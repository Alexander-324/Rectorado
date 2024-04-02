<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("DELETE FROM usuarios WHERE id_usuario = ?");
    $stmt->execute(array($_POST["id_usuario"]));
    $salida = array(
        "eliminado" => true,
        "mensaje" => "Registro eliminado.!!!"
    );
} catch (PDOException $e) {

    if ($e->getCode() == 23000) {
        $salida = array(
            "eliminado" => false,
            "mensaje" => "El registro esta relacionado con otros datos, no se podra eliminar."
        );
    } else {
        $salida = array(
            "eliminado" => false,
            "mensaje" => "Ocurrio un error al eliminar." .$e->getMessage()
        );
    }
}

echo json_encode($salida);