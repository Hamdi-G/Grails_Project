package grails_project

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/groupe/show"(view:"/groupe/show")
        "/poi/showOnMap"(view:"/poi/showOnMAp")
    }
}
