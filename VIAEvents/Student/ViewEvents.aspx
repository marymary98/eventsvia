<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewEvents.aspx.cs" Inherits="Student_ViewEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<span class="headingspan">Choose an event to attend:</span> <br /><br />

     <asp:ListView ID="ListView1" runat="server" DataKeyNames="title" 
         DataSourceID="SqlDataSource1" OnSelectedIndexChanged="AttendEvent">
         
        <AlternatingItemTemplate> 
           <!-- The AlternatingItemTemplate can be used to make every second item displayed differently.
              So item 1, 3, 5, etc. will appear as defined in the ItemTemplate, and item 2, 4, 6, etc. will 
              be displayed as defined in this AlternatingItemTemplate 
         --> 
         <div style="background-color:#c1ceff; float:left;padding:10px;margin:0px 5px 5px 0px; border:1px solid #000077">
            <div style="float:left">
               <span style="color: #000000;">
                  The name of the event: <asp:Label ID="titledLabel" runat="server" Text='<%# Eval("title")%>' />
                  <br />
                  Number of free spots: <asp:Label ID="participantsLabel" runat="server" Text='<%# Eval("participants")%>' />
                  <br />
                 Date: <asp:Label ID="dateLable" runat="server" Text='<%# Eval("date")%>' />
                   <br />
                 Description: <asp:Label ID="descriptionLable" runat="server" Text='<%# Eval("description")%>' />

                 <br /><br />
<asp:Button ID="Button1" runat="server" Text="Attend" OnClick="AttendEvent" />
                  <br/>
               </span>
            </div>
            <div style="float:right;margin:0px 50px">
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image").ToString() == "" ? "~/Images/noImg.ipg" : Eval("image") %>' AlternateText="Event Image"/>
            </div>
            <br />
            <br />
         </div>
        </AlternatingItemTemplate>
       
        <EmptyDataTemplate>
          <!-- Defines what should be displayed if no items are returned from the database -->
          No Conference rooms found.
        </EmptyDataTemplate>
      
        <ItemTemplate>
            <!-- The ItemTemplate defines how each item in the database will be displayed. 
              To get the value from each column we can use Eval("columnName") 
         --> 
         <div style="background-color:#c1ceff; float:left; clear:both; padding:10px; margin:0px 5px 5px 0px; border:1px solid #000077">
            <div style="float:left;">
               <span style="color: #000000;">
                  The name of the event: <asp:Label ID="titledLabel" runat="server" Text='<%# Eval("title")%>' />
                  <br />
                  Number of free spots: <asp:Label ID="participantsLabel" runat="server" Text='<%# Eval("participants")%>' />
                  <br />
                 Date: <asp:Label ID="dateLable" runat="server" Text='<%# Eval("date")%>' />
                   <br />
                 Description: <asp:Label ID="descriptionLable" runat="server" Text='<%# Eval("description")%>' />

                 <br /><br />
<asp:Button ID="Button1" runat="server" Text="Attend" OnClick="AttendEvent" />
                  <br/>
               </span>
            </div>
            <div style="float:right;margin:0px 50px">
               <!-- Set the image by using the conditional operator. If no image path is in the 
                    database, then use standard image, else use the image path from the database 
               --> 
               <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image").ToString() == "" ? "~/Images/noImg.ipg" : Eval("image") %>' AlternateText="Event Image"/>
            </div>
            <br />
            <br />
         </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="clear:both;text-align: center;">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
      </asp:ListView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [title], [participants], [date], [image], [description] FROM [EVENT] ORDER BY [date]">
     </asp:SqlDataSource>
</asp:Content>

