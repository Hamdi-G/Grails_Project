<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <button class="btn btn-primary btn-round">
        <a href="${createLink(uri: '/')}" style="color: white">
            <i class="material-icons">home</i> Home
        </a>
    </button>
    <button class="btn btn-primary btn-round">
        <g:link class="create" action="create" ><g:message  args="[entityName]" /><i class="material-icons" style="color: white">add</i>create</g:link>
    </a>
    </button>

    <button class="btn btn-primary btn-round">
        <g:link class="list" action="index"><g:message  args="[entityName]" /><i class="material-icons" style="color: white">list</i> list</g:link>
    </a>
    </button>

        <div id="edit-poi" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.poi}" method="PUT">
                <g:hiddenField name="version" value="${this.poi?.version}" />
                <fieldset class="form">
                    <f:all bean="poi"/>
                    <g:each var="image" in="${poi.images}">
                        <asset:image src="${image.name}" width="300" height="300" display="inline-block" style="float:left;margin-left: 10px;margin-right: 10px;"/></a>
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
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
