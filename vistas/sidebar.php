<nav class="navbar bg-body-tertiary fixed-top border">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a href="#">
      <img class="img-fluid rounded-5" src="../img/usuarios/alexander.jpg" alt="" width="50px" height="50px">
    </a>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Rectorado</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="menu.php">Inicio</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Mantenimientos
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="ciudades.php">Ciudades</a></li>
              <li><a class="dropdown-item" href="roles.php">Roles</a></li>
              <li><a class="dropdown-item" href="funcionarios.php">Funcionarios</a></li>
              <li><a class="dropdown-item" href="#">Usuarios</a></li>
              <li><a class="dropdown-item" href="#">Dependencias</a></li>
              <li><a class="dropdown-item" href="#">Áreas</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Expendientes
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Recepcion</a></li>
              <li><a class="dropdown-item" href="#">Expedientes a Revisar</a></li>
              <li><a class="dropdown-item" href="#">Historial de Expedientes</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>