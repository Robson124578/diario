<?php

include("conexao.php");

// criando banco de dados

$sql = "CREATE DATABASE dbDiarioDeClasse";

	if ($conn-> query($sql) === TRUE) {
		echo "Banco de Dados Criado com Sucesso!!!";
	} else {
		echo "Erro ao criar "
	}
		
	$conn->close();	
?>