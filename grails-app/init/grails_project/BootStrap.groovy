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

        def group_1 = new Groupe(name: 'group1', description: 'descGroup1')
        def group_2 = new Groupe(name: 'group2', description: 'descGroup2')
        def group_3 = new Groupe(name: 'group3', description: 'descGroup3')


        def poi_1 = new Poi(name: 'poiName1', description: 'poiDesc1', lat: 43.729497, lng:7.146764).addToGroups(group_1)
        poi_1.addToImages(image_P1).save(flush:true)
        def poi_2 = new Poi(name: 'poiName2', description: 'poiDesc2', lat: 40.72949, lng:8.14676).addToGroups(group_1)
        poi_2.addToImages(image_P2).save(flush:true)

        def poi_3 = new Poi(name: 'poiName3', description: 'poiDesc3', lat: 46.729497, lng:9.146764).addToGroups(group_2)
        poi_3.addToImages(image_P3).save(flush:true)
        def poi_4 = new Poi(name: 'poiName4', description: 'poiDesc4', lat: 50.72949, lng:10.14676).addToGroups(group_2)
        poi_4.addToImages(image_P4).save(flush:true)
        def poi_5 = new Poi(name: 'poiName5', description: 'poiDesc5', lat: 53.729497, lng:12.146764).addToGroups(group_3)
        poi_5.addToImages(image_P5).save(flush:true).save(flush:true)

        group_1.addToImages(image1_G1).save(flush:true)
        group_2.addToImages(image1_G2).save(flush:true)
        group_3.addToImages(image1_G3).save(flush:true)
    }
    def destroy = {
    }
}
