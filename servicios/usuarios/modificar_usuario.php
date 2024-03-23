<?php

include("../conexion.php");

try {

    $correo_comparar = '';
    $user_comparar = '';
    $modify = false;

    $stmt = $conexion->prepare("SELECT email, usuario FROM usuarios WHERE id_usuario = :id_usuario");
    $stmt->execute(array(':id_usuario' => $_POST["id_usuario"]));
    $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($resultados as $datos) {
        $correo_comparar = $datos["email"];
        $user_comparar = $datos["usuario"];
    }

    if ($correo_comparar === $_POST["email"]) {
        $modify = true;
    } else {
        $stmt = $conexion->prepare("SELECT email FROM usuarios WHERE email = :email");
        $stmt->execute(array(':email' => $_POST["email"]));
        if ($stmt->rowCount() > 0) {
            $salida = array(
                'exite' => true,
                'mensaje' => 'El correo ingresado pertenece a otro usuario.'
            );
            $modify = false;
        }
    }

    if ($user_comparar === $_POST["usuario"]) {
        $modify = true;
    } else {
        $stmt = $conexion->prepare("SELECT usuario FROM usuarios WHERE usuario = :usuario");
        $stmt->execute(array(':usuario' => $_POST["usuario"]));
        if ($stmt->rowCount() > 0) {
            $salida = array(
                'exite' => true,
                'mensaje' => 'El usuario ingresado ya esta en uso.'
            );
            $modify = false;
        }
    }

    // Si el usuario cambio decide cambiar su foto de usuario
    // entonces guardamos la nueva imagen
    if ($modify == true) {
        if ($_POST["cambio"] === "si") {
            $stmt = $conexion->prepare(
                "UPDATE usuarios SET email = :email, imagen = :foto, usuario = :usuario, contrasena = :contrasena
            WHERE id_usuario = :id_usuario"
            );
            $imagen = $_FILES['foto']['tmp_name'];
            $extension = explode('.', $_FILES['foto']['name']);
            $nombre = $_POST['usuario'] . '.' . $extension[1];
            $direccion = '../../img/usuarios/';
            $ruta = $direccion . $nombre;
            move_uploaded_file($imagen, $ruta);
            $stmt->execute(array(
                ':email' => $_POST["email"],
                ':foto' => $nombre,
                ':usuario' => $_POST["usuario"],
                ':contrasena' => $_POST["contrasena"],
                ':id_usuario' => $_POST["id_usuario"]
            ));
            // Si no decidio cambiar la foto solo actualizamos lo demas datos y no la imagen
        } else {
            $stmt = $conexion->prepare(
                "UPDATE usuarios SET email = :email, usuario = :usuario, contrasena = :contrasena
            WHERE id_usuario = :id_usuario"
            );
            $stmt->execute(array(
                ':email' => $_POST["email"],
                ':usuario' => $_POST["usuario"],
                ':contrasena' => $_POST["contrasena"],
                ':id_usuario' => $_POST["id_usuario"]
            ));
        }

        $salida = array(
            'modificado' => true,
            'mensaje' => 'Registro Modificado'
        );
    }
} catch (PDOException $e) {
    $salida = array(
        'modificado' => false,
        'mensaje' => 'Ocurrio un error. ' . $e->getMessage()
    );
}

echo json_encode($salida);
