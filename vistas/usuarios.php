<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/datatables.min.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/toastr.min.css">
    <style>
        #vista-previa {
            max-width: 100%;
            max-height: 200px;
            display: none;
            margin: 0 auto;
            vertical-align: middle;
        }

        #error_password {
            opacity: 1;
            transition: opacity 0.5s ease-in-out;
        }

        #error_password.hidden {
            opacity: 0;
        }
    </style>
</head>

<body>
    <?php include("header.php") ?>
    <div class="main">
        <nav class="navbar navbar-expand px-3 border-bottom">
            <!-- Button for sidebar toggle -->
            <button class="btn" id="btn_menu" type="button" data-bs-theme="dark">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="clock">
                <p id="time"></p>
            </div>
            <div class="d-flex p-1">
                <a href="#" data-bs-toggle="modal" data-bs-target="#modal_perfil">
                    <img id="img_user" src="#" class="rounded img-fluid" width="50px" alt="">
                </a>
            </div>
        </nav>
        <main class="content px-3 py-2">
            <div class="container-fluid">
                <div class="mb-3">
                    <div class="card bg-transparent">
                        <div class="card-header">
                            <h2 class="neon text-center">Usuarios</h2>
                            <div class="card-body">
                                <div class="mb-2">
                                    <button class="btn btn-success neon-btn" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Importar a Excel"><i class="fa-solid fa-file-excel"></i> Excel</button>
                                    <button class="btn btn-danger neon-btn" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Importar como PDF"><i class="fa-solid fa-file-pdf"></i> Pdf</button>
                                    <button class="btn btn-secondary neon-btn" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Imprimir"><i class="fa-solid fa-print"></i> Imprimir</button>
                                </div>
                                <div class="table-responsive">
                                    <table id="tabla_usuarios" class="table table-striped table-hover w-100">
                                        <thead>
                                            <tr>
                                                <th class="text-center text-white bg-transparent">EMPLEADO</th>
                                                <th class="text-center text-white bg-transparent left_border">ROL</th>
                                                <th class="text-center text-white bg-transparent left_border">CORREO</th>
                                                <th class="text-center text-white bg-transparent left_border">FOTO</th>
                                                <th class="text-center text-white bg-transparent left_border">USUARIO</th>
                                                <th style="width: 2px;" class="text-center text-white bg-transparent left_border">ACCIONES</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-6">
                                            <button type="button" class="btn btn-primary neon-btn" id="btn_nuevo" data-bs-toggle="modal" data-bs-target="#modal_usuarios">
                                                <i class="bi bi-plus-square"></i> Nuevo
                                            </button>
                                        </div>
                                        <div class="col-6 text-end">
                                            <button type="button" class="btn btn-danger neon-btn" id="btn_salir">
                                                <i class="bi bi-x-square"></i> Salir
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modal_usuarios" data-bs-backdrop="static" tabindex="-1" aria-labelledby="modal_usuarios" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content bg-black border_blank">
                <div class="modal-header text-white">
                    <h1 class="modal-title fs-5">Modal title</h1>
                    <a href="#" type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></a href="#">
                </div>
                <div class="modal-body">
                    <form action="#" id="form_usuarios">
                        <div class="row">
                            <div class="col-10">
                                <label for="ci">C.I</label>
                                <input type="text" name="ci" id="ci" class="form-control" autocomplete="off" maxlength="13">
                            </div>
                            <div class="col-2 mt-4 text-end">
                                <button type="button" class="btn btn-primary" id="btn_buscar" onclick="buscar_empleado();"><i class="bi bi-search"></i></button>
                            </div>
                        </div>
                        <div class="mt-2">
                            <label for="empleado">NOMBRE</label>
                            <input type="text" name="empleado" id="empleado" class="form-control text-uppercase" readonly>
                        </div>
                        <div class="mt-2">
                            <label for="rol_usuario">ROL</label>
                            <input type="text" name="rol_usuario" id="rol_usuario" class="form-control" readonly>
                        </div>
                        <div class="mt-2">
                            <input type="hidden" name="id_empleado" id="id_empleado" class="form-control" readonly>
                            <input type="hidden" name="id_rol" id="id_rol" class="form-control" readonly>
                        </div>
                        <div class="mt-2">
                            <label for="email">CORREO</label>
                            <input type="text" name="email" id="email" class="form-control" autocomplete="off" maxlength="50">
                        </div>
                        <div class="mt-2">
                            <label for="foto">FOTO</label>
                            <input type="file" name="foto" id="foto" class="form-control" onchange="mostrarVistaPrevia()">
                            <div class=" mt-2 text-center">
                                <div class="">
                                    <span id="nombre_imagen" class="text-white"></span>
                                </div>
                                <img id="vista-previa" src="#" alt="" class="rounded">
                            </div>
                        </div>
                        <div class="mt-2">
                            <label for="usuario">USUARIO</label>
                            <input type="text" name="usuario" id="usuario" class="form-control" autocomplete="off" maxlength="20">
                        </div>
                        <div class="mt-2">
                            <label for="contrasena">CONTRASEÑA</label>
                            <div class="input-group">
                                <input type="password" class="form-control" name="contrasena" id="contrasena" autocomplete="off" maxlength="20" onkeyup="validarPassword();">
                                <button class="btn btn-primary neon-btn" type="button" onclick="mostrarPassword('contrasena', 'pass1')"><i class="bi bi-eye pass1"></i></button>
                            </div>
                            <span class="text-danger fw-bold" id="error_password"></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary neon-btn" id="btn_guardar">
                        <i class="bi bi-upload"></i> Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/toastr.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/all.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/datatables.min.js"></script>
    <script src="../js/sweetalert2.all.min.js"></script>
    <script src="../js/menu.js"></script>
    <script src="../js/usuarios.js"></script>
</body>

</html>