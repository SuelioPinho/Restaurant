<g:formRemote id="formUsuario" name="formUsuario" url="[controller: 'controlePermissao', action: 'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
    <div class="form-group">
        <input type="text" class="form-control" id="nomeInput" name="login" placeholder="Nome"/>
    </div>
    <input type="hidden" name="id" />
    <button id="saveButton" type="submit" name="salvar" class="btn btn-primary" value="Salvar">Salvar</button>
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
</g:formRemote>