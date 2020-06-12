<%@page import="com.webrats.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.webrats.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.webrats.dao.PostDao"%>
<%@page import="com.webrats.entities.Message"%>
<%@page import="com.webrats.entities.User"%>
<%@page errorPage="error_page.jsp"%>


<nav class="navbar navbar-expand-lg navbar-dark primary-background p-0 m-0">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk fa-spin"></span> WebRats</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="	fa fa-bell-o"></span> Learn Code with Amit <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="		fa fa-clone"></span>  Categories
        </a>
      
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<%
							ArrayList<Categories> list2 = new ArrayList<Categories>();
							
							PostDao pd2 = new PostDao(ConnectionProvider.GetConnection());
							list2= pd2.getAllCategories();
							
							for(Categories c2 :list2){
								
								String name2 = c2.getcName();
								
								
								%>
								<a class="dropdown-item" href="login_page.jsp"><%=name2 %></a>
								
								<% 
							}
							
							%>
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Advance Java</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="	fa fa-address-card"></span> Contact</a>
      </li>
      
      <li class="nav-item active">
      <a href="login_page.jsp" class="nav-link"> <span class="	fa fa-sign-in"></span> Login</a>
      </li>
      
      
      <li class="nav-item active">
      <a href="register_page.jsp" class="nav-link"> <span class="fa fa-user-plus"></span> Signup</a>
      </li>
      
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>