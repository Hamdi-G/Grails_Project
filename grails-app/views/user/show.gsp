<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<button class="btn btn-primary btn-round" style="float: right">
    <a href="${createLink(uri: '/')}" style="color: white">
        <i class="material-icons">home</i> Home
    </a>
</button>
<button class="btn btn-primary btn-round" style="float: right">
    <g:link class="create" action="create"><g:message args="[entityName]"/><i class="material-icons"
                                                                              style="color: white">add</i></g:link>
</a>
</button>

<button class="btn btn-primary btn-round" style="float: right">
    <g:link class="list" action="index"><g:message args="[entityName]"/><i class="material-icons"
                                                                           style="color: white">list</i></g:link>
</a>
</button>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-text" data-background-color="rose">
                    <h4 class="card-title">Votre Profil</h4>
                </div>

                <div class="card-content">
                    <input type="hidden" name="version" value="0" id="version">
                    <fieldset class="form">
                        <br>

                        <div class="row ">
                            <div class=" text-center">
                                <div class="fileinput text-center fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail img-circle">
                                        <g:if test="${user.image != null}">
                                        <img src="${grailsApplication.config.server.pathServer}/images/${user.image.name}"/>
                                        </g:if>
                                        <g:else>
                                            <asset:image src="placeholder.jpg"/>
                                        </g:else>
                                    </div>

                                    <div class="fileinput-preview fileinput-exists thumbnail img-circle"
                                         style=""></div>

                                </div>
                            </div>
                        </div>
                        <br><br>

                        <div class="row">
                            <label class="col-sm-2 label-on-left">Idantifiant</label>

                            <label class="col-sm-2 label-on-left">${user.username}</label>
                        </div>
                        <br>

                        <div class="row">
                            <label class="col-sm-2 label-on-left">Mot de passe</label>

                            <label class="col-sm-2 label-on-left">${user.password}</label>
                        </div>
                        <br>

                        <div class="row">
                            <label class="col-sm-2 label-on-left">Rôle</label>

                            <div class="col-sm-7">
                                <span class="tag label label-rose">${Grails_Project.UserRole.findByUser(user).role.authority}</span>
                            </div>
                        </div>

                    </fieldset>

                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">

                        <div class="card-footer text-center">
                            <g:form resource="${user}" method="DELETE">
                                <fieldset class="buttons">

                                    <g:link class="edit" action="edit"
                                            resource="${user}"><div
                                            class="btn btn-success btn-fill">Modifier</div></g:link>
                                    <input class="delete btn btn-danger btn-fill" type="submit"
                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                                </fieldset>
                            </g:form>
                        </div>
                    </sec:ifAnyGranted>
                </div>

            </div>
        </div>
    </div>
</div>






%{--}

        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div>${user.username}</div>
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>--}%
</body>
</html>
