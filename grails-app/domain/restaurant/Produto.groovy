package restaurant

class Produto {

    String nome
    Double preco
    Estoque estoque

    static hasMany = [clientes:Cliente]

    static belongsTo = [Cliente]

    static constraints = {

    }

    static mapping = {
        estoque column: "id_estoque"
        clientes joinTable: [name: "preferencias_clientes", key: "id_produto", column: "id_cliente"]
    }
}
