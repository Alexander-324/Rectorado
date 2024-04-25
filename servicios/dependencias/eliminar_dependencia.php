<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("DELETE FROM dependencias WHERE id_dependencia = ?");
    $stmt->execute(array($_POST["id_dependencia"]));
    $salida = array(
        'eliminado' => true,
        'mensaje' => 'Registro Eliminado.'    
    );

}catch (PDOException $e) {
    if($e->getCode() == 23000) {
        $salida = array(
            'eliminado' => false,
            'mensaje' => 'El registro esta asociado a otros registros, no se podra eliminar.'    
        );  
    } else {
        $salida = array(
            'eliminado' => false,
            'mensaje' => 'Ocurrio un errro. ' .$e->getMessage()    
        );
    }
}

echo json_encode($salida);

$conexion = null;

?>