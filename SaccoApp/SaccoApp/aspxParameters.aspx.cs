using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

namespace SaccoApp
{
    public partial class aspxParameters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (txtGuarUpdateType.Text == "") { LoadParameters(); }
            System.Diagnostics.Debug.WriteLine("Page_Load  ====================================");
        }

        protected void EnableCtrls()
        {
            txtCompanyName0.Enabled = true;
            txtDecimalPlaces.Enabled = true;
            txtDeRegFeeAcc.Enabled = true;
            txtDeRegFeeAcc0.Enabled = true;
            txtDeRegFeeAmt.Enabled = true;
            txtDivProcPrd.Enabled = true;
            txtFundContribution.Enabled = true;
            txtFundContribution0.Enabled = true;
            txtGuarShareRatio.Enabled = true;
            txtGuarUpdateType.Enabled = true;
            txtLoanIntr.Enabled = true;
            txtLoanToShareRatio.Enabled = true;
            txtMaxGuarantors.Enabled = true;
            txtMaxNonContrPrd.Enabled = true;
            txtMemGuarOwnLoan.Enabled = true;
            ddlMemGuarOwnLoan.Enabled = true;
            txtMinContrib.Enabled = true;
            txtMinGuarantors.Enabled = true;
            txtMinLoanApplPeriod.Enabled = true;
            txtPassBookFeeAcc.Enabled = true;
            txtPassBookFeeAcc0.Enabled = true;
            txtPassBookFeeAmt.Enabled = true;
            txtRegFeeAcc.Enabled = true;
            txtRegFeeAcc0.Enabled = true;
            txtRegFeeAmt.Enabled = true;
            txtShareCapitol.Enabled = true;
            txtSharesAcc.Enabled = true;
            txtSharesAcc0.Enabled = true;
            txtTransFromFOSAcc.Enabled = true;
            txtTransFromFOSAcc0.Enabled = true;
            txtTransToFOSAcc.Enabled = true;
            txtTransToFOSAcc0.Enabled = true;
            txtWithdrawalNotice.Enabled = true;

            txtDividentAcc.Enabled = true;
            txtDividentAcc0.Enabled = true;
            txtDividentWhtxAcc.Enabled = true;
            txtDividentWhtxAcc0.Enabled = true;
           

        }

        protected void DisEnableCtrls()
        {
            txtCompanyName0.Enabled = false;
            txtDecimalPlaces.Enabled = false;
            txtDeRegFeeAcc.Enabled = false;
            txtDeRegFeeAcc0.Enabled = false;
            txtDeRegFeeAmt.Enabled = false;
            txtDivProcPrd.Enabled = false;
            txtFundContribution.Enabled = false;
            txtFundContribution0.Enabled = false;
            txtGuarShareRatio.Enabled = false;
            txtGuarUpdateType.Enabled = false;
            txtLoanIntr.Enabled = false;
            txtLoanToShareRatio.Enabled = false;
            txtMaxGuarantors.Enabled = false;
            txtMaxNonContrPrd.Enabled = false;
            txtMemGuarOwnLoan.Enabled = false;
            ddlMemGuarOwnLoan.Enabled = false;
            txtMinContrib.Enabled = false;
            txtMinGuarantors.Enabled = false;
            txtMinLoanApplPeriod.Enabled = false;
            txtPassBookFeeAcc.Enabled = false;
            txtPassBookFeeAcc0.Enabled = false;
            txtPassBookFeeAmt.Enabled = false;
            txtRegFeeAcc.Enabled = false;
            txtRegFeeAcc0.Enabled = false;
            txtRegFeeAmt.Enabled = false;
            txtShareCapitol.Enabled = false;
            txtSharesAcc.Enabled = false;
            txtSharesAcc0.Enabled = false;
            txtTransFromFOSAcc.Enabled = false;
            txtTransFromFOSAcc0.Enabled = false;
            txtTransToFOSAcc.Enabled = false;
            txtTransToFOSAcc0.Enabled = false;
            txtWithdrawalNotice.Enabled = false;

            txtDividentAcc.Enabled = false;
            txtDividentAcc0.Enabled = false;
            txtDividentWhtxAcc.Enabled = false;
            txtDividentWhtxAcc0.Enabled = false;

        }

        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }

        protected void LoadParameters()
        {

            String errMessage;
            try
            {
                SqlCommand cmd = new SqlCommand("BS_get_parameters", new SqlConnection(GetConnectionString()));
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                System.Diagnostics.Debug.WriteLine("Connection read =====> cmd.ExecuteReader");
                
                if (reader.Read())
                {
                    try
                    {
                        try
                        { txtShareCapitol.Text = reader.GetDecimal(0).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Share Capital =====> " + ex.Message.ToString()); }

                        try
                        { txtLoanIntr.Text = reader.GetDecimal(1).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Loan Intr =====> " + ex.Message.ToString()); }
                        try
                        { txtMinGuarantors.Text = reader.GetDecimal(2).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Min. Guarantors =====> " + ex.Message.ToString()); }
                        try
                        { txtMaxGuarantors.Text = reader.GetDecimal(3).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Max. Guarantors =====> " + ex.Message.ToString()); }
                        try
                        { txtLoanToShareRatio.Text = reader.GetDecimal(4).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Loan To Share Ratio =====> " + ex.Message.ToString()); }
                        try
                        { txtMinLoanApplPeriod.Text = reader.GetDecimal(5).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Min. Loan Period =====> " + ex.Message.ToString()); }
                        try
                        { txtMinContrib.Text = reader.GetDecimal(6).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Min. Tot Shares =====> " + ex.Message.ToString()); }
                        try
                        { txtMaxNonContrPrd.Text = reader.GetDecimal(7).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Max Non Contrib period =====> " + ex.Message.ToString()); }
                        
                        try   //=======BankInterest 8===================================================
                        { txtDecimalPlaces.Text = reader.GetDecimal(8).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Decimal Places =====> " + ex.Message.ToString()); }

                        try
                        { txtWithdrawalNotice.Text = reader.GetDecimal(9).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Withdrawal Notice =====> " + ex.Message.ToString()); }
                        try
                        { txtDivProcPrd.Text = reader.GetDecimal(10).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Min. Divident Processing prd =====> " + ex.Message.ToString()); }
                        //=======DeductAmt  11===================================================
                        try
                        {
                            txtMemGuarOwnLoan.Text = reader.GetString(12).ToString();
                            ddlMemGuarOwnLoan.SelectedValue = reader.GetString(12).ToString();
                        }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("SelfGuar =====> " + ex.Message.ToString()); }

                        try
                        { txtGuarShareRatio.Text = reader.GetDecimal(13).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Guarantor Share Ratio =====> " + ex.Message.ToString()); }

                        try
                        { txtCompanyName0.Text = reader.GetString(14).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Company Name =====> " + ex.Message.ToString()); }
                        //=======AuditID  15===================================================
                        //=======AuditTime  16===================================================

                        try
                        { txtTransToFOSAcc.Text = reader.GetString(17).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Trans To FoSA Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtTransToFOSAcc0.Text = reader.GetDecimal(18).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Trans To FoSA Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtTransFromFOSAcc.Text = reader.GetString(19).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Trans From FoSA Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtTransFromFOSAcc0.Text = reader.GetDecimal(20).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Trans From FoSA Acc code=====> " + ex.Message.ToString()); }
                        
                        try
                        { txtSharesAcc.Text = reader.GetString(21).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Shares Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtSharesAcc0.Text = reader.GetDecimal(22).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Shares Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtFundContribution.Text = reader.GetString(23).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Fund Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtFundContribution0.Text = reader.GetDecimal(24).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Fund Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtRegFeeAcc.Text = reader.GetString(25).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("RegFee Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtRegFeeAcc0.Text = reader.GetDecimal(26).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("RegFee Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtRegFeeAmt.Text = reader.GetDecimal(27).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("RegFee Amount =====> " + ex.Message.ToString()); }

                        try
                        { txtPassBookFeeAcc.Text = reader.GetString(28).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Passbook fee Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtPassBookFeeAcc0.Text = reader.GetDecimal(29).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Passbook Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtPassBookFeeAmt.Text = reader.GetDecimal(30).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Passbook Amount =====> " + ex.Message.ToString()); }

                        try
                        { txtDeRegFeeAcc.Text = reader.GetString(31).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Dereg fee Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtDeRegFeeAcc0.Text = reader.GetDecimal(32).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Dereg Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtDeRegFeeAmt.Text = reader.GetDecimal(33).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Dereg Amount =====> " + ex.Message.ToString()); }

                        try
                        { txtDividentAcc.Text = reader.GetString(34).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Divident Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtDividentAcc0.Text = reader.GetDecimal(35).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Divident Acc code=====> " + ex.Message.ToString()); }

                        try
                        { txtDividentWhtxAcc.Text = reader.GetString(36).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Divident WHtax Acc =====> " + ex.Message.ToString()); }

                        try
                        { txtDividentWhtxAcc0.Text = reader.GetDecimal(37).ToString(); }
                        catch (Exception ex) { System.Diagnostics.Debug.WriteLine("Divident WHtax Acc code=====> " + ex.Message.ToString()); }

                        txtShareCapitol.Focus();

                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                    }
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            EnableCtrls();
            txtGuarUpdateType.Text = "Edit";
            btnEdit.Enabled = false;
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ParamDtls_Update("Edit");
            LoadParameters();
            DisEnableCtrls();
            btnEdit.Enabled = true;
            btnSave.Enabled = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadParameters();
            DisEnableCtrls();
            btnEdit.Enabled = true;
            btnSave.Enabled = false;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        private Boolean ParamDtls_Update(String UpdateType)
        {
            Boolean v_bool;
            String errMessage;
            String v_user = System.Web.HttpContext.Current.User.Identity.Name;
            String v_LoanNo; //output LoanNo

            try
            {
                decimal v_ShareInterest, v_LoanInterest, v_MinGuarantors, v_MaxGuarantors, v_LoanToShareRatio,
                    v_MinLoanPeriod, v_MinTotShares, v_MaxContribPeriod, v_BankInterest,
                    v_WithdrawalNotice, v_MinDivPeriod,v_GuarShareRatio,v_TransToFosaAccCode,
                    v_TransFromFosaAccCode,v_SharesAccCode,v_FundAccCode ,v_RegFeeAccCode ,
                    v_RegFeeAmt, v_PassBookFeeAccCode  , v_PassBookFeeAmt  ,v_DeRegFeeAccCode  ,
                    v_DeRegFeeAmt  ,v_DividentAccCode ,v_DividentWhtxAccCode;

                if (String.IsNullOrEmpty(v_user)) { v_user = "Admin"; }

                txtShareCapitol.Text = txtShareCapitol.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtShareCapitol.Text)) {v_ShareInterest = 0;}
                else {v_ShareInterest = Convert.ToDecimal(txtShareCapitol.Text); }

                txtLoanIntr.Text = txtLoanIntr.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtLoanIntr.Text)) { v_LoanInterest = 0; }
                else { v_LoanInterest = Convert.ToDecimal(txtLoanIntr.Text); }

                txtMinGuarantors.Text = txtMinGuarantors.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMinGuarantors.Text)) { v_MinGuarantors = 0; }
                else { v_MinGuarantors = Convert.ToDecimal(txtMinGuarantors.Text); }

                txtMaxGuarantors.Text = txtMaxGuarantors.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMinGuarantors.Text)) { v_MaxGuarantors = 0; }
                else { v_MaxGuarantors = Convert.ToDecimal(txtMaxGuarantors.Text); }

                txtLoanToShareRatio.Text = txtLoanToShareRatio.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtLoanToShareRatio.Text)) { v_LoanToShareRatio = 0; }
                else { v_LoanToShareRatio = Convert.ToDecimal(txtLoanToShareRatio.Text); }

                txtMinLoanApplPeriod.Text = txtMinLoanApplPeriod.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMinLoanApplPeriod.Text)) { v_MinLoanPeriod = 0; }
                else { v_MinLoanPeriod = Convert.ToDecimal(txtMinLoanApplPeriod.Text); }

                txtMinContrib.Text = txtMinContrib.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMinContrib.Text)) { v_MinTotShares = 0; }
                else { v_MinTotShares = Convert.ToDecimal(txtMinContrib.Text); }

                txtMaxNonContrPrd.Text = txtMaxNonContrPrd.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtMaxNonContrPrd.Text)) { v_MaxContribPeriod = 0; }
                else { v_MaxContribPeriod = Convert.ToDecimal(txtMaxNonContrPrd.Text); }

                txtDecimalPlaces.Text = txtDecimalPlaces.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDecimalPlaces.Text)) { v_BankInterest = 0; }
                else { v_BankInterest = Convert.ToDecimal(txtDecimalPlaces.Text); }

                txtWithdrawalNotice.Text = txtWithdrawalNotice.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtWithdrawalNotice.Text)) { v_WithdrawalNotice = 0; }
                else { v_WithdrawalNotice = Convert.ToDecimal(txtWithdrawalNotice.Text); }

                txtDivProcPrd.Text = txtDivProcPrd.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDivProcPrd.Text)) { v_MinDivPeriod = 0; }
                else { v_MinDivPeriod = Convert.ToDecimal(txtDivProcPrd.Text); }

                txtGuarShareRatio.Text = txtGuarShareRatio.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtGuarShareRatio.Text)) { v_GuarShareRatio = 0; }
                else { v_GuarShareRatio = Convert.ToDecimal(txtGuarShareRatio.Text); }

                txtTransToFOSAcc0.Text = txtTransToFOSAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtTransToFOSAcc0.Text)) { v_TransToFosaAccCode = 0; }
                else { v_TransToFosaAccCode = Convert.ToDecimal(txtTransToFOSAcc0.Text); }

                txtTransFromFOSAcc0.Text = txtTransFromFOSAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtTransFromFOSAcc0.Text)) { v_TransFromFosaAccCode = 0; }
                else { v_TransFromFosaAccCode = Convert.ToDecimal(txtTransFromFOSAcc0.Text); }

                txtSharesAcc0.Text = txtSharesAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtSharesAcc0.Text)) { v_SharesAccCode = 0; }
                else { v_SharesAccCode = Convert.ToDecimal(txtSharesAcc0.Text); }

                txtFundContribution0.Text = txtFundContribution0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtFundContribution0.Text)) { v_FundAccCode = 0; }
                else { v_FundAccCode = Convert.ToDecimal(txtFundContribution0.Text); }

                txtRegFeeAcc0.Text = txtRegFeeAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtRegFeeAcc0.Text)) { v_RegFeeAccCode = 0; }
                else { v_RegFeeAccCode = Convert.ToDecimal(txtRegFeeAcc0.Text); }

                txtRegFeeAmt.Text = txtRegFeeAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtRegFeeAmt.Text)) { v_RegFeeAmt = 0; }
                else { v_RegFeeAmt = Convert.ToDecimal(txtRegFeeAmt.Text); }

                txtPassBookFeeAcc0.Text = txtPassBookFeeAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtPassBookFeeAcc0.Text)) { v_PassBookFeeAccCode = 0; }
                else { v_PassBookFeeAccCode = Convert.ToDecimal(txtPassBookFeeAcc0.Text); }

                txtPassBookFeeAmt.Text = txtPassBookFeeAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtPassBookFeeAmt.Text)) { v_PassBookFeeAmt = 0; }
                else { v_PassBookFeeAmt = Convert.ToDecimal(txtPassBookFeeAmt.Text); }

                txtDeRegFeeAcc0.Text = txtDeRegFeeAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDeRegFeeAcc0.Text)) { v_DeRegFeeAccCode = 0; }
                else { v_DeRegFeeAccCode = Convert.ToDecimal(txtDeRegFeeAcc0.Text); }

                txtDeRegFeeAmt.Text = txtDeRegFeeAmt.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDeRegFeeAmt.Text)) { v_DeRegFeeAmt = 0; }
                else { v_DeRegFeeAmt = Convert.ToDecimal(txtDeRegFeeAmt.Text); }

                txtDividentAcc0.Text = txtDividentAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDividentAcc0.Text)) { v_DividentAccCode = 0; }
                else { v_DividentAccCode = Convert.ToDecimal(txtDividentAcc0.Text); }

                txtDividentWhtxAcc0.Text = txtDividentWhtxAcc0.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtDividentWhtxAcc0.Text)) { v_DividentWhtxAccCode = 0; }
                else { v_DividentWhtxAccCode = Convert.ToDecimal(txtDividentWhtxAcc0.Text); }
                
                SqlCommand cmd = new SqlCommand("BS_update_parameters", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add(new SqlParameter("@ShareInterest", v_ShareInterest));
                cmd.Parameters.Add(new SqlParameter("@LoanInterest", v_LoanInterest));
                cmd.Parameters.Add(new SqlParameter("@MinGuarantors", v_MinGuarantors));
                cmd.Parameters.Add(new SqlParameter("@MaxGuarantors", v_MaxGuarantors));
                cmd.Parameters.Add(new SqlParameter("@LoanToShareRatio", v_LoanToShareRatio));
                cmd.Parameters.Add(new SqlParameter("@MinLoanPeriod", v_MinLoanPeriod));
                cmd.Parameters.Add(new SqlParameter("@MinTotShares", v_MinTotShares));
                cmd.Parameters.Add(new SqlParameter("@MaxContribPeriod", v_MaxContribPeriod));
                cmd.Parameters.Add(new SqlParameter("@BankInterest", v_BankInterest));
                cmd.Parameters.Add(new SqlParameter("@WithdrawalNotice", v_WithdrawalNotice));
                cmd.Parameters.Add(new SqlParameter("@MinDivPeriod", v_MinDivPeriod));
                cmd.Parameters.Add(new SqlParameter("@SelfGuar", ddlMemGuarOwnLoan.SelectedValue.ToString()));
                cmd.Parameters.Add(new SqlParameter("@GuarShareRatio", v_GuarShareRatio));
                cmd.Parameters.Add(new SqlParameter("@CompanyName", txtCompanyName0.Text));
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));
                cmd.Parameters.Add(new SqlParameter("@TransToFosa", txtTransToFOSAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@TransToFosaAccCode", v_TransToFosaAccCode));
                cmd.Parameters.Add(new SqlParameter("@TransFromFosa", txtTransFromFOSAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@TransFromFosaAccCode", v_TransFromFosaAccCode));
                cmd.Parameters.Add(new SqlParameter("@SharesAcc", txtSharesAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@SharesAccCode", v_SharesAccCode));
                cmd.Parameters.Add(new SqlParameter("@FundAcc", txtFundContribution.Text));
                cmd.Parameters.Add(new SqlParameter("@FundAccCode", v_FundAccCode));
                cmd.Parameters.Add(new SqlParameter("@RegFeeAcc", txtRegFeeAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@RegFeeAccCode", v_RegFeeAccCode));
                cmd.Parameters.Add(new SqlParameter("@RegFeeAmt", v_RegFeeAmt));
                cmd.Parameters.Add(new SqlParameter("@PassBookFeeAcc", txtPassBookFeeAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@PassBookFeeAccCode", v_PassBookFeeAccCode));
                cmd.Parameters.Add(new SqlParameter("@PassBookFeeAmt", v_PassBookFeeAmt));
                cmd.Parameters.Add(new SqlParameter("@DeRegFeeAcc", txtDeRegFeeAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@DeRegFeeAccCode", v_DeRegFeeAccCode));
                cmd.Parameters.Add(new SqlParameter("@DeRegFeeAmt", v_DeRegFeeAmt));
                cmd.Parameters.Add(new SqlParameter("@Divident", txtDividentAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@DividentAccCode", v_DividentAccCode));
                cmd.Parameters.Add(new SqlParameter("@DividentWhtx", txtDividentWhtxAcc.Text));
                cmd.Parameters.Add(new SqlParameter("@DividentWhtxAccCode", v_DividentWhtxAccCode));

                cmd.Connection.Open();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 000 v_user=" + v_user+ " v_ShareInterest="+ v_ShareInterest.ToString());
                cmd.ExecuteNonQuery();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 222 v_LoanNo=  ");
                cmd.Connection.Close();
                cmd.Dispose();

                v_bool = true;

                txtGuarUpdateType.Text = "";
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