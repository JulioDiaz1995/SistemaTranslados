<div class="row">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-cyan.min.css" />

	<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

	<div class="col-md-12">
		<?php
		if (isset($_GET["detalle"])) {
		?>
			<div class="alert alert-warning alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<strong>Advertencia!</strong> El Producto no se puede agregar dos veces.
			</div>
		<?php
		}
		?>

		<h1>
			<center><b>Historial De Remisiones</b></center>
		</h1>

		<div class="clearfix"></div>

		<br>

		<form action="">

			<br></br>

				<br>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Fecha</th>
							<th>De</th>
							<th>Para</th>
							<th>Observaciones</th>
							<th>Enviado Por</th>
							<th>Transportado Por</th>
							<th>Recibido Por</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
						<?php
						$detalles = ProductData::producto_remisiones2();

						foreach ($detalles as $key => $value) {
						?>
							<tr>
								<td><?php echo $value->id; ?></td>
								<td><?php echo $value->fecha; ?></td>
								<td></td>
								<td><?php echo $value->de; ?></td>
								<td></td>
								<td><?php echo $value->para; ?></td>
								<td></td>
								<td><?php echo $value->observaciones; ?></td>
								<td></td>
								<td><?php echo $value->enviado_firma; ?></td>
								<td></td>
								<td><?php echo $value->transportado_firma; ?></td>
								<td></td>
								<td><?php echo $value->recibido_firma; ?></td>
								<td></td>
							</tr>
						<?php
						}
						?>

					</tbody>

				</table>


				<div class="btn-group pull-right">

				</div>
				<br><br><br><br><br><br><br><br><br><br>
			</div>


						<!-- jQuery 2.1.4 -->

	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	<script>
		//In your Javascript (external .js resource or <script> tag)
		$(document).ready(function() {
			$('.selector_remisiones').select2({
				dropdownParent: $('#exampleModal')
			});
		});
	</script> 
	<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</div>