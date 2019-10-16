package restaurant

import comum.Permissao
import comum.Usuario
import comum.UsuarioPermissao
import org.springframework.security.crypto.factory.PasswordEncoderFactories
import org.springframework.security.crypto.password.PasswordEncoder

class BootStrap {

    def init = { servletContext ->

        Permissao admin = Permissao.findByAuthority('ROLE_ADMIN')
        if (admin == null) {
            Permissao.withTransaction {
                admin = new Permissao(authority: "ROLE_ADMIN").save(flush: true)
            }
        }

        Permissao balcao = Permissao.findByAuthority('ROLE_BALCAO')
        if (balcao == null) {
            Permissao.withTransaction {
                balcao = new Permissao(authority: "ROLE_BALCAO").save(flush: true)
            }
        }

        PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
        Usuario administrador = Usuario.findByUsername('administrador')
        if (administrador == null) {
            Usuario.withTransaction {
                administrador = new Usuario(username: 'administrador', password: encoder.encode('123'), enabled: true, accountExpired: false,
                        accountLocked: false, passwordExpired: false).save(flush: true)
            }
        }

        Usuario balconista = Usuario.findByUsername('balconista')
        if (balconista == null) {
            Usuario.withTransaction {
                balconista = new Usuario(username: 'balconista', password: encoder.encode('123'), enabled: true, accountExpired: false,
                        accountLocked: false, passwordExpired: false).save(flush: true)
            }
        }

        if (UsuarioPermissao.findByUsuarioAndPermissao(administrador, admin) == null) {
            UsuarioPermissao.withTransaction {
                new UsuarioPermissao(usuario: administrador, permissao: admin).save(flush: true)
            }
        }

        if (UsuarioPermissao.findByUsuarioAndPermissao(balconista, balcao) == null) {
            UsuarioPermissao.withTransaction {
                new UsuarioPermissao(usuario: balconista, permissao: balcao).save(flush: true)
            }
        }
    }
    def destroy = {
    }
}
