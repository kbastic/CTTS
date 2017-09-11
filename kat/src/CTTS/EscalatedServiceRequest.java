/******************************************************************************************

EscalatedServiceRequest.java

The purpose of this servlet is to escalate a service request for the 
current technician user.

   + This servlet is invoked by ViewMyServiceRequests_Technician.jsp
   + This servlet dispatches to MainPage.jsp
   
******************************************************************************************/

package CTTS;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import CTTS.DBI;
import CTTS.Shared;

public class EscalatedServiceRequest extends CTTS.Control
{
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   { 
      HttpSession session = request.getSession(); //Returns the current session associated with this request, or if the request does not have a session, creates one
      CTTS.Shared bean = (CTTS.Shared)session.getAttribute("shared"); // get bean from the session
         	String[][] myServiceRequests = bean.getMyServiceRequests();
		/* gets user inputs POSTed from the HttpServletRequest, request */
       	
		int myServiceRequestIndex=Integer.parseInt(request.getParameter("srId"));

		// get the owned service request selected by the user index
		String srId = myServiceRequests[myServiceRequestIndex][0]; 
		bean.setcurrSrId(srId);
        
      updateServiceRequestStatus(bean, srId); // call the updateServiceRequestStatus function and pass it the bean and selected service request ID
      
      this.gotoPage("/EscalatedServiceRequest.jsp", request,response); // dispatcher to MainPage.jsp 
     
      
   }
   
/****Escalate Service Request Method****/

   private void updateServiceRequestStatus(CTTS.Shared bean, String srId) throws ServletException, IOException
   {
      
      CTTS.DBI dbi = new CTTS.DBI(); // new DBI object to access the database. DBI (Data Base Interface)
      
      try // to connect to the database and adopt a service request
      {
         dbi = new CTTS.DBI(); //creates a new instance of dbi
         if(dbi.connect()) // get a database connection from Tomcat
         {

            dbi.updateServiceRequestStatus(srId, "Escalated"); // call the updateServiceRequestStatus function in the DBI and pass it the serv req ID and the new status of escalated
         }
      }
      catch(Exception e)
      {
         e.printStackTrace();
         bean.setMessage("Exception caught : " + e);
         bean.setError("The database could not be connected");
      }
      finally
      {
         dbi.close();  //return connection to Tomcat
      }
   }//end method

}//end class
