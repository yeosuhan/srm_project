<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<head>
    <title>Mega Able bootstrap admin template by codedthemes </title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->     <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/icofont/css/icofont.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/font-awesome/css/font-awesome.min.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/jquery.mCustomScrollbar.css">
    <!-- fullcalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    
	<style>
		.modal {
		   position: absolute;
		   top: 0;
		   left: 0;
		   /* width: 100%; */
		   /* height: 100%; */
		   display: none;
		   background-color: rgba(0, 0, 0, 0.4);
		   padding: 20px;
		}
		
		.modal.show {
		   display: block;
		}
		
		.modal_body {
		   position: absolute;
		   top: 50%;
		   left: 50%;
		   width: 800px;
		  /*  height: 600px; */
		   /* padding: 40px; */
		   /* text-align: center; */
		   background-color: rgb(255, 255, 255);
		   border-radius: 10px;
		   box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		   transform: translateX(-50%) translateY(-50%);
		}
		
		.m_head {
		  /*  height: 10%; */
		   padding: 20px;
		   display: flex;
		   justify-content: space-between;
		   background-color: #448aff;
		   border-top-left-radius: 10px;
		   border-top-right-radius: 10px;
		}
		
		.m_body {
		   /* height: 82%; */
		   padding: 20px;
		}
		
		.m_footer {
		   height: 8%;
		   padding: 10px;
		   border-bottom-left-radius: 10px;
		   border-bottom-right-radius: 10px;
		   display: flex;
		   justify-content: end;
		}
		
		.modal_title {
		   font-size: 18px;
		   color: gray;
		   font-weight: 500;
		}
		
		.close_btn {
		   font-size: 20px;
		   color: rgb(139, 139, 139);
		   font-weight: 900;
		   cursor: pointer;
		}
		
		.modal_label {
		   padding-top: 10px;
		}
		
		.input_box {
		   width: 100%;
		   border: 1px solid rgb(189, 189, 189);
		   height: 30px;
		}
		
		.modal_btn {
		   width: 80px;
		   height: 30px;
		   border-radius: 5px;
		   text-align: center;
		   font-size: 14px;
		   font-weight: bolder;
		   padding-top: 5px;
		   margin-left: 5px;
		   font-family: sans-serif;
		}
		
		.cancle {
		   background-color: #448aff;
		   color: white;
		}
		
		.save {
		   background-color: #448aff;
		   color: white;
		}
		div .col {
		   float: left;
		}
		.form-group {
		   margin-left: 5px;
		}
	</style>
</head>

<body>
<!-- Pre-loader start -->
<div class="theme-loader">
    <div class="loader-track">
        <div class="preloader-wrapper">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
            
            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div>
                <div class="gap-patch">
                    <div class="circle"></div>
                </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
        <nav class="navbar header-navbar pcoded-header">
            <div class="navbar-wrapper">
                <div class="navbar-logo">
                    <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                        <i class="ti-menu"></i>
                    </a>
                    <div class="mobile-search waves-effect waves-light">
                        <div class="header-search">
                            <div class="main-search morphsearch-search">
                                <div class="input-group">
                                    <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                    <input type="text" class="form-control" placeholder="Enter Keyword">
                                    <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="index.html">
                        <img class="img-fluid" src="/resources/assets/images/logo.png" alt="Theme-Logo" />
                    </a>
                    <a class="mobile-options waves-effect waves-light">
                        <i class="ti-more"></i>
                    </a>
                </div>
            
                <div class="navbar-container container-fluid">
                    <ul class="nav-left">
                        <li>
                            <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                        </li>
                        <li class="header-search">
                            <div class="main-search morphsearch-search">
                                <div class="input-group">
                                    <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                    <input type="text" class="form-control">
                                    <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
                                <i class="ti-fullscreen"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav-right">
                        <li class="header-notification">
                            <a href="#!" class="waves-effect waves-light">
                                <i class="ti-bell"></i>
                                <span class="badge bg-c-red"></span>
                            </a>
                            <ul class="show-notification">
                                <li>
                                    <h6>Notifications</h6>
                                    <label class="label label-danger">New</label>
                                </li>
                                <li class="waves-effect waves-light">
                                    <div class="media">
                                        <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                        <div class="media-body">
                                            <h5 class="notification-user">John Doe</h5>
                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                            <span class="notification-time">30 minutes ago</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="waves-effect waves-light">
                                    <div class="media">
                                        <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                        <div class="media-body">
                                            <h5 class="notification-user">Joseph William</h5>
                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                            <span class="notification-time">30 minutes ago</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="waves-effect waves-light">
                                    <div class="media">
                                        <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                        <div class="media-body">
                                            <h5 class="notification-user">Sara Soudein</h5>
                                            <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                            <span class="notification-time">30 minutes ago</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="user-profile header-notification">
                            <a href="#!" class="waves-effect waves-light">
                                <img src="/resources/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                <span>John Doe</span>
                                <i class="ti-angle-down"></i>
                            </a>
                            <ul class="show-notification profile-notification">
                                <li class="waves-effect waves-light">
                                    <a href="#!">
                                        <i class="ti-settings"></i> Settings
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="user-profile.html">
                                        <i class="ti-user"></i> Profile
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="email-inbox.html">
                                        <i class="ti-email"></i> My Messages
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="auth-lock-screen.html">
                                        <i class="ti-lock"></i> Lock Screen
                                    </a>
                                </li>
                                <li class="waves-effect waves-light">
                                    <a href="auth-normal-sign-in.html">
                                        <i class="ti-layout-sidebar-left"></i> Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="pcoded-main-container">
            <div class="pcoded-wrapper">
                <nav class="pcoded-navbar">
                    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                    <div class="pcoded-inner-navbar main-menu">
                        <div class="">
                            <div class="main-menu-header">
                                <img class="img-80 img-radius" src="/resources/assets/images/avatar-4.jpg" alt="User-Profile-Image">
                                <div class="user-details">
                                    <span id="more-details">John Doe<i class="fa fa-caret-down"></i></span>
                                </div>
                            </div>
                
                            <div class="main-menu-content">
                                <ul>
                                    <li class="more-details">
                                        <a href="user-profile.html"><i class="ti-user"></i>View Profile</a>
                                        <a href="#!"><i class="ti-settings"></i>Settings</a>
                                        <a href="auth-normal-sign-in.html"><i class="ti-layout-sidebar-left"></i>Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="p-15 p-b-0">
                            <form class="form-material">
                                <div class="form-group form-primary">
                                    <input type="text" name="footer-email" class="form-control" required="">
                                    <span class="form-bar"></span>
                                    <label class="float-label"><i class="fa fa-search m-r-10"></i>Search Friend</label>
                                </div>
                            </form>
                        </div>
                        <div class="pcoded-navigation-label" data-i18n="nav.category.navigation">Layout</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="">
                                <a href="index.html" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class="pcoded-hasmenu active pcoded-trigger">
                                <a href="javascript:void(0)" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Components</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class=" ">
                                        <a href="accordion.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Accordion</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="breadcrumb.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Breadcrumbs</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="button.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Button</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="tabs.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Tabs</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="color.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Color</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="label-badge.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Label Badge</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="tooltip.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tooltip</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="typography.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Typography</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="notification.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Notification</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="icon-themify.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Themify</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                    
                                </ul>
                            </li>
                        </ul>
                        <div class="pcoded-navigation-label" data-i18n="nav.category.forms">Forms &amp; Tables</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li>
                                <a href="form-elements-component.html" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">Form Components</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li>
                                <a href="bs-basic-table.html" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">Basic Table</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
            
                        </ul>
            
                        <div class="pcoded-navigation-label" data-i18n="nav.category.forms">Chart &amp; Maps</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li>
                                <a href="chart.html" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">Chart</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li>
                                <a href="map-google.html" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.form-components.main">Maps</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class="pcoded-hasmenu">
                                <a href="javascript:void(0)" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Pages</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class=" ">
                                        <a href="auth-normal-sign-in.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Login</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="auth-sign-up.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Register</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class=" ">
                                        <a href="sample-page.html" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Sample Page</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
            
                        </ul>
            
                        <div class="pcoded-navigation-label" data-i18n="nav.category.other">Other</div>
                        <ul class="pcoded-item pcoded-left-item">
                            <li class="pcoded-hasmenu ">
                                <a href="javascript:void(0)" class="waves-effect waves-dark">
                                    <span class="pcoded-micon"><i class="ti-direction-alt"></i><b>M</b></span>
                                    <span class="pcoded-mtext" data-i18n="nav.menu-levels.main">Menu Levels</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                                <ul class="pcoded-submenu">
                                    <li class="">
                                        <a href="javascript:void(0)" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-21">Menu Level 2.1</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                                    <li class="pcoded-hasmenu ">
                                        <a href="javascript:void(0)" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-direction-alt"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">Menu Level 2.2</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                        <ul class="pcoded-submenu">
                                            <li class="">
                                                <a href="javascript:void(0)" class="waves-effect waves-dark">
                                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                    <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span>
                                                    <span class="pcoded-mcaret"></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="">
                                        <a href="javascript:void(0)" class="waves-effect waves-dark">
                                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                            <span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-23">Menu Level 2.3</span>
                                            <span class="pcoded-mcaret"></span>
                                        </a>
                                    </li>
                    
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="pcoded-content">
                    <!-- Page-header start -->
                    <div class="page-header">
                        <div class="page-block">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <div class="page-header-title">
                                        <h5 class="m-b-10">Typography</h5>
                                        <p class="m-b-0">Lorem Ipsum is simply dummy text of the printing</p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <ul class="breadcrumb-title">
                                        <li class="breadcrumb-item">
                                            <a href="index.html"> <i class="fa fa-home"></i> </a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#!">Basic Components</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#!">Typography</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page-header end -->
                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <!-- Page-body start -->
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <!-- SRDemand card start -->
                                            <div class="card">
                                                <div class="card-header">
                                                	<div class="row">
                                                		<div class="col-10">
		                                                    <h5>SR 요청 관리</h5>
                                                		</div>
                                                		<div class="col-2">
		                                                    <button class="btn btn-info">요청 등록</button>
                                                		</div>
                                                	</div>
                                                </div>
                                                <div class="card-block ">
                                                    <div class="row">
                                                        <div class="col-12 ">
                                                            <form action="/">
                                                            	<div class="row">
                                                            		<div class="col-5">
                                                            			<label for="dmndYmdStart">조회 기간</label>
                                                            			<input type="date" name="dmndYmdStart" id="dmndYmdStart">
                                                            			<span>~</span>
                                                            			<input type="date" name="dmndYmdEnd" id="dmndYmdEnd">
                                                            		</div>
                                                            		<div class="col-5">
                                                            			<label for="sttsCd">진행 상태</label>
                                                            			<select id="sttsCd" name="sttsCd">
                                                            				<option value="0">요청</option>
                                                            				<option value="1">반려</option>
                                                            				<option value="2">접수</option>
                                                            				<option value="3">개발중</option>
                                                            				<option value="4">테스트</option>
                                                            				<option value="5">개발 완료</option>
                                                            			</select>
                                                            		</div>
                                                            		<div class="col-2"></div>
                                                            		<div class="col-5">
                                                            			<label for="">관련 시스템</label>
                                                            			<select id="" name="">
                                                            				<option value="0">워크넷</option>
                                                            				<option value="1">고용정보원</option>
                                                            				
                                                            			</select>
                                                            			<select id="" name="">
                                                            				<option value="0">내부망</option>
                                                            				<option value="1">외부망</option>
                                                            				
                                                            			</select>
                                                            		</div>
                                                            		<div class="col-5">
                                                            			<label for="keyWord">키워드</label>
                                                            			<input type="text" name="keyWord" id="keyWord">
                                                            		</div>
                                                            		<div class="col-2">
                                                            			<button class="btn btn-info"><i class="ti-search"></i></button>
                                                            		</div>
                                                            	</div>
                                                            </form>
                                                        </div>
                                                       	<div class="col-12" style="overflow-x: scroll">
                                                       		<table class="table table-hover">
                                                       			<thead>
                                                       				<tr>
                                                       					<th>순번</th>
                                                       					<th>SR번호</th>
                                                       					<th>시스템 구분</th>
                                                       					<th>업무 구분</th>
                                                       					<th>SR제목</th>
                                                       					<th>담당자</th>
                                                       					<th>완료 요청일</th>
                                                       					<th>완료 예정일</th>
                                                       					<th>진행 상태</th>
                                                       					<th>상세보기</th>
                                                       					
                                                       				</tr>
                                                       			</thead>
                                                       			<tbody>
                                                       				<tr>
                                                       					<td>1</td>
                                                       					<td>wok-1</td>
                                                       					<td>워크넷</td>
                                                       					<td>내부망</td>
                                                       					<td>시스템 개선</td>
                                                       					<td>홍길동</td>
                                                       					<td>2023.2.18</td>
                                                       					<td>2023.2.18</td>
                                                       					<td>개발중</td>
                                                       					<td><button class="btn btn-info btn-sm" data-toggle="modal"
												data-target="#srDemandModal">요청 상세</button></td>
                                                       				</tr>
                                                       				<tr>
                                                       					<td>2</td>
                                                       					<td>wok-2</td>
                                                       					<td>워크넷</td>
                                                       					<td>외부망</td>
                                                       					<td>테스트</td>
                                                       					<td>홍길동</td>
                                                       					<td>2023.2.28</td>
                                                       					<td>2023.2.28</td>
                                                       					<td>요청</td>
                                                       					<td><button class="btn btn-info btn-sm" onClick="resourceModalCalendar()" data-toggle="modal"
												data-target="#resourceSelectModal">요청 수정</button></td>
                                                       				</tr>
                                                       			</tbody>
                                                       			<tfoot></tfoot>
                                                       		</table>
                                                       	</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SRDemand card end -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Page-body end -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main-body end -->
                <div id="styleSelector">
                
                </div>
                    <jsp:include page="/WEB-INF/views/srDemandDetail.jsp"/>
                    <jsp:include page="/WEB-INF/views/resourceSelectModal.jsp"/><!-- 임시 -->
            </div>
        </div>
    </div>
</div>



<!-- Warning Section Starts -->
<!-- Older IE warning message -->
<!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
<script type="text/javascript" src="/resources/assets/pages/widget/excanvas.js "></script>
<!-- waves js -->
<script src="/resources/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
<!-- modernizr js -->
    <script type="text/javascript" src="/resources/assets/js/SmoothScroll.js"></script>     <script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
<script src="/resources/assets/js/pcoded.min.js"></script>
<script src="/resources/assets/js/vertical-layout.min.js "></script>
<script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="/resources/assets/js/script.js"></script>

</body>

</html>
