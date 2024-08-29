<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("UPDATE expedientes 
    SET nro_expediente = ?, fecha_recepcion = ?, anhio_recepcion = ?,
    id_area = ?, id_objeto = ?, id_dependencia = ?, observacion = ?");
    $stmt->execute(array(
        $_POST["nro"],
        $_POST["fecha"],
        $_POST["anhio"],
        $_POST["area"],
        $_POST["objeto"],
        $_POST["dependencia"],
        $_POST["observacion"],
    ));
    $salida = array();
    $salida["modicado"] = true;
    $salida["mensaje"] = "Modificación Exitosa.!!!";

} catch (PDOException $e) {
    $salida["modicado"] = false;
    $salida["mensaje"] = "Ocurrio un error al modificar. " . $e->getMessage();   
}

echo json_encode($salida);
