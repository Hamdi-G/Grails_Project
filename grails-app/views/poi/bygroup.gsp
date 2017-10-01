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
                <div class="card-header card-header-icon" data-background-color="orange">
                    <i class="material-icons">store</i>
                </div>

                <div class="card-content">
                    <h4 class="card-title">${grails_project.Groupe.findById(params.id).name}</h4>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <g:each var="i" in="${(1..<grails_project.Groupe.findById(params.id).images.size())}">
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
                            <g:each status="i" var="img" in="${grails_project.Groupe.findById(params.id).images}">
                                <g:if test="${grails_project.Groupe.findById(params.id).images.size() != 0}">
                                    <g:if test="${i == 0}">
                                        <div class="item active">
                                            <asset:image class="img img-responsive center-block" style=" height: 400px"
                                                         src="${img.name}"/>
                                        </div>
                                    </g:if>
                                    <g:else>
                                        <div class="item">
                                            <asset:image class="img img-responsive center-block" style=" height: 400px"
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
                    <h5>Description:</h5>
                    <h6 class="card-description">${grails_project.Groupe.findById(params.id).description}</h6>
                </div>
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
                                        <asset:image class="img" src="${p.images[0].name}"/>
                                    </g:if>
                                    <g:else>
                                        <asset:image class="img" src="non_disponible.jpg"/>
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
                                    <a href="#pablo">${p.name}</a>
                                </h4>

                                <div class="card-description">
                                    ${p.description}
                                </div>
                            </div>

                            <div class="card-footer">
                                <div class="stats">
                                    <p class="category"><i class="material-icons">place</i> Barcelona, Spain</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:if>
            </g:each>
        </g:each>
    </div>
</div>
</body>
</html>