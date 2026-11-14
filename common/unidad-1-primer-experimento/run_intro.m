% RUN_INTRO Primer experimento: lea y ejecute por bloques o completo.
% Abra esta carpeta como carpeta actual. Requiere solo MATLAB u Octave base.
% Este script borra las variables y cierra las figuras de la sesion actual.
% Guarde cualquier trabajo previo antes de ejecutarlo.
clear;
close all;
clc;

%% 1. Supuestos: cambielos en params.m y ejecute TODO de nuevo.
p = params();
y0 = p.y0;
g_base = p.g_base;
g_alt = p.g_alt;
T = p.T;

%% 2. Tiempo: el primer elemento corresponde al anio cero.
t = (0:T)';

%% 3. Ecuacion economica: el punto en .^ significa elemento a elemento.
y_base = y0 * (1 + g_base).^t;
y_alt = y0 * (1 + g_alt).^t;

%% 4. Tres magnitudes diferentes.
brecha_puntos = y_alt - y_base;
brecha_pct = 100 * (y_alt ./ y_base - 1);
diferencia_tasas_pp = 100 * (g_alt - g_base);

%% 5. Tabla en la consola: anio, A, B, brecha en puntos, brecha porcentual.
tabla = [t, y_base, y_alt, brecha_puntos, brecha_pct];
disp('Anio      Indice A     Indice B     Brecha puntos     Brecha %');
disp(tabla);
fprintf('Ultimo anio: %d\n', t(end));
fprintf('A = %.4f; B = %.4f\n', y_base(end), y_alt(end));
fprintf('Brecha relativa a A = %.4f %%\n', brecha_pct(end));
fprintf('Diferencia de tasas = %.2f puntos porcentuales\n', ...
        diferencia_tasas_pp);

%% 6. Figura: las etiquetas se actualizan con las tasas elegidas.
figure;
plot(t, y_base, '-', t, y_alt, '--', 'LineWidth', 1.8);
grid on;
xlabel('Anios desde el inicio');
ylabel('Indice de ingreso real por habitante');
title('Crecimiento compuesto: escenarios ilustrativos');
legend(sprintf('A: %.2f %% anual', 100*g_base), ...
       sprintf('B: %.2f %% anual', 100*g_alt), 'Location', 'northwest');

% Este script deja los resultados en memoria y una figura abierta.
% Para exportar el paquete reproducible, ejecute: run_example
% Para comprobar la implementacion con parametros base: run_tests
