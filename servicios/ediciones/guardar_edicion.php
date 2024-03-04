<?php

    include("../conexion.php");

    try {
        $stmt = $conexion->prepare("SELECT edicion FROM ediciones WHERE edicion = ?");
        $stmt->execute(array($_POST["edicion"]));
        if($stmt->rowCount() > 0) {
            $salida = array(
                "existe" => true
            );            
        } else {
            $stmt = $conexion->prepare("INSERT INTO ediciones (edicion) VALUES(?)");
            $stmt->execute(array($_POST["edicion"]));
            $salida = array("guardado" => true);
        }
    } catch (PDOException $e) {
        $salida = array(
            "guardado" => false,
            "mensaje" => "Error al guardar. " . $e->getMessage()
        );
    }

    echo json_encode($salida);