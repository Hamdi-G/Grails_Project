package grails_project

class Groupe {

    String name;
    String description;


    static belongsTo = Poi
    static hasMany = [pois: Poi, images:Image]

    static constraints = {
        name blank: false
        description blank: false
        images nullable: true
    }
}
