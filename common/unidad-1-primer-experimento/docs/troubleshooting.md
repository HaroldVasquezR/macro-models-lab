# Problemas frecuentes

| Síntoma | Comprobación y solución |
|---|---|
| `run_intro` no se encuentra | Extraiga el ZIP, abra la carpeta `01-intro-octave`, compruebe `pwd`, `dir` y `which run_intro`. No copie únicamente el script sin `params.m`. |
| El archivo se llama `.m.txt` | Muestre las extensiones y guárdelo realmente como `.m`, no como documento de texto con doble extensión. |
| Cambió `g` pero `y` no cambia | Una asignación guarda un resultado, no una fórmula vinculada. Vuelva a ejecutar desde los parámetros hasta la salida. |
| La potencia devuelve error | Use `.^` para elevar el factor a cada elemento del vector de tiempo. `^` tiene significado matricial. |
| Una tasa de 2 produce niveles enormes | `2` equivale a 200 %; 2 % se introduce como `0.02`. Use punto decimal, no coma. |
| El período final aparece desplazado | `0:T` incluye el año cero. `t(1)=0`; el año 20 ocupa la posición 21. |
| Error de dimensiones | Inspeccione `size(t)` y `size(y)`. En los archivos principales ambos son vectores columna. No elimine una transposición sin revisar el resto. |
| No puede escribir el CSV | Use una carpeta local con permisos de escritura. Cierre el archivo si otra aplicación lo mantiene bloqueado. No ejecute dentro del ZIP. |
| No aparece figura con `run_example` | Es deliberado: el exportador usa figuras invisibles y guarda PNG/PDF. `run_intro` sí muestra una figura. |
| Falla la exportación gráfica | Ejecute `check_environment(true)`. Compruebe backend, fuentes y dependencias del instalador. No instale paquetes económicos al azar. Aísle el cálculo con `run_example(false)`. |
| Una función apunta a otro curso | Consulte `which params`, `which run_example` y `which growth_path`. El ejecutable reproducible agrega temporalmente sus rutas y las restaura al terminar. Evite archivos propios llamados `plot.m`, `sum.m`, `size.m` o `params.m` en otra carpeta activa. |
| Las pruebas muestran `FAIL` | Copie el mensaje completo y registre `version`, `computer` y los archivos utilizados. No cambie tolerancias solo para ocultar un resultado. |
| Un supuesto inválido genera `U01:...` | Es una comprobación intencional: nivel inicial positivo, tasa mayor que −1 y horizonte entero no negativo dentro del límite docente documentado. |
| El CSV se ve en una sola columna | Importe con coma como separador y punto como decimal; no cambie el código para adaptarlo silenciosamente a una configuración regional. |

## Cómo pedir ayuda

Comunique el comando exacto, el mensaje completo, el motor/versión y el sistema operativo. Señale si cambió `params.m`. No es necesario compartir rutas con información personal, credenciales o archivos ajenos al curso.

## No confundir una prueba con otra

`run_tests()` comprueba el cálculo y la exportación de tablas. `run_tests(true)` agrega archivos gráficos. La lectura visual verifica su presentación. Ninguna de esas comprobaciones valida la tasa como estimación económica ni convierte el escenario en pronóstico.
