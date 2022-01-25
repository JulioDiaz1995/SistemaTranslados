<?php
		include_once "dompdf/autoload.inc.php";	
		include_once "core/app/model/ProductData.php";	
         // reference the Dompdf namespace
		use Dompdf\Dompdf;

		 // instantiate and use the dompdf class
		 $dompdf = new Dompdf();
		 $remision = ProductData::getByIdRemision($_GET["id"]);

		 $html = '<h1>master/index.php?view=remisionexportar&id=2</h1>';
	
		 $dompdf->loadHtml("<h1>vvv</h1>");
		 
		 // (Optional) Setup the paper size and orientation
		 $dompdf->setPaper('A4', 'landscape');
		 
		 // Render the HTML as PDF
		 $dompdf->render();
		 
		 // Output the generated PDF to Browser
		 $dompdf->stream();

?>