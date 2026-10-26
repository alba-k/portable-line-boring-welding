# Portable Line Boring Machine and Weld Overlay System

**Mandriladora portátil y sistema de recargue por soldadura** para alojamientos de pasadores de maquinaria pesada.
Proyecto de la asignatura IMT-311 Prototipado Rápido (CAD, CAE y Prototipado), Ingeniería Mecatrónica, Universidad Católica Boliviana "San Pablo". Docente: Ing. Daniel Asturizaga.
Equipo: Mauri Yeison Alba Rodríguez y Julio Constantino Sandi Vargas.

## Estado del proyecto

*Actualizado: 26-10-2026.* Primera evaluación (P1, fase conceptual): **73,4 / 100**. Ahora se trabaja para la segunda evaluación (P2): diseño CAD, análisis por elementos finitos (FEA) y planos. Las rúbricas están en [`rubrica/`](rubrica/). El docente anunció cambios a la P2, así que hay que confirmar la rúbrica vigente.

**Cómo actualizar este estado:** editar `rubrica/estado.csv` (pesos, % de avance y fechas de cada criterio; se abre con Excel o VS Code) y ejecutar `& .\rubrica\actualizar-estado.ps1` desde la carpeta Mandriladora. El script recalcula todo lo que está entre las marcas de abajo. Fechas alineadas al cronograma: hito de revisión 04-11 y entrega de la 2.ª parte 20-11-2026. Cronograma interactivo: https://claude.ai/artifact/4GAodZmQWr2Qh4jfRMdxkY (privado).

<!-- ESTADO:INICIO -->
*Calculado el 26-10-2026 con `rubrica/actualizar-estado.ps1`. Los pesos, el avance y las fechas se editan en `rubrica/estado.csv`. Se considera adelantado o atrasado si la diferencia con lo esperado a la fecha supera 10 puntos.*

| Parte | Avance ponderado | Esperado hoy | Estado |
|---|---:|---:|---|
| Informe | 22,8 % | 0 % | 🔵 Adelantado |
| Práctica | 0 % | 0 % | 🟢 Al día |

### Informe: 22,8 % de avance (esperado hoy: 0 %) · 🔵 Adelantado

| Criterio | Peso | Avance | Esperado hoy | Aporta | Estado | Fecha límite | Qué falta |
|---|---:|---:|---:|---:|---|---|---|
| Problema (03) | 5 % | 80 % | 0 % | 4 | 🔵 Adelantado | 05-11 | Pulido de redacción. |
| Objetivos (04) | 5 % | 60 % | 0 % | 3 | 🔵 Adelantado | 05-11 | Ajustar los específicos al alcance real: CAD, FEA y planos. |
| Formato (Todo) | 5 % | 40 % | 0 % | 2 | 🔵 Adelantado | 28-11 | Revisión ortográfica, numeración de figuras y compilación final. |
| Desarrollo de conceptos (5 pasos) (05-09) | 8 % | 70 % | 0 % | 5,6 | 🔵 Adelantado | 08-11 | Mejorar exploración sistemática (P1: 5) y conceptos (P1: 3). |
| Filtrado y evaluación de conceptos (10-11) | 10 % | 70 % | 0 % | 7 | 🔵 Adelantado | 08-11 | Justificar la portabilidad del Modelo AD y revisar los pesos de las necesidades. |
| Desarrollo individual de piezas (12) | 15 % | 0 % | 0 % | 0 | 🟢 Al día | 12-11 | Modelar las piezas propias con material y color y explicar su función. |
| Ensamblaje del prototipo (12) | 15 % | 0 % | 0 % | 0 | 🟢 Al día | 18-11 | Ensamble con imágenes en varias posiciones haciendo la tarea. |
| Análisis de cargas (FEA) (13) | 15 % | 0 % | 0 % | 0 | 🟢 Al día | 22-11 | Análisis estático de piezas fundamentales con cargas, sujeciones e interpretación. |
| Planos (14) | 10 % | 0 % | 0 % | 0 | 🟢 Al día | 25-11 | Planos de piezas y ensamble con normas de clase y carimbo personalizado. |
| Conclusiones (15) | 10 % | 10 % | 0 % | 1 | 🔵 Adelantado | 28-11 | Una conclusión por objetivo, con evidencia de CAD y FEA. |
| Recomendaciones (15) | 2 % | 10 % | 0 % | 0,2 | 🔵 Adelantado | 28-11 | Rehacer al final. |

### Práctica: 0 % de avance (esperado hoy: 0 %) · 🟢 Al día

| Criterio | Peso | Avance | Esperado hoy | Aporta | Estado | Fecha límite | Qué falta |
|---|---:|---:|---:|---:|---|---|---|
| Desarrollo individual de piezas (CAD) | 25 % | 0 % | 0 % | 0 | 🟢 Al día | 12-11 | Piezas con croquis totalmente definidos, material y color. |
| Manejo de configuraciones (CAD) | 20 % | 0 % | 0 % | 0 | 🟢 Al día | 15-11 | Configuraciones en las piezas fundamentales. |
| Ensamblaje del prototipo (CAD) | 25 % | 0 % | 0 % | 0 | 🟢 Al día | 18-11 | Movimiento e interacción de las piezas y vista explosionada. |
| Análisis de cargas (FEA) | 30 % | 0 % | 0 % | 0 | 🟢 Al día | 22-11 | Estudio de la pieza más representativa con cargas, sujeciones e interpretación. |

<!-- ESTADO:FIN -->

### Próximos pasos

1. Confirmar con el docente la rúbrica vigente de la P2.
2. Definir la lista de piezas del Modelo AD y repartirlas entre los dos integrantes.
3. Modelar en CAD las piezas, las configuraciones y el ensamble.
4. Hacer el FEA de la barra de mandrinar y de los soportes.
5. Hacer los planos.
6. Escribir las secciones 12 a 15 y pulir el resto (en curso: 01 y 02 ya pulidas).

## Estructura del repositorio

| Carpeta o archivo | Contenido |
|---|---|
| `Mandriladora.tex` | Documento principal (LaTeX, IEEEtran). Se compila con `compilar-y-guardar-version.bat`. |
| `00-resumen` … `15-conclusiones-recomendaciones` | Una carpeta por sección: texto en `.txt`, `referencias.bib` y `recursos/` con las figuras. |
| `fuentes-utilizadas/` | PDF de las fuentes citadas y su índice (`README.md`). `descargar-fuentes.ps1` baja las que faltan. |
| `rubrica/` | Rúbricas P1 y P2, `estado.csv` (pesos, avance y fechas) y `actualizar-estado.ps1`, que recalcula el estado. |
| `versiones/` | PDF compilado de cada versión (`Mandriladora_vNN_AAAA-MM-DD.pdf`). |
| `MEJORAS.md` | Registro de cambios y pendientes por revisar. |

## Cómo trabajar en equipo

```powershell
git pull                      # antes de empezar, traer los cambios del otro
git add -A
git commit -m "Qué cambié"
git push                      # al terminar
```

Conviene que cada uno trabaje en secciones o piezas distintas para no editar el mismo archivo a la vez.
