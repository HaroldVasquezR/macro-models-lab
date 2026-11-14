# Lectura · Un primer experimento de crecimiento

## 1. De una pregunta a una ecuación

Suponga que un índice de ingreso real por habitante comienza en 100. Queremos comparar dos trayectorias posibles: una aumenta 2 % cada año y otra 3 %. Antes de programar debemos fijar la variable, sus unidades, la frecuencia y los supuestos.

En esta unidad, `y` es un **índice de ingreso real por habitante**, `t` mide años desde el comienzo, `y0` es el nivel inicial y `g` una tasa anual expresada en tanto por uno. Un valor `g = 0.02` representa 2 %, no 0.02 % ni 200 %.

El índice permite estudiar cambios proporcionales sin usar una moneda específica. No convierte por sí mismo los niveles de ingreso de distintos países en magnitudes comparables.

## 2. El mecanismo del crecimiento compuesto

Una tasa constante significa que el aumento de cada año se calcula sobre el nivel del año anterior:

\[
y_{t+1}=(1+g)y_t.
\]

Por sustitución sucesiva:

\[
y_1=y_0(1+g),\qquad y_2=y_0(1+g)^2,\qquad y_t=y_0(1+g)^t.
\]

Con `y0 = 100` y `g = 0.02`, el primer aumento es 2 y el siguiente es 2.04. El aumento absoluto crece porque se aplica el mismo porcentaje a una base mayor. La tasa sigue siendo 2 %.

No es lo mismo que `y0 * (1 + g*t)`, que añade cada año el mismo incremento calculado sobre el nivel inicial. Esa expresión describe otro supuesto. Tampoco se sustituye automáticamente la fórmula discreta por `y0*exp(g*t)`: la tasa continua equivalente sería `log(1+g)`. Esta última distinción es de consulta; no es requisito de la práctica inicial.

## 3. Qué está dado y qué calculamos

| Objeto | Papel en el experimento |
|---|---|
| `y0` | Condición inicial, ilustrativa en esta unidad. |
| `g` | Parámetro impuesto; el ejercicio no explica por qué toma ese valor. |
| `T` | Horizonte elegido para el experimento. |
| `t = 0:T` | Índices temporales, no una serie de años calendario. |
| `y` | Trayectoria calculada a partir de la ecuación. |
| Tabla, figura y brecha | Resultados derivados, no nuevos datos observados. |

No utilizamos una función de producción, decisiones de hogares o un mecanismo de innovación. Por eso la trayectoria es un **ejercicio de crecimiento compuesto**, no un modelo estructural completo de crecimiento económico.

## 4. La traducción a MATLAB/Octave

```matlab
y0 = 100;
g = 0.02;
T = 20;
t = (0:T)';
y = y0 * (1 + g).^t;
```

`(0:T)'` crea un vector columna: el apóstrofo transpone el vector real. Hay `T+1` observaciones porque se incluye `t=0`. El elemento `y(1)` corresponde a ese año inicial; `y(21)` corresponde al año 20. Los índices de los arreglos empiezan en 1, aunque el tiempo del modelo empiece en 0.

El punto en `.^` indica potencia elemento a elemento. `./` se utilizará para dividir los niveles de una trayectoria por los de otra, observación por observación. Las reglas de operaciones matriciales completas se tratarán en la unidad siguiente. Consulte las fuentes [O3] y [M2] en el archivo de referencias.

Una asignación como `y1 = y0*(1+g)` calcula y guarda un valor. Cambiar `g` después no actualiza automáticamente `y1`: debe ejecutar de nuevo la expresión. Esta es una diferencia importante frente a una celda con fórmula de una hoja de cálculo.

## 5. Comparar sin confundir unidades

Para A con tasa `g_A` y B con tasa `g_B`:

\[
\Delta g_{pp}=100(g_B-g_A),\qquad
D_t=y_{B,t}-y_{A,t},\qquad
B_t=100\left(\frac{y_{B,t}}{y_{A,t}}-1\right).
\]

La primera magnitud es una diferencia de tasas en **puntos porcentuales**. La segunda es una diferencia de niveles en **puntos del índice**. La tercera es una diferencia de niveles **en porcentaje respecto de A**. Cambiar el denominador cambia la comparación.

Con la misma condición inicial, la brecha relativa depende del cociente de los factores de crecimiento:

\[
B_t=100\left[\left(\frac{1+g_B}{1+g_A}\right)^t-1\right].
\]

En el año 20, A alcanza aproximadamente 148.5947 y B 180.6111. La diferencia es 32.0164 puntos del índice, o 21.5461 % respecto de A. No se obtiene la respuesta multiplicando simplemente la diferencia de tasas por veinte.

El crecimiento acumulado de A es `100*(y_A(T)/y0-1)`. Con `y0=100` coincide numéricamente con `y_A(T)-100`, pero no son definiciones intercambiables cuando cambia el nivel inicial.

## 6. Casos de uso: República Dominicana y Estados Unidos

**Escenario de ingreso por habitante.** Una vez definida una serie adecuada y justificada una tasa, la ecuación permite mostrar lo que implicaría mantener esa tasa durante un horizonte. Aquí solo practicamos la lógica; no seleccionamos una tasa histórica ni una proyección oficial para ninguno de los países.

**Sensibilidad al horizonte.** El mismo cambio de tasa puede producir diferencias pequeñas a cinco años y mayores a veinte. La comparación ayuda a explicar por qué importan los supuestos de largo plazo.

**Separar nivel inicial y crecimiento.** Normalizar dos series en 100 facilita comparar su expansión relativa. Oculta, sin embargo, la diferencia inicial de ingreso. Dos curvas normalizadas no permiten afirmar que un país alcanzará el nivel de vida del otro.

**Preparar una aplicación con datos.** Para República Dominicana se considerarían cuentas nacionales del BCRD y población de la ONE; para Estados Unidos, producción de BEA y una fuente de población compatible. Antes de usarlas habría que documentar serie, período, revisión, unidades, frecuencia y cobertura. No se descargan ni redistribuyen datos de esos organismos en esta unidad.

No se comparan directamente pesos con dólares, PIB total con ingreso por habitante ni series nominales con series reales. Una tasa de crecimiento del PIB total tampoco es automáticamente la tasa del PIB por habitante.

## 7. Qué no permite concluir este experimento

La tasa es exógena: el ejercicio no identifica sus determinantes ni mide el efecto causal de una política. No incorpora ciclos, incertidumbre, cambios demográficos explícitos o restricciones productivas. No ofrece intervalos de pronóstico. Una gráfica suave puede ser una consecuencia de los supuestos, no una propiedad de la economía.

Un escenario aplicado a un país sigue siendo ilustrativo hasta justificar sus insumos. Calibrarlo no lo convierte por sí solo en un pronóstico validado. Utilizar nombres o parámetros nacionales tampoco introduce comercio, movimientos de capital ni una estructura de economía abierta.

## 8. Comprobar antes de interpretar

Compruebe `t=0`, `g=0`, un cálculo manual de dos períodos, el número de observaciones y las unidades del gráfico. Compare una solución por fórmula con la recurrencia. Verifique que solo cambió el supuesto que quería estudiar.

La función `growth_path.m` añade validación de entradas y se utiliza en el ejecutable reproducible. Aprender a escribir esas validaciones no es un prerrequisito para comprender el script introductorio.

**Fuentes de esta lectura:** unidad 1 del programa aprobado; selección pedagógica del `intro_octave.m` del profesor; documentación oficial [O1–O4, M1–M2]. Las ecuaciones, ejemplos numéricos y ejercicios de esta unidad son desarrollos docentes para este paquete; no se atribuyen como texto literal a los manuales.
