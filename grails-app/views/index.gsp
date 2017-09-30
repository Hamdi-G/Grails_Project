<%@ page import="org.codehaus.groovy.runtime.DefaultGroovyMethods" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="rose">
                    <i class="material-icons">place</i>
                </div>

                <div class="card-content">
                    <p class="category">Lieux</p>

                    <h3 class="card-title">${grails_project.Poi.count}</h3>
                </div>

                <div class="card-footer">
                    <div class="stats">
                        <a href="#">Voir tous</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="orange">
                    <i class="material-icons">view_carousel</i>
                </div>

                <div class="card-content">
                    <p class="category">Catégories</p>

                    <h3 class="card-title">${grails_project.Groupe.count}</h3>
                </div>

                <div class="card-footer">
                    <div class="stats">
                        <a href="/poi/bygroup">Voir tous</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header" data-background-color="blue">
                    <i class="material-icons">person</i>
                </div>

                <div class="card-content">
                    <p class="category">Utilisateurs</p>

                    <h3 class="card-title">${Grails_Project.User.count}</h3>
                </div>

                <div class="card-footer">
                    <div class="stats">
                        <a href="#">Voir tous</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
