<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div id="edit-user" class="content scaffold-edit" role="main">

    <g:hasErrors bean="${this.user}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <g:uploadForm url="[resource: user, action: 'update']" method="POST" class="form-horizontal">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Modification d'utilisateur</h4>
                        </div>

                        <div class="card-content">
                            <g:hiddenField name="version" value="${this.user?.version}"/>
                            <fieldset class="form">

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

                                            <div>
                                                <span class="btn btn-round btn-rose btn-file">
                                                    <span class="fileinput-new">Modifier votre photo</span>
                                                    <span class="fileinput-exists">Changer</span>
                                                    <input type="hidden" value="" name=""><input type="file"
                                                                                                 name="file">

                                                    <div class="ripple-container"></div></span>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Idantifiant</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="username" id="username"
                                                   value="${user.username}"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Mot de passe</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="password" id="password"
                                                   value="${user.password}"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Rôle</label>

                                    <div class="col-sm-7">
                                        <div class="btn-group ">
                                            <select name="roleId" required
                                                    id="roleId" class="selectpicker"
                                                    data-style="btn btn-info btn-round" title="Choisir un rôle">
                                                <g:each var="role" in="${Grails_Project.Role.all}">
                                                    <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().id == role.id}">
                                                        <option selected
                                                                value="${role.id}">${role.authority.substring(5).toLowerCase()}</option>
                                                    </g:if>
                                                    <g:else>
                                                        <option value="${role.id}">${role.authority.substring(5).toLowerCase()}</option>
                                                    </g:else>
                                                </g:each>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="passwordExpired" id="passwordExpired">Password Expired
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="accountLocked" id="accountLocked">Account Locked
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="accountExpired" id="accountExpired">Account Expired
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="enabled" checked="checked" id="enabled">Enabled
                                    </label>
                                </div>

                            </fieldset>
                        </div>

                        <div class="card-footer text-center">
                            <fieldset class="buttons">
                                <button type="submit" class="btn btn-rose btn-fill">Mettre à jour</button>
                            </fieldset>
                        </div>
                    </g:uploadForm>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
