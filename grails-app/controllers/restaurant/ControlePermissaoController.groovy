package restaurant

import comum.Permissao
import comum.Usuario

class ControlePermissaoController {

    def index() {
        def usuarios = Usuario.list()
        def permissoes = Permissao.list()
        render(view: 'index', model: [usuarios: usuarios, permissoes: permissoes])
    }
}
