#!/bin/bash
# Configuración para discapacidad visual leve
echo "Configurando el escritorio para discapacidad visual leve..."

# Aumentar el tamaño de la fuente del sistema
xfconf-query -c xsettings -p /Gtk/FontName --create -t string -s 'Sans 22'

# Habilitar alto contraste
xfconf-query -c xsettings -p /Net/ThemeName --create -t string -s 'HighContrast'

# Ajustar la escala de la interfaz (opcional, útil para pantallas de alta resolución)
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor --create -t int -s 1

# Configurar el tamaño de los iconos en el escritorio
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size --create -t int -s 40

# Aumentar el tamaño del puntero del mouse
xfconf-query -c xsettings -p /Gtk/CursorThemeSize --create -t int -s 50

# Reiniciar el gestor de ventanas para aplicar los cambios
echo "Reiniciando el gestor de ventanas para aplicar los cambios..."
xfwm4 --replace &

echo "Se han realizado las configuraciones de accesibilidad."

