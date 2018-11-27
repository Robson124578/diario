<?php

include("conexao.php");

///////////////////////////////////////////
///Criando a Tabela anotação
///////////////////////////////////////////

// $sql = "CREATE TABLE tb_anotacao( tb_anotacao_id_anotacao			INT (100) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
// 					 				 tb_anotacao_assunto				VARCHAR (200) NOT NULL,
// 					 				 tb_anotacao_data_criacao 			DATE,
// 					 				 tb_anotacao_id_usuario 			INT,
// 					 				 tb_anotacao_anotacao 				VARCHAR (200) NOT NULL,
// 									 tb_anotacao_data 					TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
// 									 CONSTRAINT FK_tb_anotacao_id_usuario FOREIGN KEY (tb_anotacao_id_usuario) REFERENCES tb_usuario(tb_usuario_id_usuario)		
// 									)";


// if ($conn->query($sql) === TRUE) {
// 	echo "Tabela Criada com sucesso !!!";
// } else {
// 	echo "Erro ao criar tabela" . mysqli_error($conn);
// }

///////////////////////////////////////////
///adicionando os dados
///////////////////////////////////////////

foreach ($_POST as $variavel => $valor) {
	$$variavel = $valor;
}

//variável vai pegar o tipo de ação. 
$acao = $_GET['acao'];



if ($acao == "cadastrar") {

	
	$sql = " INSERT INTO tb_anotacao(tb_anotacao_assunto, 
								 tb_anotacao_data_criacao, 
								 tb_anotacao_anotacao) 
		  VALUES (?,?,?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $tb_anotacao_assunto, 
						 $tb_anotacao_data_criacao, 
						 $tb_anotacao_anotacao);
$stmt->execute();

	echo "<br><br><br>Dados inseridos na tabela ('tb_anotacao') com sucesso !";


$stmt->close();

} else 
if ($acao == "alterar") {
	$sql = "UPDATE tb_anotacao SET
								   tb_anotacao_assunto =      '".$tb_anotacao_assunto."', 
								   tb_anotacao_data_criacao = '".$tb_anotacao_data_criacao."', 
								   tb_anotacao_anotacao=       '".$tb_anotacao_anotacao."' WHERE tb_anotacao_id_anotacao =".$tb_anotacao_id_anotacao;

	if (mysqli_query($conn, $sql)) {

    echo "Record updated successfully";
} else {
    echo "Error updating record: " . mysqli_error($conn);
}

}  
 else 
if ($acao == "excluir") {
	$sql = "DELETE FROM tb_anotacao WHERE tb_anotacao_id_anotacao =".$tb_anotacao_id_anotacao;

	if (mysqli_query($conn, $sql)) {
    echo "Record deleted successfully";
} 	else {
    	echo "Error deleting record: " . mysqli_error($conn);
	}
	
}  

$conn->close();
header("Location:http://localhost:8080/diario_de_classe/php/anotacoes.php");
exit();
?>