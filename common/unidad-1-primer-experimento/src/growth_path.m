function [t, y] = growth_path(y0, g, T)
% GROWTH_PATH Trayectoria anual y(t)=y0*(1+g)^t, con t=0,...,T.
%   [t,y] = growth_path(100,0.02,20)
% Devuelve dos vectores columna de T+1 filas. No usa paquetes adicionales.
% Dominio docente: y0>0, g>-1, T entero entre 0 y 1000000.
% El limite de T evita reservar arreglos desmesurados por error de entrada;
% no es una restriccion del modelo economico. Se rechaza desbordamiento.
    if nargin ~= 3
        error('U01:ArgumentCount', 'Se requieren y0, g y T.');
    end
    if ~(isnumeric(y0) && isreal(y0) && isscalar(y0) && ...
            isfinite(y0) && y0 > 0)
        error('U01:InitialLevel', 'y0 debe ser un escalar real, finito y positivo.');
    end
    if ~(isnumeric(g) && isreal(g) && isscalar(g) && isfinite(g) && g > -1)
        error('U01:GrowthRate', 'g debe ser un escalar real finito mayor que -1.');
    end
    if ~(isnumeric(T) && isreal(T) && isscalar(T) && isfinite(T) && ...
            T >= 0 && T == fix(T) && T <= 1000000)
        error('U01:Horizon', 'T debe ser entero entre 0 y 1000000.');
    end
    % Conversion explicita: evita aritmetica entera si se reciben enteros.
    y0 = double(y0); g = double(g); T = double(T);
    t = (0:T)';
    y = y0 * (1 + g).^t;
    if any(~isfinite(y)) || any(y <= 0)
        error('U01:NumericRange', ...
              'Trayectoria fuera del rango numerico: revise tasa y horizonte.');
    end
end
