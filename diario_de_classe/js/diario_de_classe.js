// function botaoMenu() {
// 	var botao = document.getElementById("menu-cel").className += " aparecer";
// 	if ( botao == aparecer) {
// 		document.getElementById("menu-cel").className.replace("aparecer","sumir")
// 	}
// }
function botaoMenu() {
	var botao =	document.getElementById("menu-cel");
	if (botao.classList.contains("menu")) {
			botao.className += " aparecer";
	}
	else if (botao.classList.contains("aparecer")) {
			botao.className.remove("aparecer");
	} 

}


/***********Ações da Página Anotações***************/

function estenderAnotacao() {
	 document.getElementsById("anot").style.overflow = "visible";
	
	}

