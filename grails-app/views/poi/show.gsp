<%@ page import="grails_project.Poi" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
        <g:link class="edit" action="edit" resource="${this.poi}"><g:message  args="[entityName]" /><i class="material-icons" style="color: white">edit</i>Edit</g:link>
    </a>
    </button>
    <button class="btn btn-primary btn-round">
        <g:link class="list" action="index"><g:message  args="[entityName]" /><i class="material-icons" style="color: white">list</i> list</g:link>
    </a>
    </button>
        <g:form resource="${this.poi}" method="DELETE">

            <fieldset class="buttons">
                <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
        <div id="show-poi" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="poi"/>
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
                    /*google.maps.event.addListener(map, 'click', function(e) {
                        marker.setPosition(e.latLng);
                    });*/
                }

            </g:javascript>

            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwPaWz9e-O1iqBASHZk_r_weUe3pCZbOM&callback=myMap"></script>


        </div>
    </body>
</html>
