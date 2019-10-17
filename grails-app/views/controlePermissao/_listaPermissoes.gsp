<table class="table table-striped table-hover">
    <thead>
    <th colspan="2">Permissão</th>
    <th colspan="2">Ações</th>
    </thead>
    <g:each in="${permissoes}" var="permissao">
        <tr>
            <td>${permissao.authority}</td>
            <td><a href="javascript: vincularPermissao(${permissao.id})">Vincular</a></td>
            <td><a href="javascript: alterarPermissao(${permissao.id})">Alterar</a></td>
            <td><a href="javascript: excluirPermissao(${permissao.id})">Excluir</a></td>
        </tr>
    </g:each>
</table>