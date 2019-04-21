<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club| Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="${SITE_URL}/static/css/ionicons.min.css" rel="stylesheet" type="text/css" />

        <style>
            .image-pro {
                position: relative;
                margin-top: 50px;
                width: 250px;
                height: 250px;
                display: inline-block;
                margin-right: 20px;

            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0);
                transition: background 0.5s ease;
            }

            .image-pro:hover .overlay {
                display: block;
                background: rgba(0, 0, 0, .3);
            }

            .img-pro {
                position: absolute;
                width: 250px;
                height: 250px;
                left: 0;

            }


            .image-pro:hover .title {
                top: 70px;
            }

            .button {
                position: absolute;
                width: 250px;
                left:0;
                top: 120px;
                text-align: center;
                opacity: 0;
                transition: opacity .35s ease;
            }

            .button a {
                width: 200px;
                padding: 12px 48px;
                text-align: center;
                color: white;
                border: solid 2px white;
                z-index: 1;
            }

            .image-pro:hover .button {
                opacity: 1;
            }
            .comments{
                padding-top: 10px;
                padding-left: 10px;
                padding-right: 10px;
                margin-left: 40px;
                margin-right: 40px;
                border: 1px solid #b2b2b2;

            }
            .comment-section{
                border-bottom: 1px solid lightblue;
                margin-bottom: 40px;
            }
            .comment-input{
                height: 35px;
                width: 80%;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 15px;
            }
            .comment-button{
                margin-right: 10px;

            }

            .notification-item{
                background: #e8f4f8;
                border: 1px solid lavender;
                border-radius: 10% 10%;
                padding-top: 10px;
                padding-right: 5px;
                padding-left: 10px;
                margin-bottom: 10px;

            }
            .notification-content{
                font-size: 14px;
            }


        </style>

    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="${SITE_URL}" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Thames IT Club
            </a>
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
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
                        <li class="active">
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
                                <i class="fa fa-table"></i> <span>Events</span> 
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
                                <i class="fa fa-balance-scale"></i> <span>Club Accounts</span> 
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/calendar">
                                <i class="fa fa-calendar"></i> <span>Calendar</span> 
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
                        Dashboard
                        <small>Control panel</small>
                    </h1>

                </section>

                <!-- Main content -->
                <section class="content">

                    <div class="row">
                        <div class="col-3">

                            <div class="image-pro" >
                                <img class="img-pro" src="${SITE_URL}/static/${proPic.picture}" alt="" />
                                <div class="overlay"></div>
                                <div class="button"><a href="javascript:void()[0]" id="btn-change-profilePic" > Change Profile Picture </a></div>
                            </div>




                        </div>
                        <div class="col-6">
                            <div class="box box-solid">
                                <div class="box-header" data-toggle="tooltip" title="Header tooltip">
                                    <h3 class="box-title">Personal Info</h3>

                                </div>

                                <div class="box-body">
                                    <h4>${member.firstName} ${member.lastName}</h4>
                                    <h5>${member.stream} ${member.semester} semester</h5>
                                    <p>

                                        <i>Member ID :</i> ${member.memberId}<br>
                                        <i>Email :</i> ${member.email}<br>
                                        <i>Contact No :</i> ${member.contactNo}<br>
                                        <i>Username :</i> ${member.username}<br>
                                        <i>Joined on :</i> ${member.addedDate}

                                    </p>
                                </div><!-- /.box-body -->

                            </div><!-- /.box -->





                        </div><!-- /.col -->




                        <div class="col-3">
                            <div class="small-box bg-light-blue">
                                <div class="inner">
                                    <h4>
                                        ${member.username}
                                    </h4>
                                    <p>
                                        ${member.designation}
                                    </p>

                                </div>

                                <a href="javascript:void()[0]" id="btn-settings" class="small-box-footer">
                                    settings <i class="fa fa-cog"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">

                            <!-- TO DO List -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <i class="ion ion-alert"></i>
                                    <h3 class="box-title">Notifications</h3>
                                    <div class="box-tools pull-right">

                                    </div>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <c:forEach begin="0" end="4" var="notification" items="${notification}">
                                        <div class="notification-item">
                                            <span class="time pull-right"><i class="fa fa-clock-o"></i>${notification.addedDate}</span><br>
                                            <div>
                                                <i class="fa ${notification.notificationIcon} ${notification.buttonColor}" style="margin-right: 10px;"></i>
                                                <a href="javascript:void()[0]"> <b> ${notification.memberName} </b></a>
                                            </div>
                                            <div>
                                                <p class="notification-content"> ${notification.notification}</p>
                                                <a  href="${SITE_URL}/${notification.link}">${notification.buttonText}</a>
                                            </div>

                                        </div>
                                    </c:forEach>

                                </div><!-- /.box-body -->
                                <div class="box-footer clearfix no-border">
                                    <a href="${SITE_URL}/dashboard/notifications" class="btn bg-blue pull-right"> Show All</a>
                                </div>
                            </div><!-- /.box -->



                        </div>

                        <div class="col-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"><i class="fa fa-comments-o"></i> News Feed</h3>

                                </div>
                                <div class="box-body chat" id="chat-box">

                                    <div class="box box-solid" style="margin-bottom: 50px">
                                        <div class="box-header" data-toggle="tooltip" title="Header tooltip">
                                            <h3 class="box-title">Create New Post</h3>
                                            <div class="box-tools pull-right">
                                                <button id="profile-minimize" class="btn btn-primary btn-xs" data-widget="collapse"><i class="fa fa-plus"></i></button>

                                            </div>
                                        </div>
                                        <div   id="profile-box" class="box-body">
                                            <form method="post" action="${SITE_URL}/dashboard/newPost/save">
                                                <textarea class="form-control text-area" name="postBody" id="message-text"></textarea>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button class=" pull-right btn btn-primary" type="submit">Post</button>
                                            </form>
                                        </div><!-- /.box-body -->
                                    </div><!-- /.b
                                    --> 
                                    <!-- chat item -->
                                    <c:forEach var="post" items="${post}">
                                        <div class="item" style="border-bottom: 1px solid lightblue; margin-bottom: 40px">
                                            <img src="${SITE_URL}/static/${post.pictureId.getPicture()}" alt="user image" class=""/>
                                            <p class="message">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${post.addedDate} </small>
                                                <a href="#" class="name">
                                                    ${post.memberId.firstName} ${post.memberId.lastName}
                                                </a>
                                                ${post.postBody}
                                            </p>
                                            <c:if test="${post.memberId.getMemberId() == member.memberId}">
                                                <div>
                                                    <a href="${SITE_URL}/dashboard/newPost/delete/${post.postId}" class="pull-right btn">Delete</a>
                                                    <a href="javascript:void()[0]" onClick="editPost(${post.postId})" class="pull-right btn">Edit</a>

                                                </div>
                                            </c:if>
                                            <div>
                                                <a href="javascript:void()[0]" onclick="showComments(${post.postId})" class="btn pull-left btn-comments">Comments</a>
                                            </div>

                                        </div><!-- /.item -->
                                        <div class="comment-section" id="${post.postId}">
                                            <div>
                                                <form method="post" action="${SITE_URL}/dashboard/comment/save">
                                                    <input type="text" name="comment" class="comment-input" placeholder="Comment"required="required" />
                                                    <input type="hidden" name="id" value="${post.postId}"/>
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                    <button type="submit" class="btn btn-xs btn-default">Post</button>
                                                </form>
                                            </div>
                                            <c:forEach var="comment" items="${comments}">
                                                <c:if test="${comment.postId.getPostId() == post.postId}">
                                                    <div class="comments item">
                                                        <img src="${SITE_URL}/static/${comment.pictureId.getPicture()}" alt="user image" height="50px" width="50px" class="img-circle"/>
                                                        <p class="message">
                                                            <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${comment.addedDate} </small>
                                                            <a href="#" class="name">
                                                                ${comment.memberId.getFirstName()} ${comment.memberId.getLastName()}
                                                            </a>
                                                            ${comment.comment}


                                                            <c:if test="${comment.memberId.getMemberId() == member.memberId}">
                                                            <div>
                                                                <a href="javascript:void()[0]" onClick="editComment(${comment.commentId})" class="pull-left comment-button">Edit</a>
                                                                <a href="${SITE_URL}/dashboard/comment/delete/${comment.commentId}" class="pull-left comment-button">Delete</a>

                                                            </div>
                                                        </c:if>
                                                        </p>

                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>


                                </div><!-- /.chat -->

                            </div><!-- /.box (chat box) -->
                        </div>

                    </div>





                </section>
            </aside>
        </div>


        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title text-uppercase text-center">Settings </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form class="form " method="post" action="${SITE_URL}/dashboard/update">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-4 avataar">
                                    <ul>
                                        <li>  <a id="btn-personalSettings" class="btn btn-default">Personal settings</a></li>
                                        <li> <a id="btn-accountSettings" class="btn btn-default">Accounts settings</a></li>
                                    </ul>

                                </div>

                                <div class="col-8">

                                    <div id="accounts-info">
                                        <h2>Accounts Settings</h2>
                                        <div class="form-group">
                                            <label>Username</label>
                                            <small class="form-text text-muted">please logout and login again after changing your username or password</small>
                                            <input type="text" name="username" class="form-control" required="required" value="${member.username}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" required="required"  value="${member.password}" />
                                        </div>

                                    </div>
                                    <div id="personal-info">
                                        <h2>Personal Settings</h2>
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <input type="text" class="form-control" name="firstName" required="required"  value="${member.firstName}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" name="lastName" required="required"  value="${member.lastName}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" name="email" required="required"  value="${member.email}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Contact Number</label>
                                            <input type="tel" class="form-control" name="contactNo" required="required" value="${member.contactNo}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Stream</label>
                                            <select class="form-control" name="stream" required="required">
                                                <option value="${member.stream}">${member.stream}</option>
                                                <option>BIM</option>
                                                <option>BBA</option>
                                                <option>BSW</option>
                                                <option>BBS</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Semester</label>
                                            <select class="form-control" name="semester" required="required">
                                                <option value="${member.semester}">${member.semester}</option>
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
                                            <input type="text" name="status" class="form-control" required="required" value="${member.status}"/>
                                        </div>
                                    </div>
                                    <input type="hidden" name="designation" value="${member.designation}"/>
                                    <input type="hidden" name="memberId" value="${member.memberId}"/>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>




                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" id="btn-close" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>    


        <div class="modal" tabindex="-1" role="dialog" id="modal-change-profilePic">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Upload Profile Picture</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="${SITE_URL}/dashboard/uploadProfilePic" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Upload Profile Picture</label>
                                <label class="sm text-success">( Please insert the image you want to upload)</label>
                                <input type="file" name="file"  class="form-control" required="required"/>
                            </div>
                            <input type="hidden" name="pictureId" value="${proPic.pictureId}"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Upload</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Post Edit Modal -->
        <div class="modal" tabindex="-1" role="dialog" id="modal-edit-post">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="${SITE_URL}/dashboard/newPost/update">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Post</label>     
                                <textarea type="text" name="postBody" id="post-body"  class="form-control" required="required"></textarea>
                            </div>
                            <input type="hidden" name="postId" id="post-id" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="post_id" id="post_id" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="submit" id="post-btn" class="btn btn-primary">Save Changes</button>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Comment Edit Modal -->
        <div class="modal" tabindex="-1" role="dialog" id="modal-edit-comment">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Comment</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post" action="${SITE_URL}/dashboard/comment/update">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Comment</label>     
                                <textarea type="text" name="comment" id="comment"  class="form-control" required="required"></textarea>
                            </div>
                            <input type="hidden" name="commentId" id="comment-id" />
                            <input type="hidden" name="id" id="postId" />
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" name="comment_id" id="comment_id" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>

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
                                                                    $(document).ready(function () {
                                                                        $('#btn-logout').click(function () {
                                                                            $('#logout-form').submit();
                                                                        });

                                                                        $('#btn-settings').click(function () {
                                                                            $('#dialog').modal();
                                                                        });

                                                                        $('#profile-box').hide();

                                                                        $('#profile-minimize').click(function () {
                                                                            $('#profile-box').slideToggle();
                                                                        });

                                                                        $('#btn-profile-picture').hide();
                                                                        $('#img-link').hover(function () {
                                                                            $('#btn-profile-picture').show();
                                                                        });

                                                                        $('#btn-change-profilePic').click(function () {
                                                                            $('#modal-change-profilePic').modal();
                                                                        });

                                                                    });
        </script>

        <script>
            $(document).ready(function () {
                $('#accounts-info').hide();
                $(".comment-section").hide();

                $('#btn-accountSettings').click(function () {
                    $('#accounts-info').show();
                    $('#personal-info').hide();
                });

                $('#btn-personalSettings').click(function () {
                    $('#personal-info').show();
                    $('#accounts-info').hide();
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
            function editPost(id) {
                
                $.getJSON("${SITE_URL}/graph/posts/" + id, function (res) {                
                    $("#post-body").val(res.postBody);
                    $("#post-id").val(res.postId);
                    $("#post_id").val(id);
                    $("#modal-edit-post").modal();
                    
                });
            }
        </script>

        <script>
            function editComment(id) {
                $("#comment_id").val(id);
                $.getJSON("${SITE_URL}/graph/comments/" + id, function (res) {
                    $("#comment").val(res.comment);
                    $("#comment-id").val(res.commentId);
                    $("#postId").val(res.postId.postId);
                    $("#modal-edit-comment").modal();
                });
            }
        </script>

        <script>
            function showComments(id) {
                $.getJSON("${SITE_URL}/graph/posts/" + id, function (res) {
                    var post = "#" + res.postId;
                    $(post).slideToggle();
                });
            }
        </script>

    </body>
</html>