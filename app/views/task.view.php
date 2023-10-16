<?php

class TaskView {
    public function showCanciones($canciones) {
        $count = count($canciones);

        // NOTA: el template va a poder acceder a todas las variables y constantes que tienen alcance en esta funcion

        // mostrar el template
        require 'templates/lista_canciones.phtml';
    }

    public function showError($error) {
        require 'templates/error.phtml';
    }
}