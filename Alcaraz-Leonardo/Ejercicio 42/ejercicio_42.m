clear
clc

% 1. Datos (Idem Ej 39/41)
R = 0.1; L = 0.002; M = 0.0005; w = 314;
a = exp(1i * 2/3 * pi);
E_rst = 220 * [1; a^2; a];

% Matriz de línea con inductancia mutua
zl_rst = [R+1i*w*L, 1i*w*M,   1i*w*M;
          1i*w*M,   R+1i*w*L, 1i*w*M;
          1i*w*M,   1i*w*M,   R+1i*w*L];

% 2. Cargas asimétricas del Ej 41
z1 = 100;
z2 = 100 + 1i*30;
z3 = 50 + 1i*50;

zc_rst = [z1, 0,  0;
          0,  z2, 0;
          0,  0,  z3];

% 3. Resolución por Nodos (Ejercicio 42)
Yl = inv(zl_rst);
Yc = inv(zc_rst);

% Tensión en los nodos de la carga
U_rst = inv(Yl + Yc) * (Yl * E_rst);

% Cálculo de las corrientes de fase
I_rst = Yc * U_rst;

% 4. Resultado abs(I^RST)
disp('Módulos de las corrientes de fase [I1; I2; I3]:')
disp('---------------------------------------------------------')
abs(I_rst)
