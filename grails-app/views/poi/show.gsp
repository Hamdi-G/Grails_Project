<%@ page import="grails_project.Poi" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-poi" class="content scaffold-show" role="main">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-icon" data-background-color="orange">
                        <i class="material-icons">place</i>
                    </div>

                    <div class="card-content">
                        <h4 class="card-title">${poi.name}</h4>

                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <g:each var="i" in="${(1..<poi.images.size())}">
                                    <g:if test="${poi.images.size() != 0}">
                                        <li data-target="#myCarousel" data-slide-to="${i}"></li>
                                    </g:if>
                                    <g:else>
                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                    </g:else>
                                </g:each>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <g:each status="i" var="img" in="${poi.images}">
                                    <g:if test="${poi.images.size() != 0}">
                                        <g:if test="${i == 0}">
                                            <div class="item active">
                                                <asset:image class="img img-responsive center-block"
                                                             style=" height: 400px"
                                                             src="${img.name}"/>
                                            </div>
                                        </g:if>
                                        <g:else>
                                            <div class="item">
                                                <asset:image class="img img-responsive center-block"
                                                             style=" height: 400px"
                                                             src="${img.name}"/>
                                            </div>
                                        </g:else>
                                    </g:if>
                                    <g:else>
                                        <div class="item active">
                                            <asset:image class="img img-responsive center-block" style=" height: 400px"
                                                         src="non_disponible.jpg"/>
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
                        <br>


                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <legend>Tags</legend>
                                        <g:each var="g" in="${poi.groups}">
                                            <a href="/groupe/bygroup?id=${g.id}"><div class="bootstrap-tagsinput">
                                                <span class="tag label label-info">${g.name}</span>
                                                <!-- You can change data-color="rose" with one of our colors primary | warning | info | danger | success -->
                                            </div></a>
                                        </g:each>
                                    </div>

                                </div>
                                <br>
                                <legend>Description:</legend>
                                <h6 class="card-description">${poi.description}</h6>
                                <br>

                                <div class="row invisible">
                                    <div class="col-md-6">
                                        <legend>latitude</legend>

                                        <div id="latt">${poi.lat}</div>
                                    </div>
                                </div>
                                <br>

                                <div class="row invisible">
                                    <div class="col-md-6">
                                        <legend>longitude</legend>

                                        <div id="lngg">${poi.lng}</div>
                                    </div>
                                </div>
                                <br>

                            </div>

                            <div class="col-sm-6">
                                <div id="mappoi" class="map map-big" style="width:100%;height:300px;"></div>
                            </div>
                        </div>
                        <br>

                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_MODERATOR">

                            <div class="card-footer text-center">
                                <g:form resource="${poi}" method="DELETE">
                                    <fieldset class="buttons">

                                        <g:link class="edit" action="edit"
                                                resource="${poi}"><div
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
        </div>
    </div>
</body>
</html>
