# Plan de recuperación del cronograma

Actualizado: 26-10-2026 (lunes). Hitos: **revisión 04/11 (miércoles, Lab 4)** y **entrega P2 20/11 (viernes, Lab 3)**.
Responsables: Mauri (Yeison), Julio, Claude. Cronograma visual: https://claude.ai/artifact/4GAodZmQWr2Qh4jfRMdxkY

## 1. Situación al 26-10

| Bloque | Estado | Retraso |
|---|---|---|
| 1. Reconstrucción del informe base (1.1–1.6) | Migración hecha; Introducción y Antecedentes pulidos. Exploración, conceptos, filtrado y evaluación **sin rehacer**; problemática, objetivos y resumen en borrador | 1.4–1.6 vencieron entre el 22 y el 24/10 |
| 2. Diseño detallado (2.1 BOM, 2.2 croquis) | **BOM y especificación por módulos entregados hoy** (`diseno-detalle/`) | Recuperado en papel; falta el modelo |
| 3. Modelado CAD (3.1–3.4) | Sin iniciar | A y B debían ir por la mitad (22–28/10) |
| 5.1 Casos de carga | **Entregado hoy** (`diseno-detalle/CASOS-DE-CARGA.md`) | Adelantado (vence el 31/10) |
| 6.1 Carimbo | Sin iniciar | Vence el 31/10 |

El cuello de botella es el **modelado en SolidWorks**: solo ustedes pueden hacerlo, y ahora tiene todas las cotas, materiales e interfaces definidos para empezar sin diseñar sobre la marcha.

## 2. Quién hace qué

| Lo hace Claude | Lo hacen ustedes (requiere SolidWorks, impresora o el docente) |
|---|---|
| Textos del informe (propuestas en `propuestas/NN-NN/`, se aplican con su visto bueno) | Modelado de piezas y ensambles, configuraciones, materiales y colores |
| BOM, especificaciones, cotas para croquis, relaciones de posición | Ensamble, vista explosionada y animación |
| Casos de carga, cálculos manuales, plan de FEA e interpretación de resultados | Correr los estudios en SolidWorks Simulation y exportar imágenes |
| Diseño del carimbo y lista de verificación de normas para planos | Planos en SolidWorks con la plantilla |
| Esquemas de los conceptos A–D (corrige la nota de 3/10) | Validar el módulo a prototipar con el docente, imprimir y ensayar |
| Secciones 12–15 a partir de sus capturas y resultados | Revisión final y exposición |

## 3. Plan hasta el hito del 04/11

| Fecha | Claude | Mauri (Yeison) | Julio |
|---|---|---|---|
| Lun 26/10 | BOM, especificación A–E, casos de carga, este plan ✓ | Revisar `ESPECIFICACION-MODULOS.md` y responder las 3 decisiones (sección 5) | Igual |
| Mar 27/10 | Propuesta 09-11 ✓ (adelantada al 26/10) | Empezar **B**: barra con tabla de diseño, collar, portacuchilla | Empezar **A**: patín, placa portarrodamiento con configuraciones, buje |
| Mié 28/10 | Propuesta 00-03-04: resumen, problemática, objetivos | Terminar B; empezar **D** (avance) | Terminar A; empezar **C** (transmisión) |
| Jue 29/10 | Carimbo (plantilla) y lista de verificación de planos | D | C |
| Vie 30/10 | Aplicar propuestas aprobadas; pasada de formato | Terminar D | Terminar C |
| Sáb 31/10 – Dom 01/11 | Sección 12 (borrador con las capturas que envíen) | **Ensamble preliminar** con las relaciones de `ESPECIFICACION-MODULOS.md` §6 | Revisar croquis totalmente definidos (en negro) de A y C |
| Lun 02/11 | Revisión contra la rúbrica; compilar v02 | Capturas de piezas y ensamble para el informe | Igual |
| Mar 03/11 | Ajustes finales | Ensayo de la presentación | Igual |
| **Mié 04/11** | | **Revisión con el docente** | |

Entregable del hito, punto por punto:
1. Correcciones de la 1.ª evaluación → propuesta 09-11 (Claude) + su visto bueno.
2. Informe base (problemática, objetivos, resumen, formato) → propuesta 00-03-04 (Claude) + visto bueno.
3. BOM y croquis totalmente definidos de A–D → BOM listo; croquis en SolidWorks (ustedes).
4. Ensamble preliminar con relaciones de posición → ustedes, con la guía §6.

## 4. Plan del 05/11 al 20/11 (resumen)

| Semana | Claude | Ustedes |
|---|---|---|
| 05–11/11 | Especificación final del módulo E; redacción de la Sección 12; preparación de FEA-1 y FEA-2 | Módulo E, configuraciones (3.6), materiales y masa (3.7), ensamble final (4.2); elegir con el docente el módulo a prototipar (7.1, 05–06/11) |
| 09–15/11 | Interpretación de FEA y Sección 13; lista de normas para planos | Correr FEA-1/FEA-2 (5.2), planos de piezas (6.2), animación (4.3), preparar e imprimir el módulo (7.2–7.3) |
| 16–20/11 | Sección 14, conclusiones por objetivo (15), formato, bibliografía; compilación v03+ | Planos de ensamble (6.3), montaje y ensayo del prototipo (7.4), revisión final |

**Sugerencia de módulo a prototipar:** el módulo D (carro de avance) con un tramo corto de barra, a escala 1:1 en PLA o PETG, movido por un NEMA 17 y sincronizado con la rotación. Demuestra la "sincronización de movimientos" que pide la rúbrica y cabe en una impresora común.

## 5. Decisiones (cerradas por Claude el 26-10, con criterio delegado por Yeison; ver `MEJORAS.md`)

1. **Interpretación de los módulos B y D.** Propuse: B = barra + collar con brida + portacuchilla; D = avance axial y bloques intercambiables. ¿Coincide con lo que pensaron al hacer el cronograma?
2. **Dos motores en el módulo C** (AC para mandrinar, paso a paso para recargar), porque las velocidades difieren en 100:1. ¿Lo aceptan?
3. **Paso del gas y la corriente a la antorcha giratoria** (unión rotativa o giro limitado). Puede esperar hasta el 05/11.

## 6. Inconsistencias detectadas que conviene corregir

- La **Introducción** pulida dice que "el prototipo físico no forma parte del trabajo", pero el objetivo específico 5 y el cronograma (bloque 7) incluyen imprimir y ensayar un módulo. Hay que alinear el alcance (se avisó al hilo que pule el informe).
- La especificación **masa < 35 kg** solo se cumple con la barra L800 (34,8 kg); con la L1000 da 36,3 kg. Propuesta: "módulo más pesado ≤ 15 kg y máquina montada ≤ 35 kg en la configuración de referencia".
- **Voltaje en la encuesta** (7 u 8 de 8 en una tabla, 6 de 8 en otra): sigue pendiente de confirmar con los datos crudos.
- La **portabilidad 3/5 del Modelo AD** se puede justificar con los patines soldables sacrificables (ver `ESPECIFICACION-MODULOS.md` §1).

## 7. Registro de lo que hizo Claude en este plan

| Fecha | Archivo | Qué se hizo |
|---|---|---|
| 26-10-2026 | `diseno-detalle/BOM.csv` | Lista de 45 ítems (piezas fabricadas y comerciales) por módulo, con material, cotas clave, masa, color y configuraciones. Se abre en Excel (separador `;`). |
| 26-10-2026 | `diseno-detalle/ESPECIFICACION-MODULOS.md` | Arquitectura, parámetros de operación, cotas e interfaces de cada pieza de A–E, colores, presupuesto de masa y relaciones de posición del ensamble. |
| 26-10-2026 | `diseno-detalle/CASOS-DE-CARGA.md` y `casos_de_carga.py` | Transmisión, tres casos de corte, flecha y tensión de la barra, cargas de la pieza crítica, soldadura de patines, husillo de avance y plan de tres estudios FEA con criterios de aceptación. |
| 26-10-2026 | `planificacion/PLAN-RECUPERACION.md` | Este plan. |
| 26-10-2026 | `propuestas/09-11/` (aplicada el mismo día) | Corrección de exploración, conceptos, filtrado y evaluación: gráfico de combinación general, reglas de selección de conceptos, criterios definidos, pesos derivados de las necesidades y análisis de sensibilidad. Detalle en su `PROPUESTA.md`. |

| 26-10-2026 | Secciones 00, 03, 04, 05, 07–15 del informe (aplicadas en el PC) | Con el visto bueno general de Yeison: correcciones de P1, resumen, problemática, objetivos y borradores de CAD, FEA, planos y conclusiones. Detalle en `MEJORAS.md`. |
| 26-10-2026 | `planificacion/PENDIENTES-Y-MEJORAS.md` | Qué falta por sección, qué solo pueden hacer ustedes, sugerencias técnicas y riesgos. |
