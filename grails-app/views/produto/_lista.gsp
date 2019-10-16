<g:if test="${produtos.size() > 0}">
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th style="width:37%;">Nome</th>
            <th>Preço</th>
            <th>Qtde. Atual</th>
            <th>Qtde. Mínima</th>
            <th class="actions"></th>
        </tr>
        </thead>
        <tbody>
        <g:each var="produto" in="${produtos}">
            <tr>
                <td id="${produto.id}">${produto.nome}</td>
                <td>${produto.preco}</td>
                <td>${produto.estoque.quantidade}</td>
                <td>${produto.estoque.quantidadeMinima}</td>
                <td>
                    <g:remoteLink controller="produto" action="alterar" update="divForm" id="${produto.id}" data-toggle="modal" data-target="#modalTable"><i class="large material-icons">create</i></g:remoteLink>
                    <i class="large material-icons" style="cursor:pointer;  color:#2559a7;" onclick="deleteClick(${produto.id})" >delete</i>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    Não há produtos.
</g:else>
