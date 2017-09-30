<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png"/>
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>TripCompass</title>
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

<body class="">

<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" filter-color="black" data-image="">
        <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="on">
                            <div class="card card-login card-hidden">
                                <div class="card-header text-center" data-background-color="purple">
                                    <i class="material-icons">explore</i>
                                    <h4 class="card-title">TripCompass</h4>
                                </div>

                                <p class="category text-center">
                                    Connectez-vous à l'aide de vos identifiants
                                </p>

                                <div class="card-content">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">face</i>
                                        </span>

                                        <div class="form-group label-floating">
                                            <label class="control-label">identifiant</label>
                                            <input type="text" class="form-control"
                                                   name="${usernameParameter ?: 'username'}" id="username"  autofocus/>
                                        </div>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <i class="material-icons">lock_outline</i>
                                        </span>

                                        <div class="form-group label-floating">
                                            <label class="control-label">Mot de passe</label>
                                            <input type="password" class="form-control"
                                                   name="${passwordParameter ?: 'password'}" id="password"/>
                                        </div>
                                    </div>

                                    <div class="">
                                        <div class="checkbox icheck">
                                            <label>
                                                <input type="checkbox" class="chk"
                                                       name="${rememberMeParameter ?: 'remember-me'}" id="remember_me"
                                                       <g:if test='${hasCookie}'>checked="checked"</g:if>/> Mémoriser mon compte
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="footer text-center">
                                    <button type="submit"
                                            class="btn btn-primary btn-simple btn-wd btn-lg">Connexion</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFPQibxeDaLIUHsC6_KqDdFaUdhrbhZ3M"></script>
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
<script type="text/javascript">
    $().ready(function () {
        demo.checkFullPageBackgroundImage();

        setTimeout(function () {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>

</html>