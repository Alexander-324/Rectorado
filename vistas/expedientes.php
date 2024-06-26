<!DOCTYPE html>
<html lang="es" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expedientes</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="../css/datatables.min.css">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/sweetalert2.min.css">
    <link rel="stylesheet" href="../css/toastr.min.css">
</head>
<body>
    
    <?php include("sidebar.php") ?>

    <div class="container w-50" id="main">
        <div class="card">
            <div class="card-header text-center">
                <h3 class="text-white">Recepción de Expedientes</h3>
            </div>
            <div class="card-body">
                <div class="container">
                    <form action="#" id="form_expedientes">
                        <div class="d-flex flex-column">
                            <div class="mt-2">
                                <label for="nro">Nro. Expediente</label>
                                <input type="text" name="nro" id="nro" class="form-control" oninput="this.value=solo_numeros_sin_cero(this.value)" maxlength="10">
                            </div>
                            <div class="mt-2">
                                <label for="nro">Fecha de Recepción</label>
                                <input type="date" name="fecha" id="fecha" class="form-control text-end" max="<?= date("Y-m-d") ?>">
                            </div>
                            <div class="mt-2">
                                <label for="area">Remitente</label>
                                <select name="area" id="area" class="form-select">
                                    <option value="">Seleccione un área</option>
                                </select>
                            </div>
                            <div class="mt-2">
                                <label for="objeto">Objeto</label>
                                <input type="text" name="objeto" id="objeto" class="form-control" oninput="this.value=mayusculas_espacio(this.value)" maxlength="100">
                            </div>
                            <div class="mt-2">
                                <label for="dependencia">Dependencia</label>
                                <select name="dependencia" id="dependencia" class="form-select">
                                    <option value="">Seleccione una dependencia</option>
                                </select>
                            </div>
                            <div class="mt-2">
                                <label for="observacion">Observación</label>
                                <input type="text" name="observacion" id="observacion" class="form-control" oninput="this.value=mayusculas_espacio(this.value)" maxlength="100">
                            </div>
                            <div class="mt-2">
                                <label for="recepcionado">Recepcionado por</label>
                                <input type="text" name="recepcionado" id="recepcionado" class="form-control" readonly maxlength="100">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-primary" id="btn_guardar">Guardar</button>
                    </div>
                    <div class="col-6 text-end">
                        <button type="button" class="btn btn-danger" id="btn_salir">Salir</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/datatables.min.js"></script>
    <script src="../js/all.min.js"></script>
    <script src="../js/sweetalert2.all.min.js"></script>
    <script src="../js/toastr.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/expedientes.js"></script>

</body>
</html>