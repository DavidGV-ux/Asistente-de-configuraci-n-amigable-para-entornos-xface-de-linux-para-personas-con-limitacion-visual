#!/bin/bash
# Configuración para discapacidad visual moderada o parcial
echo "Configurando el escritorio para discapacidad visual moderada o parcial..."

# Verifica si se están ejecutando los comandos como superusuario
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como superusuario (sudo)." 
   exit 1
fi

# Aumentar el tamaño de la fuente del sistema
xfconf-query -c xsettings -p /Gtk/FontName --create -t string -s 'Sans 18'

# Habilitar alto contraste
xfconf-query -c xsettings -p /Net/ThemeName --create -t string -s 'HighContrast'

# Ajustar la escala de la interfaz
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor --create -t int -s 2

# Configurar el tamaño de los iconos en el escritorio
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size --create -t int -s 80

# Aumentar el tamaño del puntero del mouse
xfconf-query -c xsettings -p /Gtk/CursorThemeSize --create -t int -s 64

# Instalar Orca si no está instalado
if ! command -v orca &> /dev/null; then
    echo "Instalando el lector de pantalla Orca..."
    apt install orca -y
fi
orca &

# Instalar KMag si no está instalado
if ! command -v kmag &> /dev/null; then
    echo "Instalando la lupa KMag..."
    apt install kmag -y
fi

# Ejecutar KMag con configuración predeterminada
echo "Ejecutando KMag como lupa alrededor del cursor..."
kmag &
