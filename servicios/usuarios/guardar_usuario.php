<?php

include("../conexion.php");

try {

    $stmt = $conexion->prepare("INSERT INTO usuarios 
    (id_funcionario, correo, foto, usuario, password) VALUES(?,?,?,?,?)");
        $stmt->execute(array(
            $_POST["id_funcionario"],
            $_POST["correo"],
            $_POST["foto"],
            $_POST["usuario"],
            $_POST["password"],
        ));

        $salida = array(
            "guardado" => true,
            "mensaje" => "Registro Insertado"
        );

    // } else {
    //     $imagen = $_FILES['foto']['tmp_name'];
    //     $extension = explode('.', $_FILES['foto']['name']);
    //     $nombre = $_POST['usuario'] . '.' . $extension[1];
    //     $direccion = '../../img/usuarios/';
    //     $ruta = $direccion . $nombre;
    //     move_uploaded_file($imagen, $ruta);
    //     $stmt->execute(array(
    //         $_POST["id_funcionario"],
    //         $_POST["correo"],
    //         $nombre,
    //         $_POST["usuario"],
    //         $_POST["password"],
    //     ));
    // }


} catch (PDOException $e) {
    $salida = array(
        "guardado" => true,
        "mensaje" => "Ocurrio un error. " .$e->getMessage()
    );
}

echo json_encode($salida);