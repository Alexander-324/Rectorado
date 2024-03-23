<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("SELECT usuario FROM usuarios WHERE usuario = ?");
    $stmt->execute(array($_POST["usuario"]));
    $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if ($resultado == true) {
        $salida = array(
            'existe' => true,
            'mensaje' => 'El nombre de usuario ingresado ya esta en uso.'
        );
    } else {
        $stmt = $conexion->prepare("SELECT correo FROM usuarios WHERE correo = ?");
        $stmt->execute(array($_POST["foto"]));
        $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($resultado == true) {
            $salida = array(
                'existe' => true,
                'mensaje' => 'El correo ingresado ya esta en uso.'
            );
        } else {
            $stmt = $conexion->prepare(
                "INSERT INTO usuarios (id_empleado, email, imagen, usuario, contrasena)
                VALUES (:id_empleado, :email, :foto, :usuario, :contrasena)"
            );

            $imagen = $_FILES['foto']['tmp_name'];
            $extension = explode('.', $_FILES['foto']['name']);
            $nombre = $_POST['usuario'] . '.' . $extension[1];
            $direccion = '../../img/usuarios/';
            $ruta = $direccion . $nombre;
            move_uploaded_file($imagen, $ruta);
            $stmt->execute(array(
                ':id_empleado' => $_POST["id_empleado"],
                ':email' => $_POST["email"],
                ':foto' => $nombre,
                ':usuario' => $_POST["usuario"],
                ':contrasena' => $_POST["contrasena"]
            ));
            $salida = array(
                'guardado' => true,
                'mensaje' => 'Registro Insertado'
            );
        }
    }
} catch (PDOException $e) {
    $salida = array(
        'guardado' => false,
        'mensaje' => 'Ocurrio un error. ' . $e->getMessage()
    );
}

echo json_encode($salida);
