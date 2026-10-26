## Ponerse al día con el cronograma (26-10-2026, aplicado con el visto bueno general de Yeison)

Base técnica nueva (carpetas aparte, no forman parte del PDF): `diseno-detalle/` (BOM, especificación por módulos, casos de carga y script de cálculo) y `planificacion/` (plan de recuperación y lista de pendientes).

### Decisiones de diseño tomadas por Claude (Yeison las dejó a su criterio)
- **Módulos B y D:** B = barra de mandrinar + collar con brida rígida (centrador Ø50 h7, 4 pernos M6) + bloque portacuchilla; D = carro de avance axial con husillo. *Por qué:* la "brida rígida con pernos axiales" del concepto AD es la sujeción de herramienta, así que pertenece al conjunto barra-herramienta; el avance es una función distinta y se separa.
- **Dos configuraciones de motor en el módulo C** (AC 0,75 kW + reductor para mandrinar; paso a paso NEMA 23 + planetario 1:20 para recargar). *Por qué:* el recargue gira a 0,3–3,2 rpm y el mandrinado a 10–190 rpm (relación ≈100:1) y el variador no cubre ese rango; el paso a paso solo se descartó en P1 por par de corte, que en el recargue no existe. CLIMAX resuelve lo mismo con su unidad BW3000.
- **Paso de gas y corriente a la antorcha:** colector rotativo (como en los equipos CLIMAX de recargue). Respaldo para el prototipo: giro limitado ±1,5 vueltas.
- **Fijación por soldadura:** se sueldan patines sacrificables A36 y los soportes se atornillan a ellos. Justifica la portabilidad del Modelo AD.

### Por sección
| Sección | Cambios |
|---|---|
| 00 Resumen | Reescrito con el alcance completo (CAD, FEA, prototipo impreso) y la nueva puntuación 4,15. Quedan cifras `[XX]` a completar. |
| 03 Problemática | Párrafo inicial con datos de importación (ITA 2026, SIIP 2021), cita de Kou junto a Lancaster, dato de paradas > 24 h de la encuesta y enunciado explícito del problema. Se quitó "barreno" por "alojamiento". |
| 04 Objetivos | Objetivos 3–5 con criterios medibles: configuraciones y masa (3), FS ≥ 2 y contraste con el cálculo analítico (4), impresión 3D y sincronización rotación-avance (5). |
| 05 Necesidades | Especificación de masa dividida en "máquina montada ≤ 35 kg (configuración de referencia)" y "módulo más pesado ≤ 15 kg". Se agregaron las velocidades de giro de mandrinado y de recargue. |
| 07 Búsqueda externa | Nueva subsección "Implicaciones para el diseño": rotación y avance independientes, dos regímenes de velocidad, soportes autoalineables y colector rotativo, cada una con su fuente. |
| 08 Búsqueda interna | Las 6 imágenes sueltas de S1 se unieron en una figura numerada con subfiguras y título. |
| 09 Exploración (P1: 5/10) | Gráfico de la tabla de combinación general (`tabla-combinacion-general.png`), conteo de 108 combinaciones y subsección con las 3 reglas de selección de conceptos (corrige "Conceptos", P1: 3/10). |
| 10 Filtrado (P1: 7/10) | Definición de cada criterio y vínculo con las necesidades. |
| 11 Evaluación (P1: 5/10) | Pesos derivados de las necesidades (tabla necesidad → evidencia → importancia → peso): precisión 25, portabilidad 25, manejo 20, durabilidad 15, manufactura 15. Resultado AD 4,15 frente a B 3,70. Justificación de calificaciones y análisis de sensibilidad. Cierra el punto 3 de "Lo que tienen que revisar". |
| 12 Diseño CAD | Borrador completo: módulos, piezas, materiales, configuraciones, ensamble y masa. Las figuras son recuadros "Figura pendiente" hasta tener las capturas. |
| 13 FEA | Borrador: casos de carga, verificación analítica de la barra, estudios 1 (placa portarrodamiento, pieza crítica) y 2 (barra, pieza representativa) con sujeciones, cargas y malla; tabla de validación con `[XX]`. Referencias nuevas: Kalpakjian y Schmid 2014, Budynas y Nisbett 2019. |
| 14 Planos | Borrador: normas ISO (5457, 7200, 128-1, 129-1, 286-1, 1101, 21920-1), contenido del carimbo y lista de 13 planos. |
| 15 Conclusiones | Conclusión 2 actualizada (4,15 / 3,70). Borradores de las conclusiones 3, 4 y 5 con `[XX]` y 5 recomendaciones técnicas. |

Compilación de prueba (copia en inglés/ieeetr en la VM): 53 páginas, sin errores ni referencias sin resolver.
