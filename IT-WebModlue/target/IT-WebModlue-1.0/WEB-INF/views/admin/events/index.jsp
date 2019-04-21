<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Events</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        
        <style>
            .text-area{
                height: 600px;
                overflow: scroll;
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
                        <li class="active">
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
                        Events
                        <small>Control panel</small>
                    </h1>

                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="col-2"></div>
                    <div class="col-10">
                          <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_VICE_PRESIDENT','ROLE_SECRETARY','ROLE_EXECUTIVE_MEMBER','ROLE_PROGRAM_CO-ORDINATOR')">

                        <a href="${SITE_URL}/dashboard/events/add" class="btn btn-secondary btn-flat pull-right" id="btn-add">Add Events</a> 
                          </sec:authorize>
                        <table class="table table-bordered table-sm">
                            <tr class="bg-navy">
                                <th>View</th>
                                <th>Event ID</th>
                                <th>Title</th>
                                <th>Date</th>
                               <th>Action</th>

                            </tr>
                            <c:forEach var="event" items="${events}">
                                <tr>
                                    <td>
                                        <a href="#" class="btn btn-success btn-sm view" onclick="showDialog(${event.eventId})" data-toggle="modal" data-target=".bd-example-modal-lg">View</a>
                                    </td>
                                    <td>${event.eventId}</td>
                                    <td>${event.eventTitle}</td>
                                    <td>${event.eventDate}</td>
                                    <td>
                                          <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_VICE_PRESIDENT','ROLE_SECRETARY','ROLE_EXECUTIVE_MEMBER','ROLE_PROGRAM_CO-ORDINATOR')">
                                            <a href="${SITE_URL}/dashboard/events/edit/${event.eventId}" class="btn btn-warning btn-sm">Edit</a>
                                             <sec:authorize access="hasAnyRole('ROLE_SECRETARY','ROLE_PROGRAM_CO-ORDINATOR')">   
                                            <a onClick="messageDialog()" class="btn bg-maroon btn-sm">Invite</a>
                                            </sec:authorize>
                                            <sec:authorize access="hasRole('ROLE_PROGRAM_CO-ORDINATOR')">  
                                                <a href="${SITE_URL}/dashboard/events/delete/${event.eventId}" class="btn btn-danger btn-sm">Delete</a>
                                            </sec:authorize>
                                            <!--delete button modal checking is remaining-->
                                        </sec:authorize>
                                             <a href="${SITE_URL}/dashboard/events/accounts/${event.eventId}" class="btn bg-gray btn-sm">Accounts</a>
                                             <a href="${SITE_URL}/dashboard/events/team/${event.eventId}" class="btn bg-black btn-sm">Team</a>
                                    </td>
                                </tr>
                            </c:forEach>


                        </table>




                    </div>


                </section>
            </aside>
        </div>





        <!-- Modal -->
        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-uppercase text-center" id="dialog-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="event-image" >

                        </div>

                        <div style="margin-top: 20px">

                            <p id="event-body"></p>
                        </div>
                        <div>
                            <ul class="event-details">

                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" id="btn-close" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        
        
         <div id="modal-email" class="modal fade bd-example-modal-lg  " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg"  role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="${SITE_URL}/dashboard/events/mailInvite">
                            <div class="modal-body">
                                <div class="form-group ">
                                    <label for="recipient-name"  class="form-control-label ">Send To</label>
                                    <select class="form-control" name="recipients" required="required">
                                        <option value="all">All Members</option>
                                        <option value="general">General Members</option>
                                        <option value="board">Board Members</option>


                                    </select>
                                </div>

                                <div class="form-group ">
                                    <label for="title-text"  class="form-control-label ">Subject</label>
                                    <input type="text" class="mail-title form-control" name="mail-title"/>
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="form-control-label">Message:</label>
                                    <textarea class="form-control text-area mail-message" name="mail-message" id="message-text"></textarea>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button  type="submit" class="btn btn-success">Send message</button>
                            </div>
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
                                            function showDialog(id) {
                                                $.getJSON("${SITE_URL}/graph/events/" + id, function (res) {
                                                    $("#dialog-title").html(res.eventTitle);
                                                    $(".event-image").html("<img src='${SITE_URL}/static/" + res.eventImage + "' width='600px' height='400px'/>");
                                                    $("#event-body").html(res.eventDescription);
                                                    $(".event-details").html("<li><b>Date: </b>" + res.eventDate + "</li>"
                                                            + "<li><b>Venue: </b>" + res.eventVenue + "</li>"
                                                            + "<li><b>Co-Ordinator: </b>" + res.eventcoOrdinator + "</li>");
                                                    $("#dialog").modal();
                                                });
                                            }
        </script>

<script>
            $(document).ready(function () {
                $('#btn-logout').click(function () {
                    $('#logout-form').submit();
                });
            });
        </script>
        <script>
            function messageDialog() {
                 $.getJSON("${SITE_URL}/graph/emailTemplates/3", function (res) {


              $(".mail-title").val(res.templateTitle);
              $(".mail-message").val(res.templateBody);
              $("#modal-email").modal();
            });
     }
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