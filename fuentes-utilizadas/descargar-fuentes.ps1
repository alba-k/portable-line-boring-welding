# Descarga las fuentes del informe en esta carpeta (fuentes-utilizadas).
# Uso: clic derecho > "Ejecutar con PowerShell", o en la terminal:  powershell -ExecutionPolicy Bypass -File .\descargar-fuentes.ps1
# - Si el enlace es un PDF, lo guarda como .pdf.
# - Si es una página web, la imprime a PDF con Chrome o Edge.
# - Además deja un acceso directo .url a cada fuente (videos y obras de pago solo quedan así).
# Lo que ya existe no se vuelve a descargar.
$ErrorActionPreference = "Continue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$dir = $PSScriptRoot
$browser = @("$env:ProgramFiles\Google\Chrome\Application\chrome.exe","${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe","$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe","${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe","$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
$fuentes = @(
  ,@("02_DS-4579_2021", "https://www.impuestos.gob.bo/wp-content/uploads/2025/09/DS-4579.pdf", "descargar")
  ,@("02_Holmberg2017", "https://doi.org/10.1016/j.triboint.2017.05.010", "enlace")
  ,@("02_ICEX_2023_maquinaria-agricola-Bolivia", "https://www.institutofomentomurcia.es/documents/20147/275736/Estudio+Mercado+Maquinaria+agr%C3%ADcola+2023+%28Becaria+INFO+en+Bolivia%29.pdf/5bd7485e-73e9-a9c3-34ac-3dcbb2773f4a", "descargar")
  ,@("02_ITA_2026_Bolivia-maquinaria", "https://www.trade.gov/country-commercial-guides/bolivia-equipment-and-machinery", "descargar")
  ,@("02_Ley-1391_2021", "https://faolex.fao.org/docs/pdf/bol206531.pdf", "descargar")
  ,@("02_Lincoln_Hardfacing-Guide", "https://ch-delivery.lincolnelectric.com/api/public/content/cb1103a79670484faf333bbd9245f540", "descargar")
  ,@("02_Maucotools_2026_blog-ovalizacion", "https://www.maucotools.com/en/blog/line-boring-ovalized-excavator-bushings-on-site", "descargar")
  ,@("02_SIIP_2021_importaciones-maquinaria", "https://siip.produccion.gob.bo/noticias/files/2021-81dfe-Importacion-de-maquinaria-agricola-2021.pdf", "descargar")
  ,@("02_Schijve2009", "https://doi.org/10.1007/978-1-4020-6808-9", "enlace")
  ,@("02_SoldadurasSAM_2025_video-TikTok", "https://www.tiktok.com/@soldaduras_sam/video/7489078616119168262", "video")
  ,@("07_ASM6A-2011", "https://doi.org/10.31399/asm.hb.v06a.9781627081740", "enlace")
  ,@("07_AWSD14.0-2024", "https://pubs.aws.org/p/2231/d140d140m2024-machinery-and-equipment-welding-specification", "enlace")
  ,@("07_Alarcon_2021_UTN", "https://frrq.cvg.utn.edu.ar/mod/resource/view.php?id=8069", "descargar")
  ,@("07_Climax_BB5000", "https://www.climaxportable.com/wp-content/uploads/2016/02/BB5-BB5000-E3.pdf", "descargar")
  ,@("07_Climax_BB5000-120V", "https://climaxportable.com/wp-content/uploads/2016/02/BB5000-120V-boring.pdf", "descargar")
  ,@("07_Climax_BW3000-web", "https://www.climaxportable.com/products/bore-welding-machines/bw3000-auto-bore-welder/", "descargar")
  ,@("07_Climax_bore-welding-web", "https://www.climaxportable.com/products/bore-welding-machines/", "descargar")
  ,@("07_Climax_Top10-BW3000-web", "https://www.climaxportable.com/?p=79120", "descargar")
  ,@("07_DL-16998_1979", "https://www.lexivox.org/norms/BO-DL-16998.html", "descargar")
  ,@("07_Maucotools_LBM-web", "https://maucotools.com/products/portable-line-boring-machines/portable-line-boring-machine-lbm-dual-system-series", "descargar")
  ,@("07_Maucotools_video-YouTube", "https://youtu.be/nZJ67LVgspM", "video")
  ,@("07_NTP-494_INSST", "https://www.insst.es/documentacion/colecciones-tecnicas/ntp-notas-tecnicas-de-prevencion/14-serie-ntp-numeros-471-a-505-ano-1999/ntp-494-soldadura-electrica-al-arco-normas-de-seguridad", "descargar")
  ,@("07_NTP-7_INSST", "https://www.insst.es/documentacion/colecciones-tecnicas/ntp-notas-tecnicas-de-prevencion/1-serie-ntp-numeros-001-a-035-ano-1982/ntp-7-soldadura.-prevencion-de-riesgos-higienicos", "descargar")
  ,@("07_SirMeccanica_catalogo", "https://pdf.directindustry.com/pdf/sir-meccanica-spa/sir-meccanica-catalog/40443-1142549.html", "descargar")
  ,@("07_SirMeccanica_serie-WS-web", "https://sirmeccanica.com/w/serie-ws-1", "descargar")
  ,@("01_AWSD14.3-2019", "https://webstore.ansi.org/standards/aws/awsd143m2019", "enlace")
  ,@("01_Camputiz_2008_tesis-EPN", "https://bibdigital.epn.edu.ec/bitstream/15000/738/1/CD-1676(2008-09-17-11-18-21).pdf", "descargar")
  ,@("01_Marusich_2022_BSTU", "https://doi.org/10.34031/2071-7318-2022-7-12-124-134", "descargar")
  ,@("01_Saenz_2024_tesis-UContinental", "https://repositorio.continental.edu.pe/bitstream/20.500.12394/15098/2/IV_FIN_111_TE_Saenz_Serpa_2024.pdf", "descargar")
)
$ok = 0; $fallos = @()
foreach ($f in $fuentes) {
  $nombre, $url, $modo = $f
  Set-Content -LiteralPath (Join-Path $dir "enlaces\$nombre.url") -Value "[InternetShortcut]`r`nURL=$url" -Encoding ascii
  if ($modo -ne "descargar") { continue }
  $pdf = Join-Path $dir "$nombre.pdf"
  if (Test-Path -LiteralPath $pdf) { Write-Host "Ya existe: $nombre"; $ok++; continue }
  Write-Host "Descargando: $nombre"
  $tmp = Join-Path $env:TEMP "fuente.tmp"
  try {
    $r = Invoke-WebRequest -Uri $url -OutFile $tmp -UserAgent $ua -PassThru -UseBasicParsing -TimeoutSec 90
    $ct = "$($r.Headers['Content-Type'])"
    $bytes = [IO.File]::ReadAllBytes($tmp)
    $esPdf = ($bytes.Length -gt 4) -and ([Text.Encoding]::ASCII.GetString($bytes,0,4) -eq "%PDF")
  } catch { $esPdf = $false; $ct = "" }
  if ($esPdf) { Move-Item -LiteralPath $tmp -Destination $pdf -Force; $ok++; continue }
  if ($browser) {
    & $browser --headless=new --disable-gpu --no-pdf-header-footer "--print-to-pdf=$pdf" $url 2>$null | Out-Null
    Start-Sleep -Seconds 2
    if (Test-Path -LiteralPath $pdf) { Write-Host "  guardada la página como PDF"; $ok++; continue }
  }
  $fallos += "$nombre  ->  $url"
}
Write-Host ""
Write-Host "PDF listos: $ok"
if ($fallos.Count) { Write-Host "No se pudieron bajar (ábrelos a mano y guárdalos con ese nombre):"; $fallos | ForEach-Object { Write-Host "  $_" } }
Read-Host "Pulsa Enter para cerrar"
