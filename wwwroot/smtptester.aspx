<%@ Import Namespace="System.Net" %> 
<%@ Import Namespace="System.Net.Mail" %> 
<script language="c#" runat="server">


private void btnSend_Click(object sender, System.EventArgs e)
{                                                
		MailMessage mail = new MailMessage();	
		
		mail.From = new MailAddress(txtFrom.Text); //IMPORTANT: This must be same as your smtp authentication address.
        mail.To.Add(txtTo.Text); 
 
        //set the content 
        mail.Subject = txtSubject.Text; 
        mail.Body = txtContent.Value; 

        
		//send the message 
         SmtpClient smtp = new SmtpClient(txtMailServer.Text, 25); 
         
		//IMPORANT:  Your smtp login email MUST be same as your FROM address. 
         NetworkCredential Credentials = new NetworkCredential(txtFrom.Text, txtPass.Text); 
         smtp.Credentials = Credentials;
                                                     
		smtp.Send(mail); 
		lblStatus.Text = "Sent email (" + txtSubject.Text + ") to " +txtTo.Text;                                         
}
</script> 
<html>
<body>
<table align = center>
    <TR> <TD align = center colspan = 2><h3>Email From ASP.NET</h3></tr>
    <form id="MailForm" method="post" runat="server">
    <TR>    <TD><asp:Label ID="Label1" runat="server">From Email Address:   
        </asp:Label>
      
		<TD><asp:TextBox ID="txtFrom" runat="server"></asp:TextBox>        </TR>
		
		
		<TR>    <TD><asp:Label ID="lblPass" runat="server">Email Password:   
        </asp:Label>
      
		<TD><asp:TextBox ID="txtPass" runat="server" TextMode="Password" ></asp:TextBox>        </TR>
		
    
<TR>	<TD>	<asp:Label ID="EmailServer" runat="server">Email Server   
        </asp:Label>
    
	<TD>	<asp:TextBox ID="txtMailServer" runat="server"></asp:TextBox>    
  <TD> <font color = blue>[For Example :: Mail.YourDomain.com] </font><font color=red>(make sure your domain resolves to our mail server.) </font>
   	</TR>
	
 <TR>  <TD>     <asp:Label ID="Label2"  runat="server">Recipient Email Address: 

        </asp:Label>
    <TD>    <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>					</TR>
      
  <TR> <TD>     <asp:Label ID="Label3" 
          runat="server">Subject</asp:Label>

     <TD>   <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>				</TR>

      <TR>  <TD><asp:Label ID="Label4" runat="server">Mail Body:
        </asp:Label>
      
 <TD> <textarea runat="server" id="txtContent">	 </textarea>					</TR>

        <TR><TD align = center><asp:Button ID="btnSend" runat="server"
            Text="Send" OnClick="btnSend_Click"></asp:Button>				</TR>
    <TR> <TD colspan = 2> <asp:Label ID="lblStatus" runat="server" forecolor=Green Font-Size="15" Bold = true> 
        </asp:Label>
    </form>
</body>
</html>