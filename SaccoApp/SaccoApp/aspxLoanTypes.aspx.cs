using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaccoApp
{
    public partial class aspxLoanTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }

        protected void ReportsMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            String menuSelected = ReportsMenu.SelectedValue.ToString();
            /*if (String.IsNullOrEmpty(menuSelected) || menuSelected == "Reports")
            {
                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;

                pnlPendingApplications.Visible = true;
                pnlLoanDtls.Visible = true;
                pnlNext.Visible = true;
                pnlAddGuarantors.Visible = true;
                pnlReports.Visible = false;
            }
            else
            {
                btnAdd.Enabled = false;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                pnlPendingApplications.Visible = false;
                pnlLoanDtls.Visible = false;
                pnlNext.Visible = false;
                pnlAddGuarantors.Visible = false;
                pnlReports.Visible = true;

                lblReportName.Text = menuSelected;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','" + menuSelected + "');", true);
            }*/
        }

        protected String v_update_type;

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String errMessage;
            String v_user;
            try
            {

                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                clearCtrls();

                txtLoanCode.Text = GridView1.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtLoanType.Text = GridView1.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");

                System.Diagnostics.Debug.WriteLine("txtLoanCode.Text====" + txtLoanCode.Text);
                if (String.IsNullOrEmpty(txtLoanCode.Text))
                { }
                {
                    SqlCommand cmd = new SqlCommand("BS_get_loantypes", new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@LoanCode", txtLoanCode.Text));
                    cmd.Connection.Open();
                    
                    SqlDataReader reader = cmd.ExecuteReader();
                    System.Diagnostics.Debug.WriteLine("Connection read =====> cmd.ExecuteReader");

                    if (reader.Read())
                    {
                        try
                        {
                            try
                            { txtRepayPeriod.Text = reader.GetDecimal(2).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("RepayPeriod =====> " + ex.Message.ToString()); }

                            try
                            { txtInterestRate.Text = reader.GetDecimal(3).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Interest =====> " + ex.Message.ToString()); }

                            try
                            { txtMaxAmount.Text = reader.GetDecimal(4).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("MaxAmount =====> " + ex.Message.ToString()); }

                            try
                            {
                                txtGuarRequired.Text = reader.GetString(5).ToString();
                                ddlGuarRequired.SelectedValue = reader.GetString(5).ToString();
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Guarantor Required =====> " + ex.Message.ToString()); }

                            try
                            { txtAmtIssuedCrAcc0.Text = reader.GetDecimal(6).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("AmtIssuedCrAcc code =====> " + ex.Message.ToString()); }

                            try
                            { txtAmtIssuedCrAcc.Text = reader.GetString(7).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Amt Issued Cr Acc =====> " + ex.Message.ToString()); }

                            try
                            { txtAmtIssuedDrAcc0.Text = reader.GetDecimal(8).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("AmtIssuedDrAcc code =====> " + ex.Message.ToString()); }

                            try
                            { txtAmtIssuedDrAcc.Text = reader.GetString(9).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("txtAmtIssuedDrAcc =====> " + ex.Message.ToString()); }

                            try
                            { txtUpfrIntrAcc0.Text = reader.GetDecimal(10).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Upfront Interest Acc Code =====> " + ex.Message.ToString()); }

                            try
                            { txtUpfrIntrAcc.Text = reader.GetString(11).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Upfront Interest Acc =====> " + ex.Message.ToString()); }

                            try   //Accrued Interest Loan Acc code 12 =================================================
                            { txtAccruedIntrAcc0.Text = reader.GetDecimal(12).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Accrued Interest Acc Code =====> " + ex.Message.ToString()); }

                            try   //Accrued Interest Loan Acc 13 ======================================================
                            { txtAccruedIntrAcc.Text = reader.GetString(13).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Accrued Interest Acc =====> " + ex.Message.ToString()); }
                            
                            try
                            { txtLoanPymtToFOSAAcc.Text = reader.GetString(14).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Loan Pymt To FOSA Acc =====> " + ex.Message.ToString()); }

                            try
                            { txtLoanPymtToFOSAAcc0.Text = reader.GetDecimal(15).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Loan Pymt To FOSA  Acc code =====> " + ex.Message.ToString()); }

                            try
                            {
                                txtInsuranceType.Text = reader.GetString(16).ToString();
                                ddlInsuranceType.SelectedValue = reader.GetString(16).ToString();
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Insurance Type =====> " + ex.Message.ToString()); }

                            try
                            { txtInsurancerate.Text = reader.GetDecimal(17).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Insurance Rate =====> " + ex.Message.ToString()); }

                            try
                            { txtInsuranceAcc.Text = reader.GetString(18).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Insurance Acc =====> " + ex.Message.ToString()); } 

                            try
                            { txtInsuranceAcc0.Text = reader.GetDecimal(19).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Insurance Acc Code =====> " + ex.Message.ToString()); }


                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    btnDelete.Enabled = true;
                    btnCancel.Enabled = true;
                    
                }


            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }

        protected void EnableCtrls()
        {
            txtAccruedIntrAcc.Enabled = true;
            txtAccruedIntrAcc0.Enabled = true;
            txtAmtIssuedCrAcc.Enabled = true;
            txtAmtIssuedCrAcc0.Enabled = true;
            txtAmtIssuedDrAcc.Enabled = true;
            txtAmtIssuedDrAcc0.Enabled = true;
            txtGuarRequired.Enabled = true;
            ddlGuarRequired.Enabled = true;
            txtInsuranceAcc.Enabled = true;
            txtInsuranceAcc0.Enabled = true;
            txtInsurancerate.Enabled = true;
            txtInsuranceType.Enabled = true;
            ddlInsuranceType.Enabled = true;
            txtInterestRate.Enabled = true;
            txtLoanCode.Enabled = true;
            txtLoanPymtToFOSAAcc.Enabled = true;
            txtLoanPymtToFOSAAcc0.Enabled = true;
            txtLoanType.Enabled = true;
            txtMaxAmount.Enabled = true;
            txtRepayPeriod.Enabled = true;
            txtUpfrIntrAcc.Enabled = true;
            txtUpfrIntrAcc0.Enabled = true;
        }

        protected void DisableCtrls()
        {
            txtAccruedIntrAcc.Enabled = false;
            txtAccruedIntrAcc0.Enabled = false;
            txtAmtIssuedCrAcc.Enabled = false;
            txtAmtIssuedCrAcc0.Enabled = false;
            txtAmtIssuedDrAcc.Enabled = false;
            txtAmtIssuedDrAcc0.Enabled = false;
            txtGuarRequired.Enabled = false;
            ddlGuarRequired.Enabled = false;
            txtInsuranceAcc.Enabled = false;
            txtInsuranceAcc0.Enabled = false;
            txtInsurancerate.Enabled = false;
            txtInsuranceType.Enabled = false;
            ddlInsuranceType.Enabled = false;
            txtInterestRate.Enabled = false;
            txtLoanCode.Enabled = false;
            txtLoanPymtToFOSAAcc.Enabled = false;
            txtLoanPymtToFOSAAcc0.Enabled = false;
            txtLoanType.Enabled = false;
            txtMaxAmount.Enabled = false;
            txtRepayPeriod.Enabled = false;
            txtUpfrIntrAcc.Enabled = false;
            txtUpfrIntrAcc0.Enabled = false;
        }
        protected void clearCtrls()
        {
            txtAccruedIntrAcc.Text = "";
            txtAccruedIntrAcc0.Text = "";
            txtAmtIssuedCrAcc.Text = "";
            txtAmtIssuedCrAcc0.Text = "";
            txtAmtIssuedDrAcc.Text = "";
            txtAmtIssuedDrAcc0.Text = "";
            txtGuarRequired.Text = "";
            ddlGuarRequired.SelectedIndex = 0;
            txtInsuranceAcc.Text = "";
            txtInsuranceAcc0.Text = "";
            txtInsurancerate.Text = "";
            txtInsuranceType.Text = "";
            ddlInsuranceType.SelectedIndex = 0;
            txtInterestRate.Text = "";
            txtLoanCode.Text = "";
            txtLoanPymtToFOSAAcc.Text = "";
            txtLoanPymtToFOSAAcc0.Text = "";
            txtLoanType.Text = "";
            txtMaxAmount.Text = "";
            txtRepayPeriod.Text = "";
            txtUpfrIntrAcc.Text = "";
            txtUpfrIntrAcc0.Text = "";

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            String errMessage;

            try
            {
                v_update_type = "Add";
                txtUpdateType.Text = "Add";
                btnAdd.Enabled = false;
                btnEdit.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = false;
                txtLoanCode.Text = "";
                txtLoanType.Text = "";
                clearCtrls();
                EnableCtrls();
            }
            catch (Exception ex)
            {
                errMessage = "Error adding record ..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (LoanTypeDtls_Update(txtUpdateType.Text))
            {

                btnAdd.Enabled = true;
                btnEdit.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                GridView1.DataBind();
                DisableCtrls();
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
            }
            else { }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            String errMessage;
            try
            {
                SqlCommand cmd = new SqlCommand("BS_delete_loantype", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@LoanCode", txtLoanCode.Text));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                //System.Diagnostics.Debug.WriteLine("@v_user===>" + v_user + " v_MemberNo=" + v_MemberNo);

                btnAdd.Enabled = true;
                btnEdit.Enabled = false;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                GridView1.DataBind();
                clearCtrls();
                DisableCtrls();
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Record deleted successfully');", true);
            }
            catch (Exception ex)
            {
                errMessage = "Error saving record ..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            btnEdit.Enabled = true;
            btnSave.Enabled = false;
            btnDelete.Enabled = false;
            GridView1.DataBind();
            DisableCtrls();
            v_update_type = "Edit";
            txtUpdateType.Text = "Edit";

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = false;
            btnEdit.Enabled = false;
            btnSave.Enabled = true;
            btnDelete.Enabled = true;
            EnableCtrls();
            v_update_type = "Edit";
            txtUpdateType.Text = "Edit";
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        private Boolean LoanTypeDtls_Update(String UpdateType)
        {
            Boolean v_bool;
            String errMessage;
            String v_user = System.Web.HttpContext.Current.User.Identity.Name;
            String v_LoanNo; //output LoanNo

            try
            {
                decimal v_RepayPeriod, v_Interest, v_MaxAmount, v_cr_acc_code, v_dr_acc_code,
                    v_cr_Intr_acc_code, v_dr_Intr_acc_code, v_LoanPymtAccCode, v_Insurance_Rate, v_InsuranceAccCode; 

                if (String.IsNullOrEmpty(v_user)) { v_user = "Admin"; }

                txtRepayPeriod.Text = txtRepayPeriod.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtRepayPeriod.Text)) { v_RepayPeriod = 0; }
                else { v_RepayPeriod = Convert.ToDecimal(txtRepayPeriod.Text); }

                txtInterestRate.Text = txtInterestRate.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInterestRate.Text)) { v_Interest = 0; }
                else { v_Interest = Convert.ToDecimal(txtInterestRate.Text); }

                txtMaxAmount.Text = txtMaxAmount.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMaxAmount.Text)) { v_MaxAmount = 0; }
                else { v_MaxAmount = Convert.ToDecimal(txtMaxAmount.Text); }

                txtAmtIssuedCrAcc0.Text = txtAmtIssuedCrAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtAmtIssuedCrAcc0.Text)) { v_cr_acc_code = 0; }
                else { v_cr_acc_code = Convert.ToDecimal(txtAmtIssuedCrAcc0.Text); }

                txtAmtIssuedDrAcc0.Text = txtAmtIssuedDrAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtAmtIssuedDrAcc0.Text)) { v_dr_acc_code = 0; }
                else { v_dr_acc_code = Convert.ToDecimal(txtAmtIssuedDrAcc0.Text); }

                txtUpfrIntrAcc0.Text = txtUpfrIntrAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtUpfrIntrAcc0.Text)) { v_cr_Intr_acc_code = 0; }
                else { v_cr_Intr_acc_code = Convert.ToDecimal(txtUpfrIntrAcc0.Text); }

                txtAccruedIntrAcc0.Text = txtAccruedIntrAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtAccruedIntrAcc0.Text)) { v_dr_Intr_acc_code = 0; }
                else { v_dr_Intr_acc_code = Convert.ToDecimal(txtAccruedIntrAcc0.Text); }

                txtLoanPymtToFOSAAcc0.Text = txtLoanPymtToFOSAAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtLoanPymtToFOSAAcc0.Text)) { v_LoanPymtAccCode = 0; }
                else { v_LoanPymtAccCode = Convert.ToDecimal(txtLoanPymtToFOSAAcc0.Text); }

                txtInsurancerate.Text = txtInsurancerate.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInsurancerate.Text)) { v_Insurance_Rate = 0; }
                else { v_Insurance_Rate = Convert.ToDecimal(txtInsurancerate.Text); }

                txtInsuranceAcc0.Text = txtInsuranceAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInsuranceAcc0.Text)) { v_InsuranceAccCode = 0; }
                else { v_InsuranceAccCode = Convert.ToDecimal(txtInsuranceAcc0.Text); }


                SqlCommand cmd = new SqlCommand("BS_update_loantype", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@UpdateType", UpdateType));
                cmd.Parameters.Add(new SqlParameter("@LoanCode", txtLoanCode.Text));
                cmd.Parameters.Add(new SqlParameter("@LoanType", txtLoanType.Text));
                cmd.Parameters.Add(new SqlParameter("@RepayPeriod", v_RepayPeriod));
                cmd.Parameters.Add(new SqlParameter("@Interest", v_Interest));
                cmd.Parameters.Add(new SqlParameter("@MaxAmount", v_MaxAmount));
                cmd.Parameters.Add(new SqlParameter("@Guarantor", ddlGuarRequired.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@cr_acc_code", v_cr_acc_code));
                cmd.Parameters.Add(new SqlParameter("@cr_acc_sht_desc", txtAmtIssuedCrAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@dr_acc_code", v_dr_acc_code));
                cmd.Parameters.Add(new SqlParameter("@dr_acc_sht_desc", txtAmtIssuedDrAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@cr_Intr_acc_code", v_cr_Intr_acc_code));
                cmd.Parameters.Add(new SqlParameter("@cr_Intr_acc_sht_desc", txtUpfrIntrAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@dr_Intr_acc_code", v_dr_Intr_acc_code));
                cmd.Parameters.Add(new SqlParameter("@dr_Intr_acc_sht_desc", txtAccruedIntrAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@LoanPymtAcc", txtLoanPymtToFOSAAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@LoanPymtAccCode", v_LoanPymtAccCode));
                cmd.Parameters.Add(new SqlParameter("@Insurance_Type", ddlInsuranceType.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@Insurance_Rate", v_Insurance_Rate));
                cmd.Parameters.Add(new SqlParameter("@InsuranceAcc", txtInsuranceAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@InsuranceAccCode", v_InsuranceAccCode));
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));

                cmd.Connection.Open();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 000 v_user=" + v_user);
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 111 v_LoanNo=  ");
                cmd.Connection.Close();
                cmd.Dispose();

                v_bool = true;
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Records saved successfully');", true);
            }
            catch (Exception ex)
            {
                v_bool = false;
                errMessage = "Error saving record ..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }

            return v_bool;
        }

    }
}