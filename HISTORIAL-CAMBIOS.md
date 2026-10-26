# Historial de cambios y recomendaciones

**Proyecto:** Mandriladora portátil y sistema de recargue por soldadura (IMT-311 Prototipado Rápido, UCB).
**Equipo:** Mauri Yeison Alba Rodríguez y Julio Constantino Sandi Vargas. **Docente:** Ing. Daniel Asturizaga.
**Período que cubre:** 25-10-2026 al 26-10-2026. **Punto de partida:** informe P1 (fase conceptual, nota 73,4 / 100).

Este archivo resume, en un solo lugar, todo lo que se modificó desde el informe P1, por qué se hizo y qué queda pendiente. El detalle técnico por sección sigue en [`MEJORAS.md`](MEJORAS.md) y la verificación de cada fuente en [`fuentes-utilizadas/notas-de-verificacion/verificacion-referencias.md`](fuentes-utilizadas/notas-de-verificacion/verificacion-referencias.md).

---

## Índice

1. [Línea de tiempo](#1-línea-de-tiempo)
2. [Nueva estructura del informe](#2-nueva-estructura-del-informe)
3. [Verificación de referencias](#3-verificación-de-referencias)
4. [Cambios por sección](#4-cambios-por-sección)
5. [Criterios de redacción acordados](#5-criterios-de-redacción-acordados)
6. [Versiones del PDF](#6-versiones-del-pdf)
7. [Repositorio en GitHub](#7-repositorio-en-github)
8. [Carpeta fuentes-utilizadas](#8-carpeta-fuentes-utilizadas)
9. [Rúbrica configurable y estado del proyecto](#9-rúbrica-configurable-y-estado-del-proyecto)
10. [Cronograma interactivo](#10-cronograma-interactivo)
11. [Pendientes por confirmar](#11-pendientes-por-confirmar)
12. [Recomendaciones](#12-recomendaciones)
13. [Cómo subir este archivo a GitHub](#13-cómo-subir-este-archivo-a-github)

---

## 1. Línea de tiempo

| Fecha | Qué se hizo |
|---|---|
| 25-10-2026 | Revisión del proyecto anterior (`CAD-CAE-PROJECT/`), de las rúbricas P1 y P2, las diapositivas y el laboratorio. Resumen y plan de trabajo. |
| 25-10-2026 | Creación del esqueleto nuevo `Mandriladora/` (16 secciones) y migración completa del informe P1. |
| 25-10-2026 | Verificación de las 56 referencias del P1 y de las 31 fuentes del cuaderno de Gemini. Se eliminaron las inventadas. |
| 25-10-2026 | Compilación de prueba sin errores (44 referencias resueltas). PDF guardado como **v01**. |
| 26-10-2026 | Pulido de **01 Introducción** (borrador) y **02 Antecedentes** con fuentes nuevas verificadas en línea. |
| 26-10-2026 | Registro de redacción técnico-formal acordado con Yeison. |
| 26-10-2026 | Inicio de git, `.gitignore` y primer push al repositorio `alba-k/portable-line-boring-welding`. |
| 26-10-2026 | `fuentes-verificadas/` pasa a `fuentes-utilizadas/` con índice de las 50 fuentes citadas. |
| 26-10-2026 | README con el estado del proyecto frente a la rúbrica P2, `rubrica/estado.csv` y `actualizar-estado.ps1`. |
| 26-10-2026 | Cronograma interactivo con fases, hitos, tareas y semáforo. |

---

## 2. Nueva estructura del informe

**Antes (P1):** `project_main/main.tex` + `text/config.tex` + 13 archivos `.tex` en `text/`, imágenes en `image/image-N/` y un solo `referencias.bib` de 56 entradas.

**Ahora:**

```
Mandriladora/
├── Mandriladora.tex                  documento principal (preámbulo + \input de cada sección)
├── compilar-y-guardar-version.bat    compila y guarda vNN en versiones/
├── 00-resumen/ … 15-conclusiones-recomendaciones/
│   ├── <seccion>.txt                 texto de la sección
│   ├── referencias.bib               fuentes de esa sección (claves con prefijo)
│   └── recursos/                     figuras de esa sección
├── fuentes-utilizadas/               PDF de las fuentes e índice
├── rubrica/                          rúbricas P1/P2, estado.csv y script
├── versiones/                        PDF numerados (línea de tiempo)
├── librerias/
├── README.md                         portada y estado del proyecto
├── MEJORAS.md                        registro técnico de cambios
└── HISTORIAL-CAMBIOS.md              este archivo
```

**Decisiones y motivo:**

| Cambio | Motivo |
|---|---|
| Una carpeta por sección con `.txt`, `.bib` y `recursos/` | Permite que cada integrante trabaje en secciones distintas sin editar el mismo archivo. |
| 16 secciones (se agregan 12 CAD, 13 FEA, 14 Planos) | Son los criterios nuevos de la rúbrica P2 (piezas 15 %, ensamble 15 %, FEA 15 %, planos 10 %). |
| Una sola lista de **Referencias** a partir de los 16 `.bib` | El formato IEEE exige numeración única en todo el documento. |
| Claves con prefijo de sección (`intro-`, `antec-`, `busqext-`) | Se sabe de qué sección viene cada fuente y se evitan claves repetidas. Cada fuente vive en un solo `.bib`, aunque se cite en varias secciones. |
| Estilo `ieeetr` → `IEEEtran` | Ambos son IEEE, pero `IEEEtran` muestra URL y fecha de consulta. |
| `main.tex` + `config.tex` → un solo `Mandriladora.tex` | Se quitaron paquetes duplicados (`booktabs`), márgenes de 2,5 cm en A4, "Tabla" en vez de "Cuadro", `pgfplots` para gráficos de datos. |
| Imágenes renombradas sin espacios ni puntos (`solucion s1.1.jpeg` → `solucion-s1-1.jpeg`) | Esos caracteres rompen la compilación en LaTeX. |
| Imágenes sueltas pasan a figuras numeradas con título y "Fuente" | Lo pide el criterio de formato de la rúbrica. |
| Títulos en tipo oración ("Búsqueda externa de soluciones") | Norma de la RAE. |
| Se borraron comentarios de rúbrica y notas internas del código | Limpieza. |

---

## 3. Verificación de referencias

Se revisaron las **56 entradas** del `referencias.bib` del P1 (49 documentos distintos tras unir 5 duplicados) y las **31 fuentes** del cuaderno de Gemini.

### 3.1 Referencias eliminadas por ser inventadas (6 + 1)

| Clave antigua | Problema |
|---|---|
| Fernandez2021 | Ni el artículo ni la revista existen. |
| Gutierrez2019 | Ni el artículo ni la revista existen. |
| Mendez2020 | Ni el artículo ni la revista existen. |
| Rivas2018 | No aparece en ninguna base. |
| PatenteMecanizado2001 (US 6 283 682) | Ese número es una broca helicoidal de J. D. Plummer, no una mandriladora. |
| PatenteSoldadura2008 (US 7 417 202) | Ese número es una patente de interruptores electrónicos. |
| maqbol2024 | El sitio MasterMaQ/MaqBol está fuera de línea y no hay copia citable. Se quitó junto con la foto de la retroexcavadora. |

Del cuaderno de Gemini también se descartaron: `insitu_characterization2022` (DOI falso), `jigs_fixtures_intro` y `dispositivos_fijacion` (sin autor, editorial ni año).

### 3.2 Referencias corregidas (las más relevantes)

| Fuente | Corrección |
|---|---|
| Ulrich | Se reemplazó la 7.ª ed. en inglés (2020) por la **5.ª ed. en español (2013)**, que es la bibliografía oficial del curso. |
| Patente US 7 020 942 | Faltaba el inventor (Massimo Siracusa, Sir Meccanica). |
| Patente US 6 447 220 | Los inventores son D. L. Ricci y M. A. Gardzinski (no "Vanderpol"); estaba duplicada. |
| ASM Handbook Vol. 6A | Es de 2011 (no 2020), con sus editores y DOI. |
| Pahl y Beitz | 3.ª ed., Springer 2007, con los cuatro autores. |
| UNE-EN IEC 60974-1 | La versión vigente es de 2022, no 2021. |
| AWS D14.3:2019 | Se aclara que fue reemplazada por la **AWS D14.0:2024**. |
| Ley 1391 | Título oficial y reglamento DS 4579 (02-09-2021). |
| ICEX 2023 | Autora (C. Mirete García) y alcance: trata de maquinaria **agrícola**. |
| NTP 494 y NTP 7 | Se agregaron los autores del INSST. |
| Video Soldaduras SAM | Fecha real 03-04-2025 y título "Reparación de caballito para excavadora Caterpillar" (confirmado por Yeison). |
| Video Maucotools | Canal "Aemaq & Coppola Ltda.", https://youtu.be/nZJ67LVgspM (confirmado por Yeison). |
| Khavin 2023 | Título y páginas reales (análisis estático del husillo de una mandriladora móvil). |
| Marusich 2022 | Faltaba el volumen 7 y el nombre exacto de la revista. |

### 3.3 Duplicados unificados

Climax2022 = climax_bb5000 · Bortech2020 = climax_bw3000 · SirMeccanica2021 = sirmeccanica_catalogo · PatenteRicci2002 = US6447220 · ricci2002portable (Gemini) = busqext-US6447220.

### 3.4 Fuentes nuevas agregadas (todas verificadas en línea)

| Fuente | Sección | Para qué se usa |
|---|---|---|
| Ulrich y Eppinger, 5.ª ed. (2013) | 01 | Proceso de desarrollo de producto del curso. |
| Liou (2008) | 01 | Prototipo virtual (CAD/CAE). |
| Marusich 2022, Camputiz 2008, Saenz 2024 | 01 | Antecedentes de mandriladoras portátiles. |
| Holmberg et al. (2017) | 02 | Pérdidas por desgaste en minería (≈ 210 000 M€/año). |
| International Trade Administration (2026) | 02 | Producción nacional nula e importaciones 2022–2024 (datos del INE). |
| Ministerio de Desarrollo Productivo / SIIP (2021) | 02 | Santa Cruz recibe el 55 % de la maquinaria agrícola importada. |
| Maucotools (2026) | 02 | Mecanismo de ovalización y reparación in situ. |
| DS 4579 (2021) | 02 | Reglamento de la Ley 1391. |

**Estado actual:** 51 entradas en los `.bib` (01: 7, 02: 14, 07: 30); 50 fuentes citadas en el texto.

---

## 4. Cambios por sección

### 4.1 Migración (25-10-2026)

| Sección | Cambios |
|---|---|
| 00 Resumen | Estaba vacío y con el código roto (`begin{abstract}` sin `\`). Se redactó un borrador con palabras clave. |
| 01 Introducción | Se cambiaron las 4 citas inventadas por fuentes reales. |
| 02 Antecedentes | Se quitó la cita a MaqBol, se agregó el DS 4579 y la AWS D14.0:2024. Figuras con `[H]`. |
| 03 Problemática | Tenía una sola oración. Se amplió a un párrafo con pregunta de investigación y se incorporó el texto de `publico.tex` (beneficiarios), que existía pero no se incluía. |
| 04 Objetivos | Ortografía ("método", "selección", "módulos"). El objetivo 4 nombra el análisis por elementos finitos. |
| 05 Necesidades | Títulos de tabla más cortos. La encuesta (`survey-1.tex`) pasa a `recursos/encuesta.tex` como anexo. |
| 06 Descomposición funcional | "Fuente: Elaboración propia" en el diagrama. |
| 07 Búsqueda externa | Claves nuevas, se quitaron las 2 patentes falsas, rango de Sir Meccanica Ws Ø 22–1700 mm, la C40 evolucionó a la serie LBM, figura numerada de la patente US 7 020 942, unidades en la ecuación de rpm, tablas con `\toprule`/`\bottomrule`. |
| 08 Búsqueda interna | Objetivo de "Sujeción de herramienta" (faltaba), figuras con título y fuente. |
| 09 Exploración sistemática | Se quitó un `\centering` suelto que centraba el resto del texto. Frase que conecta con el filtrado. |
| 10 Filtrado | Error `\textitBrida` (rompía la compilación), modelos unificados en A–D, suma de ceros de D corregida, tabla con 8 columnas declaradas para 5, justificación de cada decisión. |
| 11 Evaluación | El texto decía que precisión y durabilidad pesaban más que la portabilidad, pero la tabla da 35 % a la portabilidad. Se ajustó el texto a la tabla y se justificó con la encuesta (83,3 % prefiere un equipo portátil). |
| 12–14 CAD, FEA, planos | Secciones nuevas, vacías con `% PENDIENTE`. |
| 15 Conclusiones | Decía "7 operadores" y la encuesta tiene 6. Se agregaron recomendaciones y los espacios para los objetivos 3 a 5. |

### 4.2 Pulido (26-10-2026)

**01 Introducción** (aplicada como borrador; se cierra cuando estén CAD, FEA y planos):
- Estructura de embudo: mundo → Bolivia → Santa Cruz → alojamiento del pasador → propuesta.
- El método de cinco pasos **genera** conceptos; la **selección** se hace con las matrices de filtrado y evaluación (diapositivas 4 y 5). Antes decía lo contrario.
- Se define el alcance: CAD de piezas y ensamble, FEA y planos. El prototipo físico queda fuera.
- Se quitó lo que repetía los Antecedentes, se moderó la promesa de resultados y se agregó el párrafo de organización del documento.

**02 Antecedentes** (aplicada):
- Cinco subsecciones de lo general a lo particular: desgaste en la maquinaria pesada → parque de maquinaria en Bolivia y Santa Cruz → ovalización de alojamientos → reparación por recargue y mandrinado → limitaciones del recargue manual.
- Datos propios de la encuesta (100 % de los operadores reporta paradas de más de 24 h), como pide la rúbrica ("problema fundamentado mediante los antecedentes").
- Ecuación numerada del aporte térmico HI = η·V·I/v con unidades (Kou). La versión anterior omitía la corriente.
- Figuras nuevas: gráfico de importaciones 2022–2024 (pgfplots) y Fig. 1 de la patente US 6 295 707 B1. Se quitó la foto de la retroexcavadora.
- Cada figura se menciona en el texto.
- La AWS D14 pasa de "regula la reparación" a "referencia de calidad". La Ley 1391 se usa como evidencia de la importación de maquinaria. Se corrigió "distorsión de la ZAC" (se distorsiona la pieza; en la ZAC cambia la microestructura).
- Frase de cierre que da paso a la Problemática.

---

## 5. Criterios de redacción acordados

Indicados por Yeison el 26-10-2026; se aplican a todo el informe.

- **Registro técnico-formal de ingeniería:** ni coloquial ni rebuscado.
- **Nombrar el mecanismo concreto** en vez de palabras ambiguas:

| Evitar | Usar |
|---|---|
| falla(s), daño, averiado | desgaste, ovalización, pérdida de geometría, deterioro |
| dependencia | "proviene de la importación", "el propio Estado reconoce esta condición" |
| "caro y lento" | "costos de importación elevados y plazos de reposición prolongados" |
| "a mano", "a pulso" | "de forma manual", "depende de la destreza del soldador" |
| "En otros países" | "En la industria internacional … in situ" |

- **Introducción en embudo:** de lo general a lo particular.
- **Figuras:** numeradas, citadas en el texto, con "Fuente: …" (o "Elaboración propia").

---

## 6. Versiones del PDF

- Cada versión compilada se guarda en `versiones/Mandriladora_vNN_AAAA-MM-DD.pdf`.
- Se genera con doble clic en `compilar-y-guardar-version.bat` (usa el MiKTeX de la PC; busca el siguiente número libre).
- La tabla "Historial de versiones del PDF" está al final de `MEJORAS.md`.

| Versión | Fecha | Contenido |
|---|---|---|
| v01 | 25-10-2026 | Informe P1 migrado al esqueleto nuevo, antes del pulido. |
| v02 | *por generar* | Debe incluir la Introducción y los Antecedentes pulidos. |

---

## 7. Repositorio en GitHub

- **URL:** https://github.com/alba-k/portable-line-boring-welding (rama `main`, colaborador: Julio).
- Se sube con el git de la PC de Yeison desde la terminal de VS Code.
- `.gitignore`: deja fuera los auxiliares de LaTeX (`.aux`, `.bbl`, `.log`, `.toc`, etc.), `*.tmp` y el `Mandriladora.pdf` de la raíz. Los PDF de `versiones/` sí se suben.
- Commits: `ab79d05` versión inicial (subido) · `fd39a50` fuentes utilizadas completas · `5000042` README y rúbrica.
- **Atención:** al 26-10-2026 los dos últimos commits **todavía no están en GitHub** (`git status` dice *ahead 2*); el push se cortó por la red. Ver la recomendación 12.1 antes de subirlos.
- En PowerShell, las rutas con `[MT-211]` necesitan `-LiteralPath`, porque los corchetes son comodines.

---

## 8. Carpeta fuentes-utilizadas

Antes se llamaba `fuentes-verificadas/`. Contiene:

- **PDF guardados:** las 4 patentes (US 6 295 707, US 6 447 220, US 7 020 942, US 8 304 680), Ulrich 5.ª ed., Liou 2008 y las diapositivas 4 y 5 del curso en `material-del-curso/`.
- **`README.md`:** índice de las 50 fuentes citadas, en cuatro grupos: PDF guardados, PDF libres por descargar (con el nombre de archivo a usar), páginas web y videos, y libros/normas de pago (solo enlace o DOI).
- **`descargar-fuentes.ps1`:** baja los PDF libres que faltan.
- **`notas-de-verificacion/`:** `verificacion-referencias.md`, `fuentes-cuaderno.bib` y la lista de enlaces.

---

## 9. Rúbrica configurable y estado del proyecto

- `rubrica/` tiene las rúbricas P1 y P2 en PDF, `estado.csv` y `actualizar-estado.ps1`.
- `estado.csv` (separador `;`): `parte;criterio;peso;avance;inicio;fin;seccion;falta`. Se edita con Excel o VS Code.
- `actualizar-estado.ps1` calcula el avance ponderado frente al esperado según la fecha (más de 10 puntos de diferencia = adelantado o atrasado) y reescribe el README entre `<!-- ESTADO:INICIO -->` y `<!-- ESTADO:FIN -->`.
- Uso, desde la carpeta Mandriladora: `& .\rubrica\actualizar-estado.ps1`
- **Estado al 26-10-2026:** informe 22,8 % ponderado; práctica 0 %. CAD, FEA y planos (55 % del informe y 100 % de la práctica) aún no empiezan.
- El script no se probó en Windows (el entorno de Claude no tiene PowerShell). Si da error, enviar el mensaje.

---

## 10. Cronograma interactivo

- **Enlace:** https://claude.ai/artifact/4GAodZmQWr2Qh4jfRMdxkY
- Basado en el cronograma del equipo: 32 actividades por fases, responsables (Mauri, Julio o ambos), fechas y % de avance editable en cada fila.
- Semáforo: verde al día, amarillo si faltan 2 días o menos o va 10 puntos atrasada, rojo si vence hoy o está vencida, gris por iniciar.
- **Hitos:** revisión 04-11-2026 · entrega de la 2.ª parte 20-11-2026 · habilitaciones 27-11-2026.
- Se guarda un historial de cada cambio de avance con nota y autor.

---

## 11. Pendientes por confirmar

Marcados en los `.txt` con `% POR REVISAR`, `% POR CONFIRMAR` o `% PENDIENTE`.

| # | Sección | Qué falta | Quién |
|---|---|---|---|
| 1 | 05 | La tabla de necesidades dice que 7 de 8 técnicos usan 220 V (87,5 %) y la de especificaciones dice 6 de 8. Unificar con la encuesta. | Equipo |
| 2 | 07 | El rango Ø 45–600 mm de Maucotools no aparece en su web. Confirmar con su catálogo o quitarlo. | Equipo |
| 3 | 11 | El Modelo AD se fija con soldadura y recibe 3/5 en portabilidad (el criterio de mayor peso, 35 %). Justificarlo o revisar la fijación en el CAD. | Equipo |
| 4 | 02 | Confirmar si la AWS D14.0 cubre también la reparación (cláusula de alcance). Si no, queda como "referencia de calidad". | Equipo |
| 5 | 00 | El resumen es un borrador; rehacerlo al final. | Equipo |
| 6 | 12–15 | CAD, FEA, planos y conclusiones de los objetivos 3 a 5. | Equipo |
| 7 | P2 | El docente anunció cambios a la rúbrica P2. Confirmar la versión vigente. | Equipo |
| 8 | 02 | Si consiguen una foto propia de un taller, se agrega como "Elaboración propia". | Opcional |

---

## 12. Recomendaciones

### 12.1 Urgentes

1. **Poner el repositorio en privado antes del próximo push.** Los commits pendientes incluyen los PDF de Ulrich 5.ª ed., Liou y las diapositivas del curso, que tienen derechos de autor. Si el repo sigue público, cualquiera los puede descargar. Se cambia en GitHub: *Settings → General → Danger Zone → Change visibility → Private*. Julio sigue teniendo acceso como colaborador. La otra opción es sacarlos del repo con `git rm --cached` y agregarlos al `.gitignore`.
2. **Generar la v02** con `compilar-y-guardar-version.bat` y anotarla en la tabla de versiones de `MEJORAS.md`.
3. **Borrar los archivos temporales** que quedaron y que ya no se usan:
   - `01-introduccion/referencias-nuevas.tmp` (el `.gitignore` ya lo excluye)
   - `02-antecedentes/recursos/referencias-nuevas.bib.txt` (este **sí** está en git)
   - `02-antecedentes/recursos/retroexcavadora-mantenimiento.png` (la figura ya no se usa)

   Para los dos últimos: `git rm "02-antecedentes/recursos/referencias-nuevas.bib.txt" "02-antecedentes/recursos/retroexcavadora-mantenimiento.png"`

### 12.2 Del informe

4. **Seguir el pulido en orden:** 03 Problemática → 04 Objetivos → 05–11. Ajustar los objetivos específicos al alcance real (CAD, FEA, planos; sin prototipo físico).
5. **Reforzar los criterios con nota baja en P1:** exploración sistemática (P1: 5) y generación de conceptos (P1: 3).
6. **Resolver la portabilidad del Modelo AD antes de modelar.** Es la incoherencia más visible y afecta directamente al CAD: si la fijación por soldadura se mantiene, hay que justificar el puntaje; si se cambia por una fijación mecánica (brida o abrazadera), el concepto queda coherente con el criterio de mayor peso.
7. **Título del informe:** hoy menciona solo el recargue. Propuesta: *Diseño CAD/CAE de una máquina portátil semiautomatizada para el mandrinado y recargue de alojamientos de pasadores de maquinaria pesada*.
8. **Holmberg (2009)** respalda el desgaste por abrasión en general, no la ovalización de alojamientos. La tesis de Saenz (2024) puede ser mejor fuente para ese punto.
9. **Cerrar la Introducción y el Resumen al final**, cuando haya resultados de CAD y FEA.

### 12.3 Del trabajo práctico (P2)

10. **Definir la lista de piezas del Modelo AD y repartirla** entre los dos integrantes (barra de mandrinar, soportes y rodamientos, motor y transmisión por correa, brida, sistema de avance, antorcha).
11. **Elegir pronto las piezas para el FEA:** la barra de mandrinar (flexión y torsión) y los soportes. Definir cargas, sujeciones y material con datos del catálogo de referencia.
12. **Cuidar los requisitos de la práctica:** croquis totalmente definidos, material y color en cada pieza, configuraciones en las piezas fundamentales, ensamble con movimiento y vista explosionada.
13. **Planos** con las normas de clase y el carimbo personalizado.

### 12.4 De organización

14. Cada uno trabaja en secciones o piezas distintas para no editar el mismo archivo a la vez. Siempre `git pull` antes de empezar y `git push` al terminar.
15. Actualizar `rubrica/estado.csv` y correr el script cada vez que avance una etapa, y el % en el cronograma.
16. Anotar cada cambio relevante en `MEJORAS.md` (técnico) y en este archivo (resumen).

---

## 13. Cómo subir este archivo a GitHub

En la terminal de VS Code, dentro de la carpeta `Mandriladora`:

```powershell
git add HISTORIAL-CAMBIOS.md
git commit -m "Historial de cambios y recomendaciones"
git push
```

Este push sube también los dos commits que quedaron pendientes. **Antes, pon el repositorio en privado** (recomendación 12.1). Si sale *Failed to connect* o *Connection was reset*, repite `git push`: es la red, no el repositorio.
