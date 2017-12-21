using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

using System.Configuration;
/*
 * Author: Samuel Nyong'a
 * Date: January 1st, 2018
 * 
 */
namespace SaccoApp
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Query Strings
            //System.Diagnostics.Debug.WriteLine("Current URL=====> \n" + Request.Url.ToString());
            //System.Diagnostics.Debug.WriteLine("Current AbsoluteUri=====> \n" + Request.Url.AbsoluteUri);

            String errMessage;
            try
            {
                String strURL = ReverseString(Request.Url.ToString());
                String processArea;
                int initialOcr;
                System.Diagnostics.Debug.WriteLine(" Reversed strURL=====> \n" + strURL);
                initialOcr = strURL.IndexOf("/");
                strURL = strURL.Substring(0, initialOcr);
                strURL = ReverseString(strURL) + "";
                System.Diagnostics.Debug.WriteLine("Final strURL=====> " + strURL);
                processArea = strURL;

                if (strURL == "Default.aspx" || strURL == "default.aspx")
                { strURL = "Home";
                  processArea = strURL;
                }
                else if (strURL == "aspxOrganization.aspx")
                { strURL = "Organization Structure";
                    processArea = strURL;
                }
                else if (strURL == "aspxJobTitles.aspx")
                { strURL = "Job Titles";
                    processArea = strURL;
                }
                else if (strURL == "aspxPayrolls.aspx")
                { strURL = "Payrolls";
                    processArea = strURL;
                }
                else if (strURL == "aspxEmployeeDetails.aspx")
                { strURL = "Employee Details";
                    processArea = strURL;
                }
                else if (strURL == "aspxTaxes.aspx")
                { strURL = "Taxes And Charges";
                    processArea = strURL;
                }
                else if (strURL == "aspxPayElements.aspx")
                { strURL = "Pay Elements";
                    processArea = strURL;
                }
                else if (strURL == "aspxLoans.aspx")
                { strURL = "Employee Loan Types";
                    processArea = strURL;
                }
                else if (strURL == "aspxLoanAmin.aspx")
                { strURL = "Loan Administration";
                    processArea = strURL;
                }
                else if (strURL == "aspxSystemPrivilages.aspx")
                { strURL = "System Privilages";
                    processArea = strURL;
                }
                else if (strURL == "aspxSystemRoles.aspx")
                { strURL = "System Roles";
                    processArea = strURL;
                }
                else if (strURL == "aspxUsers.aspx")
                { strURL = "Users";
                    processArea = strURL;
                }
                else if (strURL == "aspxUserPasswordChange.aspx")
                { strURL = "Change Password";
                    processArea = strURL;
                }
                else if (strURL == "Global.asax")
                { strURL = "Global";
                    processArea = strURL;
                }
                else if (strURL == "aspxBanks.aspx")
                { strURL = "Banks";
                    processArea = strURL;
                }
                else if (strURL == "aspxMembers.aspx")
                { strURL = "Members";
                  processArea = "Member Registration >> Members";
                }
                else if (strURL == "aspxNextOfKins.aspx")
                { strURL = "Next Of Kin Registration";
                    processArea = "Member Registration >> Next Of Kin Registration";
                }
                else if (strURL == "aspxStatement.aspx")
                { strURL = "Statement";
                    processArea = "Member Registration >> Statement";}
                else if (strURL == "aspxShareContribution.aspx")
                { strURL = "Share Contribution";
                    processArea = "Shares >> Share Contribution";
                }
                else if (strURL == "aspxShareVariation.aspx")
                { strURL = "Shares >> Share Variation"; processArea = "Share Variation"; }
                else if (strURL == "aspxLoanApplication.aspx")
                { strURL = "Loan Application"; processArea = "Loans >> Loan Application"; }
                else if (strURL == "aspxLoanGuarantors.aspx")
                { strURL = "Loan Guarantors"; processArea= "Loans >> Loan Guarantors"; }
                else if (strURL == "aspxLoanAppraisal.aspx")
                { strURL = "Loan Appraisal"; processArea = "Loans >> Loan Appraisal"; }
                else if (strURL == "aspxLoanEndorsement.aspx")
                { strURL = "Loan Endorsement"; processArea = "Loans >> Loan Endorsement"; }
                else if (strURL == "aspxChequeEntry.aspx")
                { strURL = "Cheque Entry"; processArea = "Loans >> Cheque Entry"; }
                else if (strURL == "aspxEffectLoanRepayments.aspx")
                { strURL = "Effect Loan Repayments"; processArea = "Loans >> Effect Loan Repayments"; }
                else if (strURL == "aspxLoanTransactions.aspx")
                { strURL = "Loan Transactions"; processArea = "Loans >> Loan Transactions"; }
                else if (strURL == "aspxLoanBalances.aspx")
                { strURL = "Loan Balances"; processArea = "Loans >> Loan Balances"; }
                else if (strURL == "aspxBenevolentFund.aspx")
                { strURL = "Benevolent Fund"; processArea = "Other Schemes >> Benevolent Fund"; }
                else if (strURL == "aspxMemberSavings.aspx")
                { strURL = "Member Savings"; processArea = "Other Schemes >> Member Savings"; }
                else if (strURL == "aspxDividents.aspx")
                { strURL = "Dividents"; processArea = "Utilities >> Dividents"; }
                else if (strURL == "aspxPeriodicTransactions.aspx")
                { strURL = "Periodic Transactions"; processArea = "Utilities >> Periodic Transactions"; }
                else if (strURL == "aspxPeriodicStatements.aspx")
                { strURL = "Periodic Statements"; processArea = "Utilities >> Periodic Statements"; }
                else if (strURL == "aspxReceiptAllocation.aspx")
                { strURL = "Receipt Allocation"; processArea = "Utilities >> Receipt Allocation"; }
                else if (strURL == "aspxDormant.aspx")
                { strURL = "Dormant Members"; processArea = "Utilities >> Dormant Members"; }
                else if (strURL == "aspxDormant.aspx")
                { strURL = "Dormant"; processArea = "Utilities >> Dormant"; }
                else if (strURL == "aspxMemberWithdrawal.aspx")
                { strURL = "Member Withdrawal"; processArea = "Utilities >> Member Withdrawal"; }
                else if (strURL == "aspxArchivedMembers.aspx")
                { strURL = "Archived Members"; processArea = "Utilities >> Archived Members"; }
                else if (strURL == "aspxGuarantorViewing.aspx")
                { strURL = "Guarantor Viewing"; processArea = "Utilities >> Guarantor Viewing"; }
                else if (strURL == "aspxExportToGL.aspx")
                { strURL = "Export To GL accounts"; processArea = "Utilities >> Export To GL accounts"; }
                else if (strURL == "aspxTransfers.aspx")
                { strURL = "Transfers"; processArea = "Utilities >> Transfers"; }
                else if (strURL == "aspxParameters.aspx")
                { strURL = "Parameters"; processArea = "Setups >> Parameters"; }
                else if (strURL == "aspxLoanTypes.aspx")
                { strURL = "Loan Types"; processArea = "Setups >> Loan Types"; }
                else if (strURL == "aspxCompanySetup.aspx")
                { strURL = "Company Setup"; processArea = "Setups >> Company Setup";  }
                else if (strURL == "aspxBankSetup.aspx")
                { strURL = "Bank Setup"; processArea = "Setups >> Bank Setup"; }
                else if (strURL == "aspxDatabaseSetup.aspx")
                { strURL = "Database Setup"; processArea = "Setups >> Database Setup"; }
                else if (strURL == "aspxRejectionReasons.aspx")
                { strURL = "Rejection Reasons"; processArea = "Setups >> Rejection Reasons"; }
                else if (strURL == "aspxChangeMemberNo.aspx")
                { strURL = "Change Member No"; processArea = "Setups >> Change Member No"; }
                else if (strURL == "aspxSystemPrivilages.aspx")
                { strURL = "System Privilages"; processArea = "System Administration >> System Privilages"; }
                else if (strURL == "aspxSystemRoles.aspx")
                { strURL = "System Roles"; processArea = "System Administration >> System Roles"; }
                else if (strURL == "aspxUsers.aspx")
                { strURL = "User Setup"; processArea = "System Administration >> User Setup"; }
                else if (strURL == "aspxUsers.aspx")
                { strURL = "Change Password"; processArea = "System aspxUserPasswordChange >> Change Password"; }
                else if (strURL == "About.aspx")
                { strURL = "About"; processArea = "About";  }


                Session["ProcessArea"] = processArea;
                lblWorkFlow.Text = processArea;

                ProcAccessRoles();

                csPublic pb = new csPublic();
                String strGreetings = txtProductKey.Text;
                String strResponce = "";
                strResponce = pb.HelloWorld(strGreetings);
                System.Diagnostics.Debug.WriteLine("Site strResponce  ==== " + strResponce);
                if (strResponce == "Hello."){
                    System.Diagnostics.Debug.WriteLine("Site thru strResponce  xxx==== " + strResponce);
                  
                }                
                else
                {
                    System.Diagnostics.Debug.WriteLine("Site not thru strResponce  ==== " + strResponce);
                    if (strResponce == "Your trial version has expired.") {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MySiteFunction('Product Key Required.','Product Key Required.');", true);
                    }
                    else{
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MySiteFunction('Product Key Required.','Product Key Required.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                errMessage = "Main Screen error..."+ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
            
            }

        }

        protected void ProcAccessRoles() {
            String errMessage;
            try
            {
                String v_user = System.Web.HttpContext.Current.User.Identity.Name;
                /*
                SqlCommand cmd = new SqlCommand("get_curr_user_priv", new SqlConnection(GetConnectionString()));
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));

                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();

                da.SelectCommand = cmd;
                da.Fill(dt);

                cmd.Connection.Close();
                cmd.Dispose();

                if (dt.Columns.Count != 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        System.Diagnostics.Debug.WriteLine("row[2]===>" + row[2].ToString());
                        
                        foreach (MenuItem item in NavigationMenu.Items)
                        {
                            if (row[2].ToString() == item.Text.Trim())
                            {
                                item.Enabled = true; item.Selectable = true;
                                System.Diagnostics.Debug.WriteLine("Enabling Men===>" + item.Text);
                            }
                            //System.Diagnostics.Debug.WriteLine("Menu===>" + item.Text);
                            foreach (MenuItem childItem in item.ChildItems)
                            {
                                if (row[2].ToString() == childItem.Text.Trim() && row[2].ToString() != "Authorise Payroll")
                                {
                                    childItem.Enabled = true; childItem.Selectable = true;
                                    System.Diagnostics.Debug.WriteLine("Enabling childItem Menu===>" + childItem.Text);
                                }
                                //System.Diagnostics.Debug.WriteLine("childItem Menu===>" + childItem.Text + "row[2].ToString="+row[2].ToString());
                            }
                        }                        
                    }
                }
                dt.Clear();
                da.Dispose();
                cmd.Dispose();*/
            }
            catch (Exception ex)
            {
                errMessage = "Main Screen error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);

            }
            finally { 
                
            }

        }

        protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        public static string ReverseString(string s)
        {
            char[] arr = s.ToCharArray();
            Array.Reverse(arr);
            return new string(arr);
        }
        
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }

        protected void btnOk_Click(object sender, EventArgs e)
        { 
            String errMessage;
            try{
                csPublic pb = new csPublic();
                String strGreetings = txtProductKey.Text;
                String strResponce = "";
                strResponce = pb.HelloWorld(strGreetings);
                System.Diagnostics.Debug.WriteLine("Site strResponce  ==== " + strResponce);
                if (strResponce == "Hello.")
                {
                    System.Diagnostics.Debug.WriteLine("Site thru strResponce  ==== " + strResponce);

                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Site not thru strResponce  ==== " + strResponce);
                    if (strResponce == "Your trial version has expired.")
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MySiteFunction('Product Key Required.','Your trial version has expired. \nProduct Key Required.');", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MySiteFunction('Product Key Required.','Product Key Required.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MySiteFunction('Error.','Product Key Required.');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }
                
    }
}
