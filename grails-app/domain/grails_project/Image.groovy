package grails_project

class Image {

    String name;

    static belongsTo = [Poi,Groupe]
    static constraints = {
        name blank: false
    }
}
