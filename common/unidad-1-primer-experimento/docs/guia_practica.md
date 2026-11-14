# Guía práctica del estudiante — 120 minutos

## Antes de comenzar

Tenga el motor instalado, el ZIP extraído y una copia propia de la unidad. Conserve las carpetas incluidas. La sesión reserva una comprobación de instalación, no una instalación prolongada desde cero. En caso de incidencias, trabaje con el asistente y consulte la guía correspondiente.

## Bloque 1 · Orientarse y diagnosticar (0–15 minutos)

Abra la consola, el editor y la carpeta actual. Consulte `version`, `pwd` y `dir`. Ejecute `check_environment(true)`. Identifique dónde escribir código, dónde observar resultados y dónde se guardan los archivos. Lea la pregunta económica antes de abrir los gráficos.

**Punto de control:** puede ubicar `run_intro.m` y conoce la diferencia entre la terminal del sistema y la consola del motor.

## Bloque 2 · Aprender los comandos necesarios (15–35 minutos)

Abra `examples/primeros_pasos.m` y ejecute por bloques. Si desea ejecutarlo completo desde la carpeta de la unidad:

```matlab
run(fullfile('examples','primeros_pasos.m'))
```

Observe la asignación, el punto y coma y los vectores. Cree un vector con años de 0 a 20. Muestre sus dimensiones y explique por qué tiene 21 elementos. Compare `t(1)` con `t(end)`.

**Actividad:** resuelva A1 y A2 de `exercises.md`. No necesita escribir funciones ni resolver sistemas matriciales todavía.

## Bloque 3 · De la ecuación al script (35–55 minutos)

Lea el inicio de `theory.md`. Calcule manualmente los primeros dos años con una tasa de 2 %. Después ejecute:

```matlab
y0 = 100;
g = 0.02;
T = 20;
t = (0:T)';
y = y0 * (1+g).^t;
[t(1:3), y(1:3)]
```

Compruebe el valor inicial y los primeros dos incrementos. Explique qué papel cumple `.^`. Guarde ese experimento como un archivo `.m` propio.

## Bloque 4 · Ejecutar y leer resultados (55–75 minutos)

Abra `params.m`: el caso de referencia usa `100`, `0.02`, `0.03` y `20`. Ejecute `run_intro`. Antes de ejecutarlo, guarde cualquier trabajo previo: el script utiliza `clear` y `close all`.

Obtenga los años 0, 5, 10 y 20 con las posiciones 1, 6, 11 y 21 de los vectores. Lea ambos ejes y la leyenda. Distinga diferencia de tasas, diferencia en puntos del índice y brecha porcentual respecto del escenario A.

**Punto de control:** el valor final del escenario A debe aproximarse a 148.5947 y el de B a 180.6111. Estos números solo corresponden al caso base.

## Bloque 5 · Diseñar un experimento (75–95 minutos)

Resuelva B1 y elija B2 o B3. Escriba primero su predicción. Cambie un solo parámetro y ejecute todo de nuevo; no compare resultados nuevos con variables antiguas que quedaron en memoria.

Para conservar el caso de referencia, no es obligatorio editar `params.m`: puede pasar una variante al ejecutable reproducible:

```matlab
p = params();
p.g_alt = 0.04;
r = run_example(true,p,fullfile(pwd,'outputs','mi_escenario'));
```

`p` es una estructura que agrupa parámetros; `p.g_alt` identifica un campo. En esta unidad basta saber modificar ese campo: aprender a diseñar bibliotecas o estructuras más complejas no es un prerrequisito.

## Bloque 6 · Reproducir y comprobar (95–110 minutos)

Ejecute `run_example()` con el caso que desea conservar. Abra `outputs/growth_paths.csv`, la figura exportada y `run_metadata.txt`. La carpeta debe tener permisos de escritura.

```matlab
report = run_tests();
```

Las pruebas usan **parámetros base internos fijos**, por lo que no fallarán solo porque usted haya cambiado `params.m`. Contrástelas con sus propias comprobaciones económicas. Si el motor tiene gráficos funcionales, añada `run_tests(true)`.

**Punto de control:** un compañero puede reproducir su experimento con los archivos y parámetros documentados, sin copiar valores manualmente de la pantalla.

## Cierre · Explicar y preparar la entrega (110–120 minutos)

Escriba tres oraciones: qué cambió, qué ocurrió y por qué. Añada una limitación: el ejercicio impone la tasa y no identifica sus causas ni produce un pronóstico validado. Lea C1 para la práctica posterior.

La entrega posterior se prepara en su carpeta propia y se envía por el canal académico indicado por el profesor. No se presume autorización de escritura en el repositorio docente ni publicación de información personal.
