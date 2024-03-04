<?php

include("../conexion.php");

try {
    
    $stmt = $conexion->prepare("UPDATE ediciones SET edicion = ? WHERE id_ediciones = ?");
    $stmt->execute(array(
        $_POST["edicion"], $_POST["id_ediciones"]
    ));
    $salida = array("modificado" => true);
} catch (PDOException $e) {
    $salida = array(
        "modificado" => false,
        "mensaje"   => "Error al editar. " . $e->getMessage()
);
}

echo json_encode($salida);