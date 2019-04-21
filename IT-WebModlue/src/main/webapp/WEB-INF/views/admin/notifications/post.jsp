<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Post</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <style>
            .comments{
                padding-top: 10px;
                padding-left: 10px;
                padding-right: 10px;
                margin-left: 40px;
                margin-right: 40px;
                border: 1px solid #b2b2b2;
                 margin-bottom:  15px;
                 border-radius: 3% 3% 8% 8%;

            }
            .comment-section{
                border-bottom: 1px solid lightblue;
                margin-bottom: 40px;
            }
            .comment-input{
                height: 35px;
                width: 80%;
                margin-left: 20px;
                margin-right: 25px;
            }
            .comment-button{
                margin-right: 10px;

            }
            .pro-pic{
                height: 50px;
                width: 50px;
                border-radius: 50%;
                margin-right: 10px;
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
                <section class="content">
                    
                    <div class="col-9">
                    
                    <div class="item" style="border-bottom: 1px solid lightblue; margin-bottom: 40px">
                        <p class="message">
                            <img src="${SITE_URL}/static/${post.pictureId.getPicture()}" alt="user image" class="pro-pic"/>

                            <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${post.addedDate} </small>
                            <a style="margin-right: 1500px" href="#" class="name">
                                ${post.memberId.firstName} ${post.memberId.lastName}
                            </a>

                            <i style="margin-left: 65px"> ${post.postBody}</i>
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
                                    <p class="message">
                                        <img src="${SITE_URL}/static/${comment.pictureId.getPicture()}" alt="user image" class="pro-pic"/>

                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${comment.addedDate} </small>
                                        <a style="margin-right: 1500px" href="#" class="name">
                                            ${comment.memberId.getFirstName()} ${comment.memberId.getLastName()}
                                        </a>
                                        <i style="margin-left: 65px"> ${comment.comment}</i>


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

                    </div>

                </section>
            </aside>

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
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>

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