

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'Grails_Project.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'Grails_Project.UserRole'
grails.plugin.springsecurity.authority.className = 'Grails_Project.Role'
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
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/access/**',      access: ['ROLE_ADMIN']],
	[pattern: '/user/edit/**',   access: ['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/user/**',        access: ['ROLE_ADMIN']],
	[pattern: '/role/**',        access: ['ROLE_ADMIN']],
	[pattern: '/userRole/**',    access: ['ROLE_ADMIN']],
	[pattern: '/groupe/index/**', access: ['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/groupe/**',       access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/poiGroup/index/**',access: ['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/poiGroup/**',    access: ['ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/image/**',       access: ['ROLE_ADMIN']],
	[pattern: '/localisation/**',access: ['ROLE_ADMIN']],
	[pattern: '/poi/index/**',   access: ['ROLE_USER','ROLE_ADMIN','ROLE_MODERATOR']],
	[pattern: '/poi/**',         access: ['ROLE_ADMIN','ROLE_MODERATOR']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

