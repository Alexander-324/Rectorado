<?php

include("../conexion.php");

try {

    $anterior = '';

    $stmt = $conexion->prepare("SELECT contrasena FROM usuarios WHERE usuario = :usuario");
    $stmt->execute(array(':usuario' => $_POST["usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach($resultado as $dato) {
        $anterior = $dato["contrasena"];
    }
    if ($anterior != $_POST["anterior"]) {
        $salida = array(
            'incorrecto' => true,
            'mensaje' => 'Contrasena Incorrecta'
        );
    } else {
        if($_POST["nuevo"] == $_POST["confirmar"]){            
            $stmt = $conexion->prepare("UPDATE usuarios SET contrasena = :nuevo");
            $stmt->execute(array(':nuevo' => $_POST["nuevo"]));
            $salida = array(
                'modificado' => true,
                'mensaje' => 'Contraseña Modificada. Por favor vuelva a iniciar sesión!!!.'
            );
        } else {
            $salida = array(
                'modificado' => false,
                'mensaje' => 'Las contraseñas no coinciden.'
            );   
        }
    }
} catch (PDOException $e) {
    $salida = array(
        'error' => false,
        'mensaje' => 'Ocurrio un error. ' . $e->getMessage()
    );
}

echo json_encode($salida);
