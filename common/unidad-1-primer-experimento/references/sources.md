# Fuentes, procedencia y decisiones de adaptación

## Materiales del curso

**[C1] Programa aprobado.** Harold Vásquez, *Curso Práctico de Modelos Macroeconómicos Computacionales: Parte I*, versión 1.0, edición documental del 12 de noviembre de 2026. Archivo aportado: `Programa_Final_Modelos_Macroeconomicos_Computacionales_INTEC.tex`. Se revisaron la unidad 1, los productos reproducibles y el criterio de aplicaciones a República Dominicana y Estados Unidos. El archivo no se duplica aquí para evitar versiones paralelas del programa.

**[C2] Introducción previa.** `intro_octave.m`, de Harold Vásquez, recuperado de la biblioteca del proyecto. Se revisaron operaciones, matrices/vectores, indexación y gráficos. `examples/primeros_pasos.m` es una selección nueva y adaptada para la unidad 1; no es una copia literal del archivo original.

**Cambios identificados, no correcciones silenciosas del original:** se excluyeron cadenas de texto extensas y funciones armónicas, por no ser necesarias para el experimento. Se conserva la enseñanza de asignación, índices y operaciones elemento a elemento. Se emplea `fprintf`, común a ambos motores, en lugar de depender de `printf`. El ejemplo antiguo `x(n:96)` no se utiliza como equivalente a “hasta el final”; se enseña `end`. No se alteró el archivo original del profesor.

**[C3] GitHub Training / Development.** Se consultaron los acuerdos recuperables de la conversación: laboratorio separado de `HaroldVasquezR.github.io`; `macro-models-lab` seguía como nombre propuesto, no como repositorio creado; estructura propuesta con `common/`, `macro-i/`, `macro-ii/` y `docs/`. La ubicación local `common/01-intro-octave/` es una decisión de empaquetado compatible con ese esquema, no un árbol remoto ya aprobado o verificado en el disco del usuario. No se activó el prompt de creación de arquitectura ni se cambiaron permisos.

## Documentación oficial verificada el 13 de noviembre de 2026

- **[O1] GNU Octave, Getting Started.** https://docs.octave.org/latest/Getting-Started.html
- **[O2] GNU Octave, Running Octave y Script Files.** https://docs.octave.org/latest/Running-Octave.html · https://docs.octave.org/latest/Script-Files.html
- **[O3] GNU Octave, Arithmetic Operators.** https://docs.octave.org/latest/Arithmetic-Ops.html
- **[O4] GNU Octave, Two-Dimensional Plots.** https://docs.octave.org/latest/Two_002dDimensional-Plots.html
- **[O5] GNU Octave, Download y Octave for macOS.** https://octave.org/download · https://wiki.octave.org/Octave_for_macOS
- **[M1] MathWorks, Create Scripts.** https://www.mathworks.com/help/matlab/matlab_prog/create-scripts.html
- **[M2] MathWorks, power y Matrices and Arrays.** https://www.mathworks.com/help/matlab/ref/double.power.html · https://www.mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html
- **[M3] MathWorks, print y fprintf.** https://www.mathworks.com/help/matlab/ref/print.html · https://www.mathworks.com/help/matlab/ref/fprintf.html

Los manuales se citan como soporte de sintaxis y operación. El código del paquete es una implementación docente nueva; no se distribuye código ni páginas copiadas de esos manuales. Las URL con `latest` pueden cambiar. La versión documental de Octave consultada fue 11.3.0; no se declara ejecutada.

### Comprobaciones adicionales de funciones básicas

También se revisaron las referencias oficiales de MathWorks para [isfinite](https://www.mathworks.com/help/matlab/ref/double.isfinite.html), [isrow](https://www.mathworks.com/help/matlab/ref/double.isrow.html) y [onCleanup](https://www.mathworks.com/help/matlab/ref/oncleanup.html), y el apartado [Recovering From Errors](https://docs.octave.org/latest/Recovering-From-Errors.html) de Octave. Esa revisión documental no equivale a ejecutar los archivos `.m`.

## Datos y aplicaciones nacionales

No se utiliza ninguna observación real de República Dominicana o Estados Unidos. Los organismos mencionados en la lectura son fuentes previstas por el programa aprobado; aún no se seleccionó una serie para esta unidad. Las tasas de 2 %, 3 % y las variantes de ejercicios son supuestos didácticos.
