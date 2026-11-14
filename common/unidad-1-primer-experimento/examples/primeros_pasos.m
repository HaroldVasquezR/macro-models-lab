% PRIMEROS_PASOS Seleccion introductoria basada en intro_octave.m.
% Edicion pedagogica nueva: no sustituye el archivo original del profesor.
% No borra variables. Ejecute cada bloque y explique su resultado.

%% Aritmetica y variables.
1 + 1
y0 = 100;
g = 0.02;
y1 = y0 * (1 + g)         % Resultado esperado: 102.

%% Asignar no crea una formula viva: hay que recalcular.
g = 0.03;
y1                       % Sigue siendo 102.
y1 = y0 * (1 + g)         % Ahora es 103.

%% Vector de tiempo e indices.
t = 0:5;
size(t)                  % Una fila, seis columnas.
numel(t)                 % Seis observaciones: incluye el anio cero.
t(1)                     % El indice 1 contiene el periodo 0.
t(end)                   % Ultimo periodo: 5.

%% Operaciones elemento a elemento.
y = y0 * (1 + g).^t;
disp([t', y']);

%% Ayuda: no es necesario memorizar todos los comandos.
help size
% Escriba help plot para consultar la ayuda de los graficos.
