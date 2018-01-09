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
    public partial class aspxLoanApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            pnlLoanDtls.Visible = false;
            pnlAddGuarantors.Visible = false;
        }

        protected void btnRptViewHide_Click(object sender, EventArgs e)
        {

        }

        protected void btnGenRpt_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {

                if (lblReportName.Text == "Applied Loans Report")
                {
                    rvAppliedLoans.LocalReport.ReportPath = "Reports/rptAppliedLoans.rdlc";
                    rvAppliedLoans.LocalReport.Refresh();
                } else if (lblReportName.Text == "Guarantor Listing Report")
                {
                    rvAppliedLoans.LocalReport.ReportPath = "Reports/rptGuarantorListing.rdlc";
                    rvAppliedLoans.LocalReport.Refresh();
                }
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "DisplayReports('Information.','Report ran successfully.');", true);


            }
            catch (Exception ex)
            {
                errMessage = "Error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
            }
        }

        protected void ReportsMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            String menuSelected = ReportsMenu.SelectedValue.ToString();
            if (String.IsNullOrEmpty(menuSelected) || menuSelected == "Reports")
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

                if (lblReportName.Text == "Applied Loans Report")
                {
                    lblDateFrom.Visible = true;
                    txtDateFrom.Visible = true;
                    lblDateTo.Visible = true;
                    txtDateTo.Visible = true;
                }
                else if (lblReportName.Text == "Guarantor Listing Report")
                {
                    lblDateFrom.Visible = false;
                    txtDateFrom.Visible = false;
                    lblDateTo.Visible = false;
                    txtDateTo.Visible = false;
                }
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','" + menuSelected + "');", true);
            }
        }

        protected void popupWitnessSearch(object sender, EventArgs e)
        {
            pup.HeaderText = "Witnesses";
            pnlWitnSearch.Visible = true;
            pnlGuarSearch.Visible = false;
            pnlSupSearch.Visible = false;
            pup.ShowPopupWindow();
        }
        protected void popupSupervSearch(object sender, EventArgs e)
        {
            pup.HeaderText = "Supervisors";
            pnlWitnSearch.Visible = false;
            pnlGuarSearch.Visible = false;
            pnlSupSearch.Visible = true;
            pup.ShowPopupWindow();
        }
        protected void popupGuarSearch(object sender, EventArgs e)
        {
            pup.HeaderText = "Guarantors";
            pnlWitnSearch.Visible = false;
            pnlGuarSearch.Visible = true;
            pnlSupSearch.Visible = false;
            pup.ShowPopupWindow();
        }
        protected void HidePopup_Click(object sender, EventArgs e)
        {
            pup.HidePopupWindow();
        }
        protected void MycloseWindow(object sender, EventArgs e)
        {
            pup.HidePopupWindow();
        }

        protected void btnPopSrch_Click(object sender, EventArgs e)
        {
            txtPopMemberNoSrch0.Text = txtPopMemberNoSrch.Text;
            txtPopMemberSurNameSrch0.Text = txtPopMemberSurNameSrch.Text;
            txtPopMemberONameSrch0.Text = txtPopMemberONameSrch.Text;

            if (pup.HeaderText == "Witnesses")
            {
                gvWitnSearch.DataBind();
            } else if (pup.HeaderText == "Supervisors")
            {
                gvSupSearch.DataBind();
            }else if (pup.HeaderText == "Guarantors")
            {
                gvGuarSearch.DataBind();
            }
        }
        
        protected void searchTextChange(object sender, EventArgs e)
        {
            txtPopMemberNoSrch0.Text = txtPopMemberNoSrch.Text;
            txtPopMemberSurNameSrch0.Text = txtPopMemberSurNameSrch.Text;
            txtPopMemberONameSrch0.Text = txtPopMemberONameSrch.Text;
            if (txtPopMemberNoSrch0.Text == "") { txtPopMemberNoSrch0.Text = "%"; txtPopMemberNoSrch.Text = "%"; }
            if (txtPopMemberSurNameSrch0.Text == "") { txtPopMemberSurNameSrch0.Text = "%"; txtPopMemberSurNameSrch.Text = "%"; }
            if (txtPopMemberONameSrch0.Text == "") { txtPopMemberONameSrch0.Text = "%"; txtPopMemberONameSrch.Text = "%"; }
        }
        
        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (pup.HeaderText == "Witnesses")
            {
                //gvWitnSearch.DataBind();
                String errMessage;
                try
                {
                    txtWitnsMemberNo.Text = gvWitnSearch.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                    txtWitMemberNames.Text = gvWitnSearch.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "")
                                            + " " + gvWitnSearch.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "")
                                            ;
                }
                catch (Exception ex)
                {
                    errMessage = ex.Message.ToString();
                    errMessage = errMessage.ToString().Replace("'", "");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                    System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
                }
                txtWitnsMemberNo.Focus();
            }
            else if (pup.HeaderText == "Supervisors")
            {
                //gvSupSearch.DataBind();
                String errMessage;
                try
                {
                    txtSupervMemberNo.Text = gvSupSearch.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                    txtSupervMemberNames.Text = gvSupSearch.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "")
                                                + " " + gvSupSearch.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                }
                catch (Exception ex)
                {
                    errMessage = ex.Message.ToString();
                    errMessage = errMessage.ToString().Replace("'", "");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                    System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
                }
                txtSupervMemberNo.Focus();
            }
            else if (pup.HeaderText == "Guarantors")
            {
                //gvGuarSearch.DataBind();
                SelectGuar();
            }
            pup.HidePopupWindow();
        }
        
        protected void btnPopCancel_Click(object sender, EventArgs e)
        {
            pup.HidePopupWindow();
        }

        protected String v_update_type;
        protected String v_guar_update_type;

        protected void GridView1_ItemCommand(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process btn clicked');", true);
        }

        protected void gvWitnSearch_ItemCommand(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process btn clicked');", true);
        }

        protected void gvSupSearch_ItemCommand(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process btn clicked');", true);
        }
        protected void gvGuarSearch_ItemCommand(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process btn clicked');", true);
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String errMessage;
            String v_user;
            try
            {
                
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                clearCtrls();

                txtMemberNo.Text = GridView1.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtMemberName.Text = GridView1.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "") + " " +
                                    GridView1.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");

                System.Diagnostics.Debug.WriteLine("txtMemberNo.Text====" + txtMemberNo.Text);
                if (String.IsNullOrEmpty(txtMemberNo.Text))
                { }
                {
                    String query;
                    query = "select m.InitShares, m.ShareCap, CONVERT(nvarchar(30), m.AsAtDate, 103)AsAtDate, s.TotalShares," +
                                    "MonthlyContr, Station, StaffNo, rtrim(ltrim(upper(m.Withdrawn)))Withdrawn from bs_members m  left join BS_SHARES s on s.MemberNo = m.MemberNo " +
                                    "where m.MemberNo = '" + txtMemberNo.Text + "'";
                    SqlCommand cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;
                    v_user = System.Web.HttpContext.Current.User.Identity.Name;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            txtTotShares.Text = reader.GetDecimal(3).ToString();
                            System.Diagnostics.Debug.WriteLine("Successful read =====> Withdrawn=" + reader.GetString(7));
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    gvLoanApplication.DataBind();
                    gvLoanApplication.Visible = true;
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

        protected void gvWitnSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSupSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvGuarSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void SelectGuar()
        {

            String errMessage;
            decimal v_InitShares = 0, v_tot_contrib = 0, v_tot_shares = 0, v_GuarShareRatio = 0;
            decimal v_AvailableAmt = 0, v_OtherGuarAmt = 0;
            txtAllocatedAmt.Enabled = true;

            try
            {
                txtGuarMemberNo.Text = gvGuarSearch.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtGuarMemberNames.Text = gvGuarSearch.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "")
                                            + " " + gvGuarSearch.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");


                if (String.IsNullOrEmpty(txtMemberNo.Text))
                { }
                {
                    String query;
                    #region GetInitialShares
                    //------ GetInitialShares -------------------------------
                    query = "select case when InitShares is null then 0 else InitShares end InitShares, (OtherNames+' '+ SurName)GuarNames  from BS_MEMBERS where MemberNo ='" + txtGuarMemberNo.Text + "'";
                    SqlCommand cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_InitShares = reader.GetDecimal(0);
                            txtGuarMemberNames.Text = reader.GetString(1).ToString();
                            System.Diagnostics.Debug.WriteLine("Successful read =====> InitShares=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetInitialShares -------------------------------
                    #endregion

                    #region GetShareContribution
                    //------ GetShareContribution -------------------------------
                    query = "select sum(Amount)TotalShareContrib from BS_CONTRIB where MemberNo = '" + txtGuarMemberNo.Text + "'";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_tot_contrib = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> Share Contrib=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetShareContribution -------------------------------
                    #endregion

                    #region GetOtherGuaranteedLoanAmount
                    //------ GetOtherGuaranteedLoanAmount -------------------------------
                    query = "select sum(lg.Amount) from BS_LOANGUAR lg where lg.LoanNo <> '" + txtLoanNo.Text + "' and lg.MemberNo= '" + txtGuarMemberNo.Text + "'";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_OtherGuarAmt = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> GetOtherGuaranteedLoanAmount=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetOtherGuaranteedLoanAmount -------------------------------
                    #endregion

                    #region GetGuarantorShareRatio
                    //------ GetGuarantorShareRatio -------------------------------
                    query = "select case when GuarShareRatio is null then 0 else GuarShareRatio end GuarShareRatio from BS_SYSPARAM";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_GuarShareRatio = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> GuarantorShareRatio=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetGuarantorShareRatio -------------------------------
                    #endregion

                    System.Diagnostics.Debug.WriteLine("=====> Additions v_InitShares=" + v_InitShares.ToString() + " v_tot_contrib=" + v_tot_contrib.ToString());
                    v_tot_shares = v_InitShares + v_tot_contrib;
                    System.Diagnostics.Debug.WriteLine("=====> Additions2 v_tot_shares=" + v_tot_shares.ToString() + " v_GuarShareRatio=" + v_GuarShareRatio.ToString());
                    v_tot_shares = v_tot_shares * v_GuarShareRatio;
                    System.Diagnostics.Debug.WriteLine("=====> Additions3 v_tot_shares=" + v_tot_shares.ToString() + " v_OtherGuarAmt=" + v_OtherGuarAmt.ToString());
                    v_AvailableAmt = v_tot_shares - v_OtherGuarAmt;
                    System.Diagnostics.Debug.WriteLine("=====> Additions4");
                    txtAvailableAmt.Text = v_AvailableAmt.ToString();
                    txtAllocatedAmt.Focus();

                    //gvLoanApplication.DataBind();
                    // gvLoanApplication.Visible = true;
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

        protected void clearCtrls()
        {
            txtLoanNo.Text = "";
            txtAmount.Text = "";
            txtRepayPeriod.Text = "";
            txtApplicationDate.Text = "";
            txtLoanCode.Text = "";
            ddlLoanCode.SelectedValue = "";
            txtEarnings.Text = "";
            txtWitnessSigned.Text = "";
            ddlWitnessSigned.SelectedValue = "";
            txtWitnsMemberNo.Text = "";
            txtWitMemberNames.Text = "";
            txtSupervisorSigned.Text = "";
            ddlSupervisorSigned.SelectedValue = "";
            txtSupervMemberNo.Text = "";
            txtSupervMemberNames.Text = "";
            txtPreparedBy.Text = "";
            txtAdditionalSecurity.Text = "";
            txtInsuranceType.Text = "";
            ddlInsuranceType.SelectedValue = "";
            txtInsuranceAmt.Text = "";
            txtInsPercent.Text = "";

            clearGuarCtrls();

        }

        protected void clearGuarCtrls()
        {

        }
        protected void gvLG_SelectedIndexChanged(object sender, EventArgs e)
        {


            String errMessage;
            decimal v_InitShares = 0, v_tot_contrib = 0, v_tot_shares = 0, v_GuarShareRatio = 0;
            decimal v_AvailableAmt = 0, v_OtherGuarAmt = 0;
            txtAllocatedAmt.Enabled = true;

            try
            {
                v_guar_update_type = "Edit";
                txtGuarUpdateType.Text = "Edit";
                clearGuarCtrls();

                txtGuarMemberNo.Text = gvLoanGuarantors.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtGuarMemberNames.Text = gvLoanGuarantors.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");

                txtAllocatedAmt.Enabled = true;
                btnGuarAdd.Enabled = false;
                btnGuarSave.Enabled = true;
                btnGuarDelete.Enabled = true;
                btnGuarCancel.Enabled = true;
                pnlLoanDtls.Visible = true;
                pnlAddGuarantors.Visible = true;
                
                if (String.IsNullOrEmpty(txtMemberNo.Text))
                { }
                {
                    String query;
                    #region GetInitialShares
                    //------ GetInitialShares -------------------------------
                    query = "select case when InitShares is null then 0 else InitShares end InitShares, (OtherNames+' '+ SurName)GuarNames  from BS_MEMBERS where MemberNo ='" + txtGuarMemberNo.Text + "'";
                    SqlCommand cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_InitShares = reader.GetDecimal(0);
                            txtGuarMemberNames.Text = reader.GetString(1).ToString();
                            System.Diagnostics.Debug.WriteLine("Successful read =====> InitShares=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetInitialShares -------------------------------
                    #endregion

                    #region GetShareContribution
                    //------ GetShareContribution -------------------------------
                    query = "select sum(Amount)TotalShareContrib from BS_CONTRIB where MemberNo = '" + txtGuarMemberNo.Text + "'";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_tot_contrib = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> Share Contrib=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetShareContribution -------------------------------
                    #endregion

                    #region GetOtherGuaranteedLoanAmount
                    //------ GetOtherGuaranteedLoanAmount -------------------------------
                    query = "select sum(lg.Amount) from BS_LOANGUAR lg where lg.LoanNo <> '" + txtLoanNo.Text + "' and lg.MemberNo= '" + txtGuarMemberNo.Text + "'";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_OtherGuarAmt = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> GetOtherGuaranteedLoanAmount=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetOtherGuaranteedLoanAmount -------------------------------
                    #endregion

                    #region GetGuarantorShareRatio
                    //------ GetGuarantorShareRatio -------------------------------
                    query = "select case when GuarShareRatio is null then 0 else GuarShareRatio end GuarShareRatio from BS_SYSPARAM";
                    cmd = new SqlCommand(query,
                                    new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection.Open();

                    System.Diagnostics.Debug.WriteLine("query====" + query);
                    reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        try
                        {
                            v_GuarShareRatio = reader.GetDecimal(0);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> GuarantorShareRatio=" + reader.GetDecimal(0).ToString());
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    //------ End GetGuarantorShareRatio -------------------------------
                    #endregion

                    System.Diagnostics.Debug.WriteLine("=====> Additions v_InitShares=" + v_InitShares.ToString() + " v_tot_contrib=" + v_tot_contrib.ToString());
                    v_tot_shares = v_InitShares + v_tot_contrib;
                    System.Diagnostics.Debug.WriteLine("=====> Additions2 v_tot_shares=" + v_tot_shares.ToString() + " v_GuarShareRatio=" + v_GuarShareRatio.ToString());
                    v_tot_shares = v_tot_shares * v_GuarShareRatio;
                    System.Diagnostics.Debug.WriteLine("=====> Additions3 v_tot_shares=" + v_tot_shares.ToString() + " v_OtherGuarAmt=" + v_OtherGuarAmt.ToString());
                    v_AvailableAmt = v_tot_shares - v_OtherGuarAmt;
                    System.Diagnostics.Debug.WriteLine("=====> Additions4");
                    txtAvailableAmt.Text = v_AvailableAmt.ToString();
                    txtAllocatedAmt.Focus();

                    //gvLoanApplication.DataBind();
                    // gvLoanApplication.Visible = true;
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

        protected void gv_SelectedIndexChanged(object sender, EventArgs e)
        {

            String errMessage;
            try
            {
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                clearCtrls();
                btnAdd.Enabled = false;
                btnSave.Enabled = true;
                btnDelete.Enabled = true;
                btnCancel.Enabled = true;
                pnlLoanDtls.Visible = true;
                pnlAddGuarantors.Visible = true;

                txtLoanNo.Text = gvLoanApplication.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtAmount.Text = gvLoanApplication.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                txtRepayPeriod.Text = gvLoanApplication.SelectedRow.Cells[4].Text.Trim().Replace("&nbsp;", "");
                txtApplicationDate.Text = gvLoanApplication.SelectedRow.Cells[7].Text.Trim().Replace("&nbsp;", "");
                txtLoanCode.Text = gvLoanApplication.SelectedRow.Cells[5].Text.Trim().Replace("&nbsp;", "");
                ddlLoanCode.SelectedValue = gvLoanApplication.SelectedRow.Cells[5].Text.Trim().Replace("&nbsp;", "");

                if (String.IsNullOrEmpty(txtLoanNo.Text))
                { }
                {

                    SqlCommand cmd = new SqlCommand("BS_get_loan_applications", new SqlConnection(GetConnectionString()));
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MemberNo", txtMemberNo.Text));
                    cmd.Parameters.Add(new SqlParameter("@LoanNo", txtLoanNo.Text));
                    cmd.Connection.Open();
                    System.Diagnostics.Debug.WriteLine("Connection open =====> cmd.Connection.Open");
                    //cmd.ExecuteNonQuery();

                    SqlDataReader reader = cmd.ExecuteReader();
                    System.Diagnostics.Debug.WriteLine("Connection read =====> cmd.ExecuteReader");

                    if (reader.Read())
                    {
                        try
                        {
                            try
                            { txtEarnings.Text = reader.GetString(7).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Earnings =====> " + ex.Message.ToString()); }
                            try
                            {
                                txtWitnessSigned.Text = reader.GetString(8).ToString();
                                ddlWitnessSigned.SelectedValue = reader.GetString(8).ToString();
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("WitnessSigned =====> " + ex.Message.ToString()); }
                            try
                            { txtWitnsMemberNo.Text = reader.GetString(9).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("WitnsMemberNo =====> " + ex.Message.ToString()); }
                            try
                            { txtWitMemberNames.Text = reader.GetString(10).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("WitMemberNames =====> " + ex.Message.ToString()); }
                            try
                            {
                                txtSupervisorSigned.Text = reader.GetString(11).ToString();
                                ddlSupervisorSigned.SelectedValue = reader.GetString(11).ToString();
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("SupervisorSigned =====> " + ex.Message.ToString()); }
                            try
                            { txtSupervMemberNo.Text = reader.GetString(12).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("SupervMemberNo =====> " + ex.Message.ToString()); }
                            try
                            { txtSupervMemberNames.Text = reader.GetString(13).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("SupervMemberNames =====> " + ex.Message.ToString()); }
                            try
                            { txtPreparedBy.Text = reader.GetString(14).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("PreparedBy =====> " + ex.Message.ToString()); }
                            try
                            { txtAdditionalSecurity.Text = reader.GetString(15).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("AdditionalSecurity =====> " + ex.Message.ToString()); }
                            try
                            {
                             txtInsuranceType.Text = reader.GetString(16).ToString(); 
                             ddlInsuranceType.SelectedValue = reader.GetString(16).ToString();
                            }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsuranceType =====> " + ex.Message.ToString()); }
                            try
                            { txtInsuranceAmt.Text = reader.GetDecimal(17).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsuranceAmt =====> " + ex.Message.ToString()); }
                            try
                            { txtInsPercent.Text = reader.GetDecimal(18).ToString(); }
                            catch (Exception ex) { System.Diagnostics.Debug.WriteLine("InsPercent =====> " + ex.Message.ToString()); }
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    #region Readwitnessesnames 
                    //-----Read witnesses names----------------------------------------------
                    try
                    {
                        String query;
                        query = "select (wtm.OtherNames+' '+ wtm.SurName)WitnessNames from bs_members wtm where wtm.MemberNo= " + txtWitnsMemberNo.Text + "'";
                        SqlCommand cmd2 = new SqlCommand(query,
                                        new SqlConnection(GetConnectionString()));
                        cmd2.CommandType = CommandType.Text;
                        cmd2.Connection.Open();

                        SqlDataReader reader2= cmd2.ExecuteReader();
                        System.Diagnostics.Debug.WriteLine("Connection read2 =====> cmd.ExecuteReader");
                        if (reader2.Read())
                        {
                            try
                            {
                                try
                                { txtWitMemberNames.Text = reader2.GetString(0).ToString(); }
                                catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Witness names =====> " + ex.Message.ToString()); }
                            }
                            catch (Exception ex)
                            {
                                System.Diagnostics.Debug.WriteLine("Empty data2 =====> " + ex.Message.ToString());
                            }
                        }
                        cmd2.Connection.Close();
                        cmd2.Dispose();
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Readwitnessesnames =====> " + ex.Message.ToString());
                    }
                    //-----End Read witnesses names----------------------------------------------
                    #endregion

                    #region ReadSupervisornames 
                    //-----Read Supervisor names----------------------------------------------
                    try
                    {
                        String query = "select (spm.OtherNames+' '+ spm.SurName)SupervisorNames from bs_members spm where spm.MemberNo= " + txtSupervMemberNo.Text + "'";
                        SqlCommand cmd3 = new SqlCommand(query,
                                        new SqlConnection(GetConnectionString()));
                        cmd3.CommandType = CommandType.Text;
                        cmd3.Connection.Open();

                        SqlDataReader reader3 = cmd3.ExecuteReader();
                        System.Diagnostics.Debug.WriteLine("Connection read3 =====> cmd.ExecuteReader");
                        if (reader3.Read())
                        {
                            try
                            {
                                try
                                { txtSupervMemberNames.Text = reader3.GetString(0).ToString(); }
                                catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Supervisor names =====> " + ex.Message.ToString()); }
                            }
                            catch (Exception ex)
                            {
                                System.Diagnostics.Debug.WriteLine("Empty data3 =====> " + ex.Message.ToString());
                            }
                        }
                        cmd3.Connection.Close();
                        cmd3.Dispose();
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("ReadSupervisornames =====> " + ex.Message.ToString());
                    }
                    //-----End Read Supervisor names----------------------------------------------
                    #endregion


                    txtAllocatedAmt.Focus();

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

        protected void ddlLoanCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtLoanCode.Text = ddlLoanCode.SelectedValue.ToString();
            }
            catch (Exception ex) {

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            v_update_type = "Add";
            txtUpdateType.Text = "Add";
            btnAdd.Enabled = false;
            btnSave.Enabled = true;
            btnDelete.Enabled = false;
            pnlLoanDtls.Visible = true;
            pnlAddGuarantors.Visible = true;
            gvLoanApplication.Visible = false;
            pnlNext.Visible = false;
            clearCtrls();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (LoanDtls_Update(txtUpdateType.Text))
            {
                btnAdd.Enabled = true;
                btnSave.Enabled = true;
                btnDelete.Enabled = false;
                gvLoanApplication.Visible = true;
                pnlLoanDtls.Visible = true;
                pnlAddGuarantors.Visible = true;
                gvLoanApplication.DataBind();
                pnlNext.Visible = true;

                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                //clearCtrls();
            }
            else { }

        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        private Boolean LoanDtls_Update(String UpdateType)
        {
            Boolean v_bool;
            String errMessage;
            String v_user = System.Web.HttpContext.Current.User.Identity.Name;
            String v_LoanNo; //output LoanNo

            try
            {
                decimal v_LoanAmt, v_BasicSalary, v_RepayPeriod, v_Insurance, v_InsPercent;
                if (String.IsNullOrEmpty(v_user)) { v_user = "Admin"; }
                
                txtAmount.Text = txtAmount.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtTotShares.Text))
                {
                    v_LoanAmt = 0;
                }
                else
                {
                    v_LoanAmt = Convert.ToDecimal(txtAmount.Text);
                }
                
                txtEarnings.Text = txtEarnings.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtEarnings.Text))
                {
                    v_BasicSalary = 0;
                }
                else
                {
                    v_BasicSalary = Convert.ToDecimal(txtEarnings.Text);
                }
                txtRepayPeriod.Text = txtRepayPeriod.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtRepayPeriod.Text))
                {
                    v_RepayPeriod = 0;
                }
                else
                {
                    v_RepayPeriod = Convert.ToDecimal(txtRepayPeriod.Text);
                }
                txtInsuranceAmt.Text = txtInsuranceAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInsuranceAmt.Text))
                {
                    v_Insurance = 0;
                }
                else
                {
                    v_Insurance = Convert.ToDecimal(txtInsuranceAmt.Text);
                }
                txtInsPercent.Text = txtInsPercent.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInsPercent.Text))
                {
                    v_InsPercent = 0;
                }
                else
                {
                    v_InsPercent = Convert.ToDecimal(txtInsPercent.Text);
                }
                
                SqlCommand cmd = new SqlCommand("BS_update_loanApp", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@UpdateType", UpdateType));
                cmd.Parameters.Add(new SqlParameter("@LoanNo", txtLoanNo.Text));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txtMemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@LoanCode", ddlLoanCode.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@ApplicDate", txtApplicationDate.Text));
                cmd.Parameters.Add(new SqlParameter("@LoanAmt", v_LoanAmt));
                cmd.Parameters.Add(new SqlParameter("@BasicSalary", v_BasicSalary));
                cmd.Parameters.Add(new SqlParameter("@RepayPeriod", v_RepayPeriod));
                cmd.Parameters.Add(new SqlParameter("@WitMemberNo", txtWitnsMemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@WitSigned", ddlWitnessSigned.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@SupMemberNo", txtSupervMemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@SupSigned", txtSupervisorSigned.Text));
                cmd.Parameters.Add(new SqlParameter("@PreparedBy", txtPreparedBy.Text));
                cmd.Parameters.Add(new SqlParameter("@AddSecurity", txtAdditionalSecurity.Text));
                cmd.Parameters.Add(new SqlParameter("@Insurance", v_Insurance));
                cmd.Parameters.Add(new SqlParameter("@InsPercent", v_InsPercent));
                cmd.Parameters.Add(new SqlParameter("@InsCalcType", ddlInsuranceType.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));
                cmd.Parameters.Add(new SqlParameter("@v_LoanNo", SqlDbType.NVarChar));
                cmd.Parameters["@v_LoanNo"].Direction = ParameterDirection.Output;
                cmd.Parameters["@v_LoanNo"].IsNullable = true;
                cmd.Parameters["@v_LoanNo"].Size = 45;


                cmd.Connection.Open();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 000 v_user=" + v_user);
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 111 v_LoanNo=  " );
                try
                {
                    v_LoanNo = cmd.Parameters["@v_LoanNo"].Value.ToString();
                    txtLoanNo.Text = v_LoanNo;
                }
                catch (Exception e) { System.Diagnostics.Debug.WriteLine("@v_LoanNo error..."+e.Message.ToString()); }
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 222 v_LoanNo=  ");
                cmd.Connection.Close();
                cmd.Dispose();
                
                v_bool = true;

                //pnlLoanDtls.Visible = false;
                //pnlAddGuarantors.Visible = false;
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            String errMessage;
            try
            {
                SqlCommand cmd = new SqlCommand("BS_delete_loanApp", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@LoanNo", txtLoanNo.Text));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txtMemberNo.Text));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                //System.Diagnostics.Debug.WriteLine("@v_user===>" + v_user + " v_MemberNo=" + v_MemberNo);

                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                gvLoanApplication.Visible = true;
                gvLoanApplication.DataBind();

                pnlLoanDtls.Visible = false;
                pnlAddGuarantors.Visible = false;
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
            btnSave.Enabled = false;
            btnDelete.Enabled = false;
            gvLoanApplication.Visible = true;
            pnlLoanDtls.Visible = false;
            pnlAddGuarantors.Visible = false;
            gvLoanApplication.DataBind();
            pnlNext.Visible = false;
            
        }

        protected void btnGuarAdd_Click(object sender, EventArgs e)
        {
            clearGuarCtrls();
            btnGuarAdd.Enabled = false;
            btnGuarSave.Enabled = true;
            btnGuarDelete.Enabled = true;
            btnGuarCancel.Enabled = true;
            gvLoanGuarantors.Visible = false;

            v_guar_update_type = "Add";
            txtGuarUpdateType.Text = "Add";
            txtAllocatedAmt.Enabled = true;


            txtAllocatedAmt.Focus();
        }

        protected void btnGuarSave_Click(object sender, EventArgs e)
        {
            gvLoanGuarantors.DataBind();
            gvLoanGuarantors.Visible = true;
            txtAllocatedAmt.Enabled = false;

            if (LoanGuarDtls_Update(txtGuarUpdateType.Text))
            {
                btnGuarAdd.Enabled = true;
                btnGuarSave.Enabled = true;
                btnGuarDelete.Enabled = false;
                gvLoanApplication.Visible = true;
                gvLoanGuarantors.Visible = true;
                gvLoanGuarantors.DataBind();
                pnlNext.Visible = true;

                v_guar_update_type = "Edit";
                txtGuarUpdateType.Text = "Edit";
                //clearCtrls();
            }
            else { }
            gvLoanGuarantors.Focus();

        }

        protected void btnGuarDelete_Click(object sender, EventArgs e)
        {

            String errMessage;
            try
            {
                SqlCommand cmd = new SqlCommand("BS_delete_LoanGuar", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@LoanNo", txtLoanNo.Text));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txtGuarMemberNo.Text));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();

                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                gvLoanGuarantors.Visible = true;
                gvLoanGuarantors.DataBind();
                txtAllocatedAmt.Enabled = false;
                
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

        protected void btnGuarCancel_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            btnSave.Enabled = false;
            btnDelete.Enabled = false;
            gvLoanGuarantors.DataBind();
            gvLoanGuarantors.Visible = true;
            txtAllocatedAmt.Enabled = false;
            txtAllocatedAmt.Focus();

        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        private Boolean LoanGuarDtls_Update(String UpdateType)
        {
            Boolean v_bool;
            String errMessage;
            String v_user = System.Web.HttpContext.Current.User.Identity.Name;

            try
            {
                decimal v_AllocatedAmt=0, v_Balance=0;
                if (String.IsNullOrEmpty(v_user)) { v_user = "Admin"; }

                txtAllocatedAmt.Text = txtAllocatedAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtAllocatedAmt.Text))
                {
                    v_AllocatedAmt = 0;
                }
                else
                {
                    v_AllocatedAmt = Convert.ToDecimal(txtAllocatedAmt.Text);
                }

                txtAvailableAmt.Text = txtAvailableAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtAvailableAmt.Text))
                {
                    v_Balance = 0;
                }
                else
                {
                    v_Balance = Convert.ToDecimal(txtAvailableAmt.Text);
                }
                System.Diagnostics.Debug.WriteLine("UpdateType============>" + UpdateType);
                SqlCommand cmd = new SqlCommand("BS_update_LoanGuar", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@UpdateType", UpdateType));
                cmd.Parameters.Add(new SqlParameter("@LoanNo", txtLoanNo.Text));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txtGuarMemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@AllocatedAmt", v_AllocatedAmt));
                cmd.Parameters.Add(new SqlParameter("@Balance", v_Balance));
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));

                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                cmd.Dispose();

                v_bool = true;

                //pnlLoanDtls.Visible = false;
                //pnlAddGuarantors.Visible = false;
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