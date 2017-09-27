<%@ page import="org.codehaus.groovy.runtime.DefaultGroovyMethods" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
<div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <h3>${grails_project.Poi.count()}</h3>

            <p>Point d'interet</p>
        </div>
        <div class="icon">
            <i class="ion ion-pin"></i>
        </div>
        <a href="/poi/index" class="small-box-footer">Découvrir<i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-orange">
        <div class="inner">
            <h3>${grails_project.Groupe.count}</h3>

            <p>Groups</p>
        </div>
        <div class="icon">
            <i class="ion ion-android-apps"></i>
        </div>
        <a href="/groupe/index" class="small-box-footer">Découvrir<i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-red">
        <div class="inner">
            <h3>${Grails_Project.User.count}</h3>

            <p>Utilisateurs</p>
        </div>
        <div class="icon">
            <i class="ion ion-person"></i>
        </div>
        <a href="/user/index" class="small-box-footer">Voir tout<i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
</body>
</html>
