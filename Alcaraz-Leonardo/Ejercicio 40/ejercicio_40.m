clear
clc

% 1. Datos (mismos Ej. 39)
R = 0.1; L = 0.002; M = 0.0005; w = 314;
z1 = 100 + 1i*30;
a = exp(1i * 2/3 * pi);

% Matrices de Tensión e Impedancias
E_rst = 220 * [1; a^2; a];
zl_rst = [R+1i*w*L, 1i*w*M,   1i*w*M;
          1i*w*M,   R+1i*w*L, 1i*w*M;
          1i*w*M,   1i*w*M,   R+1i*w*L];
zc_rst = [z1, 0, 0;
          0, z1, 0;
          0, 0, z1];

% 2. Resolución por Nodos (Ej 40)
% Definimos las matrices de Admitancia Y = Z^-1
Yl = inv(zl_rst);
Yc = inv(zc_rst);

% U_rst = (Zl^-1 + Zc^-1)^-1 * Zl^-1 * E
U_rst = inv(Yl + Yc) * (Yl * E_rst);

% Cálculo de la corriente: I_rst = Zc^-1 * U_rst
I_rst = Yc * U_rst;

% 3. Resultados
disp('Corrientes de fase [I1; I2; I3]:')
Modulos_I = abs(I_rst)
Angulos_I = angle(I_rst) * 180/pi
