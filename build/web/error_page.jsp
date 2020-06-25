<%-- 
    Document   : error_page
    Created on : 13 Jun, 2020, 6:35:41 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry something went wrong!!</title>
         <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style> 
            .jumbotron
            {
                height: 620px;
         clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 59% 83%, 16% 100%, 0 86%, 0 0);
            }
            </style>
  
    </head>
    <body>
        <div class="container text-center " >
            <img src="img/error1.jpg" class="img-fluid">
            <h3 class="text-white">sorry something went wrong...</h3>
            <%= exception %>
            <br>
            
            <a href="index.jsp"  class="btn bg-light text-dark mt-2">Home</a>
        </div>
    </body>
</html>
