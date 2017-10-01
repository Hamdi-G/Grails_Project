<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div id="edit-poi" class="content scaffold-create" role="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <form resource="${this.poi}" method="PUT" class="form-horizontal"
                          novalidate="novalidate">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Modification d'un lieu</h4>
                        </div>

                        <div class="card-content">
                            <g:if test="${flash.message}">
                                <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.poi}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.poi}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                                error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>

                            <fieldset class="form">
                                <g:hiddenField name="version" value="${this.poi?.version}"/>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Nom</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="name" id="name"
                                                   value="${poi.name}"
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
                                                   value="${poi.description}"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Latitude</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="lat" id="lat"
                                                   value="${poi.lat}"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 label-on-left">Longitude</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="lng" id="lng"
                                                   value="${poi.lng}"
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="fieldcontain">
                                        <label class="col-sm-2 label-on-left">Catégorie(s)</label>

                                        <div class="col-sm-7">
                                            <div class="btn-group ">
                                                <select multiple="multiple" name="groups"
                                                        id="groups" class="selectpicker"
                                                        data-style="btn btn-info btn-round" title="Choisir Catégories"
                                                        data-live-search="true">
                                                    <g:each var="group" in="${grails_project.Groupe.all}">
                                                        <g:if test="${poi.groups.any{it.id==group.id}}">
                                                            <option selected
                                                                    value="${group.id}">${group.name}</option>
                                                        </g:if>
                                                        <g:else>
                                                            <option value="${group.id}">${group.name}</option>
                                                        </g:else>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>













                                <g:each var="image" in="${poi.images}">
                                    <asset:image src="${image.name}" width="300" height="300" display="inline-block"
                                                 style="float:left;margin-left: 10px;margin-right: 10px;"/></a>
                                </g:each>
                                <div id="map" style="width:100%;height:400px;background:yellow"></div>
                                <g:javascript>
                function myMap() {

                    var latValue = "${poi.lat}";
                    var lngValue = "${poi.lng}";
                    var mapOptions = {
                        center: new google.maps.LatLng( latValue,lngValue),
                        zoom: 6,
                        mapTypeId: google.maps.MapTypeId.PLAN
                    }
                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                    var marker = new google.maps.Marker({
                        position:mapOptions.center,
                        map:map
                    });
                    google.maps.event.addListener(map, 'click', function(e) {
                        marker.setPosition(e.latLng);
                        document.getElementById("lat").value = marker.getPosition().lat().toString().replace('.',',');
                        document.getElementById("lng").value =marker.getPosition().lng().toString().replace('.',',');
                        //document.getElementById("alt").value = marker.altitude.valueOf();
               // .setAttribute(lat,marker.getPosition().lat())
                    });
                }

                                </g:javascript>

                                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwPaWz9e-O1iqBASHZk_r_weUe3pCZbOM&callback=myMap"></script>







                            </fieldset>


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



























%{--<button class="btn btn-primary btn-round">
    <a href="${createLink(uri: '/')}" style="color: white">
        <i class="material-icons">home</i> Home
    </a>
</button>
<button class="btn btn-primary btn-round">
    <g:link class="create" action="create"><g:message args="[entityName]"/><i class="material-icons"
                                                                              style="color: white">add</i>create</g:link>
</a>
</button>

<button class="btn btn-primary btn-round">
    <g:link class="list" action="index"><g:message args="[entityName]"/><i class="material-icons"
                                                                           style="color: white">list</i> list</g:link>
</a>
</button>

<div id="edit-poi" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.poi}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.poi}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form resource="${this.poi}" method="PUT">
        <g:hiddenField name="version" value="${this.poi?.version}"/>
        <fieldset class="form">
        <f:all bean="poi"/>
        <g:each var="image" in="${poi.images}">
            <asset:image src="${image.name}" width="300" height="300" display="inline-block"
                         style="float:left;margin-left: 10px;margin-right: 10px;"/></a>
        </g:each>
        <div id="map" style="width:100%;height:400px;background:yellow"></div>
        <g:javascript>
                function myMap() {

                    var latValue = "${poi.lat}";
                    var lngValue = "${poi.lng}";
                    var mapOptions = {
                        center: new google.maps.LatLng( latValue,lngValue),
                        zoom: 6,
                        mapTypeId: google.maps.MapTypeId.PLAN
                    }
                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                    var marker = new google.maps.Marker({
                        position:mapOptions.center,
                        map:map
                    });
                    google.maps.event.addListener(map, 'click', function(e) {
                        marker.setPosition(e.latLng);
                        document.getElementById("lat").value = marker.getPosition().lat().toString().replace('.',',');
                        document.getElementById("lng").value =marker.getPosition().lng().toString().replace('.',',');
                        //document.getElementById("alt").value = marker.altitude.valueOf();
               // .setAttribute(lat,marker.getPosition().lat())
                    });
                }

        </g:javascript>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwPaWz9e-O1iqBASHZk_r_weUe3pCZbOM&callback=myMap"></script>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>--}%
</body>
</html>
