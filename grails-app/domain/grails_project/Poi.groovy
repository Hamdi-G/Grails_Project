package grails_project

class Poi {

    String name;
    String description;
    double lat
    double lng


    static belongsTo = [groupe:Groupe]

    static hasMany = [ images:Image]

    static constraints = {
        name blank: false
        description blank: false
        lat nullable: false
        lng nullable: false
    }
}