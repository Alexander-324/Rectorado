<?php 

    include("../conexion.php");
    
    try {
        $stmt = $conexion->prepare("INSERT INTO expedientes");
    } catch (\Throwable $th) {
        //throw $th;
    }

?>