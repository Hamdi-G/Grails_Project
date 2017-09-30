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
                    <g:form resource="${this.user}" method="PUT" class="form-horizontal" novalidate="novalidate">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Modification d'utilisateur</h4>
                        </div>

                        <div class="card-content">
                            <g:hiddenField name="version" value="${this.user?.version}"/>
                            <fieldset class="form">

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Mot de passe</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="password" id="password" value="${user.password}"
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
                                            <input class="form-control" type="text" name="username" id="username" value="${user.username}"
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
                        </div>

                        <div class="card-footer text-center">
                            <fieldset class="buttons">
                                <button type="submit" class="btn btn-rose btn-fill">Mettre à jour</button>
                            </fieldset>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
