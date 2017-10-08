package grails_project

import Grails_Project.Role
import Grails_Project.User
import Grails_Project.UserRole

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    def show(User user) {
        respond user
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = user.username.toString()
            user.image = new Image(name: name+'.'+type)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }

        user.save flush:true
        UserRole.create(user,Role.findById(params.roleId),true);


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def name = file.originalFilename
            if (user.image != null) {
                user.image.delete()
            }
            user.image = new Image(name: name)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }

        def ur = new UserRole(user: user, role: Role.findById(params.roleId))
        UserRole.merge(ur)
        user.save flush:true



        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        UserRole.remove(user, UserRole.findByUser(user).getRole());
        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
