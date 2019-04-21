<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Accounts</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="${SITE_URL}/static/css/calculator.css" rel="stylesheet" type="text/css" />


        <style>
            @media only screen and (max-width:600px){

                .phone-calc{
                    display: none;
                }
                [class *="col-"]{
                    margin-right: 50%;
                }

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

                        <li class="active">
                            <a href="${SITE_URL}/dashboard/accounts">
                                <i class="fa fa-balance-scale"></i> <span>Club Accounts</span> 
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
                        Club Accounts
                        <small>Control panel</small>
                    </h1>

                </section>



                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-4">
                            <h1>Incomes</h1>
                            <sec:authorize access="hasRole('ROLE_TREASURER')">
                                <a href="javascript:void()[0]" id="btn-income" class="btn btn-secondary btn-flat pull-right">Add Income</a> 
                            </sec:authorize>
                                 <a href="javascript:void()[0]" class="btn bg-maroon btn-export  pull-left" id="mail-income">send-mail</a>
                            <a href="${SITE_URL}/dashboard/accounts/exportIncome"   class="btn bg-yellow btn-export  pull-right">Export</a> 

                            <table style="overflow: scroll" id="table-income" class="table  table-bordered table-sm ">

                                <tr class="bg-navy">
                                    <th>ID</th>
                                    <th>Particular</th>
                                    <th>Amount</th>
                                    <th>remarks</th>
                                </tr>

                                <c:forEach var="accountIncome" items="${accountIncome}">
                                    <tr>
                                        <td>${accountIncome.transactionId}</td>
                                        <td>${accountIncome.transactionTitle}</td>
                                        <td>${accountIncome.amount}</td>
                                        <td>${accountIncome.remarks}</td>

                                    </tr>
                                </c:forEach>

                                <tr>
                                    <th colspan="3" class="bg-navy">Total</th>
                                    <td>Rs ${income}</td>
                                </tr>
                            </table>

                            <form id="form-income" method="post" action="${SITE_URL}/dashboard/accounts/save">
                                <div class="form-group" >
                                    <label >Particular</label>
                                    <input type="text" class="form-control"name="transactionTitle" required="required">
                                </div>
                                <div class="form-group">
                                    Amount: <input type="text" class=" col-5"name="amount" required="required" placeholder="Rs:">
                                    <small class="form-text text-muted">Amount in Rupees</small>
                                </div>
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <input type="text" class="form-control "name="remarks" >
                                    <small class="form-text text-muted">Optional</small>
                                </div>
                                <div class="form-group">
                                    <label>Event</label>
                                    <select class="form-control "name="eId" >
                                        <option value="0">None</option>
                                        <c:forEach var="event" items="${events}">
                                            <option value="${event.eventId}" >${event.eventTitle}</option>
                                        </c:forEach>

                                    </select>
                                    <small class="form-text text-muted">Select None if it is not associated with any Event</small>
                                </div>
                                <input type="hidden" name="transactionType" value="income"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button id="btn-cancel-in" type="button" class="btn btn-danger">Cancel</button>
                                <button type="submit" class="btn btn-success btn-submit">Submit</button>
                            </form>
                        </div>


                        <div class="col-4">
                            <h1>Expenditures</h1>
                            <sec:authorize access="hasRole('ROLE_TREASURER')">
                                <a id="btn-expenditure" href="#" class="btn btn-secondary btn-flat pull-right">Add Expense</a> 
                            </sec:authorize>
                                <a href="javascript:void()[0]" class="btn bg-maroon btn-export  pull-left" id="mail-exp">send-mail</a>
                            <a href="${SITE_URL}/dashboard/accounts/exportExpenses"  class="btn bg-yellow btn-export  pull-right">Export</a> 
                            <table style="overflow: scroll" id="table-expenditure" class="table  table-bordered table-sm">
                                <tr class="bg-navy">
                                    <th>ID</th>
                                    <th>Particular</th>
                                    <th>Amount</th>
                                    <th>remarks</th>



                                </tr>
                                <c:forEach var="accountExpenses" items="${accountExpenses}">
                                    <tr>
                                        <td>${accountExpenses.transactionId}</td>
                                        <td>${accountExpenses.transactionTitle}</td>
                                        <td>${accountExpenses.amount}</td>
                                        <td>${accountExpenses.remarks}</td>

                                    </tr>
                                </c:forEach>
                                <tr>
                                    <th colspan="3" class="bg-navy">Total</th>
                                    <td>Rs ${expenditure}</td>
                                </tr>

                            </table>

                            <form id="form-expenditure"  method="post" action="${SITE_URL}/dashboard/accounts/save">
                                <div class="form-group" >
                                    <label >Particular</label>
                                    <input type="text" class="form-control"name="transactionTitle" required="required">
                                </div>
                                <div class="form-group">
                                    Amount: <input type="text" class=" col-5"name="amount" required="required" placeholder="Rs:">
                                    <small class="form-text text-muted">Amount in Rupees</small>
                                </div>
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <input type="text" class="form-control "name="remarks" />
                                    <small class="form-text text-muted">Optional</small>
                                </div>
                                <div class="form-group">
                                    <label>Event</label>
                                    <select class="form-control "name="eId" >
                                        <option value="0">None</option>
                                        <c:forEach var="event" items="${events}">
                                            <option value="${event.eventId}" >${event.eventTitle}</option>
                                        </c:forEach>

                                    </select>
                                    <small class="form-text text-muted">Select None if it is not associated with any Event</small>
                                </div>
                                <input type="hidden" name="transactionType" value="expenditure"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button id="btn-cancel-exp" type="button" class="btn btn-danger">Cancel</button>
                                <button type="submit" class="btn btn-success">Submit</button>
                            </form>
                        </div>
                        <div class="col-4 calc">
                            <div>
                                <table class="table table-responsive-lg table-bordered">
                                    <tr>
                                        <th class="bg-green" >Current Balance</th>
                                        <td>Rs ${currentBalance}</td>
                                    </tr>
                                </table>
                            </div>

                            <sec:authorize access="hasAnyRole('ROLE_TREASURER','ROLE_PRESIDENT','ROLE_VICE_PRESIDENT','ROLE_SECRETARY')">



                                <div id="calculator" class="calculator">

                                    <button id="clear" class="clear cal-button">C</button>

                                    <div id="viewer" class="viewer">0</div>

                                    <button class="num cal-button" data-num="7">7</button>
                                    <button class="num cal-button" data-num="8">8</button>
                                    <button class="num cal-button" data-num="9">9</button>
                                    <button data-ops="plus" class="ops cal-button">+</button>

                                    <button class="num cal-button" data-num="4">4</button>
                                    <button class="num cal-button" data-num="5">5</button>
                                    <button class="num cal-button" data-num="6">6</button>
                                    <button data-ops="minus" class="ops cal-button">-</button>

                                    <button class="num cal-button" data-num="1">1</button>
                                    <button class="num cal-button" data-num="2">2</button>
                                    <button class="num cal-button" data-num="3">3</button>
                                    <button data-ops="times" class="ops cal-button">*</button>

                                    <button class="num cal-button" data-num="0">0</button>
                                    <button class="num cal-button" data-num=".">.</button>
                                    <button id="equals" class="equals cal-button" data-result="">=</button>
                                    <button data-ops="divided by" class="ops cal-button">/</button>
                                </div>

                                <button id="reset" class="reset cal-button phone-calc">Reset Universe?</button>
                                <!--                            </div>-->
                            </sec:authorize>

                        </div>

                    </div>
                    <div class="row">


                    </div>

                </section>
            </aside>
        </div>


                                                        
         <div class="modal fade" id="email-modal-exp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Expenditure Email</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="${SITE_URL}/dashboard/accounts/expenditure/mail">
                    <div class="modal-body">
                        
                            <div class="form-group ">
                                <label for="recipient-name"  class="form-control-label ">Recipient:</label>
                                 <small class="form-text text-muted">Enter Email of the Recipient</small>
                                <input type="text" name="recipient" class="form-control recipient" id="recipient-name"/>
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
                    
                    
                      <div class="modal fade" id="email-modal-inc" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Income Email</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="${SITE_URL}/dashboard/accounts/income/mail">
                    <div class="modal-body">
                        
                            <div class="form-group ">
                                <label for="recipient-name"  class="form-control-label ">Recipient:</label>
                                 <small class="form-text text-muted">Enter Email of the Recipient</small>
                                <input type="text" name="recipient" class="form-control recipient" id="recipient-name"/>
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
        <script src="${SITE_URL}/static/js/calculator.js" type="text/javascript"></script>  


        <script>
            $(document).ready(function () {
                $('#form-expenditure').hide();
                $('#btn-expenditure').click(function () {
                    $('#form-expenditure').show();
                    $('#table-expenditure').hide();
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#form-income').hide();
                $('#btn-income').click(function () {
                    $('#form-income').show();
                    $('#table-income').hide();
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#btn-cancel-exp').click(function () {
                    $('#form-expenditure').hide();
                    $('#table-expenditure').show();
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#btn-cancel-in').click(function () {
                    $('#form-income').hide();
                    $('#table-income').show();
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.btn-submit').click(function () {
                    $('#form-income').hide();
                    $('#form-expenditure').hide();
                    $('#table-income').show();
                    $('#table-expenditure').show();
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
                $('#btn-logout').click(function () {
                    $('#logout-form').submit();
                });
            });
        </script>
        
        <script>
            $(document).ready(function () {
                $("#mail-exp").click(function() {
                   $("#email-modal-exp").modal(); 
                });
                
                $("#mail-income").click(function() {
                   $("#email-modal-inc").modal(); 
                });
        
            });
            
        </script>
        





    </body>
</html>