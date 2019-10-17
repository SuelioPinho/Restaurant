<table class="table table-striped table-hover" id="tableUsuario">
    <thead>
    <th colspan="3">Nome do usuário</th>
    </thead>
    <g:each in="${usuarios}" var="usuario">
        <tr>
            <td>${usuario.username}</td>
            <td><a href="javascript: alterarPermissaoUsuario(${usuario.id})">Permissões</a></td>
            <td><a href="javascript: alterarUsuario(${usuario.id})">Alterar</a></td>
            <td><a href="javascript: excluirUsuario(${usuario.id})">Excluir</a></td>
        </tr>
    </g:each>
</table>