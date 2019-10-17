package restaurant

import comum.Permissao
import comum.Usuario
import grails.converters.JSON
import comum.UsuarioPermissao

import javax.transaction.Transactional;

class ControlePermissaoController {

    def index() {
        render(view:"index")
    }

    def getUsuario(){
        Usuario usuario = Usuario.get(params.id)
//        def retorno = [:]
//        retorno["usuario"] = usuario
//        retorno["permissoes"] = usuario.getAuthorities()
//        render retorno as JSON
        render(template: "listaUsuarioPermissoes", model:[usuario: usuario, permissoes: usuario.getAuthorities()])
    }

    def getPermissao(){
        Permissao permissao = Permissao.get(params.id)
        render permissao as JSON
    }

    def listarPermissao(){
        def listaPermissoes = Permissao.list()
        render(template: "listaPermissoes", model: [permissoes: listaPermissoes])
    }

    def salvarPermissao(){
        def retorno = [:]
        Permissao permissao
        if (params.id){
            permissao = Permissao.get(params.id)
        }else{
            permissao=new Permissao()
        }
        permissao.authority = params.permissao
        permissao.validate()
        if (!permissao.hasErrors()){
            Permissao.withTransaction {
                permissao.save(flush:true)
            }

            retorno["mensagem"]="OK"
        }else{
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }

    def excluirUsuario(){
        def retorno=[:]
        Usuario usuario=Usuario.get(params.id)
        try{
            Usuario.withTransaction {
                usuario.delete(flush:true)
            }

            retorno["mensagem"]="OK"
        }catch(Exception ex){
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }

    def excluirPermissao(){
        def retorno=[:]
        Permissao permissao=Permissao.get(params.id)
        try{
            Permissao.withTransaction {
                permissao.delete(flush: true)
            }
            retorno["mensagem"]="OK"
        }catch(Exception ex){
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }

    def listarUsuario(){
        def listaUsuarios = Usuario.createCriteria().list{
            order("username")
        }
        render(template: "listaUsuarios", model:[usuarios: listaUsuarios])
    }

    def salvarUsuario(){
        def retorno = [:]

        Usuario usuario
        if (params.id){
            usuario = Usuario.get(params.id)
        }else{
            usuario = new Usuario()
            usuario.enabled = true
            usuario.passwordExpired = false
            usuario.accountExpired = false
            usuario.accountLocked = false
            usuario.password = "1234"
        }
        usuario.username = params.login
        usuario.validate()
        if (!usuario.hasErrors()){
            Usuario.withTransaction {
                usuario.save(flush:true)
            }
            retorno["mensagem"]="OK"
        }else{
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }

    def vincularPermissao(){
        def retorno = [:]
        Usuario usuario = Usuario.get(params.idUsuario)
        Permissao permissao = Permissao.get(params.idPermissao)

        try{
            UsuarioPermissao.withTransaction {
                UsuarioPermissao.create(usuario,permissao,true)
            }
            retorno["mensagem"]="OK"
        }catch(Exception ex){
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }

    def desvincularPermissao(){
        def retorno = [:]
        Usuario usuario = Usuario.get(params.idUsuario)
        Permissao permissao = Permissao.get(params.idPermissao)

        try{
            UsuarioPermissao.withTransaction {
                if (UsuarioPermissao.remove(usuario, permissao)) {
                    retorno["mensagem"] = "OK"
                } else {
                    retorno["mensagem"] = "ERRO"
                }
            }
        }catch(Exception ex){
            retorno["mensagem"]="ERRO"
        }
        render retorno as JSON
    }
}
