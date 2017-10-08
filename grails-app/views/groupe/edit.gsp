<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div id="edit-groupe" class="content scaffold-create" role="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form action="/groupe/update/${this.groupe.id}" method="post" enctype="multipart/form-data"><input
                            type="hidden" name="_method" value="PUT" id="_method"/>
                        <input type="hidden" name="version" value="1" id="version"/>

                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Modification d'une catégorie</h4>
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
                                <g:hiddenField name="version" value="${this.groupe?.version}"/>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Nom</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="name" id="name"
                                                   value="${groupe.name}"
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
                                                   value="${groupe.description}"
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
                                                        <g:if test="${groupe.pois.any { it.id == poi.id }}">
                                                            <option selected
                                                                    value="${poi.id}">${poi.name}</option>
                                                        </g:if>
                                                        <g:else>
                                                            <option value="${poi.id}">${poi.name}</option>
                                                        </g:else>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </fieldset>

                            <div class="row">
                                <br>

                                <div class="container" style=" width: 100%">
                                    <input type="file" name="files" accept="image/*" multiple>
                                </div>

                            </div>

                            <div class="card-footer text-center">
                                <fieldset class="buttons">
                                    <button type="submit" class="btn btn-rose btn-fill save">Mise à jour</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {
        $('input[type="file"]').imageuploadify();
    })
</g:javascript>
</body>
</html>
