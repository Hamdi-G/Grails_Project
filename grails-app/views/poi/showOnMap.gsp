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
                            <asset:image class="img" src="${poi.images[0]}"/>
                        </a>
                    </div>

                    <div class="card-content">
                        <div class="card-actions">
                            <button type="button" class="btn btn-danger btn-simple fix-broken-card">
                                <i class="material-icons">build</i> Fix Header!
                            </button>
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
</body>

</html>