      <!-- Modal -->
      <div class="modal fade" id="modalPerfil" data-bs-backdrop="static" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h1 class="modal-title fs-5" id="staticBackdropLabel">Perfil de Usuario</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <span id="p_nombre"></span>
                      <span id="p_ci"></span>
                      <span id="p_ciudad"></span>
                      <span id="p_direccion"></span>
                      <span id="p_rol"></span>
                      <span id="p_usuario"></span>
                      <div class="text-center">
                        <!-- <img src="#" id="p_userPerfil" width="200" height="200"> -->
                      </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-danger" id = "btn_salir">Cerrar Sesion</button>
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                  </div>
              </div>
          </div>
      </div>

<nav class="navbar fixed-top nav-icon border-0">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <span id="user_perfil">
      <img class="img-fluid rounded-5" id="user_img" src="../img/usuarios/alexander.jpg" alt="" width="50px" height="50px">
    </span>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Rectorado</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body nav-icon">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="menu.php">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Mantenimientos
            </a>
            <ul class="dropdown-menu nav-icon">
              <li><a class="dropdown-item" href="ciudades.php">Ciudades</a></li>
              <li><a class="dropdown-item" href="roles.php">Roles</a></li>
              <li><a class="dropdown-item" href="funcionarios.php">Funcionarios</a></li>
              <li><a class="dropdown-item" href="usuarios.php">Usuarios</a></li>
              <li><a class="dropdown-item" href="dependencias.php">Dependencias</a></li>
              <li><a class="dropdown-item" href="areas.php">Áreas</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Expendientes
            </a>
            <ul class="dropdown-menu nav-icon">
              <li><a class="dropdown-item" href="expedientes.php">Recepcion</a></li>
              <li><a class="dropdown-item" href="#">Expedientes a Revisar</a></li>
              <li><a class="dropdown-item" href="#">Historial de Expedientes</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>