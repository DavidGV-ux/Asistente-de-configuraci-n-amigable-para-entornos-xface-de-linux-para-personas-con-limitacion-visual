#!/bin/bash

# Reproducir el archivo de audio intro.mp3
if command -v mpg123 &> /dev/null; then
    mpg123 introF.mp3 &
elif command -v afplay &> /dev/null; then
    afplay introF.mp3 &  # Para sistemas macOS
else
    echo "No se encontró un reproductor de MP3. Por favor, instala mpg123 o usa un reproductor compatible."
    exit 1
fi

# Esperar 5 segundos para asegurarse de que la intro se reproduce el tiempo suficiente
sleep 7

# Verificar si el entorno virtual existe
if [ -d "py" ]; then
    echo "Activando el entorno virtual..."
    source py/bin/activate

    # Ejecutar el script de Python config_escritorio.py
    if [ -f "./config_escritorio.py" ]; then
        python3 config_escritorio.py
    else
        echo "El archivo config_escritorio.py no se encuentra en el directorio actual."
        deactivate  # Desactivar el entorno virtual si ocurre un error
        exit 1
    fi

    # Desactivar el entorno virtual después de la ejecución
    deactivate
else
    echo "El entorno virtual 'py' no se encuentra. Por favor, asegúrate de haberlo creado."
    exit 1
fi

