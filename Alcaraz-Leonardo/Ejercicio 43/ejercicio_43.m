clear
clc

% 1. Datos iniciales y matrices de impedancia
a = exp(1i * 2/3 * pi);
seq = [1; a^2; a];  #vector con la secuencia de defase entre fases(120 grados)

E = 100 * seq;
J2 = 5 * exp(-1i * 30 * pi/180) * seq;
J3 = 8 * exp(-1i * 30 * pi/180) * seq;

Zg = [1i*0.1, 0, 0;
      0, 1i*0.1, 0;
      0, 0, 1i*0.1];

Zl = [0.1+1i*0.3, 1i*0.2, 1i*0.2;
      1i*0.2, 0.1+1i*0.3, 1i*0.2;
      1i*0.2, 1i*0.2, 0.1+1i*0.3];
Zl23 = 1.5 * Zl;

% 2. Corrientes de rama (Por Ley de Nodos / Kirchhoff)
I23 = J3;
I12 = J2 + J3;

% 3. Tensiones por caídas sucesivas (Ley de Mallas / Ohm)
U1 = E - Zg * I12;      % Tensión a la salida del generador (Nodo 1)
U2 = U1 - Zl * I12;     % Tensión al final del primer tramo (Nodo 2)
U3 = U2 - Zl23 * I23;   % Tensión al final de la línea (Nodo 3)

% 4. Mostrar Resultados
disp('Módulos de Tensión [V] por Caída de Tensión:')
disp('--- Nodo 1 ---'), abs(U1)
disp('--- Nodo 2 ---'), abs(U2)
disp('--- Nodo 3 ---'), abs(U3)
