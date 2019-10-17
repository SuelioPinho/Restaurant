<%--
  Created by IntelliJ IDEA.
  User: ravmac
  Date: 16/10/19
  Time: 18:37
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:javascript src="application.js"/>
    <title>Controle de Permissão</title>
    <script type="text/javascript">
        $(document).ready(function(){
            carregarListaUsuarios()
            carregarListaPermissoes()
        })
        function carregarListaPermissoes(){
            $.ajax({
                method: "POST",
                url: "listarPermissao",
                data: { },
                success: function(data){
                    $("#divListaPermissao").html(data)
                }
            })
        }
        function carregarListaUsuarios(){
            $('#modalUsuario').click();
            $.ajax({
                method: "POST",
                url: "listarUsuario",
                data: { },
                success: function(data){
                    $("#divListaUsuario").html(data)
                }
            })
        }
        function retornoSalvarUsuario(data){
            if(data.mensagem=="OK"){
                $("#divMensagemUsuario").html("Usuário salvo com sucesso.")
                $("#formUsuario input[name=login]").val("")
                $("#formUsuario input[name=id]").val("")
                carregarListaUsuarios()
            }else{
                $("#divMensagemUsuario").html("Não foi possível salvar o usuário.")
            }
        }
        function retornoSalvarPermissao(data){
            if(data.mensagem=="OK"){
                $("#divMensagemPermissao").html("Permissão salva com sucesso.")
                $("#formPermissao input[name=permissao]").val("")
                $("#formPermissao input[name=id]").val("")
                carregarListaPermissoes()
            }else{
                $("#divMensagemPermissao").html("Não foi possível salvar a permissão.")
            }
        }
        function alterarUsuario(id){
            $.ajax({
                method: "POST",
                url: "getUsuario",
                data: { "id": id },
                success: function(data){
                    $("#formUsuario input[name=login]").val(data.usuario.username)
                    $("#formUsuario input[name=id]").val(data.usuario.id)
                    $("#divDetalhesUsuario").html("")
                    for(i in data.permissoes){
                        var permissao = data.permissoes[i]
                        $("#divDetalhesUsuario").append(permissao.authority+" <a href='javascript: desvincularPermissao("+permissao.id+")'>X</a><br />")
                    }
                }
            })
        }
        function alterarPermissaoUsuario(id) {
            $.ajax({
                method: "POST",
                url: "getUsuario",
                data: { "id": id },
                success: function(data){
                    $("#divDetalhesUsuario").html(data)
                }
            })
        }
        function alterarPermissao(id){
            $.ajax({
                method: "POST",
                url: "getPermissao",
                data: { "id": id },
                success: function(data){
                    $("#formPermissao input[name=permissao]").val(data.authority)
                    $("#formPermissao input[name=id]").val(data.id)
                }
            })
        }
        function excluirPermissao(id){
            if (confirm("Deseja realmente excluir a permissão?")){
                $.ajax({
                    method: "POST",
                    url: "excluirPermissao",
                    data: { "id": id },
                    success: function(data){
                        if (data.mensagem=="OK"){
                            carregarListaPermissoes()
                        }else{
                            $("#divMensagemPermissao").html("Não foi possível excluir")
                        }
                    }
                })
            }
        }
        function excluirUsuario(id){
            if (confirm("Deseja realmente excluir o usuário?")){
                $.ajax({
                    method: "POST",
                    url: "excluirUsuario",
                    data: { "id": id },
                    success: function(data){
                        if (data.mensagem=="OK"){
                            carregarListaUsuarios()
                        }else{
                            $("#divMensagemUsuario").html("Não foi possível excluir")
                        }
                    }
                })
            }
        }
        function vincularPermissao(idPermissao){
            var idUsuario = $("#tableUsuarioPermissoesId").val()
            $.ajax({
                method: "POST",
                url: "vincularPermissao",
                data: { "idPermissao": idPermissao, "idUsuario": idUsuario },
                success: function(data){
                    if (data.mensagem=="OK"){
                        alterarPermissaoUsuario(idUsuario)
                    }else{
                        $("#divMensagemPermissao").html("Não foi possível vincular a permissão com o usuário")
                    }
                }
            })
        }
        function desvincularPermissao(idPermissao){
            var idUsuario = $("#tableUsuarioPermissoesId").val()
            $.ajax({
                method: "POST",
                url: "desvincularPermissao",
                data: { "idPermissao": idPermissao, "idUsuario": idUsuario },
                success: function(data){
                    if (data.mensagem=="OK"){
                        alterarPermissaoUsuario(idUsuario)
                    }else{
                        $("#divMensagemPermissao").html("Não foi possível desvincular a permissão com o usuário")
                    }
                }
            })
        }
        
        function x() {
            
        }
    </script>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm">
            <div class="card card-table fixed-table-toolbar">
                <div class="card-header">Usuários
                    <div class="columns columns-right btn-group float-right">
                        <button class="btn btn-primary btn-sm active" data-toggle="modal" data-target="#modalUsuario">Adicionar</button>
                    </div>
                </div>
                <div id="divUsuarios" class="card-body">
                    <div id="divMensagemUsuario"></div>
                    <div id="divListaUsuario">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm">
            <div id="divDetalhesUsuario">
            </div>
        </div>
        <div class="col-sm">
            <div class="card card-table fixed-table-toolbar">
                <div class="card-header">Permissões
                    <div class="columns columns-right btn-group float-right">
                        <button class="btn btn-primary btn-sm active" data-toggle="modal" data-target="#modalPermissao">Adicionar</button>
                    </div>
                </div>
                <div id="divPermissoes" class="card-body">
                    <div id="divMensagemPermissao"></div>
                    <div id="divListaPermissao">
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<div id="modalUsuario" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Novo Usuário</h5>
                <button id="userClose" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div id="divFormUsuario" class="modal-body">
                <g:render template="form_usuario"/>
            </div>
        </div>
    </div>
</div>

<div id="modalPermissao" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nova Permissão</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div id="divFormPermissao" class="modal-body">
                <g:render template="form_permissao"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>