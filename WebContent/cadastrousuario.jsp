<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!-- Decalara��o da tag do jstl para mostrar os dados recuperados do banco na tabela -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="resources/css/cadastro.css">

<meta charset="ISO-8859-1">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>

<title>Cadastro usuario JSP</title>
</head>
<body>
	<a href="acessoliberado.jsp"> Inic�o</a>
	<a href="index.jsp">Sair</a>

	<!-- Criando um formulario com os campos para cadastrar um novo usu�rio no banco de dados -->
	<!-- Abertura da tag de formul�rio -->
	<!-- A a��o � salvarUsuario -->
	<!-- O post envia os dados -->

	<form action="salvarUsuario" method="post" id="formUser" onsubmit="return validarCampos() ? true : false;" enctype="multipart/form-data">
		<!-- IF tern�rio em java e java script -->
		<ul class="form-style-1">
			<li>
				<h1>Cadastro de usu�rio</h1>

				<h4 style="color: red">${msg}</h4>

				<table border="0"margin:auto;>

					<tr>
						<td><label>C�digo:</label></td>
						<td><input type="text" readonly="readonly" id="id" name="id" value="${user.id}" placeholder="Gerado autom�ticamente"></td>

						<td><label>Cep:</label></td>
						<td><input type="text" id="cep" name="cep" value="${user.cep}" placeholder="Informe um cep v�lido" onblur="consultaCep();"></td>
					</tr>

					<tr>
						<!-- Cria uma c�lula dentro da linha com o texto nome -->
						<td><label>Nome: </label></td>
						<!-- Cria um campo para receber o valor que ser� o nome -->
						<td><input type="text" id="nome" name="nome" value="${user.nome}" placeholder="Informe o nome do usu�rio"></td>

						<td><label>Rua:</label></td>
						<td><input type="text" id="rua" name="rua" value="${user.rua}"></td>
					</tr>

					<tr>
						<td><label>Login:</label></td>
						<td><input type="text" id="login" name="login" value="${user.login}"></td>

						<td><label>Bairro:</label></td>
						<td><input type="text" id="bairro" name="bairro" value="${user.bairro}"></td>
					</tr>

					<tr>
						<td><label>Senha:</label></td>
						<td><input type="password" id="senha" name="senha" value="${user.senha}"></td>

						<td><label>Cidade:</label></td>
						<td><input type="text" id="cidade" name="cidade" value="${user.cidade}"></td>
					</tr>

					<tr>
						<td><label>Telefone:</label></td>
						<td><input type="text" id="telefone" name="telefone" value="${user.telefone}"></td>

						<td><label>Estado:</label></td>
						<td><input type="text" id="estado" name="estado" value="${user.estado}"></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><label>Ibge:</label></td>
						<td><input type="text" id="ibge" name="ibge" value="${user.ibge}"></td>
					</tr>
					<tr>
						<td><label>Foto:</label></td>
						<td><input type="file" name="foto" value="foto"></td>
					</tr>


					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input type="submit" value="Cancelar" onClick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
						<td></td>
					</tr>

				</table>
			</li>
		</ul>
	</form>

	<!-- Criar tabela -> abrir tag c: do jstl -> abrir um for dentro da tag c: -> abrir expression language  ->  e uma vari�vel var="user -->

	<!-- Neste caso os items passados s�o "usuarios" da classe Usuario.java do request.setAttribute("usuarios", daoUsuario.listar()); -->

	<div class="container">
		<table class="responsive-table">
			<caption>Usu�rios cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Login</th>
				<th>Senha</th>
				<th>Editar</th>
				<th>Excluir</th>
				<th>Telefones</th>
			</tr>

			<c:forEach items="${usuarios}" var="user">

				<tr>
					<!-- Criando uma linha para cada registro -->
					<td>
						<!-- Criando uma c�lula na linha para o registro --> <c:out value="${user.id}"></c:out> <!-- Tag c:out imprime na tela o valor passado na expression language -->
					</td>

					<td>
						<!-- Criando uma c�lula na linha para o registro --> <c:out value="${user.nome}"></c:out> <!-- Tag c:out imprime na tela o valor passado na expression language -->
					</td>
					<td>
						<!--Criando uma c�lula na linha para o registro --> <c:out value="${user.telefone }"></c:out> <!--  Tag c:out imprime na tela o valor passado na expression language -->
					<td>
						<!-- Criando uma c�lula na linha para o registro --> <c:out value="${user.login}"></c:out> <!-- Tag c:out imprime na tela o valor passado na expression language -->
					</td>

					<td>
						<!-- Criando uma c�lula na linha para o registro --> <c:out value="${user.senha}"></c:out>
					</td>

					<td><a href="salvarUsuario?acao=editar&user=${user.id }"><img src="resources/img/btn_edit.png" title="Editar dados" alt="Editar" width="20px" height="20px"></a></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id }"><img src="resources/img/btn_excluir.png" title="Excluir dados" alt="Excluir" width="20px" height="20px"></a></td>
					<td><a href="salvarTelefones?acao=addFone&user=${user.id }"><img src="resources/img/btn_telefone.png" title="Telefones" alt="Telefones" width="20px" height="20px"></a></td>

				</tr>
			</c:forEach>
		</table>
	</div>


	<script type="text/javascript">
		function validarCampos() {

			if (document.getElementById("nome").value == '') {
				alert('Informe o Nome!');
				return false;
			} else if (document.getElementById("login").value == '') {
				alert('Informe o Login!');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe a Senha!');
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert('Informe o Telefone!');
				return false;
			}
			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							//Atualiza os campos com os valores da consulta.
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);
						} //end if.
						else {
							//CEP pesquisado n�o foi encontrado.
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							alert("CEP n�o encontrado.");
						}
					});
		}
	</script>
</body>
</html>