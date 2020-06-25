<%-- 
    Document   : index
    Created on : 10 Jun, 2020, 5:39:02 PM
    Author     : User
--%>
<%@page import="myproject.helper.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style> 
            .jumbotron
            {
                height: 720px;
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 59% 83%, 16% 100%, 0 86%, 0 0);
            }
        </style>
    </head>
    <body>
        <!-- to include nav ba we use include tag-->
        <%@include file="normal_navbar.jsp" %>
        <!-- Banner-->
        <div class="container-fluid m-0 p-0" >
            <div class="jumbotron" style="color: black; background: 
                 white">
                <div class="container">
                    <h3 class="display-3"> Hey Budyyy</h3>
                    <h3> This is our Banner</h3>
                    <p>I am Yash Nmadev and I am here to  teach you java</p>
                    <p>Java is a programming language created by James Gosling from Sun Microsystems (Sun) in 1991. The target of Java is to write a program once and then run this program on multiple operating systems. The first publicly available version of Java (Java 1.0) was released in 1995. Sun Microsystems was acquired by the Oracle Corporation in 2010. Oracle has now the steermanship for Java. In 2006 Sun started to make Java available under the GNU General Public License (GPL). Oracle continues this project called OpenJDK.

                        Over time new enhanced versions of Java have been released.</p>
                    <p>The current version of Java is Java 1.8 which is also known as Java 8.</p>


                    <p>Java is defined by a specification and consists of a programming language, a compiler, core libraries and a runtime (Java virtual machine) The Java runtime allows software developers to write program code in other languages than the Java programming language which still runs on the Java virtual machine. The Java platform is usually associated with the Java virtual machine and the Java core libraries.
                    </p>
                    <p>The Java language was designed with the following properties:

                    </p>
                    <button  <li class=" dropdown">
          
                           <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Start Learning
  </button>    
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="https://www.w3schools.com/java/">Java</a>
          <a class="dropdown-item" href="https://www.python.org/about/">Python</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="https://www.w3schools.com/whatis/">Web Develpment</a>
        </div>
      </li></button>
                    <button  onclick="window.location.href = 'login_page.jsp'" class="btn-outline-dark"><span class="	fa fa-info-circle fa-spin"  style="color: black;"></span>Login</button>


                </div>
            </div>
            <br>

            <div class="container" style="color: black;">
                <div class="row mb-4">
                    <div class="col-md-4"><div class="card" ">

                            <div class="card-body">
                                <h5 class="card-title">Java Programing</h5>
                                <p class="card-text">Java is a general-purpose programming language that is class-based and 
                                    object-oriented, and designed to have as few implementation dependencies as possible. 
                                    It is intended to let application developers write once, run anywhere (WORA),[17] meaning 
                                    that compiled Java code can run on all platforms that support Java without the need of 
                                    recompilation.[18] Java applications are typically compiled to bytecode that can run on
                                    any Java virtual machine (JVM) regardless of the underlying computer architecture. The 
                                    syntax of Java is similar to C and C++, but it has fewer low-level facilities than either 
                                    of them. As of 2019, Java was one of the most popular programming languages in use 
                                    according to GitHub,[19][20] particularly for client-server web applications, with a 
                                    reported 9 million developers.</p>
                                <a href="http://www.oracle.com" class="btn btn-info bg-dark" role="button">More about java</a>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-4"><div class="card" ">

                            <div class="card-body">
                                <h5 class="card-title">Python Programing</h5>
                                <p class="card-text">1> Python can be easy to pick up whether you're a first time programmer or you're 
                                    experienced with other languages. The following pages are a useful first step to get on your way writing programs with
                                    Python!

                                    <br>
                                    2>
                                    The community hosts conferences and meetups, collaborates
                                    on code, and much more. Python's documentation will help you along the way, and the mailing lists will keep you in touch.
                                    <br>
                                    3>
                                    The Python Package Index (PyPI) hosts thousands of third-party 
                                    modules for Python. Both Python's standard library and the community-contributed modules allow for endless 
                                    possibilities.</p>
                                <a href="https://www.python.org/about/" class="btn btn-info bg-dark" role="button">More about Python</a>


                            </div>

                        </div>
                    </div> <div class="col-md-4"><div class="card" ">

                            <div class="card-body">
                                <h5 class="card-title">Web Development or Techno</h5>
                                <p class="card-text">Web development is the work involved in developing a website for the 
                                    Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex web-based internet applications (web apps), electronic businesses, and social network services. A more comprehensive list of tasks to which web development commonly refers, may include web engineering, web design, web content development, client liaison, client-side/server-side scripting, web server and network security configuration, and e-commerce development.

                                    Among 
                                    nsible for behavior and visuals that run in the user browser,    nsible for behavior and visuals that run in the  and visuals that run in the user browserwhile back-end developers deal with the servers..</p>
                                <a href="https://en.wikipedia.org/wiki/Web_development" class="btn btn-info bg-dark" role="button"> More about Web development</a>
                            </div>

                        </div>
                    </div>
                </div>

            </div>


            <!--javascript-->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

            <script src="js/myjs.js" type="text/javascript"></script>
            <script>
                        <!--  $(document).ready(function () {
                    alert("Hey we Welcomes you");
                        })-->
            </script>
    </body>
</html>











<!-- <h1>Hey!</h1>

<%
    Connection con = ConnectionProvider.getConnection();
%>
<h3><%= con%></h3>
-->