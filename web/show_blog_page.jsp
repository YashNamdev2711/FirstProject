<%-- 
    Document   : show_blog_page
    Created on : 22 Jun, 2020, 11:29:28 AM
    Author     : User
--%>

<%@page import="myproject.dao.Likedao"%>
<%@page import="myproject.dao.Userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myproject.entities.Category"%>
<%@page import="myproject.entities.Post"%>
<%@page import="myproject.dao.Postdao"%>
<%@page import="myproject.helper.ConnectionProvider"%>
<%@page import="java.net.ConnectException"%>
<%@page import="myproject.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("profile1.jsp");
    }
%>

<%    int postId = Integer.parseInt(request.getParameter("post_id"));
    Postdao d = new Postdao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle() %></title>
    
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style> 
            
            body
            {
                background: url(pics/bg_project.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .post-title{
                font-weight: 100;
                font-size:30px;
            }
            .jumbotron
            {
                height: 620px;
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 59% 83%, 16% 100%, 0 86%, 0 0);
            }
        </style>
        
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0" nonce="CnYk5OsL"></script>
    </head>
    <body>
        
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">    <!--primary-color-->
            <a class="navbar-brand" href="index.jsp"><span class="	fa fa-briefcase"></span>Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile1.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>

                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="	fa fa-caret-square-o-down" style="color: black;"></span>  Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book" style="color: black;"></span>Contact us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="	fa fa-asterisk"></span> Do Post</a>
                    </li>

                </ul>



                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>






            </div>
        </nav>
        <!--end of navbar-->
        
       <!--main content of the body-->
       
       
       
       <div class="container">
           
           <div class="row mt-5">
               <div class="col-md-8 offset-md-2">
                   
                   <div class="card bg-dark text-white">
                       
                       <div class="card-header">
                           <h4 class="post-title"><%= p.getpTitle() %></h4>
                       </div>
                       
                       <div class="card-body">
                                                      

                           <img class="card-img-top" src="pics/default.png %>" alt="Card image cap">
                           <br>
                           <br>
                           
                           <div class="row">
                               
                               <div class="col-md-8">
                             
                                   <%Userdao ud=new Userdao(ConnectionProvider.getConnection()); %>
                                   <p class="post-user-info"><a href="#!" ><%= ud.getUserByUserId(p.getUserId()).getName() %></a>has Postedt : </p>
                               
                               </div>
                               
                               <div class="col-md-4">
                                   <p> On   <%= p.getpDate().toLocaleString() %></p>
                               </div>
                           </div>
                           
                           <p class="post-content"><%= p.getpContent() %></p>
                           <br>
                           <br>
                           <div class="post-code>"
                            <p><%= p.getpCode() %></p>
                               
                           </div>
                       </div>
                       
                       
                              <div class="bg-dark text-white footer ">
                              
                                    <%
                                Likedao ld = new Likedao(ConnectionProvider.getConnection());
                            %>

                            <a href="#!" id="likestop" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                            
                                  
                        <a href="#" class="btn btn-outline-light btn-small"><i class="fa fa-commenting-o"></i><span></span></a>
                    </div>
                            <div class="card-footer">
                                <div class="fb-comments" data-href="http://localhost:9494/JavaProject/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-numposts="5" data-width=""></div>
                            </div>
                       
                   </div>
                   
                   
                   
               </div>
           </div>
       </div>
       
       
       
       <!--end of main content of the body-->
        

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title text-dark" id="exampleModalLabel">Info are:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-dark">
                        <img src="pics/<%= user.getProfile()%>" style="border-radius:15%; max-width: 150px;">
                        <br>

                        <!-- details -->
                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">Name</th>
                                        <td><%= user.getName()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">email</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <th> <%= user.getGender()%></th>
                                    </tr>




                                </tbody>
                            </table>
                        </div>      
                        <!-- prfile edit -->
                        <div id="profile-edit" style="display:none">
                            <h3 class="mt-2">Edit Carefully</h3>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td> <input type="email" class="form-control" name="user_email"value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td> <input type="text" class="form-control" name="user_name"value="<%= user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td> <input type="password" class="form-control" name="user_password"value="<%= user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>About:</td>
                                        <td>
                                            <textarea rows="" class="form-control" name="user_about">  <%= user.getAbout()%>
                                            </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> New Profile:</td>
                                        <td>
                                            <input class="form-formate" type="file" name="image"
                                                   >
                                        </td>

                                    </tr>
                                </table>
                                <div class="container">
                                    <button  type="submit" class="btn btn-outline-success" >Save</button>
                                </div>  
                            </form>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of profile modal-->


        <!-- add post modal -->


        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-dark" id="exampleModalLabel" >Provide your Blog Details;</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>



                    <div class="modal-body">
                        <form  id="add-post-form" action="AddPostServlet" method="POST" >
                            <div class="form-group">
                                <select class="form-control " name="cid">
                                    <option selected disabled>***Select Categorie***</option>
                                    <%

                                        Postdao postd = new Postdao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getCname()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="Form-group">

                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">



                            </div>

                            <div class="Form-group">

                                <textarea name="pContent" style="height: 180px;" type="text" placeholder="Enter your content" class="form-control"></textarea>



                            </div>


                            <div class="Form-group">

                                <textarea name="pCode" type="text" placeholder="Enter your code(if any)" class="form-control"></textarea>



                            </div>
                            <div  class="text-dark text-left"  form-group>

                                <label>Select your pic</label>
                                <br>
                                <input type="file" name="pic">
                            </div>


                    </div>
                    <div class="container  text-center">
                        <button type="submit" class="btn-outline-primary">Post</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- end of post modal-->




        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {

                    if (editStatus == false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back")
                    } else
                    {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit")
                    }

//  alert("jay ")
//  $("#profile-details").hide()
//  $("#profile-edit").show()
                })
            });
        </script>
        <!-- now add post js  in javascript folder-->

        <script>

            $(document).ready(function (e) {
                //        alert("loaded");
                $("#add-post-form").on("submit", function (event) {
                    // this code  gets called when form is submitted
                    event.preventDefault();
                    console.log("submiteed....");
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success
                            if (data.trim() == 'donee') {
                                swal("Good job!", "\Saved succesfully", "success");
                            } else {
                                swal("Good job!", "\Saved succesfully", "success");
                            }

                        },
                        error: function (jqXHR, textstatus, errorThrown) {
                            //error 
                            swal("  Error!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            }
            )
        </script>

    </body>
</html>
