#!/bin/bash

# Abrir la primera terminal para ejecutar el entorno de Python
xfce4-terminal --hold --command "bash -c 'source py/bin/activate && python3 lectura_tecladopy.py'" &

# Abrir la segunda terminal para ejecutar el script ventanas.sh
xfce4-terminal --hold --command "bash -c './ventanas.sh'" &

# Mensaje de confirmación
echo "Las terminales han sido abiertas."

