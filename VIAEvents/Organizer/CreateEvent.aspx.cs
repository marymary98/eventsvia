using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Organizer_CreateEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateButton_Click(object sender, EventArgs e)
    {
        string dbstring = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(dbstring);
        string sqlStr = "SELECT title FROM EVENT WHERE title = @theTitle";
        SqlCommand sqlCmd = new SqlCommand(sqlStr, con);
        sqlCmd.Parameters.AddWithValue("@theTitle", eventNameTextBox.Text);
        con.Open();
        object result = sqlCmd.ExecuteScalar();
        con.Close();

        if (result == null)
        {
            string sqlStr2 = "INSERT INTO EVENT (title, participants, date, image, description) VALUES (@theTitle, @theParticipants, @theDate, @theImage, @theDescription)";
            SqlCommand sqlCmd2 = new SqlCommand(sqlStr2, con);

            int participants;
            string participantsStr = participantsTextBox.Text;

            try
            {
                participants = Convert.ToInt32(participantsStr);
            }
            catch (FormatException)
            {
                participants = 0;
            }


            // Get the selected date from the calendar
            DateTime selectedDate = dateCalendar.SelectedDate;

            // Check if the selected date is earlier than the current date
            if (selectedDate <= DateTime.Today)
            {
                resultLabel.ForeColor = System.Drawing.Color.Red;
                resultLabel.Text = "Please select a date that is later than today";
                return;
            }


            DateTime declaredDate;
            try
            {
                declaredDate = dateCalendar.SelectedDate;
            }
            catch (ArgumentOutOfRangeException)
            {
                declaredDate = DateTime.MinValue;
            }




            string imagePath = "~/Images/noImg.jpg";

            if (ImageFileUpload.HasFile)
            {
                string extension = System.IO.Path.GetExtension(ImageFileUpload.PostedFile.FileName);

                if (extension == ".png" || extension == ".gif" || extension == ".jpg" || extension == ".bmp")
                {
                    string eventName = eventNameTextBox.Text.Replace(".", "").Replace("-", "").ToLower();

                    ImageFileUpload.SaveAs(Server.MapPath("~/Images/" + eventName + extension));

                    imagePath = "~/Images/" + eventName + extension;
                }
            }

            sqlCmd2.Parameters.AddWithValue("@theTitle", eventNameTextBox.Text);
            sqlCmd2.Parameters.AddWithValue("@theParticipants", participants);
            sqlCmd2.Parameters.AddWithValue("@theDate", declaredDate);
            sqlCmd2.Parameters.AddWithValue("@theImage", imagePath);
            sqlCmd2.Parameters.AddWithValue("@theDescription", descriptionTextBox.Text);

            con.Open();
            sqlCmd2.ExecuteNonQuery();
            con.Close();

            resultLabel.ForeColor = System.Drawing.Color.Black;
            resultLabel.Text = "New event created";
        }
        else
        {
            resultLabel.ForeColor = System.Drawing.Color.Red;
            resultLabel.Text = "Event was not created, an event with that name already exists!";
        }
    }
}
