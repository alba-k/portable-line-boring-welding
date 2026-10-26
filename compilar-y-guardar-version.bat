@echo off
rem Compila el informe y guarda una copia numerada del PDF en versiones\
rem (Mandriladora_v01_fecha.pdf, v02, v03...). Doble clic para usar.
chcp 65001 >nul
cd /d "%~dp0"
pdflatex -interaction=nonstopmode Mandriladora
bibtex Mandriladora
pdflatex -interaction=nonstopmode Mandriladora
pdflatex -interaction=nonstopmode Mandriladora
if not exist Mandriladora.pdf (
  echo No se genero el PDF. Revisa Mandriladora.log
  pause
  exit /b 1
)
if not exist versiones mkdir versiones
set n=1
:buscar
set "num=0%n%"
set "num=%num:~-2%"
if exist "versiones\Mandriladora_v%num%_*.pdf" (
  set /a n+=1
  goto buscar
)
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set fecha=%%i
copy /y Mandriladora.pdf "versiones\Mandriladora_v%num%_%fecha%.pdf" >nul
echo.
echo Guardado: versiones\Mandriladora_v%num%_%fecha%.pdf
pause
