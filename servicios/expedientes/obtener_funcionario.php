<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("SELECT id_funcionario, CONCAT(nombre,' ',apellido) as funcionario
    FROM funcionarios WHERE ci = ?");
    $stmt->execute(array($_POST["ci"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach ($resultado as $datos) {
        $salida["id_funcionario"] = $datos["id_funcionario"];
        $salida["funcionario"] = $datos["funcionario"];
        $salida["encontrado"] = true;
    }
} catch (PDOException $e) {
    $salida = array(
        "encontrado" => false,
        "mensaje" => "Ocurrio un error en la obtención de datos. " . $e->getMessage()
    );
}

echo json_encode($salida);