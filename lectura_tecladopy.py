from pynput import keyboard
import subprocess

def on_press(key):
    try:
        # Intentamos obtener la letra de la tecla
        letra = key.char
        if letra:
            print(f"Tecla presionada: {letra}")
            # Reproducir el archivo mp3 correspondiente
            subprocess.Popen(["mpv", f"letras/{letra}.mp3", "--quiet"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    except AttributeError:
        # Manejo para teclas especiales
        especial = None
        if key == keyboard.Key.tab:
            especial = "tab"
        elif key == keyboard.Key.enter:
            especial = "enter"
        elif key == keyboard.Key.backspace:
            especial = "backspace"
        elif key == keyboard.Key.esc:
            especial = "esc"
        elif key == keyboard.Key.space:
            especial = "space"  # Aquí añadimos la tecla espacio

        if especial:
            print(f"Tecla especial presionada: {especial}")
            subprocess.Popen(["mpv", f"letras/{especial}.mp3", "--quiet"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# Iniciamos el listener de teclado
with keyboard.Listener(on_press=on_press) as listener:
    listener.join()

