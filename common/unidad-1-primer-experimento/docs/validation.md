# Registro de validación · v1.0.0

**Fecha de elaboración:** 13 de noviembre de 2026.

## Evidencia efectivamente obtenida

1. Lectura del archivo `.tex` del programa aprobado, especialmente la unidad 1, y del texto recuperado de `intro_octave.m`.
2. Revisión de la documentación oficial de scripts, operaciones y gráficos de MATLAB/Octave; selección de funciones básicas sin paquetes extra.
3. **10/10 comprobaciones matemáticas independientes superadas en Python**, usando `Decimal` con 60 dígitos, recurrencia y fórmula cerrada. El reporte reproducible es `expected/validation_python.json`.
4. Compilación de la presentación con pdfLaTeX y revisión visual de las páginas renderizadas. El control final de entrega se describe en `expected/release_checks.json`.

## Lo que no se ha ejecutado aquí

**MATLAB y GNU Octave no estaban disponibles como motores ejecutables en el entorno de elaboración.** No se atribuyen a esos motores las tablas de referencia ni se informa una versión como “probada”. La revisión estática y la verificación matemática en otro lenguaje no sustituyen una ejecución nativa.

No se han probado instalaciones de los alumnos en Windows/macOS/Linux. No se han ejecutado la exportación gráfica `.m` ni los tests `.m`. La instalación de paquetes externos no es necesaria para la lógica de la unidad.

## Batería nativa incluida, pendiente de ejecución local

`run_tests()` contiene **20 pruebas**: invariantes, cálculo manual, horizonte cero, dimensiones, recurrencia, tasas negativas, escala, brechas, comparación con CSV independiente, rechazo de entradas inválidas, exportación CSV y metadatos. `run_tests(true)` agrega una prueba de exportación PNG/PDF.

El conjunto usa parámetros fijos de referencia y no depende de las modificaciones estudiantiles de `params.m`. La tolerancia de la comparación CSV es relativa a la escala global de la matriz y se documenta en el código.

## Aceptación antes de la clase

Ejecute desde una sesión limpia, en el equipo docente:

```matlab
info = check_environment(true);
run_intro
r = run_example();
report = run_tests(true);
```

Compruebe la consola y los archivos, abra ambas figuras, lea sus ejes y registre los resultados. Repita en MATLAB y Octave si se distribuirá oficialmente con soporte para ambos. No marque una plataforma como validada únicamente por compartir la extensión `.m`.

| Motor | Versión | Sistema/arquitectura | Pruebas | Figuras | Fecha | Responsable |
|---|---|---|---|---|---|---|
| GNU Octave | Por registrar | Por registrar | Pendiente | Pendiente | — | — |
| MATLAB | Por registrar | Por registrar | Pendiente | Pendiente | — | — |

## Reproducibilidad y alcance

Los datos son sintéticos, no requieren conexión y los valores numéricos deben reproducirse dentro de tolerancia. La hora en los metadatos y el formato binario de las figuras pueden variar entre ejecuciones o plataformas. No se exige identidad byte por byte de los PDF/PNG. Una prueba computacional exitosa no valida una predicción sobre República Dominicana o Estados Unidos.


## Validación en GNU Octave — 14 de noviembre de 2026

**Equipo:** iMac, macOS  
**Software:** GNU Octave 11.3.0  
**Arquitectura:** aarch64-apple-darwin27.0.0

### Comandos ejecutados

```matlab
check_environment(true)
run_intro
r = run_example(false);
report = run_tests();
```

### Resultados

- Ejecución numérica satisfactoria.
- 20 de 20 pruebas automáticas superadas.
- Escenario A, año 20: 148.5947.
- Escenario B, año 20: 180.6111.
- Brecha relativa: 21.5461 %.
- Comprobaciones de archivos CSV superadas.

### Limitación pendiente

Ghostscript (`gs`) no está disponible en el PATH del equipo.
La generación y exportación de ciertos formatos gráficos
requiere comprobación adicional.

La validación numérica no certifica todavía todas las
funciones gráficas.
