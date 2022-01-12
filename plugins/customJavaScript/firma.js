const 
$btnLimpiar = document.querySelector("#btnLimpiar"),
$btnLimpiar1 = document.querySelector("#btnLimpiar1"),
$btnLimpiar2 = document.querySelector("#btnLimpiar2"),

$canvas = document.querySelector("#canvas"),
$canvas1 = document.querySelector("#canvas1"),
$canvas2 = document.querySelector("#canvas2");

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

const contexto = $canvas.getContext("2d");
const contexto1 = $canvas1.getContext("2d");
const contexto2 = $canvas2.getContext("2d");

const COLOR_PINCEL = "Green";
const COLOR_FONDO = "white";
const GROSOR = 2;

let xAnterior = 0, yAnterior = 0, xActual = 0, yActual = 0;

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

