> **Cómo leer este documento:** GitHub.com muestra automáticamente los archivos Markdown. En Visual Studio Code, utiliza `Cmd + Shift + V` (Mac) o `Ctrl + Shift + V` (Windows) para abrir la vista previa.

# Unidad 1 · Primer experimento económico en Octave

**Curso Práctico de Modelos Macroeconómicos Computacionales · INTEC**  
Profesor: Harold Vásquez, Ph.D. · Asistente: Wilmar Núñez  
Versión 1.0.0 · 13 de noviembre de 2026 · Duración guiada: 2 horas.

Esta unidad es compartida por los estudiantes de Macroeconomía I y II. Se aprende a ejecutar, modificar, comprobar e interpretar una trayectoria de crecimiento compuesto. No es un curso completo previo de programación ni una implementación de Solow o Ramsey.

## Pregunta económica

¿Qué diferencia genera mantener una tasa anual del 3 %, en lugar del 2 %, durante veinte años, partiendo del mismo índice 100?

Las tasas y el nivel inicial son **supuestos ilustrativos**, sin asignación a un país. El mecanismo puede servir para discutir escenarios de ingreso real por habitante de República Dominicana o Estados Unidos. No contiene datos observados ni un pronóstico validado.

## Inicio rápido

1. Extraiga el ZIP y abra **esta carpeta** (`common/01-intro-octave`) como carpeta actual de MATLAB u Octave. No ejecute dentro del ZIP ni suba la carpeta reservada del profesor al repositorio público.
2. Lea `params.m`. Allí están los cuatro supuestos compartidos por los ejecutables.
3. En la consola de MATLAB/Octave, escriba:

```matlab
check_environment(true)
run_intro
```

`run_intro` borra las variables de la sesión y cierra las figuras anteriores: guarde antes cualquier trabajo. Produce una tabla en la consola, variables en memoria y una figura visible. Para exportar tablas, metadatos y figuras:

```matlab
r = run_example();
```

Para ejecutar sin gráficos y comprobar el núcleo numérico:

```matlab
r = run_example(false);
report = run_tests();
```

Con un entorno gráfico funcional:

```matlab
report = run_tests(true);
```

**Requisitos:** MATLAB base con licencia válida **o** GNU Octave. No se requieren paquetes adicionales, `pkg load`, toolboxes, Dynare, Python, Git ni VS Code para ejecutar los archivos `.m`. La instalación debe incluir un backend gráfico funcional para mostrar/exportar figuras. Consulte [instalación](docs/installation.md).

## Estado de validación — leer antes de utilizar en clase

Las fórmulas y los CSV de referencia superaron **10 comprobaciones matemáticas independientes en Python**, con aritmética decimal. Los archivos `.m` se prepararon con sintaxis y funciones básicas comunes, pero **no se ejecutaron en MATLAB ni en Octave en el entorno de elaboración**. Se incluyen 20 pruebas nativas, más una gráfica opcional, para hacer esa comprobación en el equipo docente. La compatibilidad de ejecución no se presenta como certificada. Véase [registro de validación](docs/validation.md).

## Ruta de aprendizaje

| Paso | Archivo | Qué aprenderá |
|---|---|---|
| Explorar | [examples/primeros_pasos.m](examples/primeros_pasos.m) | Asignación, vectores, índices y potencia elemento a elemento. |
| Interpretar | [theory.md](theory.md) | Ecuación, unidades, mecanismo, casos de uso y límites. |
| Ejecutar | [run_intro.m](run_intro.m) | Calcular y representar los dos escenarios. |
| Modificar | [params.m](params.m) | Cambiar un supuesto y volver a ejecutar todo. |
| Reproducir | [run_example.m](run_example.m) | Exportar tablas, figuras y ficha de la ejecución. |
| Comprobar | [run_tests.m](run_tests.m) | Contrastar invariantes, referencias y manejo de entradas. |
| Practicar | [exercises.md](exercises.md) | Resolver actividades y escribir una interpretación. |

## Resultados del caso de referencia

| Año | A: 2 % | B: 3 % | Brecha B−A, puntos del índice | Brecha relativa a A, % |
|---:|---:|---:|---:|---:|
| 0 | 100.0000 | 100.0000 | 0.0000 | 0.0000 |
| 5 | 110.4081 | 115.9274 | 5.5193 | 4.9990 |
| 10 | 121.8994 | 134.3916 | 12.4922 | 10.2480 |
| 20 | 148.5947 | 180.6111 | 32.0164 | 21.5461 |

Los CSV contienen mayor precisión; son referencias calculadas independientemente, **no salidas atribuidas a una ejecución de MATLAB/Octave**. Una diferencia de **1 punto porcentual** entre tasas no equivale a una brecha de niveles de 1 % ni de 20 % al final.

## Archivos generados

`run_example` escribe en `outputs/`:

- `growth_paths.csv` (21 observaciones en el caso base) y `summary.csv` (años seleccionados).
- `growth_paths.png/.pdf` y `relative_gap.png/.pdf`, cuando se solicitan gráficos.
- `run_metadata.txt`: parámetros, unidades, frecuencia, motor y versión de la ejecución real.

Las salidas con el mismo nombre se sobrescriben. Para conservar una variante:

```matlab
p = params();
p.g_alt = 0.04;
r = run_example(true, p, fullfile(pwd, 'outputs', 'alternativo_4pct'));
```

## Documentación y presentación

[Guía práctica](docs/guia_practica.md) · [Problemas frecuentes](docs/troubleshooting.md) · [Fuentes](references/sources.md) · [Licencias y atribución](LICENSE_STATUS.md)

Presentación: [PDF](slides/Unidad_01_Primer_Experimento_Octave.pdf).

Los estudiantes trabajan en copias propias; no necesitan escribir en el repositorio docente. El entrenamiento de GitHub Desktop/VS Code se realiza aparte. Al terminar esta unidad, vectores y dimensiones preparan la unidad de álgebra matricial y modelo keynesiano.
