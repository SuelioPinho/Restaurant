<table>
    <tr>
        <th>Nome</th>
        <th>Preço</th>
        <th>Qtde. Atual</th>
        <th>Qtde. Mínima</th>
        <th>Ações</th>
    </tr>
    <g:each var="produto" in="${produtos}">
        <tr>
            <td>${produto.nome}</td>
            <td>${produto.preco}</td>
            <td>${produto.estoque.quantidade}</td>
            <td>${produto.estoque.quantidadeMinima}</td>
            <td>
                <a href="#">Alterar</a>&nbsp;
                <a href="#">Exluir</a>
            </td>
        </tr>
    </g:each>

</table>