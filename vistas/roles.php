<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Roles</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/datatables.min.css">
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
    <link rel="stylesheet" href="../css/toastr.min.css">
    <link rel="stylesheet" href="../css/menu.css">
</head>

<body>
    <?php include("sidebar.php") ?>
    <div class="container" id="main">
        <div class="card">
            <div class="card-header">
                <h3>Roles</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive w-100">
                    <table class="table table-hover table striped w-100 dt-responsive" id="tabla_roles">
                        <thead>
                            <th style="width: 90%;">Roles</th>
                            <th>Acciones</th>
                        </thead>
                    </table>
                    <tbody>

                    </tbody>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-primary" id="btn_nuevo">
                            <i class="fa fa-plus"> Nuevo</i>
                        </button>
                    </div>
                    <div class="col-6 text-end">
                        <button type="button" class="btn btn-secondary " id="btn_nuevo">
                            <i class="fa fa-x"> Salir</i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Nuevo | Editar -->
    <div class="modal fade" id="modalRoles" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                        <div class="container">
                            <div>
                                <label for="rol">Rol</label>
                                <input type="text" name="rol" id="rol" class="form-control text-uppercase" autocomplete="off" maxlength="30">
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn_guardar" onclick="operaciones()">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/datatables.min.js"></script>
    <script src="../js/sweetalert2.all.min.js"></script>
    <script src="../js/toastr.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/roles.js"></script>
</body>

</html>