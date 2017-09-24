package grails_project

class Poi {

    String name;
    String description;
    double lat
    double lng
    double alt

    static belongsTo = [groupe:Groupe]

    static hasMany = [ images:Image]

    static constraints = {
        name blank: false
        description blank: false
        lat nullable: false
        alt nullable: false
        lng nullable: false
    }
}