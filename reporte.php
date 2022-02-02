<?php


require "fpdf/fpdf.php";
include 'plantilla.php';
require 'conexion.php';

$pdf = new FPDF("P","mm", "letter") ;
$pdf->AddPage();
$pdf->SetFont("Arial","B","12") ;
$pdf->Cell(100,5 ,"Mi Primer Reporte con PHP Y MYSQL",1,0,"C");
$pdf->Output();

?>

