%% Prueba conexion
% 1. Verificar conexión
apoloUpdate()

% 2. Leer balizas visibles y ultrasonidos desde la posición inicial
balizas = apoloGetLaserLandMarks('LMS100')
ultrasonidos = apoloGetAllultrasonicSensors('Marvin')

% 3. Mover el robot 2 segundos hacia delante (v = 0.3 m/s, w = 0 rad/s)
for i = 1:20
    apoloMoveMRobot('Marvin', [0.3, 0.0], 0.1);
    apoloUpdate();
end

% 4. Comparar odometría (con ruido) frente a posición real (sin ruido)
odo = apoloGetOdometry('Marvin')
real = apoloGetLocationMRobot('Marvin')