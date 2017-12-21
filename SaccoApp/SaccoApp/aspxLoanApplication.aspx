<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxLoanApplication.aspx.cs" Inherits="SaccoApp.aspxLoanApplication" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
    <script language="JavaScript" type="text/javascript" src="/Scripts/CustomeFunctions.js">  </script>

    <script type="text/javascript">
        function MyJavaFunction(title, msg) {
            //alert("This is another function bbbbbbbbbbbbb.");
            var orignalstring = document.getElementById("msgbox").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", title);
            document.getElementById("msgbox").innerHTML = newstring;

            orignalstring = document.getElementById("msgbox").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", msg);
            document.getElementById("msgbox").innerHTML = newstring;

            document.getElementById('pagedimmer').style.visibility = 'visible';
            document.getElementById('pagedimmer').style.display = 'inline';
            document.getElementById('msgbox').style.visibility = 'visible';
            document.getElementById('msgbox').style.display = 'inline';
        }
        
        function MyKeyPress(domItem) {
            var orignalstring = document.getElementById(domItem).innerHTML;
            var newstring;
            for (var i = 0; i < orignalstring.length; i++) {
                var myChar = orignalstring.charAt(i)
            }
            newstring = "9";
            document.getElementById("msgbox").innerHTML = newstring;
        }
        
    </script>

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /*
        */
    </script>

    
    <style type="text/css">
        .TableCSS 
        { 
            border-style:none; 
            background-color:#3BA0D8; 
            width: 100%; 
        } 

        .TableHeader 
        { 
            background-color:#66CCFF; 
            color:#0066FF; 
            font-size:large; 
            font-family:Verdana; 
            }     

        .TableData 
        { 
            background-color:#82C13E;
            color:#fff; 
            font-family:Courier New; 
            font-size:medium;  
        }

        .GridView1 {
            border: 0px solid black;
            background-color: lightblue;
            width: 300px;
            height: inherit;
            overflow: auto;
            -webkit-transition: all 2s; /* Safari 3.1 to 6.0 */
            transition: all 2s;
        }

        .tdSearch {
            border: 0px solid black;
            background-color: lightblue;
            width: 300px;
            height: inherit;
            overflow: auto;
            -webkit-transition: all 2s; /* Safari 3.1 to 6.0 */
            transition: all 2s;
        }
        .tdSearch:hover {width: 600px;}
        #Button1 {
            width: 660px;
        }
        
        #tdSearch {
            -webkit-transition-property: width; /* Safari */
            transition-property: width;
            transition-Duration: 2s;
        }

        #tdSearch:hover {
            width: 600px;
        }

	    .arrow {
	      border: solid black;
	      border-width: 0 3px 3px 0;
	      display: inline-block;
	      padding: 3px;
	      vertical-align:middle;
	    }

	    .arrow.right {
		    transform: rotate(-45deg);
		    -webkit-transform: rotate(-45deg);
	    }

	    .arrow.left {
		    transform: rotate(135deg);
		    -webkit-transform: rotate(135deg);
	    }

	    .arrow.up {
		    transform: rotate(-135deg);
		    -webkit-transform: rotate(-135deg);
	    }

	    .arrow.down {
		    transform: rotate(45deg);
		    -webkit-transform: rotate(45deg);
	    }
        #Button2 {
            width: 660px;
        }
        
        </style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    


    <div class="page_dimmer" id="pagedimmer" style="display:none "> </div> 
    <div class="msg_box_container" id="msgbox" style="display:none "> 
    <table class="errorTableRound" cellpadding="5"> 
    <tr style="background-color:inherit;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;"> 
    <td colspan="2" style="font-weight:bolder">[TITLE]</td> 
    </tr> 
    <tr> 
    <td>[MESSAGE]</td> 
    </tr> 
    <tr> 
    <td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Button" value="OK" 
        onClick="document.getElementById('pagedimmer').style.visibility = 'hidden'; 
        document.getElementById('msgbox').style.visibility = 'hidden'"></td> 
    </tr> 
    </table> 
    </div> 

    

    
    <table style="width:100%;  height:500px" cellpadding="0" cellspacing="0" id="tblMaster">
        <tr style="height:inherit; vertical-align:top">
            <td style="background-color:#99CCFF; width:250px; height:inherit; overflow-x:auto; white-space: nowrap;" runat="server" id="tdSearch"
                class="tdSearch" >
                <div style="background-color:#99CCFF; height:inherit; width:inherit;  overflow-x:auto; white-space: nowrap" id="divSearchBar">
                     <table style="width:100%;">
                        <tr><td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </td></tr>
                        <tr><td>
                            <asp:Label ID="lblMemberNoSrch" runat="server" Text="Member No."></asp:Label>
                        </td></tr>
                        <tr><td>
                         <asp:TextBox ID="txtMemberNoSrch" runat="server" AutoPostBack="True"></asp:TextBox>
                        </td></tr>
                        <tr><td>
                            <asp:Label ID="lblSurnameSrch" runat="server" Text="Surname"></asp:Label>
                        </td></tr>
                        <tr><td>
                         <asp:TextBox ID="txtSurnameSrch" runat="server" width="210px" AutoPostBack="True"></asp:TextBox>
                        </td></tr>
                        <tr><td>
                            <asp:Label ID="lblOtherNameSrch" runat="server" Text="Other Names"></asp:Label>
                        </td></tr>
                        <tr><td>
                         <asp:TextBox ID="txtOtherNameSrch" runat="server" width="210px" 
                                AutoPostBack="True"></asp:TextBox>
                        </td></tr>
                        <tr><td>
                            <asp:Label ID="lblIDNoSrch" runat="server" Text="ID No"></asp:Label>
                        </td></tr>
                        <tr><td>
                         <asp:TextBox ID="txtIDNoSrch" runat="server" width="210px" 
                                AutoPostBack="True"></asp:TextBox>
                        </td></tr>
                        <tr><td>
                            
                        </td></tr>
                        <tr><td>
                            
                <asp:Menu ID="ReportsMenu" runat="server" Orientation="Horizontal"  CssClass="menu" 
                                EnableViewState="false" IncludeStyleBlock="false" OnMenuItemClick="ReportsMenu_MenuItemClick">
                                <Items>
                                    <asp:MenuItem Text="Reports" Value="Reports">
                                        <asp:MenuItem Text="Applied Loans Report" Value="Applied Loans Report" ></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>
                    <br>
                    <asp:Panel ID="pnlMembersSrch" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0" ScrollBars="Auto" Width="100%">
                        <asp:Label ID="Label1" runat="server" Text="Members" Font-Bold="true"></asp:Label><br>
                        <asp:GridView ID="GridView1" runat="server"  CssClass="GridView1"
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource1"
                            onselectedindexchanged="GridView1_SelectedIndexChanged"
                            onitemcommand="GridView1_ItemCommand" AllowPaging="True" PageSize="5">
                            
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#A2C19E"/>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Process" />
                                <asp:BoundField DataField="MemberNo" HeaderText="M. No." SortExpression="MemberNo" />
                                <asp:BoundField DataField="SurName" HeaderText="Sur Name" SortExpression="SurName" />
                                <asp:BoundField DataField="OtherNames" HeaderText="Other Names" SortExpression="OtherNames" />
                            </Columns>

                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_MEMBERS" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtMemberNoSrch" DefaultValue="%" Name="MemberNo" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtSurnameSrch" DefaultValue="%" Name="SurName" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtOtherNameSrch" DefaultValue="%" Name="OtherNames" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtIDNoSrch" DefaultValue="%" Name="IDNo" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                            </asp:Panel>
                        </td></tr>
                     </table>
                </div>
            </td>
            <td style="background-color:#dddddd; width:10px" onclick="hideViewSearchBar()">
                &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<br>
                <i class="arrow left" id="arrow">
            </td>
            <td>
                <asp:Panel ID="pnlTab" runat="server" Wrap="False" Visible="true" 
                        BackColor="#000066">
                    <table width="200px" cellpadding="0", cellspacing="0">
                        <tr>
                            <td>
                                <asp:Button ID="Button7" runat="server" Text="Application" Enabled="false" BorderStyle="Outset" BackColor="YellowGreen"/></td><td>
                                <asp:Button ID="Button2" runat="server" Text="Guarantors" Enabled="false" /></td><td>
                                <asp:Button ID="Button3" runat="server" Text="Appraisal" Enabled="false"/></td><td>
                                <asp:Button ID="Button4" runat="server" Text="Endorsement" Enabled="false"/></td><td>
                                <asp:Button ID="Button5" runat="server" Text="Cheque Entry" Enabled="false"/></td><td>
                                <asp:Button ID="Button6" runat="server" Text="Effect Repayment" Enabled="false"/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlControls" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">   
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                    <asp:Button ID="btnSave" runat="server" Text="Save"  
                        Enabled="False" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                        Enabled="False" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    <asp:TextBox ID="txtUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                    <br>
                </asp:Panel>
                


        </tr>
    </table>




</asp:Content>

