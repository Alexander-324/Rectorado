<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
        "SELECT u.id_usuario, CONCAT(u.nombre, ' ', u.apellido) as nombre, u.correo, u.foto,
        r.rol, u.usuario
        FROM usuarios u INNER JOIN roles r ON u.id_rol = r.id_rol"
    );
    $stmt->execute();
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = [];
    foreach ($resultado as $datos) {
        $salida[] = array(
            "id_usuario" => $datos["id_usuario"],
            "nombre" => $datos["nombre"],
            "correo" => $datos["correo"],
            "rol" => $datos["rol"],
            "foto" => $datos["foto"],
            "usuario" => $datos["usuario"],
        );
    }
} catch (PDOException $e) {
    echo "Ocurrio un error al cargar los usuarios. " . $e->getMessage();
}

echo json_encode($salida);
