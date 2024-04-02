<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
        "SELECT u.id_usuario, CONCAT(f.nombre, ' ', f.apellido) as nombre,
        u.correo, u.foto, u.usuario
        FROM usuarios u JOIN funcionarios f ON u.id_funcionario = f.id_funcionario;");
    $stmt->execute();
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = [];
    foreach ($resultado as $datos) {
        $salida[] = array(
            "id_usuario" => $datos["id_usuario"],
            "nombre" => $datos["nombre"],
            "correo" => $datos["correo"],
            "foto" => $datos["foto"],
            "usuario" => $datos["usuario"],
        );
    }
} catch (PDOException $e) {
    echo "Ocurrio un error al cargar los usuarios. " . $e->getMessage();
}

echo json_encode($salida);