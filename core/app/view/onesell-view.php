
<div class="btn-group pull-right">
  
</div>
<h1>Resumen de Traslados</h1>
<?php if(isset($_GET["id"]) && $_GET["id"]!=""):?>
<?php
$sell = SellData::getById($_GET["id"]);
$operations = OperationData::getAllProductsBySellId($_GET["id"]);
$total = 0;
?>
<?php
if(isset($_COOKIE["selled"])){
	foreach ($operations as $operation) {
//		print_r($operation);
		$qx = OperationData::getQYesF($operation->product_id);
		// print "qx=$qx";
			$p = $operation->getProduct();
		if($qx==0){
			echo "<p class='alert alert-danger'>El producto <b style='text-transform:uppercase;'> $p->name</b> no tiene existencias en inventario.</p>";			
		}else if($qx<=$p->inventary_min/2){
			echo "<p class='alert alert-danger'>El producto <b style='text-transform:uppercase;'> $p->name</b> tiene muy pocas existencias en inventario.</p>";
		}else if($qx<=$p->inventary_min){
			echo "<p class='alert alert-warning'>El producto <b style='text-transform:uppercase;'> $p->name</b> tiene pocas existencias en inventario.</p>";
		}
	}
	setcookie("selled","",time()-18600);
}

?>
<table class="table table-bordered">

<?php endif; ?>
</table>
<br><table class="table table-bordered table-hover">
	<thead>
		<th>Codigo</th>
		<th>Cantidad</th>
		<th>Nombre del Producto</th>
		<th>Estado Inicial</th>
		

	</thead>
<?php
	foreach($operations as $operation){
		$product  = $operation->getProduct();
?>
<tr>
	<td><?php echo $product->id ;?></td>
	<td><?php echo $operation->q ;?></td>
	<td><?php echo $product->name ;?></td>
	<td> <?php echo $product->price_out;?></td>
</tr>
<?php
	}
	?>
</table>
<br><br>
<div class="row">
<div class="col-md-4">
<table class="table table-bordered">
	
	

</table>
</div>
</div>
