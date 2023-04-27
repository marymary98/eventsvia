using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;




public partial class Student_ViewEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /* Is called when an item in the ListView is selected. In this case "selected" means
    * that a button with the the attribute CommandName="select" is clicked
    */
   protected void AttendEvent(object sender, EventArgs e)
    {
     

    // Get the selected list view item
    ListViewDataItem item = (ListViewDataItem)((Button)sender).NamingContainer;

    // Get the event title and current number of participants from the data item
    string title = ListView1.DataKeys[item.DataItemIndex].Value.ToString();
    int participants = int.Parse(((Label)item.FindControl("participantsLabel")).Text);

    // Check if there are available spots
    if (participants > 0)
    {
        // Update the number of participants in the database
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand("UPDATE EVENT SET participants = @participants WHERE title = @title", connection);
            command.Parameters.AddWithValue("@participants", participants - 1);
            command.Parameters.AddWithValue("@title", title);

            connection.Open();
            command.ExecuteNonQuery();
        }

        // Refresh the data in the list view
        ListView1.DataBind();
    }

    Page.MaintainScrollPositionOnPostBack = true;
        // Rest of the button click event handler code
}
}