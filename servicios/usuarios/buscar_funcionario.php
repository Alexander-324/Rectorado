<?php

include("../conexion.php");

try {
    $stmt = $conexion->prepare(
    "SELECT * FROM usuarios u JOIN funcionarios f ON u.id_empleado = f.id_funcionario WHERE f.ci = ?");
    $stmt->execute(array($_POST["ci"]));
    if($stmt->rowCount() > 0) {
        $salida = array(
            'tiene' => true,
            'mensaje' => 'El c.i ingresado ya cuenta con un usuario y contraseña.'
        );
    } else {
        $stmt = $conexion->prepare("SELECT f.id_funcionario, r.id_rol, CONCAT(f.nombre,' ',f.apellido) as funcionario, r.rol
        FROM funcionarios f JOIN roles r ON e.id_rol = r.id_rol 
        WHERE f.ci = ?;");
        $stmt->execute(array(':ci' => $_POST["ci"]));
        $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $salida = array();
        foreach($resultados as $datos) {
            $salida["id_funcionario"] = $datos["id_funcionario"];
            $salida["id_rol"] = $datos["id_rol"];
            $salida["funcionario"] = $datos["funcionario"];
            $salida["rol"] = $datos["rol"];
        }
    }
} catch (PDOException $e) {
    echo 'Ocurrio un error. ' .$e->getMessage();
}

echo json_encode($salida);