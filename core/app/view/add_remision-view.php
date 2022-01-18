<?php


if(count($_POST)>0){


		Executor::doit('INSERT INTO remision(fecha,de,para,observaciones) 
		VALUES('.$_POST["fecha_r"].','.$_POST["de_r"].','.$_POST["para_r"].','.(isset($_POST["observaciones_r"])?$_POST["observaciones_r"]:"" ).')');
		
		$remision = ProductData::ultima_remision();

		Executor::doit('UPDATE detalle_remision set id_remision = '.$remision[0]->id.' where id_remision=0');
		
		print "<script>window.location='index.php?view=remision';</script>";

}

?>