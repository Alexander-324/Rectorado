<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare(
        "UPDATE usuarios SET nombre = ?, apellido = ?, correo = ?, id_rol = ? usuario = ?, password= ? WHERE id_usuario = ?"
    );
    $stmt->execute(array(
        $_POST["nombre"],
        $_POST["apellido"],
        $_POST["correo"],
        $_POST["id_rol"],
        $_POST["usuario"],
        $_POST["password"],
        $_POST["id_usuario"],
    ));

    $salida = array();
    $salida["modificado"] = true;    
    $salida["mensaje"] = "Registro Modificado.!!!";    

} catch (PDOException $e) {
    $salida = array();
    $salida["modificado"] = false;    
    $salida["mensaje"] = "Ocurrio un error. " .$e->getMessage();    
}

echo json_encode($salida);