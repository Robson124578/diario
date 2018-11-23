/*********************************/
/**função para expandir cadastro**/
/*********************************/

function expandirCadastro() {
	document.getElementById("id_cadastro").classList.toggle("surgir");
	var texto = document.getElementsByTagName("p")[0].textContent;

	if (texto == "Cadastrar") {
			document.getElementsByTagName("p")[0].textContent = "FECHAR";
			document.getElementsByTagName("p")[0].setAttribute("title", "Fechar...")		
	} else if (texto == "FECHAR") {
			document.getElementsByTagName("p")[0].textContent = "Cadastrar";
			document.getElementsByTagName("p")[0].setAttribute("title", "Recuperar Usuário ou Senha...")
	}
}

function expandirRecuperacaoDeSenha() {
	document.getElementById("id_recuperar_senha").classList.toggle("surgir");
	var texto = document.getElementsByTagName("p")[1].textContent;

if (texto == "Recuperar Senha") {
			document.getElementsByTagName("p")[1].textContent = "FECHAR";
			document.getElementsByTagName("p")[1].setAttribute("title", "Fechar...")		
	} else if (texto == "FECHAR") {
			document.getElementsByTagName("p")[1].textContent = "Recuperar Senha";
			document.getElementsByTagName("p")[1].setAttribute("title", "Recuperar Usuário ou Senha...")
	}
 }
/********************************/
/********validar campo senha******/
/********************************/

function validaSenha(input) {
	var primeiraSenha = document.getElementById("senha1").value;
	if (input.value != primeiraSenha) {
		input.setCustomValidity('As senhas não conferem !!!');
	}
	else {
		inpu.setCustomValidity('');
	}
}

/********************************/
/**função para o menu principal**/
/********************************/

function botaoMenu() {
	document.getElementById("menu-cel").classList.toggle("aparecer");

	document.getElementById("superior").classList.toggle("menu-barra-Sup");

	document.getElementById("centro").classList.toggle("desaparecer-barra-central");

	document.getElementById("inferior").classList.toggle("menu-barra-Inf");
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
	if (mudaTexto == "Adicionar Anotação") {
		document.getElementById("adicionar").textContent = "Fechar";
	}
	else if (mudaTexto == "Fechar") {
		document.getElementById("adicionar").textContent = "Adicionar Anotação";		
	}
}

/*******************************/
/**função para botão Turmas **/
/*******************************/

function botaoGeral() {

	document.getElementById("insercaoTurma").classList.toggle("aparecer");

	var mudaTexto = document.getElementById("adicionar").textContent;
	if (mudaTexto == "Adicionar Turma") {
		document.getElementById("adicionar").textContent = "Fechar";
	}
	else if (mudaTexto == "Fechar") {
		document.getElementById("adicionar").textContent = "Adicionar Turma";		
	}
}
/*******************************/
/**função para botão Notas **/
/*******************************/

function botaoNotas() {
	document.getElementById("id-nota").classList.toggle("aparecer");

	var conteudoDeTexto = document.getElementById("tituloNotas").textContent;
	if (conteudoDeTexto == "Lançar nota") {
		document.getElementById("tituloNotas").textContent = "Fechar";
	}
	else if (conteudoDeTexto == "Fechar") {
		document.getElementById("tituloNotas").textContent = "Lançar nota";
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
