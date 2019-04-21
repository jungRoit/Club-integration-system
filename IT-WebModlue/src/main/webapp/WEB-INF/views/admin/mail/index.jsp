<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Messages</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />


        <style>
            .msg{
                height: 150px;
                border: 1px solid #000;
            }
            .text-area{
                height: 600px;
                overflow:scroll;
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
                <button href="#" class="navbar-btn sidebar-toggle " data-toggle="offcanvas" role="button">
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

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
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
                        <li class="treeview active">
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
                        Mail Templates
                        <small>Control panel</small>
                    </h1>

                </section>
                <section class="content">
                    
                    <sec:authorize access="hasAnyRole('ROLE_PRESIDENT','ROLE_VICE_PRESIDENT','ROLE_SECRETARY')">
                    <!-- Main content -->
                    <div class="row">
                        <div class="col-10"></div>
                        <a href="${SITE_URL}/dashboard/mail/add" class="btn btn-secondary btn-flat pull-right">Add New Template</a> 
                    </div>

                    <div class="mailbox row">

                        <div class="col-12">

                            <div class="box box-solid">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-4">
                                            <!-- BOXES are complex enough to move the .box-header around.
                                                 This is an example of having the box header within the box body -->
                                            <div class="box-header">
                                                <i class="fa fa-inbox"></i>
                                                <h3 class="box-title">New Mail</h3>
                                            </div>
                                            <!-- compose message btn -->
                                            <a class="btn btn-block btn-primary" style="color: white" data-toggle="modal" data-target="#compose-modal"><i class="fa fa-pencil"></i> Compose Mail</a>
                                            <!-- Navigation - folders-->

                                        </div><!-- /.col (LEFT) -->
                                        <div class="col-md-9 col-sm-8">
                                            <div class="row pad">
                                                <div class="col-sm-6">
                                                    <label style="margin-right: 10px;">
                                                        <input type="checkbox" id="check-all"/>
                                                    </label>
                                                    Mail Templates


                                                </div>
                                                <div class="col-sm-6 search-form">
                                                    <form action="#" class="text-right">
                                                        <div class="input-group">                                                            
                                                            <input type="text" class="form-control input-sm" placeholder="Search">
                                                            <div class="input-group-btn">
                                                                <button type="submit" name="q" class="btn btn-sm btn-primary"><i class="fa fa-search"></i></button>
                                                            </div>
                                                        </div>                                                     
                                                    </form>
                                                </div>
                                            </div><!-- /.row -->

                                            <div class="table-responsive">
                                                <!-- THE MESSAGES -->
                                                <table class="table table-mailbox">
                                                    <c:forEach var="template" items="${templates}">
                                                        <tr class="unread">
                                                            <td>
                                                                <button onclick="messageDialog(${template.templateId})" class="btn btn-circle btn-success" data-toggle="modal" data-target=".bd-example-modal-lg">+</button>
                                                            </td>
                                                            <td class="name"><a href="#">${template.templateId}</a></td>
                                                            <td class="subject"><a href="#">${template.templateTitle}</a></td>
                                                            <td class="time">
                                                                <a href="${SITE_URL}/dashboard/mail/edit/${template.templateId}" class="btn btn-circle btn-warning" >-</a>
                                                                <a href="${SITE_URL}/dashboard/mail/delete/${template.templateId}" class="btn btn-circle btn-danger">x</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </table>
                                            </div><!-- /.table-responsive -->
                                        </div><!-- /.col (RIGHT) -->
                                    </div><!-- /.row -->
                                </div><!-- /.box-body -->
                                <div class="box-footer clearfix">

                                </div><!-- box-footer -->
                            </div><!-- /.box -->
                        </div><!-- /.col (MAIN) -->
                    </div>
                    </sec:authorize>



                      <sec:authorize access="hasAnyRole('ROLE_GENERAL_MEMBER','ROLE_TREASURER','ROLE_PROGRAM_CO-ORDINATOR')">
                    <section class="content" style="background-color: red">
                             <div >
                        <h1 style="color: white">Access Denied</h1>
                        <h2 style="color: white">You don't have access to view the contents of this page</h2>
                        <h3 style="color: white">Please contact the Administrator for further information</h3>
                    </div>
                    </section>
                         </sec:authorize>
                    
                </section>

            </aside>   






            <div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="${SITE_URL}/dashboard/mail/sendNew" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close pull-right" data-dismiss="modal" aria-hidden="true">&times;</button>

                            </div>

                            <h5 class="modal-title"><i class="fa fa-envelope-o pull-left"></i> Compose New Message</h5>

                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">TO:</span>
                                        <input name="to" type="text" class="form-control" placeholder="Email TO">
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">Subject</span>
                                            <input name="subject" type="text" class="form-control" placeholder="Subject">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <textarea style="height: 200px" name="message" id="email_message" class="form-control " placeholder="Message"></textarea>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                                </div>
                                <div class="modal-footer clearfix">

                                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                                    <button type="submit" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i> Send Message</button>
                                </div>

                            </div><!-- /.modal-content -->
                    </form>
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            </div>



           



                        <div class="modal fade bd-example-modal-lg" id="exampleModal"  tabindex="-1" role="dialog" aria-labelledmpleModalby="" aria-hidden="true">
                            <div class="modal-dialog modal-lg"  role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form method="post" action="${SITE_URL}/dashboard/mail/send">
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
                                                <input type="text" id="mail-title" class="form-control" name="mail-title"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="message-text" class="form-control-label">Message:</label>
                                                <textarea id="mail-message" class="form-control text-area" name="mail-message" id="message-text"></textarea>
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
                                                                    function messageDialog(id) {
                                                                        $.getJSON("${SITE_URL}/graph/emailTemplates/" + id, function (res) {
                                                                            $("#mail-title").val(res.templateTitle);
                                                                            $("#mail-message").val(res.templateBody);
                                                                            

                                                                        });
                                                                    }



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
              
                $('#btn-logout').click(function () {
                    $('#logout-form').submit();
                });
            });
            
                                                         
                                                                        
                                                                    
        </script>


    </body>
</html>