<g:formRemote id="formPermissao" name="formPermissao" url="[controller: 'controlePermissao', action: 'salvarPermissao']" onSuccess="retornoSalvarPermissao(data)">
    <div class="form-group">
        <input type="text" class="form-control" id="nomeInput" name="permissao" placeholder="Nome"/>
    </div>
    <input type="hidden" name="id" />
    <button id="saveButton" type="submit" name="salvar" class="btn btn-primary" value="Salvar">Salvar</button>
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
%{--    <input type="submit" name="salvar" value="Salvar" />--}%
</g:formRemote>