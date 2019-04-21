<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Thames IT Club</title>

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


        </style>

    </head>

    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">
                    <img class="img-fluid logo" src="${SITE_URL}/static/img/logo.png">
                </a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger " href="#about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger " href="#team">Team</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="${SITE_URL}/events">Events</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger btn" href="${SITE_URL}/login" >Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <header class="masthead">
            <div class="container">
                <div class="intro-text">
                    <div class="intro-lead-in">Welcome To Thames IT Club</div>
                    <a class="btn btn-info btn-xl text-uppercase js-scroll-trigger" href="https://www.facebook.com/ThamesITC/">Tell Me More</a>
                </div>
            </div>
        </header>



        <!-- About -->
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading text-uppercase">About</h2>
                        <h3 class="section-subheading text-muted">The long journey</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="timeline">
                            <li>
                                <div class="timeline-image">
                                    <img class="rounded-circle img-fluid" src="${SITE_URL}/static/img/about/1.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>2012</h4>
                                        <h4 class="subheading">Our Humble Beginnings</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">
                                            Thames IT Club was established to provide a platform for the
                                            the IT enthusiast to learn about latest tech development and to provide 
                                            skills that will help students be market ready to work in the field of 
                                            Information and Technology.
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image">
                                    <img class="rounded-circle img-fluid" src="${SITE_URL}/static/img/about/11.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>2016</h4>
                                        <h4 class="subheading">An Agency is Born</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="timeline-image">
                                    <img class="mx-auto rounded-circle img-fluid" src="${SITE_URL}/static/img/about/3.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>June 2017</h4>
                                        <h4 class="subheading">Nepal Business Gabfest</h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">Nepal Business Gabfest 2017 is a unique
                                            opportunity for college students to learn about the current 
                                            issues, trends, challenges in the Nepalese business environment. 
                                            The Gabfest is organized by AMS School of Business and Technology 
                                            at Thames International College in partnership with its Managment 
                                            Club and IT Club
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image">
                                    <img class="img-fluid  rounded-circle " src="${SITE_URL}/static/img/about/4.jpg" alt="">
                                </div>
                                <div class="timeline-panel">
                                    <div class="timeline-heading">
                                        <h4>December 2017</h4>
                                        <h4 class="subheading"></h4>
                                    </div>
                                    <div class="timeline-body">
                                        <p class="text-muted">The current BOD of Thames ITC were inducted in december 2017. 

                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li class="timeline-inverted">
                                <div class="timeline-image bg-info">
                                    <h4>Be Part
                                        <br>Of Our
                                        <br>Story!</h4>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Team -->
        <section class="bg-light" id="team">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                        <h3 class="section-subheading text-muted">Thames IT Club BOD 2017/18</h3>
                    </div>
                </div>
                <div class="row">

                    <div class="col-sm-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${SITE_URL}/static/img/team/5.jpg" alt="">
                            <h4>Anmol Shrestha</h4>
                            <p class="text-muted">Vice President</p>
                            <ul class="list-inline social-buttons">
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/anmol.shrestha">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>

                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${SITE_URL}/static/img/team/6.jpg" alt="">
                            <h4>Lawoj Oli</h4>
                            <p class="text-muted">Secretary</p>
                            <ul class="list-inline social-buttons">
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/lawoj.oli">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${SITE_URL}/static/img/team/7.jpg" alt="">
                            <h4>Ashis Basnet</h4>
                            <p class="text-muted">Treasurer</p>
                            <ul class="list-inline social-buttons">
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/profile.php?id=100008236849360">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>

                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="row">

                    <div class="col-sm-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${SITE_URL}/static/img/team/8.jpg" alt="">
                            <h4>Sumit Kumar Singh</h4>
                            <p class="text-muted">Program Co-Ordinator</p>
                            <ul class="list-inline social-buttons">
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/Mortalsingh">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>

                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${SITE_URL}/static/img/team/9.jpg" alt="">
                            <h4>Nikesh Nakarmi</h4>
                            <p class="text-muted">Executive Member</p>
                            <ul class="list-inline social-buttons">
                                <li class="list-inline-item">
                                    <a href="https://www.facebook.com/nnikesh.nnakarmi">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8 mx-auto text-center">
                        <p class="large text-muted">our dedicated and robust team is capable of providing any IT support to you</p>
                    </div>
                </div>
            </div>
        </section>



        <!-- Contact -->
        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading text-uppercase">Contact Us</h2>
                        <h3 class="section-subheading text-muted">we are always at your service</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form action="${SITE_URL}/save" method="post" id="contactForm"  novalidate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="name" name="name"  type="text" placeholder="Your Name *" required data-validation-required-message="Please enter your name.">
                                        <p  class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" id="email" name="email" type="email" placeholder="Your Email *" required data-validation-required-message="Please enter your email address.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" id="phone" name="contactNo" type="tel" placeholder="Your Phone *" required data-validation-required-message="Please enter your phone number.">
                                        <p class="help-block text-danger"></p>
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input class="form-control" id="title" name="title" type="text" placeholder="Title *" required data-validation-required-message="Please enter a Title.">
                                        <p class="help-block text-danger"></p>
                                    </div>

                                    <div class="form-group">
                                        <textarea class="form-control" id="message" name="message"  placeholder="Your Message *" required data-validation-required-message="Please enter a message."></textarea>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-lg-12 text-center">
                                    <div id="success"></div>
                                    <button  class="btn btn-info btn-xl text-uppercase" type="submit">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <span class="copyright">Copyright &copy; Roit Jung Karki 2018</span>
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline social-buttons">
                            <li class="list-inline-item">
                                <a href="https://www.facebook.com/ThamesITC/">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <i class="fa fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <ul class="list-inline quicklinks">
                            <li class="list-inline-item">
                                <a href="#" class="text-dark">Privacy Policy</a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#" class="text-dark">Terms of Use</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>



        <!-- Bootstrap core JavaScript -->
        <script src="${SITE_URL}/static/vendor/jquery/jquery.min.js"></script>
        <script src="${SITE_URL}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="${SITE_URL}/static/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Contact form JavaScript -->
        <script src="${SITE_URL}/static/js/jqBootstrapValidation.js"></script>

        <!-- Custom scripts for this template -->
        <script src="${SITE_URL}/static/js/agency.min.js"></script>
        <script>
            $(function () {
                $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            });

        </script>
    </body>

</html>
