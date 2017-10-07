<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="purple">
                    <i class="material-icons">apps</i>
                </div>

                <div class="card-content">
                    <h4 class="card-title">Catégories</h4>

                    <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                        <g:link class="create" action="create">
                            <button id="addnew" class="btn btn-primary btn-round btn-fab btn-fab-mini"
                                    style="float: right;"><i class="material-icons">add</i></button>
                        </g:link>
                    </div>

                    <div class="material-datatables">
                        <table id="groupsdatatables"
                               class="table table-striped table-no-bordered table-hover dataTable dtr-inline table-shopping"
                               cellspacing="0" width="100%" style="width: 100%;" role="grid"
                               aria-describedby="datatables_info">
                            <thead>
                            <tr>
                                <th class="text-center disabled-sorting"></th>
                                <th>Nom</th>
                                <th class='hidden-480 text-left'>Description</th>
                                <th class="td-actions text-right disabled-sorting">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${groupeList}" var="groupe">
                                <tr>
                                    <td>
                                        <div class="img-container">
                                            <g:if test="${groupe.images.size() != 0 && groupe.images != null}">
                                                <img class="img img-responsive center-block" style=" height: 120px"
                                                     src="${grailsApplication.config.server.pathServer}/images/${groupe.images[0].name}"/>
                                            </g:if>
                                            <g:else>
                                                <img class="img img-responsive center-block" style=" height: 120px"
                                                     src="${grailsApplication.config.server.pathServer}/images/$non_disponible.jpg"/>
                                            </g:else>
                                        </div>
                                    </td>
                                    <td class="td-name">${groupe.name}                                            <br>
                                        <a href="/groupe/show/${groupe.id}"><small>${groupe.pois.size()} lieux dans cette catégorie  <i
                                                class='material-icons'>open_in_new</i></small></a>
                                    </td>

                                    <td class='hidden-480 text-left'>${groupe.description}</td>
                                    <td class="td-actions text-right">
                                        <a href="/groupe/show/${groupe.id}" class='btn btn-simple btn-info'><i
                                                class='material-icons'>visibility</i></a>
                                        <a href="/groupe/edit/${groupe.id}"
                                           class='btn btn-simple btn-success'><i
                                                class='material-icons'>create</i></a>
                                        <a href="/groupe/delete/${groupe.id}"
                                           class='btn btn-simple btn-danger'><i
                                                class='material-icons'>delete</i></a></td>
                                </tr>
                            </g:each>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<g:javascript>
    $(document).ready(function () {
        $('#groupsdatatables').DataTable({
            language: options
        });
    });
</g:javascript>
</body>
</html>