<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
        <div id="list-poi" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${poiList}" />

            <div class="pagination">
                <g:paginate total="${poiCount ?: 0}" />
            </div>
        </div>
    </body>
</html>