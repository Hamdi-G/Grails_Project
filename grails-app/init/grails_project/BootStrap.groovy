package grails_project

import Grails_Project.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Grails_Project.Role(authority: 'ROLE_ADMIN').save(Flush:true,failOnError:true);
        def moderatorRole = new Grails_Project.Role(authority : 'ROLE_MODERATOR').save(Flush:true,failOnError:true);
        def userRole = new Grails_Project.Role(authority : 'ROLE_USER').save(Flush:true,failOnError:true);


        def adminUser = new Grails_Project.User(username: 'admin',password: 'password').save()
        def moderatorUser = new Grails_Project.User(username: 'moderator',password: 'password').save()
        def userUser = new Grails_Project.User(username: 'user',password: 'password').save()

        UserRole.create(adminUser,adminRole,true);
        UserRole.create(userUser,userRole,true);
        UserRole.create(moderatorUser,moderatorRole,true);

        def image_1 = new Image(name: 'image1').save(flush:true)
        def image_2 = new Image(name: 'image2').save(flush:true)
        def image_3 = new Image(name: 'image3').save(flush:true)

        def group_1 = new Groupe(name: 'group1', description: 'descGroup1').save(flush:true)
        group_1.addToImages(image_1).save(flush:true)
        group_1.addToImages(image_2).save(flush:true)
        group_1.save(flush:true)
        def poi_1 = new Poi(name: 'poiName1', description: 'poiDesc1',groupe: group_1).save()
        def poiG_1 = new PoiGroup(poi: poi_1, groupe: group_1).save(flush:true)

        def loc_1 = new Localisation(alt: 1.0, lat: 2.0, lng:3.0, poi: poi_1).save(flush:true)
        poi_1.addToLocalisations(loc_1).save(flush:true)

        def loc_4 = new Localisation(alt: 1.3, lat: 2.3, lng:3.3, poi: poi_1).save(flush:true)
        poi_1.addToLocalisations(loc_4).save(flush:true)


        def group_2 = new Groupe(name: 'group2', description: 'descGroup2').save(flush:true)
        group_2.addToImages(image_3).save()
        def poi_2 = new Poi(name: 'poiName2', description: 'poiDesc2',groupe: group_2).save()
        def poiG_2 = new PoiGroup(poi: poi_2, groupe: group_2).save(flush:true)

        def loc_2 = new Localisation(alt: 1.1, lat: 2.1, lng:3.1, poi: poi_2).save(flush:true)
        poi_2.addToLocalisations(loc_2).save(flush:true)

        def poi_3 = new Poi(name: 'poiName3', description: 'poiDesc3',groupe: group_2).save()
        def poiG_3 = new PoiGroup(poi: poi_3, groupe: group_2).save(flush:true)
        def loc_3 = new Localisation(alt: 1.2, lat: 2.2, lng:3.2, poi: poi_3).save(flush:true)
        poi_3.addToLocalisations(loc_3).save(flush:true)

    }
    def destroy = {
    }
}
