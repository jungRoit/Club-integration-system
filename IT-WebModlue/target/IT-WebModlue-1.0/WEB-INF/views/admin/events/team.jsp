<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | event</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <style>


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




                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_VICE_PRESIDENT','ROLE_SECRETARY','ROLE_EXECUTIVE_MEMBER','ROLE_PROGRAM_CO-ORDINATOR')">

                        <a href="javascript:void()[0]" class="btn btn-secondary btn-flat pull-right" id="btn-add">Add Member</a> 
                    </sec:authorize>

                    <div>
                        <table id="table-team" class="table table-bordered">
                            <tr class="bg-navy">
                                <th>Role</th>
                                <th>Member</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach var="team" items="${eventTeam}">
                                <tr>
                                    <td>${team.role}</td>
                                    <td>${team.memberName}</td>
                                    <td>${team.description}</td>
                                    <td>
                                        <a href="javascript:void()[0]" onclick="editTeam(${team.id})" class="btn btn-warning">Edit</a>
                                        <a href="${SITE_URL}/dashboard/events/team/delete/${team.id}" class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>




                        <form id="form-team" method="post" action="${SITE_URL}/dashboard/events/team/save">
                            <div class="form-group" >
                                <label >Role</label>
                                <input type="text" class="form-control"name="role" required="required">
                            </div>
                            <div class="form-group" >
                                <label >Member Name</label>
                                <input type="text" class="form-control"name="memberName" required="required">
                            </div>
                            <div class="form-group" >
                                <label >Description</label>
                                <textarea class="form-control"name="description" required="required">
                                </textarea>
                            </div>
                            <input type="hidden" name="eId" value="${event.eventId}"/>
                            <input type="hidden" name="transactionType" value="income"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button id="btn-cancel" type="button" class="btn btn-danger">Cancel</button>
                            <button type="submit" class="btn btn-success btn-submit">Submit</button>
                        </form>
                     </div>
                </section>
            </aside>
                            
            <div class="modal" tabindex="-1" role="dialog" id="modal-edit">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Team Member</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                     <form id="form-team" method="post" action="${SITE_URL}/dashboard/events/team/update">
                            <div class="form-group" >
                                <label style="margin-left: 20px">Role</label>
                                <input id="role" type="text" class="form-control"name="role" required="required">
                            </div>
                            <div class="form-group" >
                                <label style="margin-left: 20px" >Member Name</label>
                                <input id="member-name" type="text" class="form-control"name="memberName" required="required">
                            </div>
                            <div class="form-group" >
                                <label >Description</label>
                                <textarea id="description" class="form-control"name="description" required="required">
                                </textarea>
                            </div>
                            <input type="hidden" name="eId" value="${event.eventId}"/>
                            <input id="team-id" type="hidden" name="id"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button id="btn-cancel" type="button" class="btn btn-danger">Cancel</button>
                            <button type="submit" class="btn btn-success btn-submit">Submit</button>
                        </form>
                    
                </div>
            </div>
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
                    $(".treeview").click(function () {
                        $(".treeview-menu").toggle();
                    });

                });

            </script>

            <script>
                $(document).ready(function () {
                    $("#form-team").hide();
                    $("#btn-add").click(function () {
                        $("#form-team").show();
                        $("#table-team").hide();

                    });

                    $("#btn-cancel").click(function () {
                        $("#form-team").hide();
                        $("#table-team").show();

                    });
                });
            </script>
            
            <script>
             function editTeam(id){
                    $.getJSON("${SITE_URL}/graph/eventTeam/"+id,function (res) {
                       $("#role").val(res.role);
                       $("#member-name").val(res.memberName);
                       $("#description").val(res.description);
                       $("#team-id").val(res.id);
                       
                       $("#modal-edit").modal();
                    });
                }
            </script>







    </body>
</html>