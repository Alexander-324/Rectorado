<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
    "SELECT f.ci, CONCAT(f.nombre, ' ', f.apellido) as nombre, u.correo, u.foto, u.usuario, u.password
    FROM usuarios u JOIN funcionarios f ON u.id_funcionario = f.id_funcionario WHERE u.id_usuario = ?");
    $stmt->execute(array($_POST["id_usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach($resultado as $datos) {
        $salida["encontrado"] = true;
        $salida["ci"] = $datos["ci"];
        $salida["nombre"] = $datos["nombre"];
        $salida["correo"] = $datos["correo"];
        $salida["foto"] = $datos["foto"];
        $salida["usuario"] = $datos["usuario"];
        $salida["password"] = $datos["password"];
    }
} catch (PDOException $e) {
    $salida["encontrado"] = false;
    $salida["mensaje"] = "Ocurrio un error al obtener los datos del usuario.!!!". $e->getMessage();
}

echo json_encode($salida);