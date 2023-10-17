<?php

class AlbumView {
    public function showAlbum($Albumes) {
        $count = count($Albumes);

        // NOTA: el template va a poder acceder a todas las variables y constantes que tienen alcance en esta funcion

        // mostrar el template
        require 'templates/albumes.phtml';
    }

    public function showError($error) {
        require 'templates/error.phtml';
    }
}