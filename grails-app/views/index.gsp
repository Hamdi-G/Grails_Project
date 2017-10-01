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
                        <a href="/poi/showOnMap">Voir tous</a>
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
                        <a href="">Voir tous</a>
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
    <div class="row">
        <div class="col-md-5">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="red">
                    <i class="material-icons">pie_chart</i>
                </div>
                <div class="card-content">
                    <h4 class="card-title">Poucentage des Lieux par catégorie</h4>
                </div>
                <div id="chartPreferences" class="ct-chart"></div>
                <div class="card-footer">

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
