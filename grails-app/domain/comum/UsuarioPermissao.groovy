package comum

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class UsuarioPermissao implements Serializable {

	private static final long serialVersionUID = 1

	Usuario usuario
	Permissao permissao

	@Override
	boolean equals(other) {
		if (other instanceof UsuarioPermissao) {
			other.usuarioId == usuario?.id && other.permissaoId == permissao?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (usuario) {
            hashCode = HashCodeHelper.updateHash(hashCode, usuario.id)
		}
		if (permissao) {
		    hashCode = HashCodeHelper.updateHash(hashCode, permissao.id)
		}
		hashCode
	}

	static UsuarioPermissao get(long usuarioId, long permissaoId) {
		criteriaFor(usuarioId, permissaoId).get()
	}

	static boolean exists(long usuarioId, long permissaoId) {
		criteriaFor(usuarioId, permissaoId).count()
	}

	private static DetachedCriteria criteriaFor(long usuarioId, long permissaoId) {
		UsuarioPermissao.where {
			usuario == Usuario.load(usuarioId) &&
			permissao == Permissao.load(permissaoId)
		}
	}

	static UsuarioPermissao create(Usuario usuario, Permissao permissao, boolean flush = false) {
		def instance = new UsuarioPermissao(usuario: usuario, permissao: permissao)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(Usuario u, Permissao r) {
		if (u != null && r != null) {
			UsuarioPermissao.where { usuario == u && permissao == r }.deleteAll()
		}
	}

	static int removeAll(Usuario u) {
		u == null ? 0 : UsuarioPermissao.where { usuario == u }.deleteAll() as int
	}

	static int removeAll(Permissao r) {
		r == null ? 0 : UsuarioPermissao.where { permissao == r }.deleteAll() as int
	}

	static constraints = {
	    usuario nullable: false
		permissao nullable: false, validator: { Permissao r, UsuarioPermissao ur ->
			if (ur.usuario?.id) {
				if (UsuarioPermissao.exists(ur.usuario.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['usuario', 'permissao']
		version false
		permissao lazy:false
	}
}
