<?php
 

if(count($_POST)>0){
	$sql = "SELECT * FROM detalle_remision WHERE id_producto =".$_POST["p_bodega"]." AND id_remision = 0";
	$query = Executor::doit($sql);
	$prod = Model::many($query[0],new ProductData());

	if(count($prod)>0){
		print "<script>window.location='index.php?view=remision&detalle=true';</script>";
	}

	if(count($prod) == 0){
		Executor::doit('INSERT INTO detalle_remision(id_producto,cantidad,id_remision) 
		VALUES('.$_POST["p_bodega"].','.$_POST["p_cantidad"].',0)');
		print "<script>window.location='index.php?view=remision';</script>";
	}

	
}

?>