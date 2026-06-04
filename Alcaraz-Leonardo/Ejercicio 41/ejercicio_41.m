clear
clc

% 1. Datos(Ej 39)
R = 0.1; L = 0.002; M = 0.0005; w = 314;
a = exp(1i * 2/3 * pi);
E_rst = 220 * [1; a^2; a];

% Matriz de línea (Idem Ej 39)
zl_rst = [R+1i*w*L, 1i*w*M,   1i*w*M;
          1i*w*M,   R+1i*w*L, 1i*w*M;
          1i*w*M,   1i*w*M,   R+1i*w*L];

% 2. Nuevas impedancias de carga (Sistema Asimétrico)
z1 = 100;
z2 = 100 + 1i*30;
z3 = 50 + 1i*50;

% Matriz diagonal de la carga
zc_rst = [z1, 0,  0;
          0,  z2, 0;
          0,  0,  z3];

% 3. Resolución Matricial
Z_total = zl_rst + zc_rst;
I_rst = inv(Z_total) * E_rst;

% 4. Resultados
disp('Módulos de las corrientes [I1; I2; I3]:')
abs(I_rst)
