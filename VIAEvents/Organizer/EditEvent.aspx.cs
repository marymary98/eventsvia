using System;
using System.Web.UI.WebControls;

public partial class Organizer_EditEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Bind the GridView on initial load
            BindGridView();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        // Set the GridView's EditIndex to the index of the row being edited
        GridView1.EditIndex = e.NewEditIndex;

        // Re-bind the GridView to show the edit row
        BindGridView();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        // Set the GridView's EditIndex back to -1 to cancel editing
        GridView1.EditIndex = -1;

        // Re-bind the GridView to show the original data
        BindGridView();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the current row being edited
        GridViewRow row = GridView1.Rows[e.RowIndex];

        // Get the values from the edit controls
        string title = GridView1.DataKeys[e.RowIndex].Value.ToString();
        TextBox participantsTextBox = (TextBox)row.FindControl("participantsTextBox");
        int participants = int.Parse(participantsTextBox.Text);
        TextBox dateTextBox = (TextBox)row.FindControl("dateTextBox");
        DateTime date = DateTime.Parse(dateTextBox.Text);
        TextBox imageTextBox = (TextBox)row.FindControl("imageTextBox");
        string image = imageTextBox.Text;
        TextBox descriptionTextBox = (TextBox)row.FindControl("descriptionTextBox");
        string description = descriptionTextBox.Text;

        // Update the row in the database
        SqlDataSource1.UpdateParameters["title"].DefaultValue = title;
        SqlDataSource1.UpdateParameters["participants"].DefaultValue = participants.ToString();
        SqlDataSource1.UpdateParameters["date"].DefaultValue = date.ToString();
        SqlDataSource1.UpdateParameters["image"].DefaultValue = image;
        SqlDataSource1.UpdateParameters["description"].DefaultValue = description;
        SqlDataSource1.Update();

        // Set the GridView's EditIndex back to -1 to stop editing
        GridView1.EditIndex = -1;

        // Re-bind the GridView to show the updated data
        BindGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Get the title of the row being deleted
        string title = GridView1.DataKeys[e.RowIndex].Value.ToString();

        // Delete the row from the database
        SqlDataSource1.DeleteParameters["theTitle"].DefaultValue = title;
        SqlDataSource1.Delete();

        // Re-bind the GridView to show the updated data
        BindGridView();
    }

    protected void BindGridView()
    {
        // Re-bind the GridView to show the data
        GridView1.DataBind();
    }
}
