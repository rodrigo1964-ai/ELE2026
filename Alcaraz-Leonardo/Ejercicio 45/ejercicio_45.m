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
