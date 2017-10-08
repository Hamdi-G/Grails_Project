package grails_project

import Grails_Project.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Grails_Project.Role(authority: 'ROLE_ADMIN').save(Flush: true, failOnError: true);
        def moderatorRole = new Grails_Project.Role(authority: 'ROLE_MODERATOR').save(Flush: true, failOnError: true);
        def userRole = new Grails_Project.Role(authority: 'ROLE_USER').save(Flush: true, failOnError: true);


        def adminUser = new Grails_Project.User(username: 'admin', password: 'password', image: new Image(name: 'avatar1.jpg')).save()
        def moderatorUser = new Grails_Project.User(username: 'moderator', password: 'password', image: new Image(name: 'avatar2.jpg')).save()
        def userUser = new Grails_Project.User(username: 'user', password: 'password', image: new Image(name: 'avatar3.jpg')).save()

        UserRole.create(adminUser, adminRole, true);
        UserRole.create(userUser, userRole, true);
        UserRole.create(moderatorUser, moderatorRole, true);

        def image1_G1 = new Image(name: 'musee.jpg').save(flush: true)
        def image1_G2 = new Image(name: 'chateau.jpg').save(flush: true)
        def image1_G3 = new Image(name: 'resto.jpg').save(flush: true)
        def image2_G3 = new Image(name: 'restoo.jpg').save(flush: true)
        def image_P11 = new Image(name: 'matisse1.jpg').save(flush: true)
        def image_P12 = new Image(name: 'matisse2.jpg').save(flush: true)
        def image_P13 = new Image(name: 'matisse3.jpg').save(flush: true)
        def image_P21 = new Image(name: 'moderne1.jpg').save(flush: true)
        def image_P22 = new Image(name: 'moderne2.jpg').save(flush: true)
        def image_P31 = new Image(name: 'napoule1.jpg').save(flush: true)
        def image_P32 = new Image(name: 'napoule2.jpg').save(flush: true)
        def image_P4 = new Image(name: 'vence1.jpg').save(flush: true)
        def image_P5 = new Image(name: 'mirabelle.jpg').save(flush: true)

        def group_1 = new Groupe(name: 'Musées', description: 'Un musée est une institution permanente sans but lucratif' +
                ' au service de la société et de son d')
        def group_2 = new Groupe(name: 'Châteaux', description: 'Un château est à l\'origine une construction médiévale d' +
                'estinée à protéger le seigneur et à symboliser son autorité au sein du fief.')
        def group_3 = new Groupe(name: 'restaurants', description: 'Un restaurant est un établissement où l\'on sert des' +
                ' plats préparés et des boissons à consommer sur place, en échange d\'un paiement. La nourriture y est ')


        def poi_1 = new Poi(name: 'Musée Matisse', description: 'Le musée Matisse de Nice est consacré à l\'œuvre du pei' +
                'ntre français Henri Matisse. ', lat: 43.7158, lng: 7.3034).addToGroups(group_1)
        poi_1.addToImages(image_P11).save(flush: true)
        poi_1.addToImages(image_P12).save(flush: true)
        poi_1.addToImages(image_P13).save(flush: true)

        def poi_2 = new Poi(name: 'Musée d\'art moderne et d\'art contemporain', description: 'Situé à côté de la place ' +
                'Garibaldi, conçu par les architectes Yves Bayard et Henri Vidal,',
                lat: 43.6978, lng: 7.3059).addToGroups(group_1)
        poi_2.addToImages(image_P21).save(flush: true)
        poi_2.addToImages(image_P22).save(flush: true)

        def poi_3 = new Poi(name: 'Château de la Napoule', description: 'Le château de La Napoule est un château situé ' +
                'en France sur la commune de Mandelieu-la-Napoule, dans le département des Alpes-Maritimes en région P' +
                'rovence-Alpes-Côte d\'Azur.', lat: 43.5197, lng: 6.9705).addToGroups(group_2)
        poi_3.addToImages(image_P31).save(flush: true)
        poi_3.addToImages(image_P32).save(flush: true)

        def poi_4 = new Poi(name: 'Donjon de Saint-Paul-de-Vence', description: 'Le donjon de Saint-Paul-de-Vence ou to' +
                'ur de la Mairie, est ce qui subsiste de l\'ancien château situé sur la commune de Saint-Paul-de-Vence ' +
                'dans le département des Alpes-Maritimes.', lat: 43.6933, lng: 7.1497).addToGroups(group_2)
        poi_4.addToImages(image_P4).save(flush: true)
        def poi_5 = new Poi(name: 'Mirabelle', description: 'Mirabelle, La Gaude. 600 J\'aime. Situé à La Gaude, notre r' +
                'estaurant est paisiblement blotti aux pieds des vieux villages pittoresques de l\'arr' +
                'ière-pays', lat: 43.731074, lng: 7.162982).addToGroups(group_3)
        poi_5.addToImages(image_P5).save(flush: true).save(flush: true)

        group_1.addToImages(image1_G1).save(flush: true)
        group_2.addToImages(image1_G2).save(flush: true)
        group_3.addToImages(image1_G3).save(flush: true)
        group_3.addToImages(image2_G3).save(flush: true)
    }
    def destroy = {
    }
}
