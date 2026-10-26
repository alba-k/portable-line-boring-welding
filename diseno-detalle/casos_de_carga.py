"""Casos de carga y verificaciones preliminares de la mandriladora portatil.
Reproduce los valores de CASOS-DE-CARGA.md. Ejecutar: python casos_de_carga.py"""
from math import pi, sqrt

# --- Datos de entrada (supuestos de diseno; ver CASOS-DE-CARGA.md) ---
kc = 2500.0        # fuerza especifica de corte, acero de recargue ~200 HB [N/mm2]
E = 205e3          # modulo de elasticidad, AISI 4140 [MPa]
Sy_4140 = 655.0    # fluencia AISI 4140 templado y revenido [MPa]
Sy_A36 = 250.0     # fluencia ASTM A36 [MPa]
d_bar = 35.0       # diametro de la barra [mm]
L = 600.0          # luz maxima entre soportes [mm]
a = 50.0           # distancia de la herramienta al soporte mas cercano [mm]

# Transmision: motor 0,75 kW 4P -> reductor sinfin i=10 -> correa HTD 5M 24T/36T
P_mot, n_mot = 750.0, 1450.0
i_red, eta_red = 10.0, 0.70
i_cor, eta_cor = 36/24, 0.95
f_min, f_nom, f_max = 5.0, 50.0, 100.0   # rango del variador [Hz]

n_bar = n_mot / i_red / i_cor
n_range = (n_bar*f_min/f_nom, n_bar*f_max/f_nom)
P_bar = P_mot*eta_red*eta_cor
T_bar = P_bar/(2*pi*n_bar/60)

def corte(ap, f, D):
    Fc = kc*ap*f            # tangencial [N]
    Fr = 0.4*Fc             # radial [N]
    Fa = 0.3*Fc             # axial [N]
    T = Fc*D/2/1000         # par [N m]
    return Fc, Fr, Fa, T

print(f"Barra: n nominal {n_bar:.0f} rpm, rango {n_range[0]:.0f}-{n_range[1]:.0f} rpm, "
      f"P util {P_bar:.0f} W, par nominal {T_bar:.1f} N m")

casos = {
    "C1 desbaste Ø150 (ap 1,0 f 0,20)": (1.0, 0.20, 150),
    "C2 desbaste Ø80 (ap 1,5 f 0,20)": (1.5, 0.20, 80),
    "C3 acabado Ø150 (ap 0,2 f 0,10)": (0.2, 0.10, 150),
}
I = pi*d_bar**4/64
for nom, (ap, f, D) in casos.items():
    Fc, Fr, Fa, T = corte(ap, f, D)
    F = sqrt(Fc**2+Fr**2)              # carga transversal sobre la barra
    b = L-a
    defl = F*a**2*b**2/(3*E*I*L)        # flecha bajo la herramienta
    M = F*a*b/L                         # [N mm]
    sig = 32*M/(pi*d_bar**3)
    tau = 16*T*1000/(pi*d_bar**3)
    svm = sqrt(sig**2+3*tau**2)
    print(f"{nom}: Fc={Fc:.0f} N Fr={Fr:.0f} N Fa={Fa:.0f} N T={T:.1f} N m "
          f"(disp {T_bar:.0f}) | F={F:.0f} N flecha={defl*1000:.1f} um "
          f"sVM={svm:.1f} MPa FS={Sy_4140/svm:.0f}")

# Caso peor de flecha: carga al centro de la luz
Fc, Fr, Fa, T = corte(1.0, 0.20, 150)
F = sqrt(Fc**2+Fr**2)
print(f"Herramienta al centro (L/2): flecha {F*L**3/(48*E*I)*1000:.0f} um -> solo acabado ahi")

# Peso propio de la barra
m_bar = 7850e-9*pi*d_bar**2/4*1000
print(f"Masa barra Ø35x1000 = {m_bar:.2f} kg")

# Soporte lado motriz (pieza critica): reaccion de corte + peso en voladizo del accionamiento
FS_din = 2.0
R_corte = F*(L-a)/L
m_acc = 14.5           # motor + reductor + poleas + brida [kg]
x_acc = 0.18           # voladizo del CG respecto de la placa soldada [m]
W = m_acc*9.81
M_vol = W*x_acc
print(f"Soporte motriz: reaccion corte {R_corte:.0f} N, peso accionamiento {W:.0f} N, "
      f"momento voladizo {M_vol:.1f} N m, par reaccion {T_bar:.0f} N m; "
      f"cargas de diseno x{FS_din}: radial {FS_din*(R_corte+W):.0f} N, axial {FS_din*Fa:.0f} N, "
      f"momento {FS_din*M_vol:.0f} N m, par {FS_din*T_bar:.0f} N m")

# Cordon de soldadura de la placa base (filete 6 mm perimetral 2x(120+100) mm)
g = 6*0.707; Lw = 2*(120+100)
tau_w = FS_din*(R_corte+W)/(g*Lw)
print(f"Filete placa base: tau media {tau_w:.2f} MPa (E70XX admisible ~145 MPa)")

# Avance axial: husillo Tr16x4, motor paso a paso
p, eta_h = 4.0, 0.35
F_ax = FS_din*Fa + 50   # + friccion de bujes estimada
T_h = F_ax*p/(2*pi*eta_h)/1000
print(f"Husillo Tr16x4: empuje {F_ax:.0f} N -> par {T_h:.2f} N m (NEMA 23 1,26 N m)")

# Recargue: velocidad de giro para velocidad de soldeo 150-300 mm/min
for D in (30, 80, 150):
    print(f"Recargue Ø{D}: {150/(pi*D):.2f}-{300/(pi*D):.2f} rpm")
