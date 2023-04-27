<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateEvent.aspx.cs" Inherits="Organizer_CreateEvent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <span class="headingspan">Create a new event:</span> <br />
            <asp:Label ID="eventNameLabel" runat="server" Width="530px" Text="Event Name:"></asp:Label> 
        <br />

<table>   
    <tr>
        <td class="auto-style2">
            <asp:TextBox ID="eventNameTextBox" runat="server" Width="530px"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="eventNameTextBox" FilterType="Numbers, UppercaseLetters, LowercaseLetters, Custom" ValidChars="._- " runat="server">
            </asp:FilteredTextBoxExtender>
        </td>
        <td class="auto-style2"> 
            &nbsp;
             <br>
        </td>
    </tr>
 
    <tr>
        <td class="auto-style1">
                   <asp:Label ID="participantsLabel" runat="server" Width="530px" Text="Number of participants:"></asp:Label> 
        </td>
    </tr>

      <tr>
    <td class="auto-style1">
        <asp:TextBox ID="participantsTextBox" runat="server" Width="530px" ></asp:TextBox>
      <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="participantsTextBox" FilterType="Numbers" runat="server">

            </asp:FilteredTextBoxExtender>
             </td>
    </tr>
    <tr>
        <td class="auto-style1">
            
          
            <asp:Label ID="ImageLabel" runat="server" Width="530px" Text="Event image:"></asp:Label>
             <br>
        </td>
    </tr>
   

    <tr>
        <td class="auto-style1">
            <asp:FileUpload ID="ImageFileUpload" runat="server" />
        </td>
    </tr>

<tr>
    <td class="auto-style1">
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="descriptionTextBox" FilterType="Numbers, UppercaseLetters, LowercaseLetters, Custom" ValidChars="._- " runat="server">
            </asp:FilteredTextBoxExtender>
    </td>
    
</tr>

    <tr>
    <td class="auto-style1">
        <asp:Label ID="dateLable" runat="server" Width="530px" Text="Date of the event:"></asp:Label> 
        <asp:Calendar ID="dateCalendar" runat="server"></asp:Calendar>
            

    </td>
    
</tr>


    <tr>
       <td class="auto-style1">
            <asp:Label ID="descriptionLable" runat="server" Width="530px" Text="Event description:"></asp:Label> 
            <asp:TextBox ID="descriptionTextBox" runat="server" Width="530px" Height="136px"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="descriptionTextBox" FilterType="Numbers, UppercaseLetters, LowercaseLetters, Custom" ValidChars="._- " runat="server">
            </asp:FilteredTextBoxExtender>
            <br />
        </td>
        </tr>
    <tr>
       <td colspan="2">
         <br/>
          <!-- When this button is clicked the method "CreateButton_Click" in the code behind file is called -->
         <asp:Button ID="CreateButton" runat="server" Text="Create a new event" 
        onclick="CreateButton_Click" />    
       </td>
     </tr>

    </table>
    <br /><br />
    
   <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>

</asp:Content>
