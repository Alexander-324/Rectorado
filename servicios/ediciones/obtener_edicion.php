<?php

include("../conexion.php");

try {
    $stmt = $conexion->prepare("SELECT edicion FROM ediciones WHERE id_ediciones = ?");
    $stmt->execute(array($_POST["id_edicion"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($resultado)) {
        foreach($resultado as $datos) {
            $salida = array(
                "encontrado" => true,
                "edicion" => $datos["edicion"]
            );
        }
    }
} catch (PDOException $e) {
    $salida = array(
        "encontrado" => false,
        "mensaje" => "Error. " . $e->getMessage()
    );
}

echo json_encode($salida);
