<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxLoanTypes.aspx.cs" Inherits="SaccoApp.aspxLoanTypes" %>
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

        function DisplayReports(title, msg) {
            var orignalstring = document.getElementById("divReports2").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", "Report.");
            document.getElementById("divReports2").innerHTML = newstring;

            orignalstring = document.getElementById("divReports2").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", "");
            document.getElementById("divReports2").innerHTML = newstring;

            document.getElementById('divReports1').style.visibility = 'visible';
            document.getElementById('divReports1').style.display = 'inline';
            document.getElementById('divReports2').style.visibility = 'visible';
            document.getElementById('divReports2').style.display = 'inline';
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

        function fnAccSearch(title, msg) {
            //alert("This is another function bbbbbbbbbbbbb.");
            var orignalstring = document.getElementById("accSearchbox").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", title);
            document.getElementById("accSearchbox").innerHTML = newstring;

            orignalstring = document.getElementById("accSearchbox").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", msg);
            document.getElementById("accSearchbox").innerHTML = newstring;

            document.getElementById('pagedimmer').style.visibility = 'visible';
            document.getElementById('pagedimmer').style.display = 'inline';
            document.getElementById('accSearchbox').style.visibility = 'visible';
            document.getElementById('accSearchbox').style.display = 'inline';
        }
    </script>

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /*
            Date formating goes here
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
    

    
    <div class="msg_box_container" id="accSearchbox" style="display:none " >
    <table class="errorTableRound" cellpadding="5"> 
    <tr style="background-color:inherit;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;"> 
    <td colspan="2" style="font-weight:bolder">[TITLE]</td> 
    </tr> 
    <tr> 
    <td>[MESSAGE]
        

    </td> 
    </tr> 
    <tr> 
    <td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Button" value="OK" 
        onClick="document.getElementById('pagedimmer').style.visibility = 'hidden'; 
    document.getElementById('accSearchbox').style.visibility = 'hidden'">
    </td> 
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

                        <asp:Menu ID="ReportsMenu" runat="server" Orientation="Horizontal"  CssClass="menu" 
                            EnableViewState="false" IncludeStyleBlock="false" OnMenuItemClick="ReportsMenu_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text="Reports" Value="Reports">
                                    <asp:MenuItem Text="Loan Types Report" Value="Loan Types Report" ></asp:MenuItem>
                                </asp:MenuItem>
                            </Items>
                        </asp:Menu>
                        <asp:TextBox ID="txtLoanCodeSrch" runat="server" Visible="false" Text=""></asp:TextBox>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>

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
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="LoanCode" HeaderText="LoanCode" SortExpression="LoanCode" />
                                <asp:BoundField DataField="LoanType" HeaderText="LoanType" SortExpression="LoanType" />
                            </Columns>

                        </asp:GridView>
                        
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_loantypes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtLoanCodeSrch" DefaultValue="null" Name="LoanCode" PropertyName="Text" Type="String" />
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
                
                <asp:Panel ID="pnlLoanTypeDtls" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">
                        <button type="button" id="btnLoanDtlsSetup" 
                        style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700 ">Loan Type Details</button>
                        
                            <asp:Panel ID="pnlControls" runat="server" Wrap="False" Visible="true" 
                                    BackColor="#99CCF0">   
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                                <asp:Button ID="btnSave" runat="server" Text="Save"  
                                    Enabled="False" OnClick="btnSave_Click"  />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                    Enabled="False" OnClick="btnDelete_Click"  />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                <asp:TextBox ID="txtUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                                <br>
                            </asp:Panel>  
                    
                            <table style="width: 100%; " cellspacing="0">
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="lblLoanCode" runat="server" Text="Loan Code" Width="100px" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblLoanType" runat="server" Text="Loan Type" Width="100px" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:TextBox ID="txtLoanCode" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLoanType" runat="server" Width="300px" Enabled="true" > </asp:TextBox>  
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <table id="tdLoanDtls" style="width: 100%; " cellspacing="2" border="1">
                                <tr>
                                    <td id="tdLoanDtls2" valign="top" style="width:50%; ">
                                        <table style="width:100%; " cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top" colspan="4">
                                                    <button type="button" id="btnLoanDtlsSetup" 
                                                    style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700 ">Loan Details</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblMaxAmount" runat="server" Text="Maximum Amount" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtMaxAmount" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblInterestRate" runat="server" Text="Interest Rate" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInterestRate" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRepayPeriod" runat="server" Text="Repay Period" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRepayPeriod" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblGuarRequired" runat="server" Text="Requires Guarantors" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtGuarRequired" runat="server" Width="100px" Enabled="true" Visible="false" > </asp:TextBox>      
                                                    <asp:DropDownList ID="ddlGuarRequired" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                        <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                        <asp:ListItem Value="YES">YES</asp:ListItem>
                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    </asp:DropDownList> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblInsuranceType" runat="server" Text="Insurance Type" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInsuranceType" runat="server" Width="100px" Enabled="true" Visible="false" > </asp:TextBox>   
                                                    <asp:DropDownList ID="ddlInsuranceType" runat="server" AutoPostBack="True" Visible="true" >
                                                        <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                        <asp:ListItem Value="AMOUNT">AMOUNT</asp:ListItem>
                                                        <asp:ListItem Value="PERCENTAGE">PERCENTAGE</asp:ListItem>
                                                        <asp:ListItem Value="INSURANCE RATE">INSURANCE RATE</asp:ListItem>
                                                    </asp:DropDownList> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblInsurancerate" runat="server" Text="Insurance rate" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInsurancerate" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                                </td>
                                            </tr>
                                        </table> 
                                    </td>
                                    <td id="tdAccDtls" valign="top" style="width:50%; ">
                                        <table style="width:100%; " cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td valign="top" colspan="4">
                                                    <button id="btnLoanAccs" style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700 " type="button">
                                                        Loan Accounts
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblAmtIssuedDrAcc" runat="server" Text="Amt Issued Dr. Account" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmtIssuedDrAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtAmtIssuedDrAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblAmtIssuedCrAcc" runat="server" Text="Amt Issued Cr. Account" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmtIssuedCrAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtAmtIssuedCrAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblUpfrIntrAcc" runat="server" Text="Upfront Interest Account" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUpfrIntrAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtUpfrIntrAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblAccruedIntrAcc" runat="server" Text="Accrued Interest Account" Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAccruedIntrAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtAccruedIntrAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblLoanPymtToFOSAAcc" runat="server" Text="Loan Payment To FOSA Acc." Width="150px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLoanPymtToFOSAAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtLoanPymtToFOSAAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <asp:Label ID="lblInsuranceAcc" runat="server" Text="Insurance Acc." Width="100px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInsuranceAcc" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                                    <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                                    <asp:TextBox ID="txtInsuranceAcc0" runat="server" Width="100px" Enabled="true" Visible="False" ></asp:TextBox>    
                                                </td>
                                            </tr>
                                        </table> 
                                    </td>
                                </tr>
                            </table>
                </asp:Panel >
            </td>
        </tr>
    </table >

</asp:Content>

