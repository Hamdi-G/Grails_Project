<%@ page import="Grails_Project.Role" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="purple">
                    <i class="material-icons">person</i>
                </div>

                <div class="card-content">
                    <h4 class="card-title">Utilisateurs</h4>

                    <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <g:link class="create" action="create">
                                <button id="addnew" class="btn btn-primary btn-round btn-fab btn-fab-mini"
                                        style="float: right;"><i class="material-icons">person_add</i></button>
                            </g:link>
                        </sec:ifAnyGranted>
                    </div>

                    <div class="material-datatables">
                        <table id="usersdatatables"
                               class="table table-striped table-no-bordered table-hover dataTable dtr-inline"
                               cellspacing="0" width="100%" style="width: 100%;" role="grid"
                               aria-describedby="datatables_info">
                            <thead>
                            <tr>
                                <th>Nom d'utilisateur</th>
                                <th>rôle</th>
                                <th class='hidden-350'>expiré</th>
                                <th class='hidden-1024'>verrouillé</th>
                                <th class='hidden-480'>Activé</th>
                                <th class='hidden-480'>mot de passe expiré</th>
                                <th class="td-actions text-right disabled-sorting">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${userList}" var="user">
                                <sec:ifAnyGranted roles="ROLE_MODERATOR">
                                    <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority() == 'ROLE_USER'}">
                                        <tr>
                                            <td><a href="/user/show/${user.id}">${fieldValue(bean: user, field: "username")}</a>
                                            </td>
                                            <td class='hidden-350'>
                                                <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "A"}">
                                                    <span class="label label-rose">administrateur</span>
                                                </g:if>
                                                <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "M"}">
                                                    <span class="label label-success">modérateur</span>
                                                </g:if>
                                                <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "U"}">
                                                    <span class="label label-info">utilisateur</span>
                                                </g:if>

                                            </td>
                                            <td class='hidden-350'><g:formatBoolean
                                                    boolean="${user.accountExpired}"/></td>
                                            <td class='hidden-1024'><g:formatBoolean
                                                    boolean="${user.accountLocked}"/></td>
                                            <td class='hidden-480'><g:formatBoolean boolean="${user.enabled}"/></td>
                                            <td class='hidden-480'><g:formatBoolean
                                                    boolean="${user.passwordExpired}"/></td>
                                            <td class="td-actions text-right">
                                                <a href="/user/show/${user.id}"
                                                   class='btn btn-simple btn-info'><i
                                                        class='material-icons'>person</i></a>
                                                <a href="/user/edit/${user.id}"
                                                   class='btn btn-simple btn-success'><i
                                                        class='material-icons'>create</i></a>
                                            </td>
                                        </tr>
                                    </g:if>
                                </sec:ifAnyGranted>
                                <sec:ifAnyGranted roles="ROLE_ADMIN">
                                    <tr>
                                        <td><a href="/user/show/${user.id}">${fieldValue(bean: user, field: "username")}</a>
                                        </td>
                                        <td class='hidden-350'>
                                            <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "A"}">
                                                <span class="label label-rose">administrateur</span>
                                            </g:if>
                                            <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "M"}">
                                                <span class="label label-success">modérateur</span>
                                            </g:if>
                                            <g:if test="${Grails_Project.UserRole.findByUser(user).getRole().getAuthority().substring(5,6) == "U"}">
                                                <span class="label label-info">utilisateur</span>
                                            </g:if>

                                        </td>
                                        <td class='hidden-350'><g:formatBoolean boolean="${user.accountExpired}"/></td>
                                        <td class='hidden-1024'><g:formatBoolean boolean="${user.accountLocked}"/></td>
                                        <td class='hidden-480'><g:formatBoolean boolean="${user.enabled}"/></td>
                                        <td class='hidden-480'><g:formatBoolean boolean="${user.passwordExpired}"/></td>
                                        <td class="td-actions text-right">
                                            <a href="/user/show/${user.id}"
                                               class='btn btn-simple btn-info'><i
                                                    class='material-icons'>person</i></a>
                                            <a href="/user/edit/${user.id}"
                                               class='btn btn-simple btn-success'><i
                                                    class='material-icons'>create</i></a>
                                            <a href="/user/delete/${user.id}"
                                               class='btn btn-simple btn-danger'><i
                                                    class='material-icons'>delete</i></a>
                                        </td>
                                    </tr>
                                </sec:ifAnyGranted>
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
$( document ).ready(function() {
    $('#usersdatatables').DataTable({
        language: options
    });
});
</g:javascript>
</body>
</html>