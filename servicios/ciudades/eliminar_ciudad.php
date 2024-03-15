<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("DELETE FROM ciudades WHERE id_ciudad = :id_ciudad");
    $stmt->execute(array(':id_ciudad' => $_POST["id_ciudad"]));
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