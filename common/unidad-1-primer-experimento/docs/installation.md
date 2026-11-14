# Instalación y entorno

**Revisión documental: 13 de noviembre de 2026.** Se verificaron los portales oficiales listados al final. Estas instrucciones no certifican una instalación concreta ni sustituyen el registro de motor/versión del equipo de clase.

## 1. Qué se necesita realmente

Para esta unidad basta **GNU Octave** o **MATLAB base**. No se necesitan Dynare, toolboxes, paquetes de Octave, `statistics`, `datatypes`, Python ni un compilador para ejecutar los `.m`. La programación es numérica; no utiliza cálculo simbólico ni descargas automáticas.

Los gráficos requieren que la instalación del motor tenga un backend gráfico y exportación PNG/PDF funcionales. Esto se diagnostica con `check_environment(true)`. La verificación matemática independiente `tests/verify_reference.py` usa Python 3 y solo su biblioteca estándar; es una herramienta opcional del mantenedor, no un requisito de los alumnos.

El PDF se abre en cualquier lector de PDF. LaTeX solo se necesita para **editar y recompilar la presentación**, no para estudiar o ejecutar los códigos.

## 2. GNU Octave en Windows

Entre al portal oficial [Descargas de GNU Octave](https://octave.org/download). La versión estable indicada en la consulta es **11.3.0**; esa es una referencia documental, no una versión ejecutada aquí. Seleccione el instalador Windows de 64 bits recomendado por el proyecto, compatible con su equipo, y siga el instalador. No necesita la variante de álgebra lineal para arreglos extremadamente grandes para esta unidad.

Abra Octave con su interfaz gráfica. En su consola, ejecute `version`. Guarde la versión que realmente devuelve, incluso si es diferente de la publicada en esta guía. La distribución puede incluir paquetes adicionales: que estén instalados no significa que los use este módulo.

## 3. GNU Octave en macOS

Consulte [Octave for macOS](https://wiki.octave.org/Octave_for_macOS), enlazado desde el portal oficial. La página consultada documenta Homebrew, especialmente para Apple Silicon, y alternativas como MacPorts. **No se presupone soporte idéntico para un Mac Intel antiguo, una versión antigua de macOS y un Apple Silicon.** Verifique los requisitos del gestor para la arquitectura y versión del sistema antes de instalar.

Con Homebrew ya instalado y compatible con el equipo, en **Terminal**, no en la consola de Octave:

```bash
brew install octave
octave --gui
```

No se prescribe una actualización global de todos los paquetes del equipo. Si Homebrew no está instalado, siga su instalación oficial desde el enlace de la wiki; no copie scripts de fuentes desconocidas. Si la distribución no incluye GUI, documente esa limitación: el cálculo puede ejecutarse por consola, pero la experiencia de clase y los gráficos necesitan revisión.

## 4. GNU/Linux

Use el gestor de paquetes de su distribución. En Debian/Ubuntu, por ejemplo, el paquete se instala desde una terminal con `sudo apt install octave`, después de preparar correctamente los repositorios según las instrucciones de la distribución. Requiere permisos y conexión; las versiones disponibles pueden diferir. No se asume que este comando sea válido para cualquier distribución.

## 5. Alternativa con MATLAB

Use una instalación de MATLAB con licencia válida. El paquete no suministra una licencia ni presupone acceso institucional. Abra la carpeta de la unidad en MATLAB, consulte `version` y use los mismos archivos `.m`.

Se han evitado funciones exclusivas de Octave, toolboxes y sintaxis reciente innecesaria. Aun así, **la ejecución debe comprobarse en la versión concreta de MATLAB**; no se declara una versión mínima garantizada sin pruebas.

## 6. Preparar la carpeta

Extraiga primero todos los archivos. Navegue a `para_repositorio/common/01-intro-octave` y conviértala en la carpeta actual del motor. Mantenga `src/`, `tests/`, `expected/` y `params.m` junto a los ejecutables.

```matlab
pwd
dir
version
which run_intro
check_environment(true)
```

`which run_intro` debe apuntar al archivo de esta unidad. El editor VS Code no ejecuta el modelo por sí solo: MATLAB/Octave es el motor. Los comandos de `brew`, `apt` o `pdflatex` pertenecen a la terminal del sistema; los bloques marcados `matlab` pertenecen a la consola de MATLAB/Octave.

## 7. Comprobación de aceptación local

```matlab
run_intro
r = run_example();
report = run_tests(true);
```

Guarde los mensajes, el motor, la versión y el sistema operativo en un registro docente. El test de figuras comprueba que existen archivos no vacíos; revise además que ejes, leyendas y texto sean legibles. Si no dispone de exportación gráfica, ejecute `run_example(false)` y `run_tests()` para aislar el cálculo y documente lo pendiente.

**Fuentes oficiales:** [GNU Octave: descargas](https://octave.org/download), [inicio](https://docs.octave.org/latest/Getting-Started.html), [ejecución](https://docs.octave.org/latest/Running-Octave.html), [macOS](https://wiki.octave.org/Octave_for_macOS), [MathWorks: scripts](https://www.mathworks.com/help/matlab/matlab_prog/create-scripts.html). Las páginas con `latest` pueden actualizarse; esta guía registra su fecha de consulta.
