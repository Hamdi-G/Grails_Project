package grails_project

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poiCount: Poi.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def listpoi(){
        render Poi.list() as JSON
    }

    def show(Poi poi) {

        respond poi
    }

    def create() {
        respond new Poi(params)
    }

    @Transactional
    def save(Poi poi) {
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poi.errors, view:'create'
            return
        }

        def selectedGroupsID = params.groups
        if (params.groups != null) {
            (0..selectedGroupsID.size()-1).each{
                int i ->
                    def PoiGroup = new PoiGroup(groupe: Groupe.findById(selectedGroupsID[i]), poi: poi).save(flush: true)
            }
        }

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            poi.addToImages(new Image(name: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + name))
        }

        poi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*' { respond poi, [status: CREATED] }
        }
    }

    def edit(Poi poi) {

        respond poi
    }

    @Transactional
    def update(Poi poi) {
        System.out.print("update---")
        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poi.hasErrors()){
            System.out.print("ok---")
            transactionStatus.setRollbackOnly()
            respond poi.errors, view:'edit'
            return
        }

        if (PoiGroup.findByPoi(poi) != null){
            def list = PoiGroup.findAllByPoi(poi)
            list.each {
                it.delete()
            }
        }

        def selectedGroupsID = params.groups
        if (params.groups != null) {
            (0..selectedGroupsID.size()-1).each{
                int i ->
                    def PoiGroup = new PoiGroup(groupe: Groupe.findById(selectedGroupsID[i]), poi: poi).save(flush: true)
            }
        }

        poi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect poi
            }
            '*'{ respond poi, [status: OK] }
        }
    }

    @Transactional
    def delete(Poi poi) {

        if (poi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (PoiGroup.findByPoi(poi) != null){
            def list = PoiGroup.findAllByPoi(poi)
            list.each {
                it.delete()
            }
        }

        poi.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'Poi'), poi.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'Poi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
