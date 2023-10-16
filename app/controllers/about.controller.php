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
        $this->model = new AlbumesModel();
    } 

    public function showAlbumes() {
        // Obtén los albumes desde el modelo
        $albumes = $this->model->getAlbumes();
        
        // Muestra los albumes desde la vista
        $this->view->showAlbumes($albumes);
    }

    public function addAlbum() {

        // Obtén los datos del formulario
        $tituloAlbum = $_POST['tituloAlbum'];
        $añoLanzamiento = $_POST['añoLanzamiento'];
        $artistaID = $_POST['artistaID'];

        // Validaciones
        if (empty($tituloAlbum) || empty($añoLanzamiento)) {
            $this->view->showError("Debe completar todos los campos");
            return;
        }

        $id = $this->model->insertAlbum($tituloAlbum, $añoLanzamiento, $artistaID);
        if ($id) {
            header('Location: ' . BASE_URL);
        } else {
            $this->view->showError("Error al insertar el álbum");
        }
    }

    public function removeAlbum($id) {
        $this->model->deleteAlbum($id);
        header('Location: ' . BASE_URL);
    }
    
    public function finishAlbum($id) {
        $this->model->updateAlbum($id);
        header('Location: ' . BASE_URL);
    }
}
