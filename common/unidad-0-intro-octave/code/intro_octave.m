%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Introduccion a Octave 
%  Profesor Harold Vásquez, Ph.D.
%  harold.vasquez@intec.edu.do 
%  Modelos Macroeconómicos Computacionales
%  Instituto Tecnologico de Santo Domingo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Octave desde la linea de comandos
%% operaciones aritmeticas
1+1
65998-4855
%%% Definiciones de variables, elementos (escalares) o matrices 
% Todos los elementos en Octave son matrices. Particularmente,
% los escalares son matrices 1x1
a=1
b=599
c=a+b
d=2*3
b*d;
%% Matrices
% Las matrices se declaran con corchetes []. Las columnas se separan
% con espacios; las filas se separan con ";"
matrix = [1 2;3 4];
matrix
VectorF = [1 2 3 4]
VectorC = [1;2;3;4]
% Podemos acceder a un elemento particulas de matrices con "( )"
% Podemos crear sub-matrices utilizando el " : "
% TambiÃ©n usamos " : " para acceder a TODOS los elementos de una fila/columna
% La palabra "end" indexa "hasta el final" 
matrix = [0.9 0.3 0.2; 0.3 0.9 0.4; 0.4 0.2 0.9];
matrix(1,3)
mini_matrix=matrix(2:3,2:3)      % crea sub-matrix fila 2-3, columnas 2-3 
matrix(1,:)                      % vector fila 1, Todas las columnas
matrix(:,1)                      % vector Todas las filas, columna 1x1

% IndexaciÃ³n con escalares 
x=[1:1:100]     % crea vector fila con valores 1 al 100 
n=96;           % crea escalar n=96
x(n:96)         % accedemos a todos los elementos a partir del n-Ã©simo
n=5;
x(end-n+1:end)  % accedemos a los Ãºltimos "n" elementos

% creacion de vectores con series
[1:5]           % crea vector elementos 1 a 5 
[5:-1:1]    
[11:3:20]
[0:.05:1]

%% Operaciones con elementos
% Los ementos son escalares, vectores, o matrices. Por tanto, 
% deben cumplirse las reglas de las operaciones arÃ­tmeticas
size(VectorF)       % size(nombre_elemento): dezpliega tamaÃ±o elemento
size(VectorC)
M=VectorF*VectorC   % Si el tamaÃ±o cumple, la operaciÃ³n se ejecuta
size(M)             % Matriz resultante debe conformar con tamaÃ±o

% Operaciones elemento a elemento
A=[9 8;7 6]
B=[1 0;0 1]
C=[1 2;3 4]
A*B
A.*B
C^2 
C.^2
 % Transposiciones: la transposiciÃ³n se ejecuta con ".'" (punto+apostrofe)
 % pero cuando se trabaja con numeros reales, se puede usar solo " ' "
 VectorC'
 VectorF'
 
 %%% Funciones
 %   El indexado de variables y los operadores matemÃ¡ticos son ejemplos de comandos.
 %   algunos comandos de utilidad son "help"
help round
 %   A diferencia de los comandos, las funciones utilizan argumentos. Por jemplo
 %   log(), log10(), sin(), cos(), etc... 
 log(100)/log(10)
 sqrt(3^2 +4^2)
 
 %%% Cadena de caracteres
 %   AdemÃ¡s de nÃºmericas, las variables pueden consistir en registros o cadenas
 %   de caracteres "strings", las cuales se definen con " ' "
 string1 = 'Hola mundo!'
 string2 = 'Que original, no?'
 string1(2,5)     % los strings se pueden indexar
 string1(end)
 %% Algunos elementos (constantes) que pueden ser usados con var strings:
 %  \t = TAB, \\ = barra invertida, \n = nueva linea, \' = apÃ³strofe
 conversacion='Don Jose:\t\t\"Hola Don Pepito\"\nDon Pepito:\t\t\"Hola Don Jose\"\n'
 printf(conversacion)       % standard output
 
 %%% GrÃ¡ficas
 %%  plot(): grafica valores del vector
 y=(1:10).^2
 plot(y)        % note el eje x por default es ordinal
 x=(-1:0.1:1);
 y=x.^2;
 plot(x,y);     % asignado eje para las x
 %% Multiples graficas
 x1=(0:0.1:1);
 y1=x1.^2        
 x2=x1;
 y2=x2.^3;
 plot(x1,y1,x2,y2);
 % De forma alternativa
 hold on;      % "hold on" no borra los graficos realizados anteriormente
 plot(x1,y1);  % "hold off" grafica la ultima invocacion de plot() 
 plot(x2,y2);
% Nota: para modificar la estitica se utilizan cadenas de caracteres de argumentos 
%  estas cadenas especifican color, estilo de linea y marcador 
%  Ejemplo:
t=(0:0.2:10);
f1=100;f2=200;f3=300;f4=50;
x1=sin(2*pi*f1*t*1e-3);
x2=sin(2*pi*f2*t*1e-3);
x3=sin(2*pi*f3*t*1e-3); 
x4=sin(2*pi*f4*t*1e-3);
hold on
plot(t,x1,'r','linewidth',3); 
plot(t,x1,'bo','markersize',15);
plot(t,x3,'k^-','markersize',15);
plot(t,x4,'gx','markersize',15); 
%%%
% Podemos agregar las etiquetas correspondientes
title('Funciones armonicas a distinta frecuencia')
xlabel('Tiempo [ms]')
ylabel('Amplitud')
leyenda1=sprintf('f1 = %u',f1);
leyenda2=sprintf('f2 = %u',200);
leyenda3=sprintf('f3 = %u',300);
leyenda4=sprintf('f4 = %u',50);
legend(leyenda1,leyenda2,leyenda3,leyenda4)
legend('boxon')
legend('right')

