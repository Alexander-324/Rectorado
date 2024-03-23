<?php

include("../conexion.php");

try {

    $img = '';

    $stmt = $conexion->prepare("SELECT foto FROM usuarios WHERE id_usuario = ?");
    $stmt->execute(array($_POST["id_usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($resultado as $dato) {
        $img = $dato["foto"];
    }

    unlink('../../img/usuarios/' . $img);

    $stmt = $conexion->prepare("DELETE FROM usuarios WHERE id_usuario = ?");
    $stmt->execute(array($_POST["id_usuario"]));

    $salida = array(
        'eliminado' => true,
        'mensaje' => 'Registro Eliminado.'
    );
} catch (PDOException $e) {
    if ($e->getCode() === 23000) {
        $salida = array(
            'eliminado' => false,
            'mensaje' => 'El usuario que desea eliminar esta relacionado con otros registros,
             no se podra realizar la eliminación.'
        );
    } else {
        $salida = array(
            'eliminado' => false,
            'mensaje' => 'Ocurrio un error. ' .$e->getMessage()
        );
    }
}

echo json_encode($salida);