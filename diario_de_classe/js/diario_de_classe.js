/********************************/
/**função para o menu principal**/
/********************************/

function botaoMenu() {
	 document.getElementById("menu-cel").classList.toggle("aparecer");
 }

/************************************/
/**função para botão planos de aula**/
/************************************/

function botaoPlanosDeAula() {
	document.getElementById("planosDeAula").classList.toggle("aparecer");

	var mudaTexto = document.getElementById("adicionar").textContent;
	if (mudaTexto == "Adicionar") {
		document.getElementById("adicionar").textContent = "Fechar";
	}
	else if (mudaTexto == "Fechar") {
		document.getElementById("adicionar").textContent = "Adicionar";		
	}

}
/*******************************/
/**função para botão anotações**/
/*******************************/

function botaoanotacoes() {

	document.getElementById("idAnotacao").classList.toggle("aparecer");

	var mudaTexto = document.getElementById("adicionar").textContent;
	if (mudaTexto == "Adicionar") {
		document.getElementById("adicionar").textContent = "Fechar";
	}
	else if (mudaTexto == "Fechar") {
		document.getElementById("adicionar").textContent = "Adicionar";		
	}
}