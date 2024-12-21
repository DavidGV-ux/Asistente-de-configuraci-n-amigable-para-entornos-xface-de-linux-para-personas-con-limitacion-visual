#!/bin/bash

# Variable para almacenar el nombre de la última ventana
last_window_name=""

while true; do
    # Obtener el ID de la ventana activa
    window_id=$(xdotool getactivewindow)

    # Obtener el nombre de la ventana activa
    window_name=$(xdotool getwindowname "$window_id")

    # Verificar si se obtuvo correctamente el nombre de la ventana
    if [ -z "$window_name" ]; then
        echo "No se pudo obtener el nombre de la ventana activa."
    elif [ "$window_name" != "$last_window_name" ]; then
        # Si el nombre de la ventana ha cambiado, reproducirlo
        espeak "$window_name"
        # Actualizar la última ventana conocida
        last_window_name="$window_name"
    fi

    # Pausar por 1 segundo antes de la próxima iteración
    sleep 1
done

