package restaurant

class Estoque {

    Integer quantidade
    Integer quantidadeMinima
    Produto produto

    static constraints = {
    }

    static mapping = {
        produto column: "id_produto"
    }
}
