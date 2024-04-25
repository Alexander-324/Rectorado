<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
    "SELECT nombre, apellido, correo, id_rol, usuario, password
    FROM usuarios WHERE id_usuario = ?");
    $stmt->execute(array($_POST["id_usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach($resultado as $datos) {
        $salida["encontrado"] = true;
        $salida["nombre"] = $datos["nombre"];
        $salida["apellido"] = $datos["apellido"];
        $salida["correo"] = $datos["correo"];
        $salida["id_rol"] = $datos["id_rol"];
        $salida["usuario"] = $datos["usuario"];
        $salida["password"] = $datos["password"];
    }
} catch (PDOException $e) {
    $salida["encontrado"] = false;
    $salida["mensaje"] = "Ocurrio un error al obtener los datos del usuario.!!!". $e->getMessage();
}

echo json_encode($salida);