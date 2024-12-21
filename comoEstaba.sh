#!/bin/bash
# Restaurar configuraciones predeterminadas del escritorio XFCE
echo "Restaurando las configuraciones predeterminadas del escritorio..."

# Restaurar el tamaño de la fuente del sistema
xfconf-query -c xsettings -p /Gtk/FontName --create -t string -s 'Sans 10'

# Restaurar el tema predeterminado
xfconf-query -c xsettings -p /Net/ThemeName --create -t string -s 'Mint-Y'

# Restaurar la escala de la interfaz a 1 (sin escalado)
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor --create -t int -s 1

# Restaurar el tamaño de los iconos en el escritorio
xfconf-query -c xfce4-desktop -p /desktop-icons/icon-size --create -t int -s 48

# Restaurar el tamaño del puntero del mouse
xfconf-query -c xsettings -p /Gtk/CursorThemeSize --create -t int -s 24

# Reiniciar el gestor de ventanas para aplicar los cambios
echo "Reiniciando el gestor de ventanas para aplicar los cambios..."
xfwm4 --replace &

echo "El escritorio ha sido restaurado a las configuraciones predeterminadas."

