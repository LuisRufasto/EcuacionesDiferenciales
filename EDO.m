% --- Parámetros del Sistema ---
mu = 1.5;         % Coeficiente de amortiguamiento no lineal
t0 = 0;           % Tiempo inicial
tf = 20;          % Tiempo final
h  = 0.05;        % Tamaño de paso temporal

% --- Condiciones Iniciales ---
x0 = 2.0;         % Desplazamiento máximo inicial
v0 = 0.0;         % Reposo instantáneo inicial

% --- Vectores de tiempo y preasignación de memoria ---
t = t0:h:tf;
N = length(t);
x = zeros(1, N);
v = zeros(1, N);

% Cargar condiciones iniciales
x(1) = x0;
v(1) = v0;

% --- Definición del sistema de EDOs ---
% f(t, Y) donde Y = [x; v]
f = @(t, Y) [Y(2); mu * (1 - Y(1)^2) * Y(2) - Y(1)];

% --- Bucle Principal RK4 ---
for i = 1:(N-1)
    Y_n = [x(i); v(i)];

    k1 = f(t(i), Y_n);
    k2 = f(t(i) + h/2, Y_n + (h/2)*k1);
    k3 = f(t(i) + h/2, Y_n + (h/2)*k2);
    k4 = f(t(i) + h, Y_n + h*k3);

    Y_next = Y_n + (h/6)*(k1 + 2*k2 + 2*k3 + k4);

    x(i+1) = Y_next(1);
    v(i+1) = Y_next(2);
end

% ==========================================
% ENTREGABLES OBLIGATORIOS
% ==========================================

% --- Tabla de datos en consola ---
fprintf('--- Primeras 10 iteraciones ---\n');
fprintf(' Iter | Tiempo (s) | Desplazamiento x | Velocidad v\n');
fprintf('-----------------------------------------------------\n');
for i = 1:10
    fprintf('%5d | %10.2f | %16.6f | %11.6f\n', i, t(i), x(i), v(i));
end

fprintf('\n--- Estados Finales ---\n');
fprintf(' Iter | Tiempo (s) | Desplazamiento x | Velocidad v\n');
fprintf('-----------------------------------------------------\n');
fprintf('%5d | %10.2f | %16.6f | %11.6f\n', N, t(N), x(N), v(N));

% --- Gráfica 1: Evolución temporal ---
figure;
plot(t, x, 'b', 'LineWidth', 1.5); hold on;
plot(t, v, 'r', 'LineWidth', 1.5);
title('Evolución temporal del desplazamiento y velocidad');
xlabel('Tiempo t (s)');
ylabel('Amplitud');
legend('Desplazamiento x(t)', 'Velocidad v(t)', 'Location', 'best');
grid on;

% --- Gráfica 2: Diagrama de espacio de fases ---
figure;
plot(x, v, 'k', 'LineWidth', 1.5);
title('Diagrama de Espacio de Fases (Ciclo Límite)');
xlabel('Desplazamiento x');
ylabel('Velocidad v');
grid on;