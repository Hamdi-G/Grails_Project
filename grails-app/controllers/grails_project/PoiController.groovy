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

        def file = request.getFile('file')
        file.transferTo(new File(grailsApplication.config.server.uploadImage + file.getOriginalFilename()))

        def imgs = params.image1.toString()
        def list = []
        list.addAll(imgs.split())
        list.each {
            def image = new Image(name:it.toString())
            poi.addToImages(image)
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
