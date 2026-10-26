# Qué falta, cómo mejorarlo y sugerencias

Actualizado: 26-10-2026 · Claude. Complementa `PLAN-RECUPERACION.md` (fechas) y `MEJORAS.md` (lo ya aplicado).

## 1. Estado del informe por sección

| Sección | Estado | Qué falta | Quién |
|---|---|---|---|
| 00 Resumen | Borrador completo | Completar las 4 cifras `[XX]` (masa, FS, flecha, módulo impreso) | Claude, al tener resultados |
| 01 Introducción | Pulida (otro hilo) | Revisión final al cerrar CAD/FEA | Claude |
| 02 Antecedentes | Pulida (otro hilo) | Confirmar el dato de AWS D14 (`% POR CONFIRMAR`) | Ustedes |
| 03 Problemática | Lista | — | — |
| 04 Objetivos | Lista | — | — |
| 05 Necesidades | Lista salvo un dato | **Voltaje: 7 de 8 o 6 de 8** (las dos tablas no coinciden). Revisen la encuesta original | Ustedes |
| 06 Descomposición funcional | Sin cambios | Nada obligatorio | — |
| 07 Búsqueda externa | Mejorada | **Rango de Maucotools Ø45–600 mm** no está en su web: confirmen con el catálogo o lo quito | Ustedes |
| 08 Búsqueda interna | Mejorada | Nada obligatorio | — |
| 09 Exploración | Corregida (P1: 5) | Opcional: croquis a mano alzada de los conceptos A–D | Ustedes o Claude |
| 10 Filtrado | Mejorado (P1: 7) | — | — |
| 11 Evaluación | Corregida (P1: 5) | Revisar las importancias de durabilidad y manufactura (3/5), que son criterio de diseño | Ustedes |
| 12 Diseño CAD | Borrador de texto | **10 capturas de SolidWorks** (recuadros "Figura pendiente") y ajustar cotas si cambian | Ustedes |
| 13 FEA | Borrador de texto | **Correr estudios 1 y 2**, capturas y valores `[XX]` | Ustedes corren, Claude interpreta |
| 14 Planos | Estructura | Carimbo, 13 planos y anexarlos | Ustedes (Claude prepara el carimbo) |
| 15 Conclusiones | Borradores 1–5 | Completar `[XX]` de las conclusiones 3–5 | Claude |
| Formato general | Compila sin errores | Revisión ortográfica final; versión v02 con `compilar-y-guardar-version.bat` | Claude + ustedes |

## 2. Lo que solo pueden hacer ustedes (en orden de urgencia)

1. **Modelar las piezas de A–D en SolidWorks** siguiendo `diseno-detalle/ESPECIFICACION-MODULOS.md`, con croquis totalmente definidos (en negro), material y color. Es lo más atrasado y lo que más pesa en la rúbrica: piezas 15 + 25, ensamble 15 + 25.
2. **Ensamble preliminar** con las relaciones de §6 de la especificación (hito 04/11).
3. Tomar las **capturas** con fondo blanco y nombrarlas como las figuras de la Sección 12 (`modulo-a.png`, `modulo-b.png`, etc.) dentro de `12-diseno-cad/recursos/`. Yo las inserto.
4. Confirmar con el docente **qué módulo imprimir** (propongo el D, avance axial).
5. Correr **FEA-1 y FEA-2** según `diseno-detalle/CASOS-DE-CARGA.md` §5 y pasarme las imágenes y los valores.
6. Responder los tres datos de la encuesta y del catálogo (voltaje, Maucotools, AWS D14).

## 3. Sugerencias técnicas (con su justificación)

| # | Sugerencia | Por qué | Impacto si no se hace |
|---|---|---|---|
| 1 | **Barra de referencia L800** y no L1000 | Con la L1000 la máquina pesa 36,3 kg y excede la especificación de 35 kg; la L800 cubre luces de hasta ≈400 mm y da 34,8 kg | El docente puede observar que no se cumple una especificación propia |
| 2 | Dar el **desbaste solo cerca de los soportes** y el acabado en el centro | La flecha en el centro de una luz de 600 mm es de 160 µm, cuatro veces la tolerancia IT7 | Mal resultado de precisión si se pregunta en la defensa |
| 3 | Usar la **barra como pieza representativa del FEA** | Permite comparar con el cálculo manual (22,5 µm) y demostrar que el modelo es válido; la rúbrica pide "resultados interpretados" | Un FEA sin validación es más difícil de defender |
| 4 | **No modelar en detalle los componentes comerciales** (motor, rótula, reductor): descargarlos de los catálogos del fabricante | La rúbrica excluye las piezas prediseñadas; el tiempo debe ir a las 12 piezas propias | Se pierde tiempo sin sumar puntos |
| 5 | Mantener el **gabinete fuera de la máquina** | Ahorra 6,8 kg en el conjunto montado y aleja al operario del arco (UNE-EN ISO 12100) | Se excede la masa |
| 6 | **Citar una fuente de k_c** (Kalpakjian ya está en la bibliografía; conviene verificar la página) | Los casos de carga dependen de ese valor | Observación de "falta fundamentar" |
| 7 | Para el **prototipo**, imprimir el carro D a escala 1:1 con un NEMA 17 y un tramo de varilla de Ø35 | Demuestra la sincronización rotación-avance, que es lo que pide el objetivo 5 | — |
| 8 | Revisar si conviene **subir la portabilidad del AD a 4/5** | La fuente de soldadura ya está en el sitio para el recargue, así que puntear los patines no agrega equipos | Ninguno: AD ya gana; es opcional |

## 4. Riesgos

- **Tiempo de modelado:** 4 módulos en 7 días para 2 personas. Si se atrasa, prioricen B (barra, collar, portacuchilla) y A (soportes), porque son las piezas del FEA.
- **Colector rotativo:** no es común en el mercado local; para el informe basta con modelarlo como componente comercial.
- **Referencias nuevas** (Kalpakjian 2014, Budynas 2019 y las normas ISO): sus datos bibliográficos son correctos según mi conocimiento, pero no las verifiqué en línea esta vez. Conviene agregarlas a `fuentes-utilizadas/README.md`.
