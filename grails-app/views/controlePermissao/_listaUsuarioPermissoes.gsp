<div class="card card-table fixed-table-toolbar">
    <div class="card-header">${usuario.username}
        <div class="columns columns-right btn-group float-right">
%{--            <button class="btn btn-primary btn-sm active" data-toggle="modal" data-target="#modalUsuario">Adicionar</button>--}%
        </div>
    </div>
    <div class="card-body">
        <table class="table table-striped table-hover" >
            <input id="tableUsuarioPermissoesId" type="hidden" name="teste" value="${usuario.id}" />
            <thead>
            <th colspan="3">Permissão</th>
            </thead>
            <g:each in="${permissoes}" var="permissao">
                <tr>
                    <td>${permissao.authority}</td>
                    <td><a href="javascript: desvincularPermissao(${permissao.id})">Desvincular</a></td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
