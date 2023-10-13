<?php
require_once './app/controllers/task.controller.php';
require_once './app/controllers/about.controller.php';
require_once './app/controllers/auth.controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'listar'; // accion por defecto
if (!empty( $_GET['action'])) {
    $action = $_GET['action'];
}

// listar    ->         taskController->showCanciones();
// agregar   ->         taskController->addCanciones();
// eliminar/:ID  ->     taskController->removeCanciones($id); 
// finalizar/:ID  ->    taskController->finishCanciones($id);
// about ->             aboutController->showAbout();
// login ->             authContoller->showLogin();
// logout ->            authContoller->logout();
// auth                 authContoller->auth(); // toma los datos del post y autentica al usuario

// parsea la accion para separar accion real de parametros
$params = explode('/', $action);

switch ($params[0]) {
    case 'listar':
        $controller = new TaskController();
        $controller->showCanciones();
        break;
    case 'agregar':
        $controller = new TaskController();
        $controller->addCanciones();
        break;
    case 'eliminar':
        $controller = new TaskController();
        $controller->removeCanciones($params[1]);
        break;
    case 'finalizar':
        $controller = new TaskController();
        $controller->finishCanciones($params[1]);
        break;



    case 'about':
        $controller = new AboutController();
        $controller->showAlbumes();
        break;

        
        
    case 'listarAlbum':
        $controller = new AboutController();
        $controller->showAlbumes();
        break;
    case 'agregarAlbum':
        $controller = new AboutController();
        $controller->addAlbumes();
        break;
    case 'eliminarAlbum':
        $controller = new AboutController();
        $controller->removeAlbumes($params[1]);
        break;
    case 'finalizarAlbum':
        $controller = new AboutController();
        $controller->finishAlbumes($params[1]);
        break;




    case 'login':
        $controller = new AuthController();
        $controller->showLogin(); 
        break;
    case 'auth':
        $controller = new AuthController();
        $controller->auth();
        break;
    case 'logout':
        $controller = new AuthController();
        $controller->logout();
        break;
    default: 
        echo "404 Page Not Found";
        break;
}