# Calcula el avance del proyecto según la rúbrica y actualiza la tabla de estado del README.md.
# Datos: rubrica\estado.csv (separado por ";"). Columnas:
#   parte     Informe o Práctica (o cualquier otra parte que agregue el docente)
#   criterio  nombre del criterio de la rúbrica
#   peso      peso en % dentro de su parte (cada parte debe sumar 100)
#   avance    cuánto llevamos de ese criterio, de 0 a 100
#   inicio    fecha en que empieza el trabajo (AAAA-MM-DD)
#   fin       fecha en que debe estar terminado (AAAA-MM-DD)
#   seccion   sección del informe o tarea
#   falta     qué falta
# Uso (desde la carpeta Mandriladora):
#   Set-ExecutionPolicy -Scope Process Bypass -Force
#   & .\rubrica\actualizar-estado.ps1
# Para ver el estado en otra fecha:  & .\rubrica\actualizar-estado.ps1 -Fecha 2026-11-15

param([string]$Fecha = (Get-Date -Format "yyyy-MM-dd"))

$ErrorActionPreference = "Stop"
$hoy = [datetime]::ParseExact($Fecha, "yyyy-MM-dd", $null)
$raiz = Split-Path -Parent $PSScriptRoot
$csv = Join-Path $PSScriptRoot "estado.csv"
$readme = Join-Path $raiz "README.md"
$margen = 10   # puntos de diferencia para considerar adelantado o atrasado

$filas = Get-Content -LiteralPath $csv -Encoding UTF8 | ConvertFrom-Csv -Delimiter ";"

function Esperado($f) {
    $ini = [datetime]::ParseExact($f.inicio, "yyyy-MM-dd", $null)
    $fin = [datetime]::ParseExact($f.fin, "yyyy-MM-dd", $null)
    if ($hoy -lt $ini) { return 0 }
    if ($hoy -ge $fin) { return 100 }
    return [math]::Round(100 * ($hoy - $ini).TotalDays / ($fin - $ini).TotalDays)
}
function Estado($avance, $esperado) {
    if ($avance -ge 100) { return "✅ Terminado" }
    if ($avance -ge $esperado + $margen) { return "🔵 Adelantado" }
    if ($avance -le $esperado - $margen) { return "🔴 Atrasado" }
    return "🟢 Al día"
}
function Num($x) { return ([double]$x).ToString("0.#", [Globalization.CultureInfo]::GetCultureInfo("es-ES")) }

$o = New-Object System.Collections.Generic.List[string]
$o.Add("*Calculado el $($hoy.ToString('dd-MM-yyyy')) con ``rubrica/actualizar-estado.ps1``. Los pesos, el avance y las fechas se editan en ``rubrica/estado.csv``. Se considera adelantado o atrasado si la diferencia con lo esperado a la fecha supera $margen puntos.*")
$o.Add("")
$resumen = New-Object System.Collections.Generic.List[string]
$errores = @()

foreach ($g in ($filas | Group-Object parte)) {
    $sumaPeso = 0; foreach ($f in $g.Group) { $sumaPeso += [double]$f.peso }
    if ([math]::Abs($sumaPeso - 100) -gt 0.01) { $errores += "La parte '$($g.Name)' suma $sumaPeso % de peso, no 100 %." }
    $nota = 0; $notaEsp = 0
    $tabla = New-Object System.Collections.Generic.List[string]
    $tabla.Add("| Criterio | Peso | Avance | Esperado hoy | Aporta | Estado | Fecha límite | Qué falta |")
    $tabla.Add("|---|---:|---:|---:|---:|---|---|---|")
    foreach ($f in $g.Group) {
        $peso = [double]$f.peso; $av = [double]$f.avance; $esp = Esperado $f
        $nota += $peso * $av / 100; $notaEsp += $peso * $esp / 100
        $fin = [datetime]::ParseExact($f.fin, "yyyy-MM-dd", $null).ToString("dd-MM")
        $tabla.Add("| $($f.criterio) ($($f.seccion)) | $(Num $peso) % | $(Num $av) % | $(Num $esp) % | $(Num ($peso*$av/100)) | $(Estado $av $esp) | $fin | $($f.falta) |")
    }
    $est = Estado ([math]::Round($nota)) ([math]::Round($notaEsp))
    $resumen.Add("| $($g.Name) | $(Num $nota) % | $(Num $notaEsp) % | $est |")
    $o.Add("### $($g.Name): $(Num $nota) % de avance (esperado hoy: $(Num $notaEsp) %) · $est")
    $o.Add("")
    $tabla | ForEach-Object { $o.Add($_) }
    $o.Add("")
}
$o.Insert(2, "| Parte | Avance ponderado | Esperado hoy | Estado |")
$o.Insert(3, "|---|---:|---:|---|")
for ($i = 0; $i -lt $resumen.Count; $i++) { $o.Insert(4 + $i, $resumen[$i]) }
$o.Insert(4 + $resumen.Count, "")
if ($errores.Count) { $o.Insert(0, "> **Revisar la rúbrica:** " + ($errores -join " ")); $o.Insert(1, "") }

$texto = [IO.File]::ReadAllText($readme, [Text.Encoding]::UTF8)
$ini = "<!-- ESTADO:INICIO -->"; $finM = "<!-- ESTADO:FIN -->"
$a = $texto.IndexOf($ini); $b = $texto.IndexOf($finM)
if ($a -lt 0 -or $b -lt $a) { throw "No encuentro las marcas $ini y $finM en README.md" }
$nuevo = $texto.Substring(0, $a + $ini.Length) + "`n" + ($o -join "`n") + "`n" + $texto.Substring($b)
[IO.File]::WriteAllText($readme, $nuevo, (New-Object Text.UTF8Encoding $false))

Write-Host "README.md actualizado ($($hoy.ToString('dd-MM-yyyy')))."
$resumen | ForEach-Object { Write-Host $_ }
if ($errores.Count) { Write-Warning ($errores -join " ") }
