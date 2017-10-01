<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="create-user" class="content scaffold-create" role="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form action="/user/save" method="post" id="TypeValidation" class="form-horizontal"
                          novalidate="novalidate">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Création d'un utilisateur</h4>
                        </div>

                        <div class="card-content">

                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.user}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.user}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                                error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>

                            <fieldset class="form">

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Mot de passe</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="password" id="password"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>


                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Idantifiant</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="username" id="username"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="passwordExpired" id="passwordExpired"
                                               required="true"
                                               aria-required="true">Password Expired
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="accountLocked" id="accountLocked" required="true"
                                               aria-required="true">Account Locked
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="accountExpired" id="accountExpired" required="true"
                                               aria-required="true">Account Expired
                                    </label>
                                </div>

                                <div class="checkbox fieldcontain col-md-offset-2">
                                    <label>
                                        <input type="checkbox" name="enabled" checked="checked" id="enabled"
                                               required="true"
                                               aria-required="true">Enabled
                                    </label>
                                </div>

                            </fieldset>


                            <div class="card-footer text-center">
                                <fieldset class="buttons">
                                    <button type="submit" class="btn btn-rose btn-fill">Créer</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
