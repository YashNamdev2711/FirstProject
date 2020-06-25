
<%@page import="java.util.ArrayList"%>
<%@page import="myproject.entities.Category"%>
<%@page import="myproject.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="myproject.dao.Postdao"%>
<%@page import="myproject.entities.Messageoverlogin"%>
<%@page import="myproject.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("profile1.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <a href="profile1.jsp"></a>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style> 
            on
            {
                height: 620px;
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 59% 83%, 16% 100%, 0 86%, 0 0);
            }
        </style>
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
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
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

        <%
            Messageoverlogin m = (Messageoverlogin) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div> 


        <%
                session.removeAttribute("msg");
            }
        %>
        <!-- starting of the main body of the page-->




        <main>

            <div class="container">

                <div class="row mt-4">
                    <!-- first column-->
                    <div class="col-md-4">
                        <!-- categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0)" class="list-group-item list-group-item-action active bg-dark">
                                All Categories
                            </a>
                            <!-- Sari categories lene ke liye-->
                            <%
                                Postdao d = new Postdao((ConnectionProvider.getConnection()));
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category c : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= c.getCid() %>)" class="list-group-item list-group-item-action"><%= c.getCname() %></a>
                            <%
                                }

                            %>

                        </div>

                    </div>


                    <div class="col-md-8" id="post-container">
                        <!--post-->
                        <div class="conatiner text-center mt-5" id="loader">
                            <i class="fa fa-refresh fa-spin fa-3x  text-light"></i>
                            <h2 class="text-light">Loading...</h2>
                         </div>
                         </div>
                        <div class="conatiner-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>




        <!-- ending of the main body of the page-->
        <!-- start of profile modal-->



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


        <script>
          <!--   loading posts using -->
         function  getPosts(catId){
           $("#loader").show();
            $("#post-container").hide();
          $.ajax({
              url:"Load_post.jsp",
              data:{cid:catId},

        
             success: function (data, textStatus, jqXHR) {
                 console.log(data);
                 $("#loader").hide();
                  $("#post-container").show();
                 $("#post-container").html(data);
             }
                 
             
          })
          }
          $(document).ready(function(e)
          {
         getPosts(0);
          })
            </script>

    </body>
</html>
