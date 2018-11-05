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

/*******************************/
/**função para Slavar anotação**/
/*******************************/

function salvarAnotacao() {
	var conteudoAnotacao = document.getElementById("info").value;

	var divPai = document.getElementById("idAnotacoesSalvas");
	
		var novaDiv= document.createElement("div");
			novaDiv.className = "anotacao";
			divPai.appendChild(novaDiv);

		var titulodiv = document.createElement("h1");
		// var titulo    = document.createTextNode("Data: ");
		// 	titulodiv.appendChild(titulo);
			novaDiv.appendChild(titulodiv);
			mes = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];
		var data = new Date();
			titulodiv.innerHTML += data.getDate() + " de " + mes[data.getMonth()] + " de " + data.getFullYear() + ", às " + " " + data.getHours() + ":" + data.getMinutes() + ".";

				
		var containerAnotacao = document.createElement("p");
			containerAnotacao.innerHTML = conteudoAnotacao;
			containerAnotacao.className = "conteudo-texto-anotacoes";
			novaDiv.appendChild(containerAnotacao);
}