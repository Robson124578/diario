<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbdiarioDeClasse";

////////////////////
// Criando a conexão
////////////////////

$conn = new mysqli($servername, $username, $password, $dbname);



///////////////////////////////////////////////
// Defininndo o padrao de caracteres para UTF-8
///////////////////////////////////////////////


mysqli_set_charset($conn,"utf8");


///////////////////////////////////////////
// Checando se houve conexão com sucesso
///////////////////////////////////////////


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>