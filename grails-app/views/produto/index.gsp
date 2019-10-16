<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Gerenciamento de produtos</title>
    <asset:javascript src="produto.js"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript">
        function carregarLista() {
            $('.close').click();
            <g:remoteFunction controller="produto" action="lista" update="divLista"/>
        }
        
        function deleteClick(productId) {
            $('#deleteBody').html('Você deseja realmente excluir ' + $('td#' + productId).text() + ' ?');
            $("#modalDelete").modal("show");
            $("#modalYesButton").attr('onclick', 'modalDeleteClick(' + productId + ')');
        }

        function modalDeleteClick(id) {
            $('#notButton').click();
            <g:remoteFunction controller="produto" action="excluir" update="divLista" id="'+id+'"/>
        }
    </script>
</head>

<body>

<div class="card card-table fixed-table-toolbar">
    <div class="card-header">Produtos
    <div class="columns columns-right btn-group float-right">
        <g:remoteLink class="btn btn-primary btn-sm active" controller="produto" action="adicionar" update="divForm" data-toggle="modal" data-target="#modalTable">Adicionar</g:remoteLink>
    </div>
    </div>
    <div id="divLista" class="card-body">
        <g:render template="lista" model="{produtos: produtos}"/>
    </div>
    <div id="divMensagem"></div>

    <div id="modalTable" class="modal fade" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Novo Produto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div id="divForm" class="modal-body">

                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Atenção</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div id="deleteBody" class="modal-body">

                </div>
                <div class="modal-footer">
                    <button id="notButton" type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                    <button id="modalYesButton" type="button" class="btn btn-primary">Sim</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>