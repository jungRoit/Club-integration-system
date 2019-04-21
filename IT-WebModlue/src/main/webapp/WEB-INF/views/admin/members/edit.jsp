<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />


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
                        <li class="active">
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
                <section class="content-header">
                    <h1>
                        Members
                        <small>Control panel</small>
                    </h1>

                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="col-8">
                        <a href="${SITE_URL}/dashboard/members/" class="btn btn-secondary btn-flat pull-right">Back</a> <br>
                        
                        <form class="form " method="post" action="${SITE_URL}/dashboard/members/update" id="members">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" class="form-control" required="required" value="${members.username}"/>
                        </div>
                        <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_SECRETARY','ROLE_VICE_PRESIDENT')">
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control" required="required"  value="${members.password}"/>
                        </div>
                        </sec:authorize>
                            <sec:authorize access="hasAnyRole('ROLE_EXECUTIVE_MEMBER')">
                                 <input type="hidden" name="password" class="form-control" required="required"  value="${members.password}"/>
                            </sec:authorize>
                        <div class="form-group">
                            <label>Designation</label>
                            <select class="form-control" name="designation" required="required">
                                <option value="${members.designation}">${members.designation}</option>
                                <option value="ROLE_GENERAL_MEMBER">General Member</option>
                                <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_SECRETARY')">
                                <option value="ROLE_EXECUTIVE_MEMBER">Executive Member</option>
                                <option value="ROLE_PRESIDENT">President</option>
                                <option value="ROLE_VICE_PRESIDENT">Vice President</option>
                                <option value="ROLE_SECRETARY">Secretary</option>
                                <option value="ROLE_TREASURER">Treasure</option>
                                <option value="ROLE_PROGRAM_CO-ORDINATOR">Program Co-Ordinator</option>
                                </sec:authorize>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" class="form-control" name="firstName" required="required"  value="${members.firstName}"/>
                        </div>
                         <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="lastName" required="required"  value="${members.lastName}"/>
                        </div>
                         <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" required="required"  value="${members.email}"/>
                        </div>
                         <div class="form-group">
                            <label>Contact Number</label>
                            <input type="tel" class="form-control" name="contactNo" required="required" value="${members.contactNo}"/>
                        </div>
                         <div class="form-group">
                            <label>Stream</label>
                            <select class="form-control" name="stream" required="required">
                                <option value="${members.stream}">${members.stream}</option>
                                <option>BIM</option>
                                <option>BBA</option>
                                <option>BSW</option>
                                <option>BBS</option>
                            </select>
                        </div>
                         <div class="form-group">
                            <label>Semester</label>
                              <select class="form-control" name="semester" required="required">
                                  <option value="${members.semester}">${members.semester}</option>
                                <option>First</option>
                                <option>Second</option>
                                <option>Third</option>
                                <option>Fourth</option>
                                <option>Fifth</option>
                                <option>Sixth</option>
                                <option>Seventh</option>
                                <option>Eighth</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <input type="text" name="status" class="form-control" required="required" value="${members.status}"/>
                        </div>
                        <input type="hidden" name="memberId" value="${members.memberId}"/>
                         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <button type="reset" class="btn btn-danger">Clear</button>
                        <button type="submit" class="btn btn-success">Save</button>
                        </form>
                        
                        
            
              

                    </div>
                </section>
            </aside>
        </div>





       

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
                $(".treeview").click(function(){
                    $(".treeview-menu").toggle();
                });
                
            });
            
        </script>
            
          


    </body>
</html>