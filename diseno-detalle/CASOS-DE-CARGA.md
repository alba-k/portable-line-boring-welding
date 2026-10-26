# Casos de carga, verificación preliminar y plan de análisis por elementos finitos

Versión 1 · 26-10-2026 · Actividades 5.1 (casos de carga y sujeciones) y preparación de 5.2–5.3.
Todos los números se reproducen con `python casos_de_carga.py` (misma carpeta).

## 1. Supuestos

| Dato | Valor | Comentario |
|---|---|---|
| Material a mecanizar | Depósito de soldadura sobre acero estructural, ≈200 HB | Recargue con ER70S-6 |
| Fuerza específica de corte k_c | 2 500 N/mm² | Valor conservador para acero de 200 HB con espesor de viruta ≈0,1–0,2 mm (tablas de Sandvik o Kalpakjian) **POR CITAR** |
| Componentes de la fuerza | F_r = 0,4 F_c ; F_a = 0,3 F_c | Proporciones típicas en torneado interior |
| Barra | Ø35 mm, AISI 4140 bonificado, S_y = 655 MPa, E = 205 GPa | |
| Luz entre soportes | L = 600 mm (máxima) | Encuesta P4 |
| Posición de la herramienta | a = 50 mm del soporte más cercano | En el mandrinado lineal los soportes se colocan junto a cada oreja |
| Factor de servicio | 2,0 | Arranques, vibración e impacto al entrar la cuchilla |

Ecuaciones: F_c = k_c·a_p·f ; T = F_c·D/2 ; flecha bajo la carga δ = F·a²·b²/(3·E·I·L) ; I = π·d⁴/64.

## 2. Transmisión

Motor 0,75 kW, 1 450 rpm → reductor i = 10 (η = 0,70) → correa 36/24 (η = 0,95).
Velocidad nominal de la barra **97 rpm** (10–193 rpm con el variador entre 5 y 100 Hz), potencia útil **499 W**, par **49,3 N·m**.

## 3. Casos de carga de mandrinado

| Caso | a_p (mm) | f (mm/rev) | Ø (mm) | F_c (N) | F_r (N) | F_a (N) | Par (N·m) | Flecha bajo herramienta (µm) | σ_VM barra (MPa) |
|---|---|---|---|---|---|---|---|---|---|
| C1 desbaste en diámetro máximo | 1,0 | 0,20 | 150 | 500 | 200 | 150 | 37,5 | 15,0 | 9,7 |
| C2 desbaste de mayor fuerza | 1,5 | 0,20 | 80 | 750 | 300 | 225 | 30,0 | 22,5 | 10,7 |
| C3 acabado | 0,2 | 0,10 | 150 | 50 | 20 | 15 | 3,8 | 1,5 | 1,0 |

Lectura de resultados:
- El par requerido (≤ 37,5 N·m) es menor que el disponible (49 N·m): **el motor de 0,75 kW es suficiente**.
- La barra está muy lejos de la fluencia (factor de seguridad > 60). **El criterio que gobierna es la rigidez, no la resistencia.**
- Con la herramienta a 50 mm del soporte, la flecha en acabado es de 1,5 µm, muy por debajo de la tolerancia IT7 de un alojamiento de Ø100 (35 µm). Si la herramienta trabaja en el centro de la luz de 600 mm, la flecha en desbaste sube a **160 µm**; en esa zona solo se deben dar pasadas de acabado. Esta conclusión es útil para la Sección 13 y para las recomendaciones.

## 4. Pieza crítica: placa portarrodamiento del lado motriz (A2 + C8)

Es la pieza más cargada porque recibe la reacción del corte, el peso en voladizo del accionamiento y el par de reacción del motor.

| Carga | Valor nominal | Valor de diseño (×2) |
|---|---|---|
| Reacción radial del corte (caso C2) | 494 N | 988 N |
| Peso del accionamiento (14,5 kg) | 142 N | 284 N |
| **Radial total** | 636 N | **1 272 N** |
| Axial (avance) | 150 N | **300 N** |
| Momento por voladizo del accionamiento (CG a 180 mm) | 25,6 N·m | **51 N·m** |
| Par de reacción del motor | 49 N·m | **99 N·m** |

Cordón de los patines (filete de 6 mm, 440 mm de longitud total): esfuerzo medio 0,7 MPa frente a ≈145 MPa admisibles para E70XX. La soldadura de fijación no es la limitante; la rigidez de la placa sí.

## 5. Plan de análisis estático en SolidWorks Simulation (actividades 5.2 y 5.3)

| Estudio | Pieza | Sujeción | Cargas | Malla | Resultado a reportar | Criterio |
|---|---|---|---|---|---|---|
| FEA-1 (pieza crítica) | A2 placa portarrodamiento (P240) | Geometría fija en las 4 ranuras (caras de apoyo de los pernos sobre los patines) | Carga de rodamiento 1 272 N radial en el alojamiento Ø68; 300 N axial; momento 51 N·m y torsión 99 N·m como carga remota en el centro del alojamiento | Sólida, basada en curvatura, refinar a 2 mm en ranuras y alojamiento | Tensión de von Mises, desplazamiento resultante, factor de seguridad | FS ≥ 2 (S_y 6061-T6 = 275 MPa); desplazamiento en el alojamiento ≤ 20 µm |
| FEA-2 (pieza representativa) | B1 barra L800 | Soportes de rodamiento (o bisagra fija) en las dos zonas de buje | Fuerza 808 N a 50 mm de un soporte (caso C2) y par 30 N·m; repetir con la carga al centro | Viga o sólida | Flecha máxima y bajo la herramienta; von Mises | **Comparar con el cálculo manual (22,5 µm y 160 µm)**: si coinciden dentro del 10 %, el modelo queda validado |
| FEA-3 (complementario) | B2 collar con brida + B3 portacuchilla | Fijo en el agujero Ø35 | 750 N tangencial + 300 N radial + 225 N axial en la punta de la cuchilla | Sólida, refinada en el centrador | von Mises en pernos M6 y centrador; desplazamiento de la punta | Desplazamiento de la punta ≤ 10 µm |

La rúbrica pide "piezas fundamentales (incluida la crítica)" y "la más representativa": FEA-1 y FEA-2 cubren ambas; FEA-3 suma si sobra tiempo. La comparación de FEA-2 con el cálculo manual es el argumento más fuerte para la sección de interpretación de resultados.

## 6. Pendiente de confirmar
- k_c y las proporciones F_r/F_c y F_a/F_c deben citarse con una fuente del curso o un catálogo (Sandvik Coromant, *Manual técnico de mecanizado*).
- Masa real del motor y del reductor según el modelo comercial que elijan (cambia el voladizo de la pieza crítica).
