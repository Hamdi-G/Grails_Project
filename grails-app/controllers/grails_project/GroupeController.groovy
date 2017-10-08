package grails_project

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {

    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model:[groupeCount: Groupe.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def listgroup(){
        render Groupe.list() as JSON
    }

    def show(Groupe groupe) {
        respond groupe
    }

    def create() {
        respond new Groupe(params)
    }

    @Transactional
    def save(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'create'
            return
        }

        def selectedPoisID = params.pois
        if (params.pois != null) {
            (0..selectedPoisID.size()-1).each{
                int i ->
                    def PoiGroup = new PoiGroup(poi: Poi.findById(selectedPoisID[i]), groupe: groupe).save(flush: true)
                    groupe.addToPois(Poi.findById(selectedPoisID[i]));
            }
        }

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            groupe.addToImages(new Image(name: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + name))
        }

        groupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*' { respond groupe, [status: CREATED] }
        }
    }

    def edit(Groupe groupe) {
        respond groupe
    }

    @Transactional
    def update(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'edit'
            return
        }

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            groupe.addToImages(new Image(name: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + name))
        }

        if (PoiGroup.findByGroupe(groupe) != null){
            def list = PoiGroup.findAllByGroupe(groupe)
            list.each {
                it.delete()
            }
        }

        (groupe.pois.size()-1..0).each{
            int i ->
                groupe.removeFromPois(Poi.findById(groupe.pois[i].id))

        }

        def selectedPoisID = params.pois
        if (params.pois != null) {
            (0..selectedPoisID.size()-1).each{
                int i ->
                    def PoiGroup = new PoiGroup(poi: Poi.findById(selectedPoisID[i]), groupe: groupe).save(flush: true)
                    groupe.addToPois(Poi.findById(selectedPoisID[i]));
            }
        }

        groupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*'{ respond groupe, [status: OK] }
        }
    }

    @Transactional
    def delete(Groupe groupe) {

        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (PoiGroup.findByGroupe(groupe) != null){
            def list = PoiGroup.findAllByGroupe(groupe)
            list.each {
                it.delete()
            }
        }

        if (groupe.pois != null){
            (groupe.pois.size()-1..0).each {
                int i ->
                    groupe.removeFromPois(groupe.pois[i])
            }
        }

        groupe.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
