package grails_project

class Poi implements Serializable{

    String name;
    String description;
    double lat
    double lng

    static hasMany = [groups: Groupe, images:Image]

    static constraints = {
        name blank: false
        description blank: false
        lat nullable: false
        lng nullable: false
    }
}