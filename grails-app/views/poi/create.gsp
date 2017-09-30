<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
        <g:link class="list" action="index"><g:message  args="[entityName]" /><i class="material-icons" style="color: white">list</i> list</g:link>
    </a>
    </button>
        <div id="create-poi" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.poi}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.poi}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
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
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
