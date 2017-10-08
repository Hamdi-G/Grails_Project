package grails_project

class PoiGroup implements Serializable{

    Poi poi
    Groupe groupe

 /*   static constraints = {
        groupe nullable: false
        poi nullable: false, validator: { Poi p, PoiGroup pg ->
            if (pg.groupe?.id) {
                if (PoiGroup.exists(pg.groupe.id, p.id)) {
                    return ['PoiGroup.exists']
                }
            }
        }
    }

    static mapping = {
        id composite: ['poi', 'groupe']
        version false
    }*/
}
