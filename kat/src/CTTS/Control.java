
/*****************************************************************************************
java.io       :   This package contains three main groups of classes and interfaces. 
	The first group is for building data streams.  A data stream is either an input stream for reading bytes
	or characters, or an output stream for writing bytes or characters (FILES). 
	The second group contains classes and interfaces for object serialization. Object Serialitation is the 
	process of converting an object's state into a byte stream in such way that the byte stream can be 
	re-converted back into a copy of the object.
	The last group is for dealing with the file System.

javax.sql : This package supplements the java.sql package to provide API's for server side data source
            access and processing. It contains support for restablishing connections to a database, connection
            pooling, distributed transactions and row sets

Datasource  :   A database connection pool creates and manages a pool of connections to a database. (done by Tomcat)
	Recycling and reusing already existing connections to a dB is more efficient than opening a new connection.
	There is one problem with connection pooling. A web application has to explicetely close ResultSet's,
	Statement's, and Connection's. Failure of a web application to close these resources can result in them
	never being available again for reuse, a db connection pool "leak". This can eventually result in your web
	application db connections failing if there are no more available connections.
	There is a solution to this problem. The Jakarta-Commons DBCP can be configured to track and recover
	these abandoned dB connections. Not only can it recover them, but also generate a stack trace for the
	code which opened these resources and never closed them.

javax.servlet :  Defines an object that receives requests from the client and sends them to any resource
	(such as a servlet, HTML file, or JSP file) on the server.
        Defines methods that all servlets must implement.
        A servlet configuration object used by a servlet container used to pass information to a servlet during initialization.
        Defines a set of methods that a servlet uses to communicate with its servlet container, for example,
        to get the MIME type of a file, dispatch requests, or write to a log file
        Defines an object to provide client request information to a servlet.
        Defines an object to assist a servlet in sending a response to the client


javax.servlet.http: Provides an abstract class to be subclassed to create an HTTP servlet suitable for a Web site.
        A subclass of HttpServlet must override at least one method, usually one of these:
		  - doGet, if the servlet supports HTTP GET requests
		  - doPost, for HTTP POST requests
		  - doPut, for HTTP PUT requests
		  - doDelete, for HTTP DELETE requests
		  - init and destroy, to manage resources that are held for the life of the servlet
		  - getServletInfo, which the servlet uses to provide information about itself

java.util.Vector  :  The Vector class implements a growable array of objects. Like an array,
                         it contains components that can be accessed using an integer index. However,
                         the size of a Vector can grow or shrink as needed to accommodate adding and removing
                         items after the Vector has been created.
                         Each vector tries to optimize storage management by maintaining a capacity and a capacityIncrement.
                         The capacity is always at least as large as the vector size; it is usually larger because as 
			components are added to the vector, the vector's storage increases in chunks the size of 
			capacity Increment.
                         An application can increase the capacity of a vector before inserting a large number of components;
                         this reduces the amount of incremental reallocation.

*****************************************************************************************/


package CTTS;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import CTTS.DBI;
import CTTS.Shared;


public class Control extends HttpServlet
{
//Control begins the application and transfers to Login.jsp
// All application servlets extend this one
	/* 
    * Handle the first HTTP GET Method
	 * @param request  servlet request
	 * @param response servlet repsonse 
    */

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException //some more code can be written here
   {  
      
      HttpSession session = request.getSession(true); //create new session from Tomcat once for each user session
   	/* create new bean */
   	CTTS.Shared bean = new CTTS.Shared(); // creates a new instance Shared.java
   	bean.setError(""); //method in Shared.java to clear old Errors
      // bind bean to session & name it "shared"
   	session.setAttribute("shared", bean); //set the Shared.java servelet as a part of Tomcat's session
   	//System.out.println("Control is started");
      gotoPage("/Login.jsp", request, response); //switch between servelets, request and responses are moved along with it
   }
    
	// all servlets need this method to transfer control thru dispatcher
   protected void gotoPage(String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      /* Use the HttpRequest Dispatcher to go to that page address from its context
	   bean.setError("Here in gotoPage"); dispatcher forwards the request and response to next servelet */
      
         RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(address);
         dispatcher.forward(request, response);
   }
	
	// any method that is common to many servlets can go here.
   public String getDate(CTTS.Shared bean)
   {
      String sdate;
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      java.util.Date date = new java.util.Date();
      bean.setCurrentDate(sdate=dateFormat.format(date)); 
	   return sdate;
   }
}
