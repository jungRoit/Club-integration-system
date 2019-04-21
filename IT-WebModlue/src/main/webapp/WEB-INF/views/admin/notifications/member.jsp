<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Email Template</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <style>
            .pro-pic{
                height: 400px;
                width: 400px;
                margin-bottom: 20px;
            }
            .main{
                margin: auto;
                text-align: center;
            }

        </style>

    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="#" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Thames IT Club
            </a>
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <button href="#" class="navbar-btn sidebar-toggle tog" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>

                </button>


                <button class="btn btn-dark pull-right" id="btn-logout">Sign out</button>

            </nav>
            <form id="logout-form" method="post" action="${SITE_URL}/j_spring_security_logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>

        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${SITE_URL}/static/${proPic.picture}" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, ${member.firstName}</p>

                            <a href="javascript:void()[0]"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="${SITE_URL}/dashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/members">
                                <i class="fa fa-user"></i> <span>Members</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/meetings">
                                <i class="fa fa-users"></i> <span>Meeting</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/events">
                                <i class="fa fa-calendar"></i> <span>Events</span> 
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="javascript:void()[0]">
                                <i class="fa fa-envelope"></i> <span>Messages</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${SITE_URL}/dashboard/messages"><i class="fa fa-envelope"></i> Contact-Form</a></li>
                                <li><a href="${SITE_URL}/dashboard/mail"><i class="fa fa-envelope-o"></i> Email Templates</a></li>
                            </ul>
                        </li>

                        <li>
                            <a href="${SITE_URL}/dashboard/accounts">
                                <i class="fa fa-envelope"></i> <span>Club Accounts</span> 
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/calendar">
                                <i class="fa fa-envelope"></i> <span>Calendar</span> 
                            </a>
                        </li>



                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content main">
                    
                    <img src="${SITE_URL}/static/${picture.picture}" class="pro-pic" />
                    
                    <div>
                        <table class="table table-striped">
                            <tr>
                                <th>Name</th>
                                <th>:</th>
                                <td>${mem.firstName} ${mem.lastName}</td>
                            </tr>
                            <tr>
                                <th>Username</th>
                                <th>:</th>
                                <td>${mem.username}</td>
                            </tr>
                            <tr>
                                <th>Designation</th>
                                <th>:</th>
                                <td>${mem.designation}</td>
                            </tr>
                            <tr>
                                <th>Stream</th>
                                <th>:</th>
                                <td>${mem.stream}</td>
                            </tr>
                            <tr>
                                <th>Semester</th>
                                <th>:</th>
                                <td>${mem.semester}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <th>:</th>
                                <td>${mem.email}</td>
                            </tr>
                            <tr>
                                <th>Contact No</th>
                                <th>:</th>
                                <td>${mem.contactNo}</td>
                            </tr>
                            <tr>
                                <th>Added Date</th>
                                <th>:</th>
                                <td>${mem.addedDate}</td>
                            </tr>
                            <tr>
                                <th>Status</th>
                                <th>:</th>
                                <td>${mem.status}</td>
                            </tr>
                            
                        </table>
                    </div>
                   

                </section>
            </aside>

           




            <!-- jQuery 2.0.2 -->
            <script src="${SITE_URL}/static/vendor/jquery/jquery.min.js"></script>
            <!-- jQuery UI 1.10.3 -->
            <script src="${SITE_URL}/static/vendor/jquery/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
            <!-- Bootstrap -->
            <script src="${SITE_URL}/static/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


            <script src="${SITE_URL}/static/js/app.js" type="text/javascript"></script>

            <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
            <script src="${SITE_URL}/static/js/dashboard.js" type="text/javascript"></script>        




            <script>
                $(document).ready(function () {
                    $('#btn-logout').click(function () {
                        $('#logout-form').submit();
                    });
                });
            </script>

            <script>
                $(document).ready(function () {
                    $(".treeview").click(function () {
                        $(".treeview-menu").toggle();
                    });

                });

            </script>
            
             <script>
            function editPost(id){
                $.getJSON("${SITE_URL}/graph/posts/" + id, function (res) {
                    $("#post-body").val(res.postBody);
                    $("#post-id").val(res.postId);
                    $("#modal-edit-post").modal();
                });
            }
        </script>
        
         <script>
            function editComment(id){
                $.getJSON("${SITE_URL}/graph/comments/" + id, function (res) {
                    $("#comment").val(res.comment);
                    $("#comment-id").val(res.commentId);
                    $("#postId").val(res.postId.postId);
                    $("#modal-edit-comment").modal();
                });
            }
        </script>

    </body>
</html>