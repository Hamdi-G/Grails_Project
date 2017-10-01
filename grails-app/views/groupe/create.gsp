<%@ page import="grails_project.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div id="create-groupe" class="content scaffold-create" role="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form action="/groupe/save" method="post" id="TypeValidation" class="form-horizontal"
                          novalidate="novalidate">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Création d'un lieu</h4>
                        </div>

                        <div class="card-content">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.groupe}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.groupe}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                                error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <fieldset class="form">

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Nom</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="name" id="name"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>


                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Description</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="description" id="description"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="fieldcontain">
                                        <label class="col-sm-2 label-on-left">Lieu(x)</label>

                                        <div class="col-sm-7">
                                            <div class="btn-group ">
                                                <select multiple="multiple" name="pois"
                                                        id="pois" class="selectpicker"
                                                        data-style="btn btn-info btn-round" title="Choisir Lieu(x)"
                                                        data-live-search="true">
                                                    <g:each var="poi" in="${grails_project.Poi.all}">
                                                        <option value="${poi.id}">${poi.name}</option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail">
                                            <img src="../../assets/img/image_placeholder.jpg" alt="...">
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                        <div>
                                            <span class="btn btn-rose btn-round btn-file">
                                                <span class="fileinput-new">Select image</span>
                                                <span class="fileinput-exists">Change</span>
                                                <input type="file" name="${Image.name}">
                                            </span>
                                            <a href="#pablo" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                        </div>
                                    </div>
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












<a href="#create-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-groupe" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.groupe}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.groupe}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.groupe}" method="POST">
        <fieldset class="form">
            <f:all bean="groupe"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
