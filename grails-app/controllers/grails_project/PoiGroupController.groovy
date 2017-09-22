package grails_project

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PoiGroup.list(params), model:[poiGroupCount: PoiGroup.count()]
    }

    def show(PoiGroup poiGroup) {
        respond poiGroup
    }

    def create() {
        respond new PoiGroup(params)
    }

    @Transactional
    def save(PoiGroup poiGroup) {
        if (poiGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGroup.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGroup.errors, view:'create'
            return
        }

        poiGroup.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poiGroup.label', default: 'PoiGroup'), poiGroup.id])
                redirect poiGroup
            }
            '*' { respond poiGroup, [status: CREATED] }
        }
    }

    def edit(PoiGroup poiGroup) {
        respond poiGroup
    }

    @Transactional
    def update(PoiGroup poiGroup) {
        if (poiGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (poiGroup.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond poiGroup.errors, view:'edit'
            return
        }

        poiGroup.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poiGroup.label', default: 'PoiGroup'), poiGroup.id])
                redirect poiGroup
            }
            '*'{ respond poiGroup, [status: OK] }
        }
    }

    @Transactional
    def delete(PoiGroup poiGroup) {

        if (poiGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        poiGroup.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poiGroup.label', default: 'PoiGroup'), poiGroup.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poiGroup.label', default: 'PoiGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
