<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
    "SELECT e.id_empleado, r.id_rol, CONCAT(e.nombre,' ',e.apellido) as empleado, r.rol, e.ci,
    u.email, u.imagen, u.usuario, u.contrasena FROM usuarios u JOIN empleados e
    ON u.id_empleado = e.id_empleado JOIN roles r ON e.id_rol = r.id_rol 
    WHERE u.id_usuario = :id_usuario");
    $stmt->execute(array(':id_usuario' => $_POST["id_usuario"]));
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach($resultados as $datos) {
        $salida["id_empleado"] = $datos["id_empleado"];
        $salida["id_rol"] = $datos["id_rol"];
        $salida["ci"] = $datos["ci"];
        $salida["empleado"] = $datos["empleado"];
        $salida["rol"] = $datos["rol"];
        $salida["email"] = $datos["email"];
        $salida["imagen"] = $datos["imagen"];
        $salida["usuario"] = $datos["usuario"];
        $salida["contrasena"] = $datos["contrasena"];
    }
}catch (PDOException $e) {
    echo 'Ocurrio un error';
}

echo json_encode($salida);