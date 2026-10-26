# Especificación de diseño de detalle por módulos (Modelo AD)

Versión 1 · 26-10-2026 · Propuesta de Claude para revisión del equipo (actividades 2.1 y 2.2 del cronograma).
Lista de piezas completa: [`BOM.csv`](BOM.csv). Cálculos: [`CASOS-DE-CARGA.md`](CASOS-DE-CARGA.md) y `casos_de_carga.py`.

> Este documento es la base para modelar en SolidWorks. Las cotas son valores de partida coherentes con los cálculos; pueden ajustarse durante el modelado, pero cualquier cambio en una **interfaz** (centradores, ejes, patrones de pernos) debe aplicarse en las dos piezas que se acoplan.

## 1. Arquitectura general

La máquina sigue el concepto AD seleccionado en P1: fijación temporal por soldadura, motor AC con correa dentada, brida rígida con pernos axiales para la herramienta, cable-manguera integrado y control por PLC con HMI.

```
 [C] Transmisión          [A] Soporte motriz        alojamiento        [A] Soporte libre       [D] Avance axial
 motor + reductor  ──correa──► manguito ══════════ BARRA Ø35 (B1) ═══════════════════════════► carro + husillo
                               (chaveta)     ▲ cabezal [B] / porta-antorcha [E1]                 (empuja la barra)
                                             └── se desplaza con la barra a lo largo del alojamiento
```

- La **barra gira y avanza** a través de dos rótulas autoalineables con buje de bronce. La rotación entra por un manguito con chaveta (la barra se desliza dentro de él gracias al chavetero longitudinal), y el avance lo impone el carro del módulo D en el extremo opuesto.
- La **herramienta es intercambiable**: la cuchilla (mandrinado) o la antorcha TIG (recargue) se fijan a la misma brida de centrado del collar B2. Esta interfaz común es la que materializa la "brida rígida con pernos axiales" del concepto.
- El **gabinete de control** va separado de la máquina, unido por cables, para no sumar su masa al conjunto montado sobre la pieza.

### Justificación de la fijación por soldadura frente a la portabilidad (observación de P1)

La soldadura no se aplica a la máquina, sino a cuatro **patines de acero sacrificables** (A1) por soporte, que se puntean a la cara del alojamiento y se retiran con amoladora al terminar. Los soportes se atornillan a esos patines con ranuras que permiten centrar la barra. Es la práctica habitual de los equipos comerciales de mandrinado portátil (soportes "weld-on"). La máquina sigue siendo modular y transportable; lo que se suelda es un consumible de 0,22 kg. Este argumento resuelve la contradicción que señala MEJORAS.md (portabilidad 3/5 del Modelo AD) y conviene incorporarlo en la Sección 11.

## 2. Parámetros de operación de referencia

| Parámetro | Valor | Origen |
|---|---|---|
| Diámetro de alojamiento | Ø 45–150 mm con barra Ø35; Ø 30–45 mm con barra Ø25 (luz ≤ 300 mm) | Encuesta P3 |
| Luz entre soportes | 100–600 mm | Encuesta P4 |
| Velocidad de la barra (mandrinado) | 10–193 rpm (variador 5–100 Hz) | Cálculo |
| Velocidad de la barra (recargue) | 0,3–3,2 rpm | Velocidad de soldeo 150–300 mm/min |
| Avance axial | 0,05–0,3 mm/rev (mandrinado); 1–5 mm/rev (recargue) | Tabla de especificaciones |
| Carrera de avance | 150 mm | Ancho típico de oreja + margen |
| Par disponible en la barra | 49 N·m a 97 rpm | Cálculo |
| Alimentación | 220 V monofásica | Encuesta P8 |

## 3. Módulos y piezas a modelar

Los números entre corchetes remiten al BOM. "Fabricada" = pieza propia (cuenta para la rúbrica); "Comercial" = se descarga o se modela simplificada.

### Módulo A · Base y fijación soldada (Julio, 3.1)
- **[A1] Patín soldable** 60×40×12, A36, rosca M10 pasante, chaflán 45°×3 en el borde que se suelda. Croquis: rectángulo + agujero centrado + chaflán.
- **[A2] Placa portarrodamiento** 240×240×15, Al 6061-T6. Alojamiento central Ø68 H7 (rótula GE 45 ES) con dos ranuras para anillos DIN 472. Cuatro ranuras 11×40 a 45° (radio medio 95 mm) para los pernos M10 a los patines: dan ±10 mm de centrado. Patrón de 4 roscas M8 en PCD 130 + centrador Ø110 H7 en una cara para recibir C8 o D1.
  - Configuraciones: **P180** (180×180, radio de ranuras 70, alojamientos hasta Ø90) y **P240**.
- **[A4] Buje de bronce** Ø35 F7 / Ø45 p6 × 32.
- Comerciales: rótula SKF GE 45 ES [A3], anillos [A5], tornillería [A6].

### Módulo B · Barra y cabezal con brida rígida (Mauri, 3.2)
- **[B1] Barra de mandrinar** Ø35 h6, AISI 4140 bonificado (28–32 HRC). Chavetero 10×5 en toda la longitud. Agujeros transversales 12×12 cada 100 mm para colocar la cuchilla directamente en alojamientos de Ø45–80. Lado de avance: espiga Ø30 × 60 con rosca M30×1,5.
  - Configuraciones (tabla de diseño): **L500 / L800 / L1000** y familia **Ø25** para alojamientos pequeños.
- **[B2] Collar partido con brida** Ø80×40, AISI 1045. Agujero Ø35 H7 con ranura para chaveta [B5], corte radial con 2 tornillos M8 de apriete. Cara frontal con centrador Ø50 h7 × 4 y 4 roscas M6 en PCD 64. **Esta cara es la interfaz común de herramientas.**
- **[B3] Bloque portacuchilla** AISI 4140, rebaje Ø50 H7 que encaja en el centrador, 4 pasantes Ø6,6, alojamiento de cuchilla 12×12 con tornillo de ajuste radial fino M6×0,5.
  - Configuraciones: **R80-115** y **R115-150** (alcance radial).
- Comerciales: cuchilla HSS 12×12 [B4], chaveta [B5], tornillos [B6].

### Módulo C · Transmisión (Julio, 3.3)
- Cadena: motor 0,75 kW 4P [C1] → reductor NMRV040 i=10 [C2] → polea HTD 5M 24T [C3] → correa 390-5M [C5] → polea 36T [C4] → manguito con chaveta [C6] → barra.
- **[C6] Manguito de arrastre** Ø45×90, AISI 1045, agujero Ø35 H7 con chavetero de 10; apoyado en 2 rodamientos 6009 [C7].
- **[C8] Carcasa / brida de accionamiento** 240×180×15, Al 6061-T6: soporta el reductor, aloja los rodamientos (Ø75 H7) y se une a la placa A2 del lado motriz mediante centrador Ø110 h7 y **4 pernos axiales M8**. Distancia entre centros de poleas 119,5 mm, con ranuras para tensar la correa.
- **[C9] Guarda de correa** en chapa de Al 1,5 (amarillo de seguridad).
- **[C10] Encoder** 1000 ppr, para que el PLC sincronice el avance con la rotación.
- Configuraciones: **Mandrinado** (C1 + C2) y **Recargue** (motor paso a paso NEMA 23 con reductor planetario 1:20 [C1R] en la misma brida).

> **Decisión técnica que proponemos (revisar):** el recargue necesita 0,3–3,2 rpm y el mandrinado 10–190 rpm, una relación cercana a 100:1 que el variador solo no cubre. Por eso el módulo C tiene dos configuraciones de motor. El paso a paso se descartó en P1 por par insuficiente *para el corte*; en el recargue solo vence la fricción de los bujes (≈3 N·m) y entrega 22 N·m, así que no contradice el informe P1. Hay que mencionarlo en la Sección 12.

### Módulo D · Portaherramienta y avance axial (Mauri, 3.4)
- **[D1] Placa base de avance** 200×120×15, Al 6061-T6, con centrador Ø110 h7 hacia la placa A2 del lado libre.
- **[D7] Carro de avance** 120×80×40, Al 6061-T6: aloja el rodamiento 6006 y dos axiales 51106 [D8] que sujetan la espiga de la barra con la tuerca KM6 [D9]. Se desliza sobre dos ejes Ø12 [D2] con LM12UU [D3] y lo mueve un husillo Tr16×4 [D4] accionado por un NEMA 23 [D5] con acople [D6].
- Tres sensores inductivos M12 [D10]: fin de carrera adelante/atrás y referencia.
- Configuración: **C150** (carrera 150 mm).
- Los bloques intercambiables de herramienta son B3 (cuchilla) y E1 (antorcha); se modelan en sus módulos, pero se presentan como "portaherramientas" del sistema.

### Módulo E · Cable-manguera, soportes y gabinete (Ambos, 3.5, después del hito)
- **[E1] Porta-antorcha** Al 6061-T6 con el mismo rebaje Ø50 H7 que B3, abrazadera Ø20 para el cuello de la WP-17, ranura radial de 40 mm para ajustar la separación y giro ±15°.
- **[E3] Unión rotativa de gas y corriente (abierto):** la antorcha gira con la barra, así que el cable-manguera no puede ir fijo. Propuesta: unión rotativa coaxial montada en el carro D y un tramo hueco Ø12 en el extremo de la barra para pasar gas y potencia. Alternativa más simple para el prototipo: giro limitado a ±1,5 vueltas con inversión de sentido. **Requiere decisión del equipo antes del 05/11.**
- **[E4–E10] Gabinete**: PLC S7-1200 1212C DC/DC/DC, HMI KTP400, variador V20 0,75 kW (entrada monofásica), dos drivers DM556, fuentes 24 V y 48 V, parada de emergencia, termomagnético y relé de interbloqueo con la fuente TIG.

## 4. Colores y materiales en SolidWorks

| Elemento | Material SW | Apariencia |
|---|---|---|
| Placas y carcasas de aluminio | 6061-T6 (SS) | Azul RAL 5015 (carcasas) / anodizado natural (A2) |
| Barra | AISI 4140 templado y revenido | Acero pulido |
| Collar, manguito | AISI 1045 estirado en frío | Acero / azul (B2) |
| Patines | ASTM A36 | Gris acero |
| Bujes | Bronce SAE 660 (agregar a la biblioteca si no existe: E = 100 GPa, ρ = 8 900 kg/m³) | Bronce |
| Guarda | 1060 Aleación | Amarillo RAL 1003 |

## 5. Presupuesto de masa

| Grupo | Masa (kg) |
|---|---|
| A · dos soportes con patines, rótulas y bujes | 7,7 |
| B · barra L1000, collar, portacuchilla, cuchillas | 9,0 |
| C · transmisión (configuración mandrinado) | 14,8 |
| D · avance axial | 4,2 |
| E1 · porta-antorcha y soportes de cable | 0,6 |
| **Máquina montada (configuración máxima L1000 + P240)** | **36,3** |
| Máquina montada con barra L800 | 34,8 |
| Gabinete (separado) | 6,8 |
| Antorcha y unión rotativa (separadas) | 1,3 |

La especificación "< 35 kg" se cumple con la barra L800 y no con la L1000. Recomendamos redactarla como **"módulo más pesado ≤ 15 kg y máquina montada ≤ 35 kg en la configuración de referencia"**, que es como se transporta realmente (por módulos). La masa definitiva se verifica con *Propiedades físicas* del ensamble (actividad 3.7).

## 6. Relaciones de posición para el ensamble preliminar (actividad 4.1)

1. Patines A1: coincidente con la cara del alojamiento (pieza de trabajo simplificada: oreja con agujero Ø100).
2. A2 ↔ A1: coincidente cara-cara + concéntrico perno/ranura (dejar libre el centrado).
3. A3/A4 en A2: concéntrico + coincidente con el resalte.
4. B1 ↔ A4 (ambos soportes): concéntrico. **No** fijar la posición axial: se controla con D.
5. C8 ↔ A2 motriz: concéntrico centrador Ø110 + coincidente + concéntrico de un perno M8.
6. C6 ↔ B1: concéntrico + relación de chaveta (ancho de ranura coincidente) para que el giro se transmita.
7. Poleas C3/C4: concéntricas con sus ejes; relación mecánica **correa/cadena** entre ellas.
8. D1 ↔ A2 libre: como en 5. D7 ↔ D2: concéntrico; D4 ↔ D7: relación mecánica **tornillo** (paso 4 mm).
9. Espiga de B1 ↔ D8: concéntrico + coincidente: así el avance del carro arrastra la barra.
10. B2 ↔ B1: concéntrico + distancia (parámetro de posición de la herramienta). B3/E1 ↔ B2: concéntrico centrador + coincidente + concéntrico de un M6.

Con 7 y 8 el ensamble ya se mueve (giro + avance), lo que adelanta la actividad 4.3 (animación).
