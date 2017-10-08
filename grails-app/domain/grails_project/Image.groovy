package grails_project

import Grails_Project.User

class Image {

    String name;

    static belongsTo = [Poi, Groupe, User]
    static constraints = {
        name blank: false
    }
}
