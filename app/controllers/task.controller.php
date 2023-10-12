<?php
require_once './app/models/task.model.php';
require_once './app/views/task.view.php';
require_once './app/helpers/auth.helper.php';

class TaskController {
    private $model;
    private $view;

    public function __construct() {
        // verifico logueado

        $this->model = new TaskModel();
        $this->view = new TaskView();
    }

    public function showCanciones() {
        // obtengo tareas del controlador
        $canciones = $this->model->getCanciones();
        
        // muestro las tareas desde la vista
        $this->view->showCanciones($canciones);
    }

    public function addCanciones() {

        // obtengo los datos del usuario
        $titulo = $_POST['titulo'];
        $duracion = $_POST['Duración'];
        $albumID = $_POST['albumID'];

        // validaciones
        if (empty($titulo) || empty($duracion)) {
            $this->view->showError("Debe completar todos los campos");
            return;
        }

        $id = $this->model->insertCanciones($titulo, $duracion, $albumID);
        if ($id) {
            header('Location: ' . BASE_URL);
        } else {
            $this->view->showError("Error al insertar la tarea");
        }
    }

    function removeCanciones($id) {
        $this->model->deleteCanciones($id);
        header('Location: ' . BASE_URL);
    }
    
    function finishCanciones($id) {
        $this->model->updateCanciones($id);
        header('Location: ' . BASE_URL);
    }

}