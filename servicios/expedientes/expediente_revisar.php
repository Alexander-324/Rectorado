<?php

include("../conexion.php");

try {
    $stmt = $conexion->prepare(
        "SELECT e.id_expediente, e.nro_expediente, DATE_FORMAT(e.fecha_recepcion, '%d/%m - %H:%i:%S') as fecha,
        DATE_FORMAT(e.fecha_recepcion, '%Y') as anhio, a.area as remitente, o.objeto, d.dependencia, 
        CONCAT(f.nombre, ' ', f.apellido) as funcionario, e.observacion, e.estado
        FROM expedientes e 
        JOIN areas a ON e.id_area = a.id_area 
        JOIN objetos o ON e.id_objeto = o.id_objeto 
        JOIN dependencias d ON e.id_dependencia = d.id_dependencia 
        JOIN funcionarios f ON e.id_funcionario = f.id_funcionario 
        WHERE d.id_dependencia = ?"
    );
    $stmt->execute(array($_POST["id_dependencia"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $salida = array();
    foreach($resultado as $datos) {
        $salida[] = array(
            "cargado" => true,
            "id_expediente" => $datos["id_expediente"],
            "nro_expediente" => $datos["nro_expediente"],
            "fecha" => $datos["fecha"],
            "remitente" => $datos["remitente"],
            "anhio" => $datos["anhio"],
            "objeto" => $datos["objeto"],
            "dependencia" => $datos["dependencia"],
            "funcionario" => $datos["funcionario"],
            "observacion" => $datos["observacion"],
        );
    }
} catch (PDOException $e) {
    $salida[] = array(
        "cargado" => false,
        "mensaje" => "Error al cargar los expedientes. " . $e->getMessage()
    );
}

echo json_encode($salida);
