# Registro de mejoras: del informe P1 al nuevo esqueleto

Fecha: 25-10-2026. Origen: `CAD-CAE-PROJECT/project_main/` (informe P1).
El contenido técnico se mantiene. Solo se corrigieron errores, se ordenó el texto y se cambiaron las referencias por fuentes verificadas.
En los `.txt`, las notas `% POR REVISAR`, `% POR CONFIRMAR` y `% PENDIENTE` marcan lo que tienen que decidir ustedes.

## General

- **Estructura nueva:** cada sección tiene su `.txt`, su `referencias.bib` y su carpeta `recursos/`. `Mandriladora.tex` reúne todas las secciones y arma **una sola lista de "Referencias"** a partir de todos los `.bib`.
- **Estilo de citas:** se pasa de `ieeetr` a `IEEEtran`. Ambos son IEEE, pero `IEEEtran` también muestra las URL y las fechas de consulta.
- **Referencias:** se eliminaron las 6 inventadas, se corrigieron los datos erróneos y se unificaron los duplicados (detalle en `fuentes-utilizadas/notas-de-verificacion/verificacion-referencias.md`). Las claves llevan el prefijo de su sección (`intro-`, `antec-`, `busqext-`). Cada fuente aparece en un solo `.bib`, aunque se cite en varias secciones.
- **Figuras:** se copiaron a `recursos/` de cada sección, con nombres sin espacios ni puntos (por ejemplo, `solucion s1.1.jpeg` pasó a `solucion-s1-1.jpeg`), porque esos caracteres hacen fallar a LaTeX. Las imágenes que estaban sueltas con `\begin{center}` ahora son figuras con título y "Fuente".
- **Preámbulo:** se juntaron `main.tex` y `config.tex` en un solo `Mandriladora.tex`. Se quitaron paquetes repetidos (`booktabs` estaba dos veces), se activaron márgenes de 2,5 cm en A4 y las tablas se llaman "Tabla" en vez de "Cuadro".
- **Títulos:** todos los encabezados quedaron en tipo oración ("Búsqueda externa de soluciones" en vez de "Búsqueda Externa de Soluciones"), como pide la RAE.
- **Limpieza:** se borraron los comentarios de la rúbrica y las notas tipo "Repite esta figura…" que habían quedado en el código.

## Por sección

| Sección | Mejoras |
|---|---|
| 00 Resumen | Estaba vacío y con el código roto (`begin{abstract}` sin `\`). Se redactó un **borrador** a partir del contenido actual, con palabras clave. Hay que completarlo cuando estén CAD, FEA y planos. |
| 01 Introducción | Se cambiaron las 4 citas inventadas por fuentes reales: ICEX, Lincoln/Kou, Marusich 2022, Camputiz 2008, Saenz 2024 y Schijve. Se agregó una oración sobre los antecedentes de mandriladoras portátiles. Redacción más directa. |
| 02 Antecedentes | Se quitó la cita a MaqBol (no existe) del pie de la foto de la retroexcavadora. Se agregó el DS 4579 junto a la Ley 1391. Se mencionó que la AWS D14.3 fue reemplazada por la D14.0:2024. Se cambió `[h]` por `[H]` para que las figuras no se muevan. |
| 03 Problemática | Tenía una sola oración. Se amplió a un párrafo usando solo lo que ya dicen los antecedentes, y se agregó una **pregunta de investigación**. Se incorporó el texto de `publico.tex` (beneficiarios), que existía pero no se incluía en el informe. |
| 04 Objetivos | Ortografía ("metodo", "seleccion", "modulos"). En el objetivo 4 se nombra el método (análisis por elementos finitos). |
| 05 Necesidades | Títulos de tabla más cortos. La encuesta en LaTeX (`survey-1.tex`, la versión más completa) se copió a `recursos/encuesta.tex` para usarla como anexo. |
| 06 Descomposición funcional | Se agregó "Fuente: Elaboración propia" al diagrama y se ajustó el formato. |
| 07 Búsqueda externa | Se cambiaron todas las claves. Se quitaron las 2 patentes falsas (US 6 283 682 y US 7 417 202) de las citas. En la tabla de *benchmarking*, el rango de Sir Meccanica Ws pasa a Ø 22–1700 mm (dato oficial) y se aclara que la C40 evolucionó en la serie LBM. La imagen de la patente US 7 020 942 ahora es una figura numerada. Se definieron las unidades de la ecuación de rpm. Las tablas usan `\toprule`/`\bottomrule`. |
| 08 Búsqueda interna | Se agregó el objetivo a "Sujeción de herramienta" (era la única subfunción sin él). Las figuras de las alternativas tienen título y fuente. La frase inicial ahora remite a la exploración sistemática, que es donde se hacen los descartes. |
| 09 Exploración sistemática | Se quitó un `\centering` suelto que centraba el resto del texto. Las figuras de los árboles tienen título. Se agregó una frase que conecta la tabla de combinación con el filtrado. |
| 10 Filtrado | Se corrigió el error `\textitBrida` (rompía la compilación). Los modelos se llamaban "Modelo 1–4" en el texto y "A–D" en las tablas; se unificó en A–D. En la matriz se quitaron los corchetes `[ ]`, se completó la suma de ceros de D (5) y se corrigió "presición". La tabla tenía 8 columnas declaradas para 5. Se justificó por qué D es la referencia y por qué cada modelo continúa, se descarta o se combina. Se corrigió "Ss recombinaran". |
| 11 Evaluación | El texto decía que la precisión y la durabilidad pesaban más que la portabilidad, pero la tabla da 35 % a la portabilidad. **Se ajustó el texto a la tabla** y se justificó con la encuesta (83,3 % prefiere un equipo portátil). Se quitaron los corchetes de los pesos, se usa coma decimal y la selección final se explica con los puntajes ponderados. |
| 12–14 CAD, FEA, planos | No existían en P1. Quedan con su título y la nota `% PENDIENTE`. |
| 15 Conclusiones | Decía "7 operadores", pero la encuesta tiene 6. Se corrigió. Se agregaron los apartados de recomendaciones y las conclusiones pendientes de los objetivos 3 a 5. |

## Lo que tienen que revisar ustedes

1. **Foto de la retroexcavadora (02):** su fuente era MaqBol, que no existe. ¿De dónde salió la foto? Si es suya, pongan "Fuente: Elaboración propia".
2. **Voltaje en la encuesta (05):** la tabla de necesidades dice que 7 de 8 técnicos usan 220 V (87,5 %), pero la de especificaciones dice 6 de 8. Confirmen el dato real.
3. **Portabilidad del Modelo AD (11):** el AD se fija con soldadura y aun así recibe 3 de 5 en portabilidad, frente a 5 del Modelo B. El docente podría cuestionarlo, porque la portabilidad es el criterio de mayor peso. Conviene justificarlo o revisar la fijación en el diseño CAD.
4. **Rango de Maucotools (07):** Ø 45–600 mm no aparece en su web. Confírmenlo con su catálogo.
5. **Resumen (00):** es un borrador; revísenlo.
6. **Compilación:** se probó con pdflatex y bibtex sin errores y con todas las citas resueltas (44 referencias). Hace falta una distribución de LaTeX con el paquete de idioma español y `IEEEtran.bst` (vienen en Overleaf, MiKTeX y TeX Live completo).

## Pulido sección por sección (desde el 26-10-2026)

Criterios acordados con Yeison: registro técnico-formal (ni coloquial ni rebuscado); nombrar el mecanismo concreto (desgaste, ovalización, pérdida de geometría) en vez de "falla", "daño" o "dependencia"; la introducción sigue la estructura de embudo (de lo general a lo particular).

### 01 Introducción (aplicada el 26-10-2026, queda como borrador)
- Estructura de embudo: mundo → Bolivia → Santa Cruz → alojamiento del pasador → propuesta.
- Se corrigió el papel del método de cinco pasos: genera conceptos; la selección se hace con las matrices de filtrado y evaluación (diapositivas 4 y 5).
- Se definió el alcance: CAD paramétrico de piezas y ensamble, FEA, planos; el prototipo físico no forma parte del trabajo.
- Se cita la bibliografía oficial del curso: Ulrich y Eppinger, 5.ª ed. en español (2013), y Liou (2008), en lugar de Ulrich 7.ª ed.
- Se quitó lo que repetía los Antecedentes, se moderó la promesa de resultados y se agregó el párrafo de organización del documento.
- Se revisará al terminar CAD, FEA y planos.

### 02 Antecedentes (aplicada el 26-10-2026)
- Se reorganizó en cinco subsecciones, de lo general a lo particular: desgaste en la maquinaria pesada → parque de maquinaria en Bolivia y Santa Cruz → ovalización de alojamientos → reparación por recargue y mandrinado → limitaciones del recargue manual.
- Fuentes nuevas, verificadas en línea el 26-10-2026: Holmberg et al. 2017 (pérdidas por desgaste en minería), International Trade Administration 2026 (producción nacional nula e importaciones 2022–2024, datos del INE), Ministerio de Desarrollo Productivo/SIIP 2021 (Santa Cruz = 55 % de las importaciones de maquinaria agrícola) y Maucotools 2026 (mecanismo de ovalización y reparación in situ).
- Figuras nuevas: gráfico de importaciones 2022–2024 hecho en LaTeX (pgfplots, se agregó al preámbulo) y Fig. 1 de la patente US 6 295 707 B1 como ejemplo de equipo portátil internacional.
- Se quitó la foto de la retroexcavadora (su fuente, MaqBol, está fuera de línea).
- Se agregaron los datos de la encuesta (paradas > 24 h), la ecuación numerada del aporte térmico (HI = ηVI/v) y referencias a cada figura en el texto.
- La AWS D14 pasa de "regula la reparación" a "referencia de calidad" (queda % POR CONFIRMAR). La Ley 1391 se usa como evidencia de la importación. Se corrigió "distorsión de la ZAC".
- Prueba de compilación (copia en inglés/ieeetr): sin errores ni citas sin resolver.

## Repositorio y fuentes (26-10-2026)

- El informe se subió a GitHub: https://github.com/alba-k/portable-line-boring-welding (`.gitignore` deja fuera los auxiliares de LaTeX y `Mandriladora.pdf`).
- La carpeta `fuentes-verificadas/` pasó a llamarse `fuentes-utilizadas/`. Reúne los PDF de las fuentes citadas y un `README.md` con las 50 fuentes del informe: PDF guardados, PDF libres por descargar (con el nombre de archivo a usar), páginas web y videos, y libros/normas sin PDF (solo enlace). Se agregaron los PDF de Ulrich 5.ª ed. y Liou, y las diapositivas 4 y 5 del curso en `material-del-curso/`.
- Se agregó el PDF de la patente US 7 020 942 B2. Las notas de verificación quedaron en `fuentes-utilizadas/notas-de-verificacion/`.

## Historial de versiones del PDF

Cada versión compilada se guarda en `versiones/` como `Mandriladora_vNN_AAAA-MM-DD.pdf`. Para generar una nueva, doble clic en `compilar-y-guardar-version.bat` (usa el MiKTeX de tu PC).

| Versión | Fecha | Cambios |
|---|---|---|
| v01 | 25-10-2026 | Informe P1 migrado al esqueleto nuevo (estado inicial antes del pulido). |
