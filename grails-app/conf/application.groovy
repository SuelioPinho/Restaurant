

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'comum.Usuario'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'comum.UsuarioPermissao'
grails.plugin.springsecurity.authority.className = 'comum.Permissao'

grails.plugin.springsecurity.auth.loginFormUrl = '/areaRestrita/logar'
grails.plugin.springsecurity.logout.afterLogoutUrl = '/areaRestrita/logout'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/areaRestrita/admin'
grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/areaRestrita/erro'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = false
grails.plugin.springsecurity.dao.hideUserNotFoundExceptions = false
grails.plugin.springsecurity.rejectIfNoRule = true
grails.plugin.springsecurity.fii.rejectPublicInvocations = false

grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"

grails.plugin.springsecurity.interceptUrlMap = [
		[pattern: '/produto/**',  access: ['ROLE_ADMIN']],
		[pattern: '/**'           ,  access: ['IS_AUTHENTICATED_ANONYMOUSLY']]
]

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

