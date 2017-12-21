<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxShareContribution.aspx.cs" Inherits="SaccoApp.aspxShareContribution" %>
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


        function hideViewSearchBar() {
            var x = document.getElementById('divSearchBar');
            var y = document.getElementById('tdSearch');
            var arrow = document.getElementById('arrow');

            /*
            if (x.style.display === 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }
            if (y.style.visibility === 'visible') {
                y.style.display = 'collapse';
            } else {
                y.style.display = 'visible';
            }*/


            table = document.getElementById("tblMaster");
            tr = table.getElementsByTagName('tr');
            td = tr[0].getElementsByTagName('td')[0];
            if (td.style.width !== '0px') {
                td.style.width = '0px';
                td.style.transitionProperty = 'width';
                td.style.transitionDuration = '3s';
                arrow.style.transform = 'rotate(-45deg)';
            } else {
                td.style.width = '300px';
                td.style.transitionProperty = 'width';
                td.style.transitionDuration = '3s';
                arrow.style.transform = 'rotate(-225deg)';
            }

            gv = document.getElementById("GridView1");
            if (gv.style.width !== '0px') {
                gv.style.width = '0px';
                gv.style.transitionProperty = 'width';
                gv.style.transitionDuration = '3s';
            } else {
                gv.style.width = '300px';
                gv.style.transitionProperty = 'width';
                gv.style.transitionDuration = '3s';
            }
            //alert("Hello World!");
        }

        if (window.addEventListener) {
            window.addEventListener("resize", browserResize);
        } else if (window.attachEvent) {
            window.attachEvent("onresize", browserResize);
        }
        var xbeforeResize = window.innerWidth;

        function browserResize() {
            var afterResize = window.innerWidth;
            if ((xbeforeResize < (970) && afterResize >= (970)) || (xbeforeResize >= (970) && afterResize < (970)) ||
                (xbeforeResize < (728) && afterResize >= (728)) || (xbeforeResize >= (728) && afterResize < (728)) ||
                (xbeforeResize < (468) && afterResize >= (468)) || (xbeforeResize >= (468) && afterResize < (468))) {
                xbeforeResize = afterResize;
                googletag.cmd.push(function () {
                    googletag.pubads().refresh([gptAdSlots[0]]);
                });
            }
            if (window.screen.availWidth <= 768) {
                restack(window.innerHeight > window.innerWidth);
            }
            fixDragBtn();
            showFrameSize();
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
                     </table>
                </div>
                <asp:Menu ID="ReportsMenu" runat="server" Orientation="Horizontal"  CssClass="menu" 
                                EnableViewState="false" IncludeStyleBlock="false" OnMenuItemClick="ReportsMenu_MenuItemClick">
                                <Items>
                                    <asp:MenuItem Text="Reports" Value="Reports">
                                        <asp:MenuItem Text="All Transactions Report" Value="All Transactions Report" ></asp:MenuItem>
                                        <asp:MenuItem Text="Periodic Transactions Report" Value="Periodic Transactions Report" ></asp:MenuItem>
                                        <asp:MenuItem Text="Total Shares Summary Report" Value="Total Shares Summary Report" ></asp:MenuItem>
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
                                <asp:CommandField ShowSelectButton="True" />
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
                <div  style="height:inherit;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" />
                    <asp:Button ID="btnSave" runat="server" Text="Save"  
                        Enabled="False" />
                    <asp:Button ID="btnSaveNAddNew" runat="server" Text="Save and Add New" 
                         Enabled="False"  />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                        Enabled="False" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    <asp:Button ID="btnPopup" runat="server" Text="Popup" 
                         Visible="False" />
                    <asp:Button ID="btnImpEmployees" runat="server" Text="Import From CSV file" 
                         Visible="true" OnClick="btnImpEmployees_Click" />
                    <asp:TextBox ID="txtUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                    <br>
                
                    <asp:Panel ID="pnlMemberDtls" runat="server" Wrap="False" Visible="true" 
                            BackColor="#99CCF0">   
                                <asp:Button ID="btnMemberDtls" runat="server"  style="text-align:left"
                                Text="Member Details       (View/Hide)" Height="20px" 
                                Width="100%" BackColor="#7AC1C7" />                     
                                <table style="width: 80%; ">
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblMemberNo" runat="server" Text="Member No." Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="lblMemberName" runat="server" Text="Member Name" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td colspan="2">
                                            <asp:Label ID="lblStation" runat="server" Text="Station" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:TextBox ID="txtMemberNo" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtMemberName" runat="server" Width="300px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtStation" runat="server" Width="217px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                    </tr>
                                
                                    <tr>
                                        <td valign="top">
                                            <asp:Label ID="lblInitSharesDate" runat="server" Text="Init Shares Date" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblInitialShares" runat="server" Text="Initial Shares" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotShares" runat="server" Text="Total Shares" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblDefaultAmount" runat="server" Text="Default Amount" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblWithdrawn" runat="server" Text="Withdrawn" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <asp:TextBox ID="txtInitSharesDate" runat="server" Width="100px" Enabled="false" > </asp:TextBox>  
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtInitShares" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotShares" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDefaultAmount" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWithdrawn" runat="server" Enabled="false" Width="100px" Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlWithdrawn" runat="server" AutoPostBack="True" Width="100px" Visible="true">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button ID="btnSaveWithdrawal" runat="server" BackColor="#7AC1C7" Height="20px" style="text-align:left" Text="save withdrwal status" Width="150px" OnClick="btnSaveWithdrawal_Click" />
                                        </td>
                                    </tr>

                                </table>
                    </asp:Panel>
                </div>
                
                <asp:Panel ID="Editing" runat="server" Wrap="False" Visible="False" 
                        BackColor="#99CCF0">
                        <asp:Button ID="btnEditPnl" runat="server" 
                            Text="Edit Member Details       (View/Hide)" Height="20px"  style="text-align:left"
                            onclick="btnEditPnl_Click" Width="100%" BackColor="#7AC1C7" />
                    <asp:Panel ID="pnlEditingData" runat="server" Wrap="False" Visible="False"
                        BackColor="#99CCFF">     
                            <table style="width: 80%; ">
                                <tr>
                                    <td valign="top">

                                    </td>
                                </tr>


                            </table>

                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="pnlShareContributions" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">
                        <asp:Button ID="Button1" runat="server"  style="text-align:left"
                            Text="Share Contributions       " Height="20px" 
                            Width="100%" BackColor="#7AC1C7" />

                            <asp:GridView ID="gvShareContrib" runat="server" 
                            AllowSorting="True" AutoGenerateColumns="False" 
                            onselectedindexchanged="gv_SelectedIndexChanged" DataSourceID="SqlDataSource2" AllowPaging="True">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="Contribdate" HeaderText="Contr Date" ReadOnly="True" SortExpression="Contribdate" />
                                    <asp:BoundField DataField="RefNo" HeaderText="RefNo." SortExpression="RefNo" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                    <asp:BoundField DataField="ShareBal" HeaderText="Share Bal" SortExpression="ShareBal" />
                                    <asp:BoundField DataField="TransBy" HeaderText="Payment Method" SortExpression="TransBy" />
                                    <asp:BoundField DataField="ReceiptNo" HeaderText="Receipt No" SortExpression="ReceiptNo" />
                                    <asp:BoundField DataField="Posted" HeaderText="Posted" SortExpression="Posted" />
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
                                </Columns>

                            </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_member_contrib" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtMemberNo" Name="MemberNo" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </asp:Panel>
                
                    <asp:Panel ID="pnlDisplayImportData" runat="server" Wrap="False" Visible="False"
                        BackColor="#99CCFF"  ScrollBars="Horizontal" Width="1000">   
                        <table id="tblImportEmp"  runat="server" width="100%" visible="true">
                        <tr>
                            <td>                                    
                                <asp:FileUpload ID="FileUpload1" runat="server"/> 
                                <asp:Button ID="btnUpLoad" runat="server" Text="Upload" 
                                    onclick="btnUpLoad_Click" />
                                <asp:Button ID="btnClearData" runat="server" Text="Clear Data" 
                                    onclick="btnClearData_Click" />
                                <asp:Button ID="btnSaveDataToDb" runat="server" Text="Save Data to Database" 
                                    onclick="btnSaveDataToDb_Click" />
                                <asp:Button ID="btnExportErrData" runat="server" 
                                    Text="Export Unloaded Data to CSV file" onclick="btnExportErrData_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>                                    
                                <asp:Label ID="lblUploadStatus" runat="server" Text="Upload Status"></asp:Label>
                            </td>
                        </tr>
                        </table>
                        <asp:GridView ID="gvImportEmpData" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </asp:Panel>  
                    <br />
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
                                    <asp:Label ID="lblDateFrom" runat="server" Text="Date From"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateFrom" runat="server" Width="100px" Enabled="true"> </asp:TextBox>
                                </td>
                                <td>                                    
                                    <asp:Label ID="lblDateTo" runat="server" Text="Date To"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateTo" runat="server" Width="100px" Enabled="true"> </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>  

            </td>
        

        </tr>
    </table>

</asp:Content>

