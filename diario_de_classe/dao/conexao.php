<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "dbDiarioDeClasse";

////////////////////
// Criando a conexão
////////////////////

$conn = new mysqli($servername, $username, $password, $dbname);

///////////////////////////////////////////
// Checando se houve conexão com sucesso
///////////////////////////////////////////


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
	echo "(*-*) conexão com o servidor e Banco de dados bem sucedida.<br><br>";
    }

?>