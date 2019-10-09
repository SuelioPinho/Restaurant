package restaurant

class Cliente {

    String nome
    String email
    String senha

    static hasMany = [pedidos:Pedido, produtosPreferidos:Produto]

    static constraints = {
    }

    static mapping = {
        produtosPreferidos joinTable: [name: "preferencias_clientes", key: "id_cliente", column: "id_produto"]
    }
}
