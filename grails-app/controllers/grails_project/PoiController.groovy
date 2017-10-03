package grails_project

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poiCount: Poi.count()]
    }

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

        //poi = new Poi(params)
        //if(params.fileupload != "") {
          /*  def myList = []
        System.out.print(params)
            myList.add(params.images)
            System.out.print(myList)*/
            def imgs = params.image1.toString()
            def list = []
            list.addAll(imgs.split())
            list.each {
                def image = new Image(name:it.toString())
                poi.addToImages(image)
            }

//            params.fileupload.transferTo(new java.io.File(grailsApplication.config.updateFolder + params.image))
        //}
        //poi.addToImages(image)
        //params.fileUpload.transferTo(new java.io.File("C:/xampp/htdocs/img/"+params.image))
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
