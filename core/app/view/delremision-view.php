<?php

$product = ProductData::borrarRemisiones($_GET["id"]);

Core::redir("./index.php?view=historial2");
?>