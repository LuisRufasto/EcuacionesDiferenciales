Q1
La aceleración es la derivada de la velocidad. Por lo tanto, los picos de aceleración ocurren exactamente en los intervalos donde la curva de velocidad (roja) 
tiene la pendiente más pronunciada. En la gráfica, esto coincide con los momentos en que la estructura cruza su posición de equilibrio (x = 0);
ahí la velocidad cambia de dirección bruscamente, generando una fuerza inercial alta.

Q2
Que la trayectoria se encierre en una curva repetitiva en el plano de fases indica que el edificio entra en un régimen de oscilación sostenida, 
en lugar de amortiguarse hasta detenerse en el origen. Físicamente, el término no lineal del fluido hace que el sistema inyecte energía 
cuando el desplazamiento es bajo y disipe energía cuando es alto. El ciclo límite es el balance exacto entre esa ganancia y pérdida de energía por ciclo.

Q3
l subir el paso a h = 0.5 y luego a h = 1.0, los datos en la tabla crecen desproporcionadamente hasta botar valores NaN o infinito, arruinando la simulación.
Esto ocurre porque RK4 es un método explícito con una región de estabilidad absoluta finita. Al usar un paso de muestreo tan grande, salimos de esa zona 
de estabilidad; el error de truncamiento se acumula iteración a iteración provocando divergencia numérica. 
