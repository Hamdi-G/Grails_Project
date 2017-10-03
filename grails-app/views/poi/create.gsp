<%@ page import="grails_project.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:javascript src="uploadr.demo.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <asset:stylesheet href="uploadr.demo.manifest.css"/>
</head>

<body>
<button class="btn btn-primary btn-round">
    <a href="${createLink(uri: '/')}" style="color: white">
        <i class="material-icons">home</i> Home
    </a>
</button>

<button class="btn btn-primary btn-round">
    <g:link class="list" action="index"><g:message args="[entityName]"/><i class="material-icons"
                                                                           style="color: white">list</i> list</g:link>
</a>
</button>
<div id="create-poi" class="content scaffold-create" role="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <form action="/poi/save" method="post" id="TypeValidation" class="form-horizontal"
                          novalidate="novalidate">
                        <div class="card-header card-header-text" data-background-color="rose">
                            <h4 class="card-title">Création d'un lieu</h4>
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
                                    <label class="col-sm-2 label-on-left">Latitude</label>

                                    <div class="col-sm-7">
                                        <div class="form-group label-floating is-empty fieldcontain required">
                                            <label class="control-label"></label>
                                            <input class="form-control" type="text" name="lat" id="lat"
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
                                                   required="true"
                                                   aria-required="true">
                                            <span class="material-input"></span></div>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="fieldcontain">
                                        <label class="col-sm-2 label-on-left">Catégorie(s) </label>

                                        <div class="col-sm-7">
                                            <div class="btn-group ">
                                                <select multiple="multiple" name="groups"
                                                        id="groups" class="selectpicker"
                                                        data-style="btn btn-info btn-round" title="Choisir Catégories"
                                                        data-live-search="true">
                                                    <g:each var="group" in="${grails_project.Groupe.all}">
                                                        <option value="${group.id}">${group.name}</option>
                                                    </g:each>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div id="dragandrophandler">Drag & Drop Files Here</div>
                                <br><br>
                                <div id="status1" style="width: 460px"></div>

                                %{--   <div class="row">
                                       <div class="fieldcontain">
                                           <label class="col-sm-2 label-on-left">Catégorie(s) </label>

                                           <div class="col-sm-7">
                                               <div class="btn-group ">
                                                   <select multiple="multiple" name="imagess"
                                                           id="imagess" class="selectpicker"
                                                           data-style="btn btn-info btn-round" title="Choisir Catégories"
                                                           data-live-search="true">
                                                       <g:set var="images" id="images" />
                                                       <g:each var="image" in="${images}">
                                                           <option value="${image}">${image}</option>
                                                       </g:each>
                                                   </select>
                                               </div>
                                           </div>
                                       </div>
                                   </div>--}%





                                <!--div class="col s12 m12 l12">
                                            <label>Images</label>
                                            <div class="file-field input-field">
                                                <div class="btn">
                                                    <span>Image</span>
                                                    <input id="fileupload" type="file" name="fileupload">
                                                </div>
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text" name="image1" id="image1">
                                                </div>
                                            </div>
                                        </--div-->

                                <input class="file-path validate" type="text" name="image1" id="image1" style="visibility: hidden">


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
            <div class="col-md-6">
                <div class="card">
                    <div id="map" style="width:100%;height:400px;background:yellow"></div>
                    <br>

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


                </div>
            </div>
        </div>
    </div>
</div>














            %{--
            <div id="create-po" class="content scaffold-create" role="main">
                <h1><g:message code="default.create.label" args="[entityName]"/></h1>
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
                <g:form resource="${this.poi}" method="POST">
                    <fieldset class="form">
                        <f:all bean="poi"/>

                        <div id="map" style="width:100%;height:400px;background:yellow"></div>
                        <br>

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
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
            </div>--}%
</body>
</html>
