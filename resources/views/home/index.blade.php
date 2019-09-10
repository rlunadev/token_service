
@extends('template.main')
@section('title','Tablero')
@section('content')

<div class="panel panel-default">
	<div class="col-md-12" style="background-color:#f5f5f5">
		<h2 id="msjBienvenido"></h2>
		<div class="col-md-8">
			<div class="panel-heading"></div>
		</div>
		<div class="col-md-4">
      {{-- <button type="button" onclick="window.location='{{ route("users.index") }}'">Button</button> --}}
		</div>
	</div>
</div>
@endsection

<script src="{{asset('bower_components/jquery/dist/jquery.min.js')}}"></script>
<script src="{{asset('bower_components/bootstrap/dist/js/bootstrap.min.js')}}"></script>
<script src="{{asset('bower_components/datatables.net/js/jquery.dataTables.js')}}"></script>
<script src="{{asset('bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')}}"></script>
<script src="{{asset('dist/js/adminlte.min.js')}}"></script>
