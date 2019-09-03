<header class="main-header">
<!-- Logo -->
<a class="logo">
  <!-- mini logo for sidebar mini 50x50 pixels -->
  <span class="logo-mini">U</span>
  <!-- logo for regular state and mobile devices -->
  <span class="logo-lg">Usuarios</span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
  <!-- Sidebar toggle button-->
  <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button" id="menuButton">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </a>
      {{-- <a href="http://localhost:8000/inventario/public/"  class="btn bg-blue margin">
      <i class="fa fa-inbox"></i> Stock
      </a>
       --}}
      {{-- <a href="http://localhost:8000/calculo/public/"  class="btn bg-blue margin">
      <i class="fa fa fa-cogs"></i> Calculo
      </a>
      <a href="http://localhost:8000/token_service/public/"  class="btn bg-blue margin">
      <i class="fa fa-user"></i> Usuarios
      </a> --}}

      <button class="btn bg-blue margin" onclick="navigateToOtherModule('inventario')"><i class="fa fa-inbox"></i> Stock  </button>
      <button class="btn bg-blue margin" onclick="navigateToOtherModule('calculo')"><i class="fa fa-inbox"></i> Calculo  </button>
      <button class="btn bg-blue margin" onclick="navigateToOtherModule('usuarios')"><i class="fa fa-user"></i> Usuarios  </button>
      <button class="btn bg-blue margin" onclick="navigateToOtherModule('fases')"><i class="fa fa-user"></i> Fases  </button>

  <div class="navbar-custom-menu">
    <ul class="nav navbar-nav">
      <li class="dropdown messages-menu">
        <a href="#" id="usuarioSistema"></a>
      </li>
      <!-- Messages: style can be found in dropdown.less-->
      <li class="dropdown messages-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="salirSistema">
          <i class="fa fa-exit-o"></i>Salir
        </a>
      </li>
    </ul>
  </div>
</nav>
</header>
<script>
$("#salirSistema").click(function(){
  localStorage.setItem('token','');
  window.location.href =  sessionStorage.getItem('servidor_logueo');
});

verifyMenu();
function verifyMenu(){
if(localStorage.getItem('menu')==null ){
  localStorage.setItem('menu',0);
  }else if (localStorage.getItem('menu')==1){
    $('body').attr('class','hold-transition skin-blue sidebar-mini');
  } else if(localStorage.getItem('menu')==0){
    $('body').attr('class','hold-transition skin-blue sidebar-mini sidebar-collapse');
  }
}
$('#menuButton').click(function(){
var statusMenu=localStorage.getItem('menu');
if(statusMenu==0){
  $('body').attr('class','hold-transition skin-blue sidebar-mini');
  localStorage.setItem('menu',1);
}
else {
  localStorage.setItem('menu',0);
  $('body').attr('class','hold-transition skin-blue sidebar-mini sidebar-collapse');
}
});

function navigateToOtherModule(name) {
var urlRedirect = '';
  if(name != 'usuarios')
    urlRedirect = "http://localhost:8000/proyecto/"+name+"/public/home?token="+localStorage.getItem('token');
  else
    urlRedirect = "http://localhost:9000/home?token="+localStorage.getItem('token');

  $.ajax({
        url:urlRedirect,
        success: function (data) { 
            window.location = urlRedirect;
        },
        error: function (jqXHR, status, er) {
          showError( "El dominio  "+ (new URL(urlRedirect)).origin + " no esta disponible.")
        }
    });
} 
</script>