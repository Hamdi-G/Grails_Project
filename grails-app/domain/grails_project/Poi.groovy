package grails_project

class Poi {

    String name;
    String description;

    static belongsTo = [groupe:Groupe]

    static hasMany = [ images:Image,localisations:Localisation]

    static constraints = {
        name blank: false
        description blank: false

    }
}
