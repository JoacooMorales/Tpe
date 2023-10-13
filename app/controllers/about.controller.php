<?php
require_once './app/models/albumes.model.php';
require_once './app/views/about.view.php';
require_once './app/helpers/auth.helper.php';

class AboutController {
    private $view;
    private $model;

    public function __construct() {
        //AuthHelper::verify();
        $this->view = new AboutView();
        $this->model = new albumesModel();
    } 

    public function showAlbumes() {
        // obtengo tareas del controlador
        $albumes = $this->model->getAlbumes();
        
        // muestro las tareas desde la vista
        $this->view->showAlbumes($albumes);
    }

    public function addAlbumes() {

        // obtengo los datos del usuario
        $tituloAlbum = $_POST['Título del Álbum'];
        $añoLanzamiento = $_POST['Año de Lanzamiento'];
        $artistaID = $_POST['Artista ID'];

        // validaciones
        if (empty($tituloAlbum) || empty($añoLanzamiento)) {
            $this->view->showError("Debe completar todos los campos");
            return;
        }

        $id = $this->model->insertAlbumes($tituloAlbum, $añoLanzamiento, $artistaID);
        if ($id) {
            header('Location: ' . BASE_URL);
        } else {
            $this->view->showError("Error al insertar la tarea");
        }
    }

    function removeAlbumes($id) {
        $this->model->deleteAlbumes($id);
        header('Location: ' . BASE_URL);
    }
    
    function finishAlbumes($id) {
        $this->model->updateAlbumes($id);
        header('Location: ' . BASE_URL);
    }

}