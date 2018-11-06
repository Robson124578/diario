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
	// variável que recebe o valor digitado no textarea
	var conteudoAnotacao = document.getElementById("info").value;

	// a divpai vai receber a nova div a ser criada
	var divPai = document.getElementById("idAnotacoesSalvas");
		// criação da nova div
		var novaDiv= document.createElement("div");
			novaDiv.className = "anotacao";
			divPai.appendChild(novaDiv); 
		//	
		var titulodiv = document.createElement("h2");
			titulodiv.className = "tituloNovaDiv";
			novaDiv.appendChild(titulodiv);
			mes = ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"];
			//função para concatenar o '0' antes dos minutos.
			function concatenarZero(numero) {
				if (numero < 10) {
					numero = "0" + numero;
				}
				return numero;
			}
		var data = new Date();
			titulodiv.innerHTML += data.getDate() + " de " + mes[data.getMonth()] + " de " + data.getFullYear() + ", às " + " " + data.getHours() + ":" + concatenarZero(data.getMinutes()) + ".";

		var botaoConfigAnotacao	= document.createElement("i");
			botaoConfigAnotacao.className = "fas fa-ellipsis-v";
			botaoConfigAnotacao.setAttribute('onclick','opcoes()');
			novaDiv.appendChild(botaoConfigAnotacao);
				
		var containerAnotacao = document.createElement("p");
			containerAnotacao.innerHTML = conteudoAnotacao;
			containerAnotacao.className = "conteudo-texto-anotacoes";
			novaDiv.appendChild(containerAnotacao);

		var botaoCrud = document.createElement("button");
			botaoCrud.innerHTML = "editar";
			botaoCrud.setAttribute('type','button');
			botaoCrud.className = "sumir"
			novaDiv.appendChild(botaoCrud);

		var botaoCrud = document.createElement("button");
			botaoCrud.innerHTML = "excluir";
			botaoCrud.setAttribute('type','button');
			botaoCrud.className = "sumir"
			novaDiv.appendChild(botaoCrud);			
}	
	function opcoes() {
		var aparcer = document.getElementsByClassName("sumir").classList.toggle("aparecer");
	}
