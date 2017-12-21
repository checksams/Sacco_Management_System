<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxMembers.aspx.cs" Inherits="SaccoApp.aspxMembers" %>
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
        $(document).ready(function () {
            $("#<%=txtAsAtDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%d/%m/%Y",  //"%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });  
            $("#<%=txtRegDate.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%d/%m/%Y",  //"%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: false,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()"
            });
            $("#<%=txt_DOB.ClientID %>").dynDateTime({
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


    
    <table style="width:100%;  height:500px" cellpadding="0" cellspacing="0">
        <tr style="height:inherit; vertical-align:top">
            <td style="background-color:#99CCFF; width:250px; height:inherit">
                <div style="background-color:#99CCFF; height:inherit; width:250px">
                    
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
                                        <asp:MenuItem Text="Registered Members Report" Value="Registered Members Report" ></asp:MenuItem>
                                        <asp:MenuItem Text="Next of Kins Report" Value="Next of Kins Report" ></asp:MenuItem>
                                        <asp:MenuItem Text="Member Statement Report" Value="Member Statement Report" ></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </td></tr>
                     </table>
                </div>
            </td>
            <td>
                <div  style="height:inherit;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save"  
                        Enabled="False" OnClick="btnSave_Click" />
                    <asp:Button ID="btnSaveNAddNew" runat="server" Text="Save and Add New" 
                         Enabled="False" OnClick="btnSaveNAddNew_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                        Enabled="False" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnPopup" runat="server" Text="Popup" 
                         Visible="False" />
                    <asp:Button ID="btnImpEmployees" runat="server" Text="Import From CSV file" 
                         Visible="true" OnClick="btnImpEmployees_Click" />
                    <asp:TextBox ID="txtUpdateType" runat="server" Width="217px" Enabled="true" Visible="false"> </asp:TextBox>
                    
                    <asp:Panel ID="pnlTests" runat="server" Wrap="False" Visible="False"  
                        BackColor="#99CCF0" >
                        <asp:Button ID="btnWriteTxt" runat="server" Text="Write Text File" 
                             Visible="true" OnClick="btnWriteTxt_Click" />
                        <asp:Button ID="btnReadTxt" runat="server" Text="Read Text File" 
                             Visible="true" OnClick="btnReadTxt_Click" />
                        <asp:Button ID="btnReadXML" runat="server" Text="Read XML File" 
                             Visible="true" OnClick="btnReadXML_Click" />
                        <asp:ListBox ID="ListBox1" runat="server" Width="100%"></asp:ListBox>
                    </asp:Panel>
                </div>
                <asp:Panel ID="Editing" runat="server" Wrap="False" Visible="False" 
                        BackColor="#99CCF0">
                        <asp:Button ID="btnEditPnl" runat="server" style="text-align:left"
                            Text="Edit Member Details       (View/Hide)" Height="20px" 
                            onclick="btnEditPnl_Click" Width="261px" BackColor="#7AC1C7" />
                    <asp:Panel ID="pnlEditingData" runat="server" Wrap="False" Visible="False"
                        BackColor="#99CCFF">                
                            <table style="width: 80%; ">
                                <tr>
                                    <td valign="top">
                                        <table style="width: 100%; ">
                                            <tr `>
                                                <td style="width:20%;">
                                                    <asp:Label ID="lbl_MemberNo" runat="server" Text="Member No. : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_MemberNo" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_surname" runat="server" Text="Surname : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_surname" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_other_names" runat="server" Text="Other Names : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_other_names" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSex" runat="server" Text="Gender : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSex" runat="server" Width="217px" Enabled="true" Visible="false"> </asp:TextBox>
                                                    <asp:DropDownList ID="ddlSex" runat="server" AutoPostBack="True"   Width="217px"
                                                        onselectedindexchanged="ddlSex_SelectedIndexChanged">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="MALE">MALE</asp:ListItem>
                                                        <asp:ListItem Value="FEMALE">FEMALE</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lbl_DOB" runat="server" Text="Date Of Birth : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_DOB" runat="server" Width="217px"> </asp:TextBox>
                                                    <img alt="Date" src="/Images/calender.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblIDNo" runat="server" Text="ID No : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtIDNo" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPINNo" runat="server" Text="PIN No : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPINNo" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRegDate" runat="server" Text="Registration Date : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRegDate" runat="server" Width="217px"> </asp:TextBox>
                                                    <img alt="Date" src="/Images/calender.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRegFee" runat="server" Text="Registration Fee : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRegFee" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPassBookFee" runat="server" Text="Pass Book Fee : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPassBookFee" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblInitShares" runat="server" Text="Initial Shares : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInitShares" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblAsAtDate" runat="server" Text="As At Date : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAsAtDate" runat="server" Width="217px"> </asp:TextBox>
                                                    <img alt="Date" src="/Images/calender.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblInitMonthlyContrib" runat="server" Text="Initial  Monthly Contribution : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtInitMonthlyContrib" runat="server" Width="217px" 
                                                        onkeypress="document.getElementById('txt_emp_tel_no1').innerHTML=this.value;"
                                                        AutoPostBack="True"
                                                        ontextchanged="txtInitMonthlyContrib_TextChanged"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCurrentContribution" runat="server" Text="Current Contribution : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCurrentContribution" runat="server" Width="217px" 
                                                        onkeypress="document.getElementById('txt_emp_tel_no1').innerHTML=this.value;"
                                                        AutoPostBack="True"
                                                        ontextchanged="txtCurrentContribution_TextChanged"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTotShares" runat="server" Text="Current Total Shares : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTotShares" runat="server" Width="217px"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblHomeTelNo" runat="server" Text="Home Telephone No : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeTelNo" runat="server" Width="217px" Enabled="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblHomeAddr" runat="server" Text="Home Address : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeAddr" runat="server" Width="217px" Enabled="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblDistrict" runat="server" Text="District : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDistrict" runat="server" Width="217px" Enabled="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblProvince" runat="server" Text="Province : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProvince" runat="server" Width="217px" Enabled="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="4">
                                                    <br>
                                                </td>
                                                <td rowspan="4">
                                                    <br>
                                                </td>
                                            </tr>
                                        </table>                                               
                                    </td>
                                    <td Style="vertical-align:top"> 
                                        <table style="width: 100%;">                                            
                                            <tr>
                                                <td  style="width:20%">
                                                    <asp:Button ID="btnEmpPhoto" runat="server" Text="View/Hide Employee's Photo. : " 
                                                        BackColor="#7AC1C7" Width="200px"
                                                        onclick="btnEmpPhoto_Click"></asp:Button>
                                                    <br>                          
                                                    <asp:Button ID="btnUploadEmpPhoto" runat="server" BackColor="#7AC1C7"
                                                        Width="200px"
                                                        onclick="btnUploadEmpPhoto_Click" Text="Preview Uploaded Photo. : " />
                                                    <br>                          
                                                    <asp:Button ID="btnSaveEmpPhoto" runat="server" BackColor="#7AC1C7"
                                                        Width="200px" 
                                                        onclick="btnSaveEmpPhoto_Click" Text="Save Employee's Photo. : " />
                                                    
                                                </td>
                                                <td>
                                                    <asp:Image ID="imgEmpPhoto" runat="server" Width="100px" Height="100px" Visible="false"
                                                    CssClass="img"
                                                     />
                                                </td>
                                            </tr>
                                            <tr><td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:FileUpload runat="server" ID="fupEmpPhotoUpload" />
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblStaffNo" runat="server" Text="Staff No. : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStaffNo" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblCompanyCode" runat="server" Text="Company Code : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCompanyCode" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEmployer" runat="server" Text="Employer : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmployer" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblStation" runat="server" Text="Station : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStation" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblOfficeAddr" runat="server" Text="Office Address : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOfficeAddr" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblOfficeTelNo" runat="server" Text="Office Telephone No : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtOfficeTelNo" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblEmploymentTerms" runat="server" Text="Employment Terms : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmploymentTerms" runat="server" Width="217px" Enabled="true" Visible="false"> </asp:TextBox>
                                                    <asp:DropDownList ID="ddlEmploymentTerms" runat="server" AutoPostBack="True"   Width="217px"
                                                        onselectedindexchanged="ddlEmploymentTerms_SelectedIndexChanged">
                                                        <asp:ListItem Value=""></asp:ListItem>
                                                        <asp:ListItem Value="PERMANENT">PERMANENT</asp:ListItem>
                                                        <asp:ListItem Value="TEMPORARY">TEMPORARY</asp:ListItem>
                                                        <asp:ListItem Value="CONTRACT">CONTRACT</asp:ListItem>
                                                        <asp:ListItem Value="OTHER">OTHER</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblRank" runat="server" Text="Rank : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRank" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblDepartment" runat="server" Text="Department : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDepartment" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblAccountNo" runat="server" Text="Account No : "></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAccountNo" runat="server" Width="217px" Enabled="true"> </asp:TextBox>
                                                </td>
                                            </tr>
                                        </table> 
                                        <div>
                                    </td>
                                </tr>                              
                            </table>    
                        
                    </asp:Panel>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlDisplayAllRecs" runat="server" Wrap="False" Visible="true"
                        BackColor="#99CCF0" ScrollBars="Horizontal" Width="1000">
                            &nbsp;
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="MemberNo"                             
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                                
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="MemberNo" HeaderText="MemberNo" SortExpression="MemberNo" />
                                    <asp:BoundField DataField="StaffNo" HeaderText="StaffNo" SortExpression="StaffNo" />
                                    <asp:BoundField DataField="IDNo" HeaderText="IDNo" SortExpression="IDNo" />
                                    <asp:BoundField DataField="AccNo" HeaderText="AccNo" SortExpression="AccNo" />
                                    <asp:BoundField DataField="SurName" HeaderText="SurName" SortExpression="SurName" />
                                    <asp:BoundField DataField="OtherNames" HeaderText="OtherNames" SortExpression="OtherNames" />
                                    <asp:BoundField DataField="Sex" HeaderText="Sex" ReadOnly="True" SortExpression="Sex" />
                                    <asp:BoundField DataField="DOB" HeaderText="DOB" ReadOnly="True" SortExpression="DOB" />
                                    <asp:BoundField DataField="Employer" HeaderText="Employer" SortExpression="Employer" />
                                    <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" />
                                    <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" />
                                    <asp:BoundField DataField="Terms" HeaderText="Terms" ReadOnly="True" SortExpression="Terms" />
                                    <asp:BoundField DataField="PresentAddr" HeaderText="PresentAddr" SortExpression="PresentAddr" />
                                    <asp:BoundField DataField="OfficeTelNo" HeaderText="OfficeTelNo" SortExpression="OfficeTelNo" />
                                    <asp:BoundField DataField="HomeAddr" HeaderText="HomeAddr" SortExpression="HomeAddr" />
                                    <asp:BoundField DataField="HomeTelNo" HeaderText="HomeTelNo" SortExpression="HomeTelNo" />
                                    <asp:BoundField DataField="RegFee" HeaderText="RegFee" SortExpression="RegFee" />
                                    <asp:BoundField DataField="InitShares" HeaderText="InitShares" SortExpression="InitShares" />
                                    <asp:BoundField DataField="AsAtDate" HeaderText="AsAtDate" ReadOnly="True" SortExpression="AsAtDate" />
                                    <asp:BoundField DataField="MonthlyContr" HeaderText="MonthlyContr" SortExpression="MonthlyContr" />
                                    <asp:BoundField DataField="ApplicDate" HeaderText="ApplicDate" ReadOnly="True" SortExpression="ApplicDate" />
                                    <asp:BoundField DataField="EffectDate" HeaderText="EffectDate" ReadOnly="True" SortExpression="EffectDate" />
                                    <asp:BoundField DataField="Signed" HeaderText="Signed" SortExpression="Signed" />
                                    <asp:BoundField DataField="Accepted" HeaderText="Accepted" SortExpression="Accepted" />
                                    <asp:BoundField DataField="Archived" HeaderText="Archived" SortExpression="Archived" />
                                    <asp:BoundField DataField="Withdrawn" HeaderText="Withdrawn" SortExpression="Withdrawn" />
                                    <asp:BoundField DataField="IsGuarantor" HeaderText="IsGuarantor" SortExpression="IsGuarantor" />
                                    <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province" />
                                    <asp:BoundField DataField="District" HeaderText="District" SortExpression="District" />
                                    <asp:BoundField DataField="Station" HeaderText="Station" SortExpression="Station" />
                                    <asp:BoundField DataField="CompanyCode" HeaderText="CompanyCode" SortExpression="CompanyCode" />
                                    <asp:BoundField DataField="PIN" HeaderText="PIN" SortExpression="PIN" />
                                    <asp:BoundField DataField="ShareCap" HeaderText="ShareCap" SortExpression="ShareCap" />
                                    <asp:BoundField DataField="BankCode" HeaderText="BankCode" SortExpression="BankCode" />
                                    <asp:BoundField DataField="PassBookFee" HeaderText="PassBookFee" SortExpression="PassBookFee" />
                                </Columns>
                            </asp:GridView>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:serenehrdbConnectionString %>" SelectCommand="BS_get_MEMBERS" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtMemberNoSrch" DefaultValue="%" Name="MemberNo" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtSurnameSrch" DefaultValue="%" Name="SurName" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtOtherNameSrch" DefaultValue="%" Name="OtherNames" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtIDNoSrch" DefaultValue="%" Name="IDNo" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:ListView ID="ListView1" runat="server">
                            </asp:ListView>
&nbsp;</asp:Panel>
                    
                
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

