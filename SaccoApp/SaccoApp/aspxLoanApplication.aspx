<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxLoanApplication.aspx.cs" Inherits="SaccoApp.aspxLoanApplication" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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

        function fnWitnessSearch(title, msg) {
            //alert("This is another function bbbbbbbbbbbbb.");
            var orignalstring = document.getElementById("witnessSearchbox").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", title);
            document.getElementById("witnessSearchbox").innerHTML = newstring;

            orignalstring = document.getElementById("witnessSearchbox").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", msg);
            document.getElementById("witnessSearchbox").innerHTML = newstring;

            document.getElementById('pagedimmer').style.visibility = 'visible';
            document.getElementById('pagedimmer').style.display = 'inline';
            document.getElementById('witnessSearchbox').style.visibility = 'visible';
            document.getElementById('witnessSearchbox').style.display = 'inline';
        }

        function fnSupervisorSearch(title, msg) {
            //alert("This is another function bbbbbbbbbbbbb.");
            var orignalstring = document.getElementById("supSearchbox").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", title);
            document.getElementById("supSearchbox").innerHTML = newstring;

            orignalstring = document.getElementById("supSearchbox").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", msg);
            document.getElementById("supSearchbox").innerHTML = newstring;

            document.getElementById('pagedimmer').style.visibility = 'visible';
            document.getElementById('pagedimmer').style.display = 'inline';
            document.getElementById('supSearchbox').style.visibility = 'visible';
            document.getElementById('supSearchbox').style.display = 'inline';
        }

        function fnGuarantorSearch(title, msg) {
            //alert("This is another function bbbbbbbbbbbbb.");
            var orignalstring = document.getElementById("guarSearchbox").innerHTML;
            var newstring = orignalstring.replace("[TITLE]", title);
            document.getElementById("guarSearchbox").innerHTML = newstring;

            orignalstring = document.getElementById("guarSearchbox").innerHTML;
            newstring = orignalstring.replace("[MESSAGE]", msg);
            document.getElementById("guarSearchbox").innerHTML = newstring;

            document.getElementById('pagedimmer').style.visibility = 'visible';
            document.getElementById('pagedimmer').style.display = 'inline';
            document.getElementById('guarSearchbox').style.visibility = 'visible';
            document.getElementById('guarSearchbox').style.display = 'inline';
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
        
        function fnViewHideMemberLoanDtls(domItem) {
            if (document.getElementById('tbMemberLoanDtls').style.visibility == 'visible') {
                document.getElementById('tbMemberLoanDtls').style.visibility = 'collapse'
            } else {
                document.getElementById('tbMemberLoanDtls').style.visibility = 'visible'
            }
        }
    </script>

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
    <script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtApplicationDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%d/%m/%Y",  //"%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });  
        });
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
    
    <div class="page_dimmer" id="divReports1" style="display:none "> </div> 
    <div class="report_container2" id="divReports2" style="display:none "> 
    <table class="errorTableRound" cellpadding="5"> 
    <tr style="background-color:inherit;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;"> 
    <td colspan="1" style="font-weight:bolder">Pay Slips</td> 
    <td align="right">
        <input type="Button" value="X" 
        onClick="document.getElementById('divReports1').style.visibility = 'hidden'; 
        document.getElementById('divReports2').style.visibility = 'hidden'">
    </td>
    </tr> 
    <tr> 
    <td valign="top" style="height:100%"> 
        <rsweb:ReportViewer ID="rvAppliedLoans" runat="server" Font-Names="Verdana" Width="100%" Height="98%" bottom="0px"
         BackColor="#ffffff" ForeColor="#000000"
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
            <LocalReport ReportPath="Reports/rptAppliedLoans.rdlc" >
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetAppLoans" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
    </td>         
    </tr>
    </table> 
    </div> 

    <div class="msg_box_container" id="witnessSearchbox" style="display:none " >
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
        
                    <asp:Panel ID="pnlWitnSearch" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0" ScrollBars="Auto" Width="100%" Height="250px">
                        <asp:Label ID="Label2" runat="server" Text="Members" Font-Bold="true"></asp:Label><br>
                        <asp:GridView ID="gvWitnSearch" runat="server"  CssClass="GridView1"
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource4"
                            onselectedindexchanged="gvWitnSearch_SelectedIndexChanged"
                            onitemcommand="gvWitnSearch_ItemCommand" PageSize="5">
                            
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#A2C19E"/>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Link" SelectText="Select" />
                                <asp:BoundField DataField="MemberNo" HeaderText="M. No." SortExpression="MemberNo" />
                                <asp:BoundField DataField="SurName" HeaderText="Sur Name" SortExpression="SurName" />
                                <asp:BoundField DataField="OtherNames" HeaderText="Other Names" SortExpression="OtherNames" />
                            </Columns>

                        </asp:GridView>
                    </asp:Panel>

    </td> 
    </tr> 
    <tr> 
    <td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Button" value="OK" 
        onClick="document.getElementById('pagedimmer').style.visibility = 'hidden'; 
    document.getElementById('witnessSearchbox').style.visibility = 'hidden'">
    </td> 
    </tr> 
    </table> 
    </div>

    <div class="msg_box_container" id="supSearchbox" style="display:none "> 
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
        
                    <asp:Panel ID="pnlSupSearch" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0" ScrollBars="Auto" Width="100%" Height="250px">
                        <asp:Label ID="Label3" runat="server" Text="Members" Font-Bold="true"></asp:Label><br>
                        <asp:GridView ID="gvSupSearch" runat="server"  CssClass="GridView1"
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource4"
                            onselectedindexchanged="gvSupSearch_SelectedIndexChanged"
                            onitemcommand="gvSupSearch_ItemCommand" PageSize="5">
                            
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#A2C19E"/>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Link" SelectText="Select" />
                                <asp:BoundField DataField="MemberNo" HeaderText="M. No." SortExpression="MemberNo" />
                                <asp:BoundField DataField="SurName" HeaderText="Sur Name" SortExpression="SurName" />
                                <asp:BoundField DataField="OtherNames" HeaderText="Other Names" SortExpression="OtherNames" />
                            </Columns>

                        </asp:GridView>
                    </asp:Panel>

    </td> 
    </tr> 
    <tr> 
    <td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Button" value="OK" 
        onClick="document.getElementById('pagedimmer').style.visibility = 'hidden'; 
        document.getElementById('supSearchbox').style.visibility = 'hidden'">
    </td> 
    </tr> 
    </table> 
    </div> 

    <div class="msg_box_container" id="guarSearchbox" style="display:none "> 
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
        
                    <asp:Panel ID="pnlGuarSearch" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0" ScrollBars="Auto" Width="100%" Height="250px">
                        <asp:Label ID="lblGvLOV" runat="server" Text="Members" Font-Bold="true"></asp:Label><br>
                        <asp:GridView ID="gvGuarSearch" runat="server"  CssClass="GridView1"
                            AllowSorting="True" AutoGenerateColumns="False" 
                            DataSourceID="SqlDataSource4"
                            onselectedindexchanged="gvGuarSearch_SelectedIndexChanged"
                            onitemcommand="gvGuarSearch_ItemCommand" PageSize="5">
                            
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#A2C19E"/>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" ButtonType="Link" SelectText="Select" />
                                <asp:BoundField DataField="MemberNo" HeaderText="M. No." SortExpression="MemberNo" />
                                <asp:BoundField DataField="SurName" HeaderText="Sur Name" SortExpression="SurName" />
                                <asp:BoundField DataField="OtherNames" HeaderText="Other Names" SortExpression="OtherNames" />
                            </Columns>

                        </asp:GridView>
                    </asp:Panel>

    </td> 
    </tr> 
    <tr> 
    <td colspan="2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="Button" value="OK" 
        onClick="document.getElementById('pagedimmer').style.visibility = 'hidden'; 
        document.getElementById('guarSearchbox').style.visibility = 'hidden'">
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
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="SaccoApp.DataSetAppLoansTableAdapters.BS_rptAppliedLoansTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtDateFrom" DefaultValue="01/01/2000" Name="DateFrom" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtDateTo" DefaultValue="31/12/2030" Name="DateTo" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>

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
                                <asp:CommandField ShowSelectButton="True" ButtonType="Link" SelectText="Select" />
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_MEMBERS" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="%" Name="MemberNo" Type="String" />
                                <asp:Parameter DefaultValue="%" Name="SurName" Type="String" />
                                <asp:Parameter DefaultValue="%" Name="OtherNames" Type="String" />
                                <asp:Parameter DefaultValue="%" Name="IDNo" Type="String" />
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
                <asp:Panel ID="pnlMemberDtls" runat="server" Wrap="False" Visible="true" 
                            BackColor="#99CCF0">   
                                <asp:Button ID="btnMemberDtls" runat="server"  style="text-align:left"
                                Text="Member Details       (View/Hide)" Height="20px" 
                                Width="100%" BackColor="#7AC1C7" Visible="false"/>
                                                     
                                <button type="button" id="btnViewHideMemberLoanDtls" onclick="fnViewHideMemberLoanDtls()" 
                                    style="width: 100%; text-align:left; background-color:#7AC1C7 ">View/Hide Member Loan Details</button>
                                <table style="width: 80%; ">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblMemberNo" runat="server" Text="Member No." Width="110px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="lblMemberName" runat="server" Text="Member Name" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotShares" runat="server" Text="Total Shares" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:TextBox ID="txtMemberNo" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtMemberName" runat="server" Width="300px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotShares" runat="server" Width="200px" Enabled="false" ></asp:TextBox>  
                                        </td>
                                        <td></td>
                                    </tr>                   
                                </table>  
                                     
                                <table id="tbMemberLoanDtls" style="width: 80%; visibility:visible">
                                
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblOsLoans" runat="server" Text="Outstanding Loans" Width="110px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOsLoans" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMonthlyPrincipal" runat="server" Text="Monthly Principal" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMonthlyPrincipal" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td rowspan="1">
                                            <asp:Label ID="lblRepaymentOptions" runat="server" Text="Repayment Options" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblOsLoanBal" runat="server" Text="Outstanding Loan Bal" Width="130px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOsLoanBal" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMonthlyIntr" runat="server" Text="Monthly Interest" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMonthlyIntr" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td rowspan="1">
                                            <asp:TextBox ID="txtRepayOption" runat="server" Enabled="false" Width="100px" Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlRepayOption" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="STR">STRAIGHT LINE</asp:ListItem>
                                                <asp:ListItem Value="RBAL">REDUCING BALANCE</asp:ListItem>
                                                <asp:ListItem Value="AMT">AMORTIZED</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblMaxLoanAmt" runat="server" Text="Max Loan Amount" Width="110px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMaxLoanAmt" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotMonthlyRpymt" runat="server" Text="Total Monthly Repayment" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotMonthlyRpymt" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblApply23Rule" runat="server" Text="Apply 2/3 Rule" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblCurrTotDed" runat="server" Text="Current Total Deductions" Width="110px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCurrTotDed" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblNewDeduction" runat="server" Text="New Deductions" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNewDeduction" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td rowspan="1">
                                            <asp:TextBox ID="txtApply23Rule" runat="server" Enabled="false" Width="100px" Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlApply23Rule" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                </table>
                </asp:Panel>
                
                <asp:Panel ID="pnlPendingApplications" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">
                        <asp:Button ID="btnPendingApplications" runat="server"  style="text-align:left"
                        Text="Pending Loan Applications       (View/Hide)" Height="20px" 
                        Width="100%" BackColor="#7AC1C7" /> 
                            <asp:Panel ID="pnlControls" runat="server" Wrap="False" Visible="true" 
                                    BackColor="#99CCF0">   
                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                <asp:Button ID="btnSave" runat="server" Text="Save"  
                                    Enabled="False" OnClick="btnSave_Click" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                    Enabled="False" OnClick="btnDelete_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                <asp:TextBox ID="txtUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                                <br>
                            </asp:Panel>  
                    
                            <asp:GridView ID="gvLoanApplication" runat="server" 
                            AllowSorting="True" AutoGenerateColumns="False" 
                            onselectedindexchanged="gv_SelectedIndexChanged" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="3">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Link" SelectText="Select" />
                                    <asp:BoundField DataField="LoanNo" HeaderText="LoanNo" SortExpression="LoanNo" />
                                    <asp:BoundField DataField="LoanAmt" HeaderText="LoanAmt" SortExpression="LoanAmt" />
                                    <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" ReadOnly="True" />
                                    <asp:BoundField DataField="RepayPeriod" HeaderText="RepayPeriod" SortExpression="RepayPeriod" />
                                    <asp:BoundField DataField="LoanCode" HeaderText="LoanCode" SortExpression="LoanCode" />
                                    <asp:BoundField DataField="LoanType" HeaderText="LoanType" SortExpression="LoanType" />
                                    <asp:BoundField DataField="ApplicDate" HeaderText="ApplicDate" SortExpression="ApplicDate" ReadOnly="True" />
                                </Columns>

                            </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_loan_applications" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtMemberNo" Name="MemberNo" PropertyName="Text" Type="String" />
                                <asp:Parameter DefaultValue="null" Name="LoanNo" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </asp:Panel>
                
                <asp:Panel ID="pnlLoanDtls" runat="server" Wrap="False" Visible="true" 
                            BackColor="#99CCF0">   
                                <asp:Button ID="Button1" runat="server"  style="text-align:left"
                                Text="Loan Application Details       (View/Hide)" Height="20px" 
                                Width="100%" BackColor="#7AC1C7" /> 
                                      
                                <table style="width: 80%; " cellspacing="0">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblLoanNo" runat="server" Text="Loan No" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLoanNo" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAmount" runat="server" Text="Amount" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAmount" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblRepayPeriod" runat="server" Text="Repay Period(M)" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRepayPeriod" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblApplicationDate" runat="server" Text="Application Date" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtApplicationDate" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                            <img alt="Date" src="/Images/calender.png" />  
                                            &nbsp;&nbsp;  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEarnings" runat="server" Text="Earnings" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEarnings" runat="server" Width="100px" Enabled="true" > </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblJobGroup" runat="server" Text="Job Group" Width="100px" Font-Bold="true" Visible="false"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtJobGroup" runat="server" Width="100px" Enabled="true" Visible="false" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblLoanCode" runat="server" Text="Loan Code" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLoanCode" runat="server" Width="100px" Enabled="false" Visible="true"></asp:TextBox> 
                                        </td>
                                        <td>
                                            <asp:Label ID="lblLoanType" runat="server" Text="Purpose" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td colspan="3"> 
                                            <asp:DropDownList ID="ddlLoanCode" runat="server" AutoPostBack="True" Width="250px" 
                                                DataSourceID="SqlDataSource3" DataTextField="LoanType" DataValueField="LoanCode" 
                                                OnSelectedIndexChanged="ddlLoanCode_SelectedIndexChanged">
                                                <asp:ListItem Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="select '' LoanCode, '' LoanType 
union all
SELECT LoanCode, LoanType FROM BS_LOANTYPE"></asp:SqlDataSource>
                                        </td>
                                    </tr>

                                    
                                    <tr style="background-color:#7AC1C7" >
                                        <td valign="top">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblWitnsMemberNo" runat="server" Text="Witness Member No" Width="200px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblWitnsMemberNames" runat="server" Text="Names" Width="130px" Font-Bold="True"></asp:Label> 
                                        </td>

                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblWitnessSigned" runat="server" Text="Witness Signed" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWitnessSigned" runat="server" Width="100px" Enabled="true" Visible="false" > </asp:TextBox>    
                                            <asp:DropDownList ID="ddlWitnessSigned" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                            </asp:DropDownList> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWitnsMemberNo" runat="server" Width="100px" Enabled="true" Visible="true" > </asp:TextBox> 
                                            <img alt="Member" src="/Images/people.ico" onclick="fnWitnessSearch('Witness','')"/>  
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWitMemberNames" runat="server" Width="200px" Enabled="true" Visible="true" > </asp:TextBox> 
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSupervisorSigned" runat="server" Text="Supervisor Signed" Width="130px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSupervisorSigned" runat="server" Width="100px" Enabled="true" Visible="false" > </asp:TextBox>   
                                            <asp:DropDownList ID="ddlSupervisorSigned" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                            </asp:DropDownList> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSupervMemberNo" runat="server" Width="100px" Enabled="true" Visible="true" > </asp:TextBox> 
                                            <img alt="Member" src="/Images/people.ico" onclick="fnSupervisorSearch('Supervisor','')"/>  
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSupervMemberNames" runat="server" Width="200px" Enabled="true" Visible="true" > </asp:TextBox> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPreparedBy" runat="server" Text="Prepared By" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPreparedBy" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAdditionalSecurity" runat="server" Text="Additional Security" Width="130px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAdditionalSecurity" runat="server" Width="200px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblInsuranceType" runat="server" Text="Insurance Type" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInsuranceType" runat="server" Width="10px" Enabled="true" Visible="false" > </asp:TextBox>  
                                            <asp:DropDownList ID="ddlInsuranceType" runat="server" AutoPostBack="True" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="AMOUNT">AMOUNT</asp:ListItem>
                                                <asp:ListItem Value="PERCENTAGE">PERCENTAGE</asp:ListItem>
                                                <asp:ListItem Value="INSURANCE RATE">INSURANCE RATE</asp:ListItem>
                                            </asp:DropDownList> 
                                        </td>
                                        <td>
                                            <asp:Label ID="lblInsurAmt" runat="server" Text="Insurance Amount" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInsuranceAmt" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAmountGuarteed" runat="server" Font-Bold="True" Text="Amount Guaranteed" Width="100px"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAmountGuarteed" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblInsPercent" runat="server" Text="Insurance Rate" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInsPercent" runat="server" Width="100px" Enabled="true" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                </table>
                </asp:Panel>

                <asp:Panel ID="pnlNext" runat="server" Wrap="False" Visible="true" 
                        BackColor="#000066">
                    <asp:Button ID="btnPassTOGuarantors" runat="server" Text="Gurantor Capture" Font-Bold="true"/>
                </asp:Panel>
    
                <asp:Panel ID="pnlAddGuarantors" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">
                        <asp:Button ID="Button11" runat="server"  style="text-align:left"
                        Text="Guarantors       (View/Hide)" Height="20px" 
                        Width="100%" BackColor="#7AC1C7" /> 
                        <asp:Panel ID="pnlGuarantorCtrls" runat="server" Wrap="False" Visible="true" 
                                BackColor="#99CCF0">   
                            <asp:Button ID="btnGuarAdd" runat="server" Text="Add" OnClick="btnGuarAdd_Click" />
                            <asp:Button ID="btnGuarSave" runat="server" Text="Save"  
                                Enabled="False" OnClick="btnGuarSave_Click" />
                            <asp:Button ID="btnGuarDelete" runat="server" Text="Delete" 
                                Enabled="False" OnClick="btnGuarDelete_Click" />
                            <asp:Button ID="btnGuarCancel" runat="server" Text="Cancel" OnClick="btnGuarCancel_Click" />
                            <asp:TextBox ID="txtGuarUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                            <br>
                        </asp:Panel>  
                            
                        <asp:GridView ID="gvLoanGuarantors" runat="server" 
                        AllowSorting="True" AutoGenerateColumns="False" 
                        onselectedindexchanged="gvLG_SelectedIndexChanged" DataSourceID="SqlDataSource5" AllowPaging="True" PageSize="3">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />

                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="GuarMemberNo" HeaderText="Guarantor Member No" SortExpression="GuarMemberNo" />
                                <asp:BoundField DataField="Guar_Names" HeaderText="Guarantor Names" SortExpression="Guar_Names" ReadOnly="True" />
                                <asp:BoundField DataField="TotalShares" HeaderText="Total Shares" SortExpression="TotalShares" ReadOnly="True" />
                                <asp:BoundField DataField="AmountGuarteed" HeaderText="Amount Guaranteed" SortExpression="AmountGuarteed" />
                                <asp:BoundField DataField="OtherGuarteedLoanAmt" HeaderText="Other Guaranteed Loan Amt" SortExpression="OtherGuarteedLoanAmt" ReadOnly="True" />
                                <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                            </Columns>

                        </asp:GridView>
                     
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_loan_guarantors" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtMemberNo" Name="MemberNo" PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtLoanNo" Name="LoanNo" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <asp:Panel ID="pnlGuarDtls" runat="server" Wrap="False" Visible="true" 
                            BackColor="#99CCF0">
                                <table style="width: 80%; " cellspacing="0">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblGuarMemberNo" runat="server" Text="Guarentor Member No" Width="130px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGuarMemberNo" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                            <img alt="Member" src="/Images/people.ico" onclick="fnGuarantorSearch('Guarantors','')"/>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblGuarMemberNames" runat="server" Text="Guarantor Names" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGuarMemberNames" runat="server" Width="200px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:Label ID="lblAvailableAmt" runat="server" Text="Available Amount" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAvailableAmt" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblAllocatedAmt" runat="server" Text="Allocated Amount" Width="100px" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAllocatedAmt" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                        </td>
                                        <td> 
                                        </td>
                                        <td>
                                        </td>
                                        <td> 
                                        </td>
                                    </tr>

                                </table>
                     
                    </asp:Panel>
                     
                </asp:Panel>
                    <asp:Panel ID="pnlReports" runat="server" Wrap="False" Visible="False"
                        BackColor="#99CCFF"  ScrollBars="Auto" Width="1000"> 
                        <asp:Button ID="btnRptViewHide" runat="server" style="text-align:left"
                            Text="Reports Parameters" Height="20px"
                            onclick="btnRptViewHide_Click" Width="100%" BackColor="#7AC1C7" />  
                    
                        <table id="tblReprts"  runat="server" width="500px" visible="true">
                            <tr><td colspan="4">
                                <asp:Button ID="btnGenRpt" runat="server" Text="Generate Report" onclick="btnGenRpt_Click" />
                                </td>
                            </tr>
                            <tr><td colspan="4">
                                    <asp:Label ID="lblReportName" runat="server" Text="Report" Font-Bold="true" Font-Size="Large"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>                                    
                                    <asp:Label ID="lblDateFrom" runat="server" Text="Date From (DD/MM/YYYY)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateFrom" runat="server" Width="100px" Enabled="true"> </asp:TextBox>
                                </td>
                                <td>                                    
                                    <asp:Label ID="lblDateTo" runat="server" Text="Date To (DD/MM/YYYY)"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateTo" runat="server" Width="100px" Enabled="true"> </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>  

        </tr>
    </table>




</asp:Content>

