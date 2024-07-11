<?php

include("../conexion.php");

try {

    $anterior = "";
    $stmt = $conexion->prepare("SELECT password FROM usuarios WHERE usuario = ?");
    $stmt->execute(array($_POST["usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($resultado as $dato) {
        $anterior = $dato["password"];
    }

    if ($_POST["password"] != $anterior) {
        $salida = array(
            "modificado" => false,
            "mensaje"   => "Contraseña Incorrecta."
        );
    } else {
        $stmt = $conexion->prepare("UPDATE usuarios SET password = ? WHERE usuario = ?");
        $stmt->execute(array(
            $_POST["password"],
            $_POST["usuario"]
        ));
        $salida = array(
            "modificado" => true,
            "mensaje"   => "Contraseña Modificada. Por favor vuelva a iniciar sesión."
        );
    }
} catch (PDOException $e) {
    $salida = array(
        "modificado" => false,
        "mensaje"   => "Ocurrio un error al modificar la contraseña."
    );
}
