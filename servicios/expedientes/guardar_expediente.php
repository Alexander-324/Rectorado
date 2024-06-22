<?php

include("../conexion.php");
$salida = array();

try {

    $stmt = $conexion->prepare("SELECT nro_expediente FROM expedientes WHERE nro_expediente = ?");
    $stmt->execute($_POST["nro_expediente"]);
    if ($stmt->rowCount() > 0) {
        $salida["guardado"] = false;
        $salida["mensaje"] = "El numero de expediente que ingreso ya existe.";
    } else {
        $stmt = $conexion->prepare("INSERT INTO expedientes 
        (nro_expediente, fecha_recepcion, id_area, objeto, id_dependencia, id_funcionario, estado)
        VALUES(?,?,?,?,?,?)");
        $stmt->execute(array(
            $_POST["nro_expediente"],
            $_POST["fecha_recepcion"],
            $_POST["id_area"],
            $_POST["objeto"],
            $_POST["id_dependencia"],
            $_POST["id_funcionario"],
            $_POST["estado"],
        ));

        $salida["guardado"] = true;
        $salida["mensaje"] = "Documento Recepcionado.!!!";
    }
} catch (PDOException $e) {
    $salida["guardado"] = false;
    $salida["mensaje"] = "Ocurrio un error al guardar. " . $e->getMessage();
}

echo json_encode($salida);
