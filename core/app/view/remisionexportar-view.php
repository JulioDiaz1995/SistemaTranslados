<div class="row">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-cyan.min.css" />

    <link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />


    <div class="col-md-12">
        <nav aria-label="...">
            <ul class="pager">
                <li class="previous"><button onclick="window.location = './?view=historial2'">Regresar</button></li>
                <li class="next"><button onclick="window.location = './?view=exportar_remision&id=<?php echo $_GET["id"]; ?>'">IMPRIMIR</button></li>
            </ul>
        </nav>
        <?php

        $remision = ProductData::getByIdRemision($_GET["id"]);

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

            <p> <span style="padding: 10px;"> <b>Fecha: </b> </span><input readonly value="<?php echo $remision->fecha; ?>" type="date" id="fecha_r" name="fecha_r" style="width: 190px;height: 30px;" require> </p>
            <p> <span style="padding-right: 30px; padding-left: 10px;"> <b>De: </b> </span> <input value="<?php echo $remision->de; ?>" readonly id="de_r" name="de_r" style="width: 190px;height: 30px;" require> </p>
            <p> <span style="padding-right: 16px; padding-left: 10px;"> <b>Para: </b> </span> <input value="<?php echo $remision->para; ?>" readonly id="para_r" name="para_r" style="width: 190px;height: 30px;" require> </p>
            <br>

            <div class="row">


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
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $detalles = ProductData::detalle_historial_remisiones($_GET["id"]);

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
                <div class="col-sm-11"> <textarea readonly style="width: 100%;height:80px" id="observaciones_r" name="observaciones_r"><?php echo $remision->observaciones; ?></textarea> </div>

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

                    </div>


                    <div class="row">
                        <div class="col-sm-4">
                            <center>
                                <canvas id="canvas2" style="border:white 0.1px solid;"></canvas>
                            </center>
                            <center>
                                <p><b>Recibido por:</b></p>
                            </center>

                        </div>

                        <!-- jQuery 2.1.4 -->


                    </div>
                </div>
            </div>


    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</div>