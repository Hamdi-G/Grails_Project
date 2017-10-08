<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-text" data-background-color="rose">
                    <h4 class="card-title">Lieux sur carte</h4>
                </div>

                <div class="card-content">
                    <div id="map1" class="map map-big" style="width:100%;height:500px;"></div>

                </div>
            </div>
        </div>
    </div>

    <h3></h3>
    <br>

    <div class="row">
        <g:each var="poi" in="${grails_project.Poi.all}">
            <div class="col-md-4">
                <div class="card card-product" data-count="7">
                    <div class="card-image" data-header-animation="true">
                        <a href="#pablo">
                            <img class="img"
                                 src="${grailsApplication.config.server.pathServer}/images/${poi.images[0].name}"/>
                        </a>
                    </div>

                    <div class="card-content">
                        <div class="card-actions">
                            <a href="/poi/show/${poi.id}">
                                <button type="button" class="btn btn-default btn-simple" rel="tooltip"
                                        data-placement="bottom"
                                        title="" data-original-title="View">
                                    <i class="material-icons">art_track</i>
                                </button></a>
                            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">
                                <a href="/poi/edit/${poi.id}">
                                    <button type="button" class="btn btn-success btn-simple" rel="tooltip"
                                            data-placement="bottom"
                                            title="" data-original-title="Edit">
                                        <i class="material-icons">edit</i>
                                    </button></a>
                                <a href="/poi/delete/${poi.id}">
                                    <button type="button" class="btn btn-danger btn-simple" rel="tooltip"
                                            data-placement="bottom"
                                            title="" data-original-title="Remove">
                                        <i class="material-icons">close</i>
                                    </button></a>
                            </sec:ifAnyGranted>
                        </div>
                        <h4 class="card-title">
                            <a href="/poi/show/${poi.id}">${poi.name}</a>
                        </h4>

                        <div class="card-description">
                            ${poi.description}
                        </div>
                    </div>

                    <div class="card-footer">
                        <div class="stats">
                            <p class="category" id="${poi.id}"></p>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>

<g:javascript>
var pois
var adresses = []

function initMap() {

    $.ajax({

        url: "${g.createLink(controller: 'poi', action: 'listpoi')}",
        dataType: "json",
        success: function(data) {
            pois = data

        },
        error: function(request, status, error) {

        },
        complete: function() {

            var map1 = new google.maps.Map(document.getElementById('map1'), {
                center: {
                    lat: 43.729497,
                    lng: 7.146764
                },
                zoom: 10,
                scrollwheel: false
            });
            //ajout du marquer/adresse pour chaque poi

            for (var i = 0; i < pois.length; i++) {


                var latlngpoi = {lat: parseFloat(pois[i].lat), lng: parseFloat(pois[i].lng)}
                    var infowindow = new google.maps.InfoWindow({
                        maxWidth: 200
                    });
                    var content = '<div id="content">'+
                    '<div id="siteNotice">'+
                    '</div>'+
                    '<h4 id="firstHeading" class="firstHeading text-center"><b>'+pois[i].name+'</b></h4>'+
                    '<div id="bodyContent"><p>'+
                    //'<b>Adresse: </b><div id='+pois[i].id+'></div>'+
                    '<b>Description: </b>'+pois[i].description+
                    '<br>'+
                    "<a href='/poi/show/"+pois[i].id+"'>"+
                    "<small>en savoir plus...</small></a>"+
                    '</p>'+
                    '</div>'+
                    '</div>';

                    var marker = new google.maps.Marker({
                        position: latlngpoi,
                        map: map1,
                        title: pois[i].name
                    });
                    google.maps.event.addListener(marker, 'click', (function(marker, content, infowindow) {
                        return function() {
                          infowindow.setContent(content);
                          infowindow.open(map1, marker);
                        };
                    })(marker, content, infowindow));
                geo(pois[i]);

            }
            getLocation(map1)



        }
    });
}
</g:javascript>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwPaWz9e-O1iqBASHZk_r_weUe3pCZbOM&callback=initMap"/>
</body>
</html>