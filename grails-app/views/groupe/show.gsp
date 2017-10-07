<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="hidden" id="groupid">${params.id}</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="orange">
                    <i class="material-icons">store</i>
                </div>

                <div class="card-content">
                    <h4 class="card-title">${grails_project.Groupe.findById(params.id).name}</h4>

                    <div id="mapgroup" class="map map-big" style="width:100%;height:500px;"></div>

                    <div class="row">
                        <div class="col-sm-6">
                            <br>
                            <h5>Description:</h5>
                            <h6 class="card-description">${grails_project.Groupe.findById(params.id).description}</h6>
                        </div>

                        <div class="col-sm-6">
                            <br>
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                <!-- Indicators -->
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <g:each var="i"
                                            in="${(1..<grails_project.Groupe.findById(params.id).images.size())}">
                                        <g:if test="${grails_project.Groupe.findById(params.id).images.size() != 0}">
                                            <li data-target="#myCarousel" data-slide-to="${i}"></li>
                                        </g:if>
                                        <g:else>
                                            <li data-target="#myCarousel" data-slide-to="1"></li>
                                        </g:else>
                                    </g:each>
                                </ol>

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <g:each status="i" var="img"
                                            in="${grails_project.Groupe.findById(params.id).images}">
                                        <g:if test="${grails_project.Groupe.findById(params.id).images.size() != 0}">
                                            <g:if test="${i == 0}">
                                                <div class="item active">
                                                    <img class="img img-responsive center-block" style=" height: 300px"
                                                         src="${grailsApplication.config.server.pathServer}/images/${img.name}"/>
                                                </div>
                                            </g:if>
                                            <g:else>
                                                <div class="item">
                                                    <img class="img img-responsive center-block" style=" height: 300px"
                                                         src="${grailsApplication.config.server.pathServer}/images/${img.name}"/>
                                                </div>
                                            </g:else>
                                        </g:if>
                                        <g:else>
                                            <div class="item active">
                                                <asset:image class="img img-responsive center-block"
                                                             style=" height: 300px"
                                                             src="${grailsApplication.config.server.pathServer}/images/non_disponible.jpg"/>
                                            </div>
                                        </g:else>
                                    </g:each>
                                </div>

                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">

                    <div class="card-footer text-center">
                        <g:form resource="${grails_project.Groupe.findById(params.id)}" method="DELETE">
                            <fieldset class="buttons">

                                <g:link class="edit" action="edit"
                                        resource="${grails_project.Groupe.findById(params.id)}"><div
                                        class="btn btn-success btn-fill">Modifier</div></g:link>
                                <input class="delete btn btn-danger btn-fill" type="submit"
                                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                            </fieldset>
                        </g:form>
                    </div>
                </sec:ifAnyGranted>

            </div>
        </div>
    </div>

    <h3>${grails_project.Groupe.findById(params.id).name}s</h3>
    <br>

    <div class="row">
        <g:each var="p" in="${grails_project.Poi.all}">
            <g:each var="g" in="${p.groups}">
                <g:if test="${g.id.toString() == params.id}">
                    <div class="col-md-4">
                        <div class="card card-product" data-count="7">
                            <div class="card-image" data-header-animation="true">
                                <a href="#pablo">
                                    <g:if test="${p.images.size() != 0}">
                                        <img class="img"
                                             src="${grailsApplication.config.server.pathServer}/images/${p.images[0].name}"/>
                                    </g:if>
                                    <g:else>
                                        <img class="img"
                                             src="${grailsApplication.config.server.pathServer}/images/non_disponible.jpg"/>
                                    </g:else>
                                </a>
                            </div>

                            <div class="card-content">
                                <div class="card-actions">
                                    <button type="button" class="btn btn-danger btn-simple fix-broken-card">
                                        <i class="material-icons">build</i> Fix Header!
                                    </button>
                                    <a href="/poi/show/${p.id}">
                                        <button type="button" class="btn btn-default btn-simple" rel="tooltip"
                                                data-placement="bottom"
                                                title="" data-original-title="View">
                                            <i class="material-icons">art_track</i>
                                        </button></a>
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">
                                        <a href="/poi/edit/${p.id}">
                                            <button type="button" class="btn btn-success btn-simple" rel="tooltip"
                                                    data-placement="bottom"
                                                    title="" data-original-title="Edit">
                                                <i class="material-icons">edit</i>
                                            </button></a>
                                        <a href="/poi/delete/${p.id}">
                                            <button type="button" class="btn btn-danger btn-simple" rel="tooltip"
                                                    data-placement="bottom"
                                                    title="" data-original-title="Remove">
                                                <i class="material-icons">close</i>
                                            </button></a>
                                    </sec:ifAnyGranted>
                                </div>
                                <h4 class="card-title">
                                    <a href="/poi/show/${p.id}">${p.name}</a></h4>

                                <div class="card-description">
                                    ${p.description}
                                </div>
                            </div>

                            <div class="card-footer">
                                <div class="stats">
                                    <p class="category" id="${p.id}"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:each>
        </g:each>
    </div>
</div>
<g:javascript>
var groupid = $('#groupid').text();
var pois
function initMap() {
    $.ajax({
        url: "${g.createLink(controller: 'grails_project.Poi', action: 'listpoi')}",
        dataType: "json",
        success: function(data) {
            pois = data
        },
        error: function(request, status, error) {

        },
        complete: function() {
            var map3 = new google.maps.Map(document.getElementById('mapgroup'), {
                center: {
                    lat: 43.729497,
                    lng: 7.146764
                },
                zoom: 10,
                scrollwheel: false
            });

            for (var i = 0; i < pois.length; i++) {
                idgroup = parseInt((JSON.stringify(pois[i].groups)).substring(7,8))
                if (idgroup == parseInt(groupid)){
                    var latlngpoi = {lat: parseFloat(pois[i].lat), lng: parseFloat(pois[i].lng)}
                    var infowindow = new google.maps.InfoWindow({
                        maxWidth: 200
                    });
                    var content = '<div id="content">'+
                        '<div id="siteNotice">'+
                        '</div>'+
                        '<h4 id="firstHeading" class="firstHeading text-center"><b>'+pois[i].name+'</b></h4>'+
                        '<div id="bodyContent">'+
                        '<p><b>Description: </b>'+pois[i].description+
                        '<br>'+
                        "<a href='/poi/show/"+pois[i].id+"'>"+
                        "<small>en savoir plus...</small></a>"+
                        '</p>'+
                        '</div>'+
                        '</div>';

                    var marker = new google.maps.Marker({
                        position: latlngpoi,
                        map: map3,
                        title: pois[i].name
                    });
                    google.maps.event.addListener(marker, 'click', (function(marker, content, infowindow) {
                        return function() {
                          infowindow.setContent(content);
                          infowindow.open(map3, marker);
                        };
                    })(marker, content, infowindow));
                    geo(pois[i]);
                }
            }
        }
    });
}

</g:javascript>
<script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwPaWz9e-O1iqBASHZk_r_weUe3pCZbOM&callback=initMap"/>
</body>
</html>