package grails_project

class Localisation {

    double lat
    double lng
    double alt


    static belongsTo = [poi: Poi]

    static constraints = {
        lat nullable: false
        alt nullable: false
        lng nullable: false
    }
}
