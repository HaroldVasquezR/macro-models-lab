# Ejercicios · Unidad 1

Trabaje en una copia propia. Entregue código, una tabla, una figura y una nota económica. Las soluciones completas son material reservado del docente y no forman parte de esta carpeta.

## A. Ejecución y comprensión — durante la sesión

**A1. Asignación.** En `examples/primeros_pasos.m`, calcule `y1` con `g=0.02`. Cambie solamente `g` a `0.03` y consulte `y1` antes de volver a calcularlo. Explique lo observado.

**A2. Tiempo e índices.** Con `T=20`, construya `t=(0:T)'`. Muestre `size(t)`, `numel(t)`, `t(1)` y `t(end)`. ¿Qué posición corresponde al año 10? Escriba el comando que selecciona ese año sin confundirlo con la décima observación.

**A3. Caso base.** Ejecute `run_intro`. Identifique los parámetros, la variable calculada y las unidades. Extraiga los años 0, 5, 10 y 20. Compare con `expected/summary_reference.csv`.

## B. Modificar, anticipar y explicar — práctica de la sesión

**B1. Tasa cero.** Construya una trayectoria con `y0=100`, `g=0` y `T=20`. Antes de ejecutar, prediga su forma y el valor final. Interprete el resultado.

**B2. Un cambio de tasa.** Cambie únicamente la tasa alternativa a `0.04`. Mantenga `y0=100`, la tasa base de 2 % y `T=20`. Calcule la brecha en puntos del índice y la brecha porcentual respecto del escenario base. No utilice la diferencia de tasas como sustituto de esas magnitudes.

**B3. Nivel inicial.** Duplique `y0`, sin modificar las tasas ni el horizonte. Compare los niveles finales, la diferencia en puntos y la brecha relativa. Explique cuáles magnitudes cambian y cuáles no.

## C. Aplicación e interpretación — entrega posterior

**C1. Un país como contexto, no como fuente inventada.** Elija República Dominicana o Estados Unidos como contexto de discusión. Construya dos escenarios hipotéticos de ingreso real por habitante. Identifique explícitamente que sus tasas son supuestos, no estimaciones de ese país. No hace falta descargar datos en esta unidad.

Redacte entre 180 y 250 palabras que respondan: ¿qué pregunta estudia?, ¿qué cambia entre escenarios?, ¿qué resultado obtiene?, ¿cómo opera el crecimiento compuesto?, ¿qué información faltaría para convertir el ejercicio en una calibración documentada?, ¿qué no permite afirmar sobre el país?

Entregue `ejercicio_apellido.m`, `resultados.csv`, `figura.png` o `figura.pdf`, `interpretacion.md` y una nota breve con motor/versión, comando de ejecución y supuestos. Utilice un identificador que no exponga matrícula, correo ni otros datos personales en un repositorio público.

## D. Ampliación opcional — no necesaria para completar la unidad

Compare una tasa de −1 % con una tasa nula y otra positiva. Explique por qué una trayectoria decreciente sigue siendo positiva cuando `g>-1`. Alternativamente, derive el tiempo de duplicación para una tasa positiva y distinga el tiempo fraccionario del primer año entero en que se supera el doble. No es necesario desarrollar un algoritmo nuevo.

## Criterios de evaluación propuestos

Código reproducible (30 %), cálculo y comprobaciones (25 %), interpretación económica y límites (30 %), presentación y documentación (15 %). Estos porcentajes son una rúbrica de la actividad, no una modificación automática de la evaluación oficial de Macro I o II.
