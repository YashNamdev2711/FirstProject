
<%@page import="myproject.entities.User"%>
<%@page import="myproject.dao.Likedao"%>
<%@page import="java.util.List"%>
<%@page import="myproject.entities.Post"%>
<%@page import="myproject.helper.ConnectionProvider"%>
<%@page import="myproject.dao.Postdao"%>


<div class="row text-dark">

    <%
        User uu=(User)session.getAttribute("currentUser");

        Postdao d = new Postdao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'> No posts available in this category </h3>");
            return;
        }
        for (Post p : posts) {
    %>


    <div class="col-md-6 mt-4">
        <div class="card">
            <!--<img class="card-img-top" src="pics/default.png %>" alt="Card image cap">-->
            <div class="card-body">
<!--                                                    posted by </h5> <%= p.getUserId()%> </h5>-->

                <h5> <%= p.getpTitle()%></h5>
                <h5> <%= p.getpContent()%></h5>
                <pre<h5> <%= p.getpCode()%></h5>
                    <br>
                    posted on </h5> <%= p.getpDate()%> </h5>


                    </div>
                    <div class="bg-dark text-white footer text-center">
                          
                         <% 
                    Likedao ld = new Likedao(ConnectionProvider.getConnection());
                %>

                <a href="#!" id=likestop onclick="doLike(<%= p.getPid()%>,<%= uu.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

                       
                        
                        <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-small">Read more..</a>

                        <a href="#" class="btn btn-outline-light btn-small"><i class="fa fa-commenting-o"></i><span>5 </span></a>
                    </div>
            </div>
        </div>


        <%
            }


        %>
    </div>
