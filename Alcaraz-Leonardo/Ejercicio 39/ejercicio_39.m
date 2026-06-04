clear
clc

% 1. Datos
R = 0.1;
L = 0.002;
M = 0.0005;
w = 314;

z1 = 100 + 1i*30;
z2 = z1;
z3 = z1;

% Defino a
a = exp(1i * 2/3 * pi);

% 2. Armado de matrices y vectores
E_rst = 220 * [1; a^2; a];

zl_rst = [R + 1i*w*L, 1i*w*M,     1i*w*M;
          1i*w*M,     R + 1i*w*L, 1i*w*M;
          1i*w*M,     1i*w*M,     R + 1i*w*L];

zc_rst = [z1, 0,  0;
          0,  z2, 0;
          0,  0,  z3];

% 3. Resolución Matricial
Z_total = zl_rst + zc_rst;
I_rst = inv(Z_total) * E_rst;

% 4. Resultados
disp('Corrientes de fase [I1; I2; I3]:')
disp('-----------------------------------------')
Modulos = abs(I_rst)
Angulos = angle(I_rst) * 180/pi
