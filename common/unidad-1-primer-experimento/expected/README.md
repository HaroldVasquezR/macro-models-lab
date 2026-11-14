# Resultados de referencia y trazabilidad

`growth_reference.csv` contiene 21 filas (años 0 a 20) y siete columnas. `summary_reference.csv` selecciona los años 0, 5, 10 y 20.

**Parámetros:** nivel inicial 100, tasa A 0.02, tasa B 0.03, horizonte 20 años. **Naturaleza:** supuestos sintéticos sin asignación nacional. **Unidad:** índice de ingreso real por habitante. **Frecuencia:** anual. **Origen:** cálculo independiente con aritmética decimal de 60 dígitos, no una ejecución de MATLAB/Octave.

| Columna | Definición | Unidad |
|---|---|---|
| `year` | Tiempo desde el inicio | Años |
| `index_a` | 100(1.02)^t | Puntos del índice |
| `index_b` | 100(1.03)^t | Puntos del índice |
| `gap_points` | B−A | Puntos del índice |
| `gap_pct` | 100(B/A−1) | Porcentaje respecto de A |
| `cumulative_a_pct` | 100(A/100−1) | Porcentaje acumulado |
| `cumulative_b_pct` | 100(B/100−1) | Porcentaje acumulado |

Separador coma, decimal punto, encabezado en primera fila. El redondeo de presentación no debe confundirse con la precisión del cálculo.

`validation_python.json` registra las 10 comprobaciones independientes efectivamente realizadas. El script opcional `tests/verify_reference.py` las reproduce con Python 3 sin paquetes externos. `release_checks.json` registra controles editoriales y de empaquetado de la entrega. Ningún reporte debe reinterpretarse como certificación de una ejecución nativa pendiente.
