<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Events at Thames ITC</title>

        <!-- Bootstrap core CSS -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="${SITE_URL}/static/css/agency.min.css" rel="stylesheet">

        <style>
            .logo{
                height: 50px;
                width: 50px;
                opacity: 80%;
            }
            .car{
                height: 400px;
                width: 600px;
            }

        </style>

    </head>

    <body id="page-top" class="bg-dark">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${SITE_URL}">
                    <img class="img-fluid logo" src="${SITE_URL}/static/img/logo.png">
                </a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger " href="${SITE_URL}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger " href="#">All Events</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger menu" rel="upcoming" href="#">Upcoming Events</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#">Completed Events</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger btn" href="${SITE_URL}/login" >Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container bg-light"style="margin-top: 100px;">
            <h1></h1>
            <!-- Portfolio Grid -->
            <section class="bg-light" id="portfolio">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2 class="section-heading text-uppercase">Events</h2>
                            <h3 class="section-subheading text-muted">Our Events</h3>
                        </div>
                    </div>
                 

                    <c:forEach var="events" items="${events}">
                    
                    <p class="pull-right text-danger">${events.eventDate}</p>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 portfolio-item">
                            <a class="portfolio-link" data-toggle="modal" href="#modal" onclick="showDialog(${events.eventId})" >
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content">
                                        <i class="fa fa-plus fa-3x"></i>
                                    </div>
                                </div>
                                <img class="img-fluid" src="${SITE_URL}/static/${events.eventImage}" alt="">
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="portfolio-caption"> 
                                <h4>${events.eventTitle}</h4>
                                <p class="text-muted"><b>Venue: </b>${events.eventVenue}</p>
                                <p class="text-muted"><b>Co-ordinator: </b>${events.eventcoOrdinator}</p>
                            </div>
                        </div>        
                    </div>
                 </c:forEach>

<!--              


                  



-->                </div>


        </div>
    </section><!--



  
    <!-- Modal 2 -->
    <div class="portfolio-modal modal " id="modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl"></div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <div class="modal-body">
                                <!-- Project Details Go Here -->
                                <h2 class="text-uppercase" id="dialog-title"></h2>
                                <p class="item-intro text-muted">Thames IT Club Events</p>

                                <div class="modal-img"></div>



                                <p id="event-body"></p>
                                <ul class="list-inline event-details">
                                    
                                </ul>
                                <button class="btn btn-info" data-dismiss="modal" type="button">
                                    <i class="fa fa-times"></i>
                                    Close Project</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

   


    

         



<!-- Bootstrap core JavaScript -->
<script src="${SITE_URL}/static/vendor/jquery/jquery.min.js"></script>
<script src="${SITE_URL}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="${SITE_URL}/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact form JavaScript -->
<script src="${SITE_URL}/static/js/jqBootstrapValidation.js"></script>
<script src="${SITE_URL}/static/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="${SITE_URL}/static/js/agency.min.js"></script>

  <script>
                function showDialog(id) {
                    $.getJSON("${SITE_URL}/graph/events/" + id, function (res) {
                        $("#dialog-title").html(res.eventTitle);
                        $("#event-body").html(res.eventDescription);
                        $('.modal-img').html('<img class="img-fluid d-block mx-auto" src="${SITE_URL}/static/'+res.eventImage+'" alt="">');
                        $(".event-details").html("<li><b>Date: </b>"+res.eventDate+"</li>"
                                                +"<li><b>Venue: </b>"+res.eventVenue+"</li>"
                                                 +"<li><b>Co-Ordinator: </b>"+res.eventcoOrdinator+"</li>");
                        
                    });
                }
            </script>

</body>
</html>
