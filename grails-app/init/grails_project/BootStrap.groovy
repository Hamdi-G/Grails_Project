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

        def image1_G1 = new Image(name: 'image1_G1.png').save(flush:true)
        def image2_G1 = new Image(name: 'image2_G1.png').save(flush:true)
        def image1_G2 = new Image(name: 'image1_G2.png').save(flush:true)
        def image1_G3 = new Image(name: 'image1_G3.png').save(flush:true)
        def image_P1 = new Image(name: 'image_P1.png').save(flush:true)
        def image_P2 = new Image(name: 'image_P2.png').save(flush:true)
        def image_P3 = new Image(name: 'image_P3.png').save(flush:true)
        def image_P4 = new Image(name: 'image_P4.png').save(flush:true)
        def image_P5 = new Image(name: 'image_P5.png').save(flush:true)

        def group_1 = new Groupe(name: 'group1', description: 'descGroup1').save(flush:true)
        group_1.addToImages(image1_G1).save(flush:true)
        group_1.addToImages(image2_G1).save(flush:true)
        group_1.save(flush:true)
        def poi_1 = new Poi(name: 'poiName1', description: 'poiDesc1', alt: 1.0, lat: 2.0, lng:3.0 ,groupe: group_1).save()
        poi_1.addToImages(image_P1).save()
        def poiG_1 = new PoiGroup(poi: poi_1, groupe: group_1).save(flush:true)

        def group_2 = new Groupe(name: 'group2', description: 'descGroup2').save(flush:true)
        group_2.addToImages(image1_G2).save()
        def poi_2 = new Poi(name: 'poiName2', description: 'poiDesc2',alt: 1.1, lat: 2.1, lng:3.1, groupe: group_2).save()
        poi_2.addToImages(image_P2).save()
        def poiG_2 = new PoiGroup(poi: poi_2, groupe: group_2).save(flush:true)

        def poi_3 = new Poi(name: 'poiName3', description: 'poiDesc3',alt: 1.2, lat: 2.2, lng:3.2, groupe: group_2).save()
        poi_3.addToImages(image_P3).save()
        def poiG_3 = new PoiGroup(poi: poi_3, groupe: group_2).save(flush:true)

        def group_3 = new Groupe(name: 'group3', description: 'descGroup3').save(flush:true)
        group_3.addToImages(image1_G3).save()
        def poi_4 = new Poi(name: 'poiName4', description: 'poiDesc4',alt: 1.3, lat: 2.3, lng:3.3, groupe: group_3).save()
        poi_4.addToImages(image_P4).save()
        def poiG_4 = new PoiGroup(poi: poi_4,groupe: group_3).save()


        def poi_5 = new Poi(name: 'poiName5', description: 'poiDesc5',alt: 1.4, lat: 2.4, lng:3.4, groupe: group_3).save()
        poi_5.addToImages(image_P5).save()
        def poiG_5 = new PoiGroup(poi: poi_5,groupe: group_3).save()

    }
    def destroy = {
    }
}
