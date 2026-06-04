clear
clc

% 1. Datos iniciales (Idem Ej 43)
a = exp(1i * 2/3 * pi);
seq = [1; a^2; a];
E = 100 * seq;
J2 = 5 * exp(-1i * 30 * pi/180) * seq;
J3 = 8 * exp(-1i * 30 * pi/180) * seq;

Zg = [1i*0.1, 0, 0; 0, 1i*0.1, 0; 0, 0, 1i*0.1];
Zl = [0.1+1i*0.3, 1i*0.2, 1i*0.2; 1i*0.2, 0.1+1i*0.3, 1i*0.2; 1i*0.2, 1i*0.2, 0.1+1i*0.3];
Zl_15 = 1.5 * Zl;

% Inversas correspondientes a 1/Zg, 1/Zl   (son las admitancias)
Yg = inv(Zg);
Yl = inv(Zl);
Yl_15 = inv(Zl_15);

% 2. Matriz M (9x9) y Vector H
M = [Yg + Yl,   -Yl,          zeros(3,3);
    -Yl,         Yl + Yl_15, -Yl_15;
     zeros(3,3), -Yl_15,      Yl_15];

H = [Yg * E;
    -J2;
    -J3];

% 3. Solución del sistema X = M^-1 * H
X = inv(M) * H;

U1 = X(1:3);
U2 = X(4:6);
U3 = X(7:9);

disp('Módulos de Tensión en los nodos [V]:')
disp('U1:'), disp(abs(U1))
disp('U2:'), disp(abs(U2))
disp('U3:'), disp(abs(U3))

% 4. Verificación de resultados (Ecuaciones a y b en la hoja)
disp('--- Verificaciones (Deberían dar cercano a cero?) ---')
disp('a) U2 - U3 = 1.5 Zl * J3')
verif_a = (U2 - U3) - (Zl_15 * J3);
disp(abs(verif_a))

disp('b) U1 - U2 = Zl * (J3 + J2)')
verif_b = (U1 - U2) - (Zl * (J3 + J2));
disp(abs(verif_b))



% --- Continuación del Ejercicio 43/44 ---

% 1. Tensión de Thevenin
Eth = U3;

% 2. Impedancia de Thevenin
Zth = Zg + Zl + 1.5 * Zl;

% Resultados
disp('--- Equivalente de Thevenin desde Nodo 3 ---')
disp('Módulo de la Tensión de Thevenin (Eth) [V]:')
disp(abs(Eth))

disp('Matriz de Impedancia de Thevenin (Zth) [Ohms]:')
disp(Zth)
