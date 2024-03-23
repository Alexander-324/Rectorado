<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("SELECT f.id_funcionario, f.ci, 
    CONCAT(f.nombre, ' ', f.apellido) as nombre, c.ciudad, f.direccion, r.rol
    FROM funcionarios f JOIN ciudades c ON f.id_ciudad = c.id_ciudad JOIN roles r
    ON f.id_rol = r.id_rol;");
    $stmt->execute();
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach($resultado as $datos) {
        $salida [] = array(
            "id_funcionario" => $datos["id_funcionario"],
            "ci" => $datos["ci"],
            "nombre" => $datos["nombre"],
            "ciudad" => $datos["ciudad"],
            "direccion" => $datos["direccion"],
            "rol" => $datos["rol"],
        );
    }

} catch (PDOException $e) {
    echo 'Ocurrio un error al cargar los funcionarios.' .$e->getMessage();
}

echo json_encode($salida);
