package grails_project

class Groupe {

    String name;
    String description;

    static hasMany = [ images:Image]

    static constraints = {
        name blank: false
        description blank: false
        images nullable: true
    }
}
