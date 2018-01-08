<%@ Page Title="SACCO App" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="aspxParameters.aspx.cs" Inherits="SaccoApp.aspxParameters" %>
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
        /**
        Javascript date formating functions will go here
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
        .auto-style1 {
            height: 47px;
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

    
    
    <table style="width:100%;  height:500px" cellpadding="0" cellspacing="0">
        <tr style="height:inherit; vertical-align:top">
            <td style="background-color:#99CCFF; width:100%; height:inherit">
                
                <asp:Panel ID="pnlCompanySetup" runat="server" Wrap="False" Visible="true" 
                        BackColor="#99CCF0">

                        <asp:Panel ID="pnlCtrls" runat="server" Wrap="False" Visible="true" 
                                BackColor="#99CCF0">   
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                            <asp:Button ID="btnSave" runat="server" Text="Save"  
                                Enabled="False" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"  />
                            <asp:TextBox ID="txtGuarUpdateType" runat="server" Width="50px" Enabled="true" Visible="false"> </asp:TextBox>
                            <br>
                        </asp:Panel>  
                    <table style="width: 80%; ">
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblCompanyName" runat="server" Text="Company Name" Width="110px" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompanyName0" runat="server" Enabled="false" Width="300px"> </asp:TextBox>
                            </td>
                            <td></td>
                        </tr>               
                    </table>  
                    <button type="button" id="btnSharesSetup" 
                                    style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700 ">Shares</button>
                    <table style="width: 80%; ">
                        <tr>
                            <td valign="top">
                                <asp:Label ID="lblShareCapitol" runat="server" Text="Share Capitol" Width="110px" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblMaxNonContrPrd" runat="server" Text="Max. Non Contribution Period" Width="110px" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblMinContrib" runat="server" Text="Min. Contribution" Width="110px" Font-Bold="true"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblDivProcPrd" runat="server" Text="Min. Divident Processing Period" Width="110px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <asp:TextBox ID="txtShareCapitol" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMaxNonContrPrd" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMinContrib" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDivProcPrd" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>                   
                    </table> 
                    <table style="width:100%; " cellpadding="2" cellspacing="2" border="1">
                        <tr>
                            <td id="tdLoanDtls" valign="top" style="width:50%; ">
                                <table style="width:100%; " cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td valign="top" colspan="4">
                                            <button type="button" id="btnLoanSetup" 
                                            style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700 ">Loans</button>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblLoanIntr" runat="server" Text="Loan Interest(%)" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLoanIntr" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="lblLoanToShareRatio" runat="server" Text="Loan To Share Ratio" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtLoanToShareRatio" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMinLoanApplPeriod" runat="server" Text="Min. Loan Appl Period" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMinLoanApplPeriod" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="lblMinGuarantors" runat="server" Text="Min Guarantors" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMinGuarantors" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMaxGuarantors" runat="server" Text="Max. Guarantors" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMaxGuarantors" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="lblGuarShareRatio" runat="server" Text="Guarantee Share Ratio" Width="100px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGuarShareRatio" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblWithdrawalNotice" runat="server" Text="Withdrawal Notice" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtWithdrawalNotice" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td valign="top">
                                            <asp:Label ID="lblMemGuarOwnLoan" runat="server" Text="Member Can Guarantee Own Loan" Width="200px" Font-Bold="true"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtMemGuarOwnLoan" runat="server" Enabled="false" Width="100px" Visible="false"> </asp:TextBox>
                                            <asp:DropDownList ID="ddlMemGuarOwnLoan" runat="server" AutoPostBack="True" Width="100px" Visible="true" Enabled="false">
                                                <asp:ListItem Selected="True" Value=""></asp:ListItem>
                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>   
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDecimalPlaces" runat="server" Text="Decimal Places" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDecimalPlaces" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                                        </td>
                                    </tr>               
                                </table> 
                            </td>
                            <td id="tdAccDtls" valign="top" style="width:50%; ">
                                <table style="width:100%; " cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td valign="top" colspan="4" style="font-size: medium">
                                            <button type="button" id="btnAccSetup" 
                                            style="width: 100%; text-align:left; background-color:#7AC1C7; font-weight:700">Accounts</button>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTransToFOSAcc" runat="server" Text="Trans. To FOSA Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTransToFOSAcc" runat="server" Enabled="false" Width="100px"></asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>  
                                            <asp:TextBox ID="txtTransToFOSAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTransFromFOSAcc" runat="server" Text="Trans. From FOSA Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTransFromFOSAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtTransFromFOSAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblShareAcc" runat="server" Text="Shares Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSharesAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtSharesAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblFundContribution" runat="server" Text="Fund Contribution" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFundContribution" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtFundContribution0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblRegFeeAcc" runat="server" Text="Registration Fee Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRegFeeAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtRegFeeAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Amount" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRegFeeAmt" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPassBookFeeAcc" runat="server" Text="Pass Book Fee Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassBookFeeAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtPassBookFeeAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Amount" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassBookFeeAmt" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDeRegFeeAcc" runat="server" Text="Deregistration Fee Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDeRegFeeAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtDeRegFeeAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Amount" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDeRegFeeAmt" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDividentAcc" runat="server" Text="Divident Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDividentAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtDividentAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblDividentWhtxAcc" runat="server" Text="Divident Whtax Acc" Width="100%" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDividentWhtxAcc" runat="server" Enabled="false" Width="100px"> </asp:TextBox>
                                            <img alt="Acc" src="/Images/people.ico" onclick="fnAccSearch('Accounts','')"/>
                                            <asp:TextBox ID="txtDividentWhtxAcc0" runat="server" Enabled="false" Visible="False" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>            
                                </table> 
                            </td>
                        </tr>               
                    </table>   
                                     

                </asp:Panel>
            </td> 
        </tr> 
    </table> 


</asp:Content>

