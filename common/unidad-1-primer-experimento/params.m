function p = params()
% PARAMS Parametros ilustrativos de la Unidad 1. Edite solo este archivo
% para cambiar el caso de run_intro y run_example de manera coherente.
% No son datos observados, estimaciones ni pronosticos de RD o EE. UU.
% Frecuencia anual. Nivel: indice de ingreso real por habitante, t=0 -> 100.
    p.y0 = 100;
    p.g_base = 0.02;       % 2 por ciento anual: escenario A.
    p.g_alt = 0.03;        % 3 por ciento anual: escenario B.
    p.T = 20;             % Numero de intervalos anuales; T+1 observaciones.
end
