<g:formRemote name="formProduto" url="[controller: 'produto', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">
    <div class="form-group">
        <label for="nomeInput">Nome</label>
        <input type="text" class="form-control" id="nomeInput" name="nome" value="${produto.nome}"/>
    </div>
    <div class="form-group">
        <label for="precoInput">Preço</label>
        <input type="text" class="form-control" id="precoInput" name="preco" value="${produto.preco}"/>
    </div>
    <div class="form-group">
        <label for="qtdAtualInput">Qtde. atual</label>
        <input type="text" class="form-control" id="qtdAtualInput" name="quantidade" value="${produto.estoque?.quantidade}"/>
    </div>
    <div class="form-group">
        <label for="qtdMinimalInput">Qtde. mínima</label>
        <input type="text" class="form-control" id="qtdMinimalInput" name="quantidadeMinima" value="${produto.estoque?.quantidadeMinima}"/>
    </div>
    <button id="saveButton" type="submit" name="btnSalvar" class="btn btn-primary" value="Salvar">Salvar</button>
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
    <input type="hidden" name="id" value="${produto.id}">
</g:formRemote>