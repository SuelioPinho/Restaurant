package restaurant

class Estoque {

    Integer quantidade
    Integer quantidadeMinima

    static belongsTo = [produto: Produto]

    static constraints = {
        quantidade min: 0
        quantidadeMinima min: 0
        produto nullable: true
    }

    static mapping = {
        produto column: "id_produto"
    }
}
