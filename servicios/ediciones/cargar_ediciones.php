<?php

    include("../conexion.php");

    try {
        
        $stmt = $conexion->prepare("SELECT * FROM ediciones");
        $stmt->execute();
        $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $salida = array();
        foreach($resultado as $datos) {
            $salida [] = array(
                "id_ediciones" => $datos["id_ediciones"],
                "edicion" => $datos["edicion"],
            );
        }
    } catch (PDOException $e) {
        $salida = array("erorr" => "Error. " . $e->getMessage());
    }

    echo json_encode($salida);