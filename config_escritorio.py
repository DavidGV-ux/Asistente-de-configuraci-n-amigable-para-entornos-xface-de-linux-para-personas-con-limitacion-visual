import os
import subprocess
import speech_recognition as sr
from gtts import gTTS
import pygame

# Función para hablar una opción
def hablar(texto):
    tts = gTTS(text=texto, lang='es')
    tts.save("respuesta.mp3")
    
    # Inicializar pygame y reproducir el archivo de audio
    pygame.mixer.init()
    pygame.mixer.music.load("respuesta.mp3")
    pygame.mixer.music.play()
    
    # Esperar a que el audio termine de reproducirse
    while pygame.mixer.music.get_busy():
        continue
    
    # Eliminar el archivo de audio temporal
    os.remove("respuesta.mp3")

# Función para reconocer voz
def escuchar():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Escuchando...")
        r.adjust_for_ambient_noise(source)
        audio = r.listen(source)
    try:
        comando = r.recognize_google(audio, language='es-ES')
        print(f"Escuchaste: {comando}")
        return comando.lower()
    except sr.UnknownValueError:
        hablar("Lo siento, no entendí lo que dijiste.")
        return None
    except sr.RequestError:
        hablar("No pude conectar con el servicio de reconocimiento de voz.")
        return None

# Función para ejecutar el script según la opción
def ejecutar_configuracion(opcion):
    if opcion == "limitada":
        os.system("bash configurar_discapacidad_leve.sh")
        hablar("Configuración para discapacidad leve ejecutada.")
    elif opcion == "moderada":
        os.system("bash configurar_discapacidad_moderadaTamanio.sh")
        hablar("Se necesita ingresar con super usuario. Por favor, ingresa tu clave a continuación.")
        try:
            result = subprocess.run(
                ["sudo", "bash", "configurar_discapacidad_moderada.sh"],
                check=True
            )
            if result.returncode == 0:
                hablar("Configuración para discapacidad moderada ejecutada.")
            else:
                hablar("Hubo un problema al ejecutar la configuración para discapacidad moderada.")
        except subprocess.CalledProcessError:
            hablar("Error al ejecutar el script con superusuario.")
    elif opcion == "grave":
        os.system("bash configurar_discapacidad_total.sh")
        hablar("Configuración para discapacidad total ejecutada.")
    else:
        hablar("Opción no válida.")

# Menú de opciones
def menu_opciones():
    opciones = "Por favor, a continuacion habla segun el nivel de discapacidad visual: di limitada si es levemente reducida, moderada para moderadamente o grave para totalmente reducida."
    
    comando = None
    while not comando:
        hablar(opciones)
        comando = escuchar()  # Intenta escuchar el comando
        if comando:
            ejecutar_configuracion(comando)
        else:
            hablar("Por favor, repite lo que dijiste.")  # Si no se entiende, pide repetir

if __name__ == "__main__":
    menu_opciones()

