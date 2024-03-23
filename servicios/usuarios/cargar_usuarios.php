<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
    "SELECT u.id_usuario, CONCAT(f.nombre,' ',f.apellido) as funcionario,
    r.rol, u.email, u.imagen, u.usuario
    FROM usuarios u, funcionarios f, roles r
    WHERE u.id_funcionario = f.id_funcionario AND f.id_rol = r.id_rol");
    $stmt->execute();
    $salida = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'Ocurrio un error. ' .$e->getMessage();
}

echo json_encode($salida);

$conexion = null;

?>