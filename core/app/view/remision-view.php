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
			<center><b>TABACOS DE ORIENTE, S. DE R.L.</b></center>
		</h1>

		<div class="clearfix"></div>

		<h2>
			<center><b>PARAISO CIGARS </b></center>
		</h2>
		<h3>
			<center> <u><b> NOTA DE REMISION </b> </u> </center>
		</h3>
		<br>

		<form action="./?view=add_remision" method="post">

			<p> <span style="padding: 10px;"> <b>Fecha: </b> </span><input type="date" id="fecha_r" name="fecha_r" style="width: 190px;height: 30px;" require> </p>
			<p> <span style="padding-right: 30px; padding-left: 10px;"> <b>De: </b> </span> <input id="de_r" name="de_r" style="width: 190px;height: 30px;" require> </p>
			<p> <span style="padding-right: 16px; padding-left: 10px;"> <b>Para: </b> </span> <input id="para_r" name="para_r" style="width: 190px;height: 30px;" require>  </p>
		<br>
			<div class="clearfix">
				<button type="submit">
					<i class='fa fa-th-list'></i>Guardar </button>
			</div>

			<div class="row">
				<div class="col-sm-8">
					<button type="button" style="margin-top: 10px;" data-toggle="modal" data-target="#exampleModal">
						<i class='fa fa-th-list'></i>Agregar</button>
				</div>

				<br>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Descripcion</th>
							<th>Unidad Medida</th>
							<th>Cantidad</th>
							<th>Precio</th>
							<th>Importe</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						$detalles = ProductData::producto_detalles_remisiones();

						foreach ($detalles as $key => $value) {
						?>
							<tr>
								<td><?php echo $value->id; ?></td>
								<td><?php echo $value->name; ?></td>
								<td></td>
								<td><?php echo $value->cantidad; ?></td>
								<td></td>
								<td><?php echo $value->cantidad; ?></td>
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

			<div class="row" style="padding: 12px;">
				<div class="col-sm-1">
					<p><b>Observaciones:</b></p>
				</div>
				<div class="col-sm-11"> <textarea style="width: 100%;height:80px" id="observaciones_r" name="observaciones_r"></textarea> </div>

			</div>

			<br></br>
			<br></br>


			<div class="row">
				<div class="col-sm-4">
					<center>
						<canvas id="canvas" style="border:white 0.1px solid;"></canvas>
					</center>
					<center>
						<p><b>Enviado por:</b></p>
						<button id="btnLimpiar" name="btnLimpiar">Limpiar</button>
					</center>

				</div>


				<div class="row">
					<div class="col-sm-4">
						<center>
							<canvas id="canvas1" style="border:white 0.1px solid;"></canvas>
						</center>
						<center>
							<p><b>Transportado por:</b></p>
						</center>
						<center><button id="btnLimpiar1" name="btnLimpiar1">Limpiar</button></center>
					</div>


					<div class="row">
						<div class="col-sm-4">
							<center>
								<canvas id="canvas2" style="border:white 0.1px solid;"></canvas>
							</center>
							<center>
								<p><b>Recibido por:</b></p>
							</center>
							<center><button id="btnLimpiar2" name="btnLimpiar2">Limpiar</button></center>
						</div>

						<!-- jQuery 2.1.4 -->


					</div>
				</div>
			</div>

		</form>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form action="./?view=adddetalle_remision" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Agregar Productos</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12">
									<select required name="p_bodega" id="p_bodega" class="selector_remisiones" style="height: 500px; width: 100%; padding-left: 10;">
										<?php
										$ubi = ProductData::producto_remisiones();
										?>
										<option value="">Seleccione Producto:</option>
										<?php foreach ($ubi as $product) : ?>
											<option value="<?php echo $product->id; ?>"><?php echo $product->name; ?></option>
										<?php endforeach; ?>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-6">
									<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input required class="mdl-textfield__input" type="number" id="p_cantidad" name="p_cantidad">
										<label class="mdl-textfield__label" for="sample3">Cantidad</label>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
							<button type="submit" class="btn btn-primary">Guardar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

	<script>
		const
			$btnLimpiar = document.querySelector("#btnLimpiar"),
			$btnLimpiar1 = document.querySelector("#btnLimpiar1"),
			$btnLimpiar2 = document.querySelector("#btnLimpiar2"),

			$canvas = document.querySelector("#canvas"),
			$canvas1 = document.querySelector("#canvas1"),
			$canvas2 = document.querySelector("#canvas2");


		const contexto = $canvas.getContext("2d");
		const contexto1 = $canvas1.getContext("2d");
		const contexto2 = $canvas2.getContext("2d");

		const COLOR_PINCEL = "black";
		const COLOR_FONDO = "white";
		const GROSOR = 1;

		// $btnDescargar = document.querySelector("#btnDescargar"),
		// $btnLimpiar = document.querySelector("#btnLimpiar"),
		// $btnGenerarDocumento = document.querySelector("#btnGenerarDocumento");

		const limpiarCanvas = () => {
			// Colocar color blanco en fondo de canvas
			contexto.fillStyle = COLOR_FONDO;
			contexto.fillRect(0, 0, $canvas.width, $canvas.height);
		};
		limpiarCanvas();
		$btnLimpiar.onclick = limpiarCanvas;

		const limpiarCanvas1 = () => {
			// Colocar color blanco en fondo de canvas
			contexto1.fillStyle = COLOR_FONDO;
			contexto1.fillRect(0, 0, $canvas1.width, $canvas1.height);
		};
		limpiarCanvas1();
		$btnLimpiar1.onclick = limpiarCanvas1;

		const limpiarCanvas2 = () => {
			// Colocar color blanco en fondo de canvas
			contexto2.fillStyle = COLOR_FONDO;
			contexto2.fillRect(0, 0, $canvas2.width, $canvas2.height);
		};
		limpiarCanvas2();
		$btnLimpiar2.onclick = limpiarCanvas2;


		let xAnterior = 0,
			yAnterior = 0,
			xActual = 0,
			yActual = 0;

		const obtenerXReal = (clientX) => clientX - $canvas.getBoundingClientRect().left;
		const obtenerYReal = (clientY) => clientY - $canvas.getBoundingClientRect().top;

		const obtenerXReal1 = (clientX) => clientX - $canvas1.getBoundingClientRect().left;
		const obtenerYReal1 = (clientY) => clientY - $canvas1.getBoundingClientRect().top;

		const obtenerXReal2 = (clientX) => clientX - $canvas2.getBoundingClientRect().left;
		const obtenerYReal2 = (clientY) => clientY - $canvas2.getBoundingClientRect().top;

		let haComenzadoDibujo = false;
		// Bandera que indica si el usuario está presionando el botón del mouse sin soltarlo

		window.obtenerImagen = () => {
			return $canvas.toDataURL();
		};


		// Contexto Y Canvas 0
		$canvas.addEventListener("mousedown", evento => {
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal(evento.clientX);
			yActual = obtenerYReal(evento.clientY);
			contexto.beginPath();
			contexto.fillStyle = COLOR_PINCEL;
			contexto.fillRect(xActual, yActual, GROSOR, GROSOR);
			contexto.closePath();
			haComenzadoDibujo = true;
		});

		$canvas.addEventListener("mousemove", (evento) => {
			if (!haComenzadoDibujo) {
				return;
			}
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal(evento.clientX);
			yActual = obtenerYReal(evento.clientY);
			contexto.beginPath();
			contexto.moveTo(xAnterior, yAnterior);
			contexto.lineTo(xActual, yActual);
			contexto.strokeStyle = COLOR_PINCEL;
			contexto.lineWidth = GROSOR;
			contexto.stroke();
			contexto.closePath();
		});
		["mouseup", "mouseout"].forEach(nombreDeEvento => {
			$canvas.addEventListener(nombreDeEvento, () => {
				haComenzadoDibujo = false;
			});
		});



		// Contexto Y Canvas 1
		$canvas1.addEventListener("mousedown", evento => {
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal1(evento.clientX);
			yActual = obtenerYReal1(evento.clientY);
			contexto1.beginPath();
			contexto1.fillStyle = COLOR_PINCEL;
			contexto1.fillRect(xActual, yActual, GROSOR, GROSOR);
			contexto1.closePath();
			haComenzadoDibujo = true;
		});

		$canvas1.addEventListener("mousemove", (evento) => {
			if (!haComenzadoDibujo) {
				return;
			}
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal1(evento.clientX);
			yActual = obtenerYReal1(evento.clientY);
			contexto1.beginPath();
			contexto1.moveTo(xAnterior, yAnterior);
			contexto1.lineTo(xActual, yActual);
			contexto1.strokeStyle = COLOR_PINCEL;
			contexto1.lineWidth = GROSOR;
			contexto1.stroke();
			contexto1.closePath();
		});
		["mouseup", "mouseout"].forEach(nombreDeEvento => {
			$canvas1.addEventListener(nombreDeEvento, () => {
				haComenzadoDibujo = false;
			});
		});







		// Contexto Y Canvas 2
		$canvas2.addEventListener("mousedown", evento => {
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal2(evento.clientX);
			yActual = obtenerYReal2(evento.clientY);
			contexto2.beginPath();
			contexto2.fillStyle = COLOR_PINCEL;
			contexto2.fillRect(xActual, yActual, GROSOR, GROSOR);
			contexto2.closePath();
			haComenzadoDibujo = true;
		});

		$canvas2.addEventListener("mousemove", (evento) => {
			if (!haComenzadoDibujo) {
				return;
			}
			xAnterior = xActual;
			yAnterior = yActual;
			xActual = obtenerXReal2(evento.clientX);
			yActual = obtenerYReal2(evento.clientY);
			contexto2.beginPath();
			contexto2.moveTo(xAnterior, yAnterior);
			contexto2.lineTo(xActual, yActual);
			contexto2.strokeStyle = COLOR_PINCEL;
			contexto2.lineWidth = GROSOR;
			contexto2.stroke();
			contexto2.closePath();
		});
		["mouseup", "mouseout"].forEach(nombreDeEvento => {
			$canvas2.addEventListener(nombreDeEvento, () => {
				haComenzadoDibujo = false;
			});
		});
	</script>

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