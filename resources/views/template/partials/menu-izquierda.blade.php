<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <br>
        </div>
        <div class="pull-left info">
          
          
        </div>
      </div>
      <!-- search form -->
      {{-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form> --}}
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree" id="menuIzquierda">
      @if(Auth::user()->admin())
        <li>
          <a href="" value="users">
            <i class="fa fa-user"></i> <span>Usuarios</span>
          </a>
        </li>
        <li>
          <a href="" value="roles">
            <i class="fa fa-vcard"></i> <span>Roles</span>
          </a>
        </li> 
        <li>
          <a href="" value="grupos">
            <i class="fa fa-window-restore"></i> <span>Grupos</span>
          </a>
        </li> 
        <li>
          <a href="" value="sistema">
            <i class="fa fa-id-card-o"></i> <span>Sistemas</span>
          </a>
        </li>
        <li>
          <a href="" value="empresa">
            <i class="fa fa-bars"></i> <span>Empresa</span>
          </a>
        </li>
       
      @endif
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <script>
  $("#menuIzquierda li a").hover(function(){
     var url=window.location.origin+"/"+$(this).attr('value')+"?token="+localStorage.getItem('token');
     $(this).attr('href',url);
    });

    setMenu ();
    function setMenu (){
      $.ajax({
        type: 'POST',
        url:{!!json_encode(url('/'))!!}+"/api/setMenu?token="+localStorage.getItem('token'),
        data:{},
        success: function(result) {
                if(result.data=="calculo"){
                  $("#roles").show();
                } 
         $("#usuarioSistema").html("Hola, "+result.user);
         $("#msjBienvenido").html("Bienvenido, "+result.user);
        },
        error: function(e) {}
      });
    }
  </script>