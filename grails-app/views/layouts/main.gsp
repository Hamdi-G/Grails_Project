<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png"/>
    <link rel="icon" type="image/png" href="../assets/img/favicon.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>TripComapss</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>
    <!-- Canonical SEO -->
    <link rel="canonical" href="http://www.creative-tim.com/product/material-dashboard-pro"/>
    <!--  Social tags      -->
    <meta name="keywords"
          content="material dashboard, bootstrap material admin, bootstrap material dashboard, material design admin, material design, creative tim, html dashboard, html css dashboard, web dashboard, freebie, free bootstrap dashboard, css3 dashboard, bootstrap admin, bootstrap dashboard, frontend, responsive bootstrap dashboard, premiu material design admin">
    <meta name="description"
          content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template">
    <meta itemprop="description"
          content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
    <meta itemprop="image" content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@creativetim">
    <meta name="twitter:title" content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template">
    <meta name="twitter:description"
          content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design.">
    <meta name="twitter:creator" content="@creativetim">
    <meta name="twitter:image" content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg">
    <!-- Open Graph data -->
    <meta property="fb:app_id" content="655968634437471">
    <meta property="og:title" content="Material Dashboard PRO by Creative Tim | Premium Bootstrap Admin Template"/>
    <meta property="og:type" content="article"/>
    <meta property="og:url" content="http://www.creative-tim.com/product/material-dashboard-pro"/>
    <meta property="og:image" content="http://s3.amazonaws.com/creativetim_bucket/products/51/opt_mdp_thumbnail.jpg"/>
    <meta property="og:description"
          content="Material Dashboard PRO is a Premium Material Bootstrap Admin with a fresh, new design inspired by Google's Material Design."/>
    <meta property="og:site_name" content="Creative Tim"/>
    <!-- Bootstrap core CSS     -->
    <asset:stylesheet src="bootstrap.min.css"/>
    <!--  Material Dashboard CSS    -->
    <asset:stylesheet src="material-dashboard.css"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <asset:stylesheet src="demo.css"/>
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
<div class="wrapper">
    <div class="sidebar" data-active-color="purple" data-background-color="black"
         data-image="">
        <!--
        Tip 1: You can change the color of active element of the sidebar using: data-active-color="purple | blue | green | orange | red | rose"
        Tip 2: you can also add an image using data-image tag
        Tip 3: you can change the color of the sidebar with data-background-color="white | black"
    -->
        <div class="logo">
            <a  class="simple-text logo-mini">
            </a>
            <a class="simple-text logo-normal">
                <i class="material-icons">explore</i>
                TripCompass
            </a>
        </div>

        <div class="sidebar-wrapper">
            <div class="user">
                <div class="photo">
                    <img src="../assets/img/faces/avatar.jpg"/>
                </div>

                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                        <span>
                            ${sec.loggedInUserInfo(field: 'username')}
                            <b class="caret"></b>
                        </span>
                    </a>

                    <div class="clearfix"></div>

                    <div class="collapse" id="collapseExample">
                        <ul class="nav">
                            <li>
                                <a>
                                <span class="label label-info">
                                    <sec:ifAnyGranted roles="ROLE_ADMIN">Administrateur</sec:ifAnyGranted>
                                    <sec:ifAnyGranted roles="ROLE_MODER">Modérateur</sec:ifAnyGranted>
                                    <sec:ifAnyGranted roles="ROLE_USER">Utilisateur</sec:ifAnyGranted>
                                </span>
                                </a>

                            </li>
                            <li>
                                <a href="/user/show/${sec.loggedInUserInfo(field: 'id')}">
                                    <span class="sidebar-normal">Mon profil</span>
                                </a>
                            </li>
                            <li>
                                <a href="/user/edit/${sec.loggedInUserInfo(field: 'id')}">
                                    <span class="sidebar-normal">Modifier mon profil</span>
                                </a>
                            </li>
                            <li>
                                <a href="${createLink(action: 'index', controller: 'logout')}">
                                    <span class="sidebar-normal">Se déconnecter</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <ul class="nav">
                <li>
                    <a href="/">
                        <i class="material-icons">dashboard</i>

                        <p>Accueil</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="material-icons">place</i>

                        <p>Tous les lieux
                        </p>
                    </a>
                </li>
                <li>
                    <a data-toggle="collapse" href="#componentsExamples">
                        <i class="material-icons">apps</i>

                        <p>Catégories
                            <b class="caret"></b>
                        </p>
                    </a>

                    <div class="collapse" id="componentsExamples">
                        <ul class="nav" id="categories">
                            <g:each var="cat" in="${grails_project.Groupe.all}">
                                <li>
                                    <a href="/poi/bygroup?id=${cat.id}">
                                        <span class="sidebar-normal">${cat.getName()}</span>
                                    </a>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </li>
                <li>
                    <a data-toggle="collapse" href="#formsExamples">
                        <i class="material-icons">settings</i>

                        <p>Gestion de site
                            <b class="caret"></b>
                        </p>
                    </a>

                    <div class="collapse" id="formsExamples">
                        <ul class="nav">
                            <li>
                                <a href="/user/">
                                    <span class="sidebar-normal">Utilisateurs</span>
                                </a>
                            </li>
                            <li>
                                <a href="/poi/">
                                    <span class="sidebar-normal">Lieux</span>
                                </a>
                            </li>
                            <li>
                                <a href="/groupe/">
                                    <span class="sidebar-normal">Catégories</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="material-icons">info</i>

                        <p>À propos</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="material-icons">textsms</i>

                        <p>Contactez-nous</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-transparent navbar-absolute">
            <div class="container-fluid">
                <div class="navbar-minimize">
                    <button id="minimizeSidebar" class="btn btn-round btn-white btn-fill btn-just-icon">
                        <i class="material-icons visible-on-sidebar-regular">more_vert</i>
                        <i class="material-icons visible-on-sidebar-mini">view_list</i>
                    </button>
                </div>

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Dashboard</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">notifications</i>
                                <span class="notification">5</span>

                                <p class="hidden-lg hidden-md">
                                    Notifications
                                    <b class="caret"></b>
                                </p>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Mike John responded to your email</a>
                                </li>
                                <li>
                                    <a href="#">You have 5 new tasks</a>
                                </li>
                                <li>
                                    <a href="#">You're now friend with Andrew</a>
                                </li>
                                <li>
                                    <a href="#">Another Notification</a>
                                </li>
                                <li>
                                    <a href="#">Another One</a>
                                </li>
                            </ul>
                        </li>
                        <li class="separator hidden-lg hidden-md"></li>
                    </ul>

                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group form-search is-empty">
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="material-input"></span>
                        </div>
                        <button type="submit" class="btn btn-white btn-round btn-just-icon">
                            <i class="material-icons">search</i>

                            <div class="ripple-container"></div>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <div class="content">
            <main>
                <g:layoutBody/>
            </main>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <p class="copyright pull-right">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <a href="#">Hamdi & Imed</a>, made with love for a better web
                </p>
            </div>
        </footer>
    </div>
</div>
</body>
<!--   Core JS Files   -->
<asset:javascript src="jquery-3.2.1.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="material.min.js"/>
<asset:javascript src="perfect-scrollbar.jquery.min.js"/>
<!-- Library for adding dinamically elements -->
<asset:javascript src="arrive.min.js"/>
<!-- Forms Validations Plugin -->
<asset:javascript src="jquery.validate.min.js"/>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<asset:javascript src="moment.min.js"/>
<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<asset:javascript src="chartist.min.js"/>
<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<asset:javascript src="jquery.bootstrap-wizard.js"/>
<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<asset:javascript src="bootstrap-notify.js"/>
<!--   Sharrre Library    -->
<asset:javascript src="jquery.sharrre.js"/>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<asset:javascript src="bootstrap-datetimepicker.js"/>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<asset:javascript src="jquery-jvectormap.js"/>
<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<asset:javascript src="nouislider.min.js"/>
<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<asset:javascript src="jquery.select-bootstrap.js"/>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<asset:javascript src="jquery.datatables.js"/>
<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<asset:javascript src="sweetalert2.js"/>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<asset:javascript src="jasny-bootstrap.min.js"/>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<asset:javascript src="fullcalendar.min.js"/>
<!-- Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<asset:javascript src="jquery.tagsinput.js"/>
<!-- Material Dashboard javascript methods -->
<asset:javascript src="material-dashboard.js"/>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<asset:javascript src="demo.js"/>
<script>
    $(document).ready(function () {
        $('#usersdatatables').DataTable();
    });
</script>

</html>