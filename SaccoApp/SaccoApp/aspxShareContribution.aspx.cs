using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaccoApp
{
    public partial class aspxShareContribution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }

        protected void btnEditPnl_Click(object sender, EventArgs e)
        {
            if (pnlEditingData.Visible == true)
            {
                pnlEditingData.Visible = false;
            }
            else
            {
                pnlEditingData.Visible = true;
            }
        }

        protected String v_update_type;
        protected void clearCtrls()
        {

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
                txtMemberName.Text = GridView1.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "")+" "+
                                    GridView1.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");

                System.Diagnostics.Debug.WriteLine("txtMemberNo.Text====" + txtMemberNo.Text);
                if (String.IsNullOrEmpty(txtMemberNo.Text))
                { }
                {
                    String query;
                    query = "select m.InitShares, m.ShareCap, CONVERT(nvarchar(30), m.AsAtDate, 103)AsAtDate, s.TotalShares," +
                                    "MonthlyContr, Station, StaffNo, rtrim(ltrim(upper(m.Withdrawn)))Withdrawn from bs_members m  left join BS_SHARES s on s.MemberNo = m.MemberNo " +
                                    "where m.MemberNo = '" + txtMemberNo.Text +"'";
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
                            txtInitShares.Text = reader.GetDecimal(0).ToString();
                            txtInitSharesDate.Text = reader.GetString(2);
                            txtTotShares.Text = reader.GetDecimal(3).ToString();
                            txtDefaultAmount.Text = reader.GetDecimal(4).ToString();
                            txtStation.Text = reader.GetString(5);
                            txtWithdrawn.Text = reader.GetString(7);
                            ddlWithdrawn.Text = reader.GetString(7);
                            System.Diagnostics.Debug.WriteLine("Successful read =====> Withdrawn=" + reader.GetString(7));
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("Empty data =====> " + ex.Message.ToString());
                        }
                    }

                    cmd.Connection.Close();
                    cmd.Dispose();

                    gvShareContrib.DataBind();
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

            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtIDNoSrch.Text == "") { txtIDNoSrch.Text = txtIDNoSrch.Text + "%"; }
            if (txtMemberNoSrch.Text == "") { txtMemberNoSrch.Text = txtMemberNoSrch.Text + "%"; }
            if (txtSurnameSrch.Text == "") { txtSurnameSrch.Text = txtSurnameSrch.Text + "%"; }
            if (txtOtherNameSrch.Text == "") { txtOtherNameSrch.Text = txtOtherNameSrch.Text + "%"; }

            btnAdd.Enabled = true;
            btnSave.Enabled = false;
            btnSaveNAddNew.Enabled = false;
            btnDelete.Enabled = false;
            Editing.Visible = false;
            pnlEditingData.Visible = false;
            GridView1.Visible = true;
            GridView1.DataBind();
            //pnlDisplayImportData.Visible = false;

        }

        protected void btnSaveWithdrawal_Click(object sender, EventArgs e)
        {
            String errMessage, v_user;
            try
            {
                System.Diagnostics.Debug.WriteLine("Saving withfrawn status member no====" + txtMemberNo.Text);

                SqlCommand cmd = new SqlCommand("BS_update_withdrawn_status",new SqlConnection(GetConnectionString()));
                cmd.CommandType = CommandType.StoredProcedure;
                v_user = System.Web.HttpContext.Current.User.Identity.Name;

                cmd.Parameters.Add(new SqlParameter("@status", ddlWithdrawn.Text));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txtMemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@v_done_by", v_user));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();

                cmd.Connection.Close();
                cmd.Dispose();


                cmd.Connection.Open();

            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }

        }

        protected void btnImpEmployees_Click(object sender, EventArgs e)
        {

            clearCtrls();
            btnAdd.Enabled = true;
            btnSave.Enabled = false;
            btnSaveNAddNew.Enabled = false;
            btnDelete.Enabled = false;
            Editing.Visible = false;
            pnlEditingData.Visible = false;
            //ListView1.Visible = true;
            //pnlDisplayImportData.Visible = true;
        }

        protected void ReportsMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            String menuSelected = ReportsMenu.SelectedValue.ToString();
            if (String.IsNullOrEmpty(menuSelected) || menuSelected == "Reports")
            {
                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
                pnlDisplayImportData.Visible = false;
                pnlReports.Visible = false;
            }
            else
            {
                //clearCtrls();
                btnAdd.Enabled = false;
                btnSave.Enabled = false;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
                pnlDisplayImportData.Visible = false;
                pnlReports.Visible = true;

                lblReportName.Text = menuSelected;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','" + menuSelected + "');", true);
            }
        }
        protected String path;

        protected void btnUpLoad_Click(object sender, EventArgs e)
        {
            String path;
            path = Server.MapPath(FileUpload1.FileName).ToString();
            //path = "C:\\Imports\\" + FileUpload1.FileName;
            lblUploadStatus.Text = path;
            lblUploadStatus.ForeColor = System.Drawing.Color.Azure;


            if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".xlsx")
            {
                using (var excel = new ExcelPackage(FileUpload1.PostedFile.InputStream))
                {
                    var tbl = new DataTable();
                    var ws = excel.Workbook.Worksheets.First();
                    var hasHeader = true;  // adjust accordingly
                    // add DataColumns to DataTable
                    foreach (var firstRowCell in ws.Cells[1, 1, 1, ws.Dimension.End.Column])
                        tbl.Columns.Add(hasHeader ? firstRowCell.Text
                            : String.Format("Column {0}", firstRowCell.Start.Column));

                    // add DataRows to DataTable
                    int startRow = hasHeader ? 2 : 1;
                    for (int rowNum = startRow; rowNum <= ws.Dimension.End.Row; rowNum++)
                    {
                        var wsRow = ws.Cells[rowNum, 1, rowNum, ws.Dimension.End.Column];
                        DataRow row = tbl.NewRow();
                        foreach (var cell in wsRow)
                            row[cell.Start.Column - 1] = cell.Text;
                        tbl.Rows.Add(row);
                    }

                    gvImportEmpData.DataSource = tbl;
                    gvImportEmpData.DataBind();
                    gvImportEmpData.Visible = true;
                    var msg = String.Format("DataTable successfully created from excel-file. Colum-count:{0} Row-count:{1}",
                                            tbl.Columns.Count, tbl.Rows.Count);
                    lblUploadStatus.Text = msg;
                }
            }
            else
            {
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                lblUploadStatus.Text = "You have not specified a file.";


            }
        }

        protected void btnClearData_Click(object sender, EventArgs e)
        {
            gvImportEmpData.DataSource = null;
            gvImportEmpData.DataBind();
        }

        protected void btnExportErrData_Click(object sender, EventArgs e)
        {
            DataTable dt = Create_DtFromGv(gvImportEmpData);

            Response.ContentType = "Application/x-msexcel";
            Response.AddHeader("content-disposition", "attachment;filename=test.csv");
            Response.Write(ExportToCSVFile(dt));
            Response.End();
        }

        protected DataTable Create_DtFromGv(GridView gv)
        {
            DataTable dt = new DataTable();

            if (gv.HeaderRow != null)
            {

                for (int i = 0; i < gv.HeaderRow.Cells.Count; i++)
                {
                    dt.Columns.Add(gv.HeaderRow.Cells[i].Text);
                }
            }

            for (int j = 0; j < gv.Rows.Count; j++)
            {
                DataRow dr;
                GridViewRow row = gv.Rows[j];
                dr = dt.NewRow();

                for (int i = 0; i < row.Cells.Count; i++)
                {
                    //dr[i] = row.Cells[i].Text;
                    dr[i] = row.Cells[i].Text.Replace("&nbsp;", "");
                    System.Diagnostics.Debug.WriteLine("row.Cells[i].Text==>" + row.Cells[i].Text.ToString());
                }

                dt.Rows.Add(dr);
            }
            return dt;

        }

        public string ExportToCSVFile(DataTable dtTable)
        {
            StringBuilder sbldr = new StringBuilder();
            if (dtTable.Columns.Count != 0)
            {
                foreach (DataColumn col in dtTable.Columns)
                {
                    sbldr.Append(col.ColumnName + ',');
                }
                sbldr.Append("\r\n");
                foreach (DataRow row in dtTable.Rows)
                {
                    foreach (DataColumn column in dtTable.Columns)
                    {
                        sbldr.Append(row[column].ToString() + ',');
                    }
                    sbldr.Append("\r\n");
                }
            }
            return sbldr.ToString();
        }

        protected void btnSaveDataToDb_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {
                MemberContrib_Import();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Successfull Importation...');", true);
                System.Diagnostics.Debug.WriteLine("Successful imported...");
            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Importation error.','" + errMessage + "');", true);

                System.Diagnostics.Debug.WriteLine("Error importing..." + ex.Message.ToString());
            }
        }

        protected void btnRptViewHide_Click(object sender, EventArgs e)
        {

        }

        protected void btnGenRpt_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {
                if (lblReportName.Text == "All Transactions Report")
                {
                    //rvPaySlip_001.LocalReport.ReportPath = "Reports/rptPaySlip_001.rdlc";
                    //rvPaySlip_001.LocalReport.Refresh();
                }
                else if (lblReportName.Text == "Periodic Transactions Report")
                {

                }
                else if (lblReportName.Text == "Total Shares Summary Report")
                {

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


        [DataObjectMethod(DataObjectMethodType.Insert)]
        protected Boolean MemberContrib_Import()
        {
            Boolean v_bool;
            String errMessage;
            String strSubString;
            int v_txt_emp_code;
            int v_txt_emp_org_code;
            int v_cnt, v_pr_code, v_bnk_code, v_bbr_code;


            try
            {
                v_bool = false;
                /*
                SqlCommand cmd = new SqlCommand("employee_update", new SqlConnection(GetConnectionString()));
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = Create_DtFromGv(gvImportEmpData);

                if (dt.Columns.Count != 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        System.Diagnostics.Debug.WriteLine("dt.Columns.Count =====>" + dt.Columns.Count.ToString());
                        txt_emp_code.Text = row[0].ToString();
                        txt_emp_sht_desc.Text = row[1].ToString();
                        txt_emp_surname.Text = row[2].ToString();
                        txt_emp_other_names.Text = row[3].ToString();
                        txt_emp_tel_no1.Text = row[4].ToString();
                        txt_emp_tel_no2.Text = row[5].ToString();
                        txt_emp_sms_no.Text = row[6].ToString();
                        txt_emp_contract_date.Text = row[7].ToString();
                        txt_emp_final_date.Text = row[8].ToString();
                        txt_emp_org_code.Text = row[9].ToString();
                        txt_emp_organization.Text = row[10].ToString();
                        txt_emp_gender.Text = row[11].ToString();
                        txt_emp_join_date.Text = row[12].ToString();
                        txt_emp_work_email.Text = row[13].ToString();
                        txt_emp_personal_email.Text = row[14].ToString();

                        txt_emp_id_no.Text = row[15].ToString();
                        txt_emp_nssf_no.Text = row[16].ToString();
                        txt_emp_pin_no.Text = row[17].ToString();
                        txt_emp_nhif_no.Text = row[18].ToString();
                        txt_emp_lasc_no.Text = row[19].ToString();
                        txt_emp_nxt_kin_sname.Text = row[20].ToString();
                        txt_emp_nxt_kin_onames.Text = row[21].ToString();
                        txt_emp_nxt_kin_tel_no.Text = row[22].ToString();
                        //cmd.Parameters.Add(new SqlParameter("@v_pr_code", v_pr_code));
                        //cmd.Parameters.Add(new SqlParameter("@v_bnk_code", v_bnk_code));
                        //cmd.Parameters.Add(new SqlParameter("@v_bbr_code", v_bbr_code));
                        txt_emp_bank_acc_no.Text = row[23].ToString();
                        try
                        {
                            ddl_emp_bnk_code.SelectedValue = row[24].ToString();
                            ddl_emp_bbr_code.SelectedValue = row[26].ToString();
                        }
                        catch (Exception ex)
                        {
                            ddl_emp_bnk_code.SelectedValue = "";
                            ddl_emp_bbr_code.SelectedValue = "";
                            System.Diagnostics.Debug.WriteLine("Error getting Bank dtls for " + txt_emp_surname.Text
                                + "\n Bank=" + row[24].ToString()
                                + "\n Bank Branch=" + row[25].ToString() + ex.Message);
                        }
                        if (ddl_emp_pr_code.SelectedValue == "") { v_pr_code = 0; }
                        else { v_pr_code = Convert.ToInt32(ddl_emp_pr_code.SelectedValue); }

                        if (ddl_emp_bnk_code.SelectedValue == "") { v_bnk_code = 0; }
                        else { v_bnk_code = Convert.ToInt32(ddl_emp_bnk_code.SelectedValue); }

                        if (ddl_emp_bbr_code.SelectedValue == "") { v_bbr_code = 0; }
                        else { v_bbr_code = Convert.ToInt32(ddl_emp_bbr_code.SelectedValue); }


                        if (String.IsNullOrEmpty(txt_emp_code.Text))
                        {
                            v_txt_emp_code = 0;
                        }
                        else
                        {
                            v_txt_emp_code = Convert.ToInt32(txt_emp_code.Text);
                        }

                        if (String.IsNullOrEmpty(txt_emp_org_code.Text))
                        {
                            v_txt_emp_org_code = 0;
                        }
                        else
                        {
                            v_txt_emp_org_code = Convert.ToInt32(txt_emp_org_code.Text);
                        }

                        if (String.IsNullOrEmpty(txt_emp_work_email.Text) == false)
                        {
                            v_cnt = txt_emp_work_email.Text.IndexOf('@');
                            if (v_cnt <= 0)
                            {
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Check Work email. An email address must have @ character');", true);
                                //return false;
                                //continue;
                            }
                            strSubString = txt_emp_work_email.Text.Substring(v_cnt);
                            //System.Diagnostics.Debug.WriteLine("Work email strSubString=====>" + strSubString);
                            v_cnt = strSubString.IndexOf('.');
                            if (v_cnt <= 0)
                            {
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Check Work email. An email address must have . character after @ character');", true);
                                //return false;
                                //continue;
                            }

                        }
                        if (String.IsNullOrEmpty(txt_emp_personal_email.Text) == false)
                        {
                            v_cnt = txt_emp_personal_email.Text.IndexOf('@');
                            if (v_cnt <= 0)
                            {
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Check Pernonal email. An email address must have @ character');", true);
                                //return false;
                                //continue;
                            }
                            strSubString = txt_emp_personal_email.Text.Substring(v_cnt);
                            v_cnt = strSubString.IndexOf('.');
                            if (v_cnt <= 0)
                            {
                                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Check Personal email. An email address must have . character after @ character');", true);
                                //return false;
                                //continue;
                            }

                        }
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add(new SqlParameter("@v_emp_code", v_txt_emp_code));
                        cmd.Parameters.Add(new SqlParameter("@v_sht_desc", txt_emp_sht_desc.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_surname", txt_emp_surname.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_other_names", txt_emp_other_names.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_tel_no1", txt_emp_tel_no1.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_tel_no2", txt_emp_tel_no2.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_sms_no", txt_emp_sms_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_contract_date", txt_emp_contract_date.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_final_date", txt_emp_final_date.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_org_code", v_txt_emp_org_code));
                        cmd.Parameters.Add(new SqlParameter("@v_organization", txt_emp_organization.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_gender", txt_emp_gender.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_join_date", txt_emp_join_date.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_work_email", txt_emp_work_email.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_personal_email", txt_emp_personal_email.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_empcode", SqlDbType.Int));
                        cmd.Parameters["@v_empcode"].Direction = ParameterDirection.Output;

                        cmd.Parameters.Add(new SqlParameter("@v_id_no", txt_emp_id_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_nssf_no", txt_emp_nssf_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_pin_no", txt_emp_pin_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_nhif_no", txt_emp_nhif_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_lasc_no", txt_emp_lasc_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_nxt_kin_sname", txt_emp_nxt_kin_sname.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_nxt_kin_onames", txt_emp_nxt_kin_onames.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_nxt_kin_tel_no", txt_emp_nxt_kin_tel_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_pr_code", v_pr_code));
                        cmd.Parameters.Add(new SqlParameter("@v_bnk_code", v_bnk_code));
                        cmd.Parameters.Add(new SqlParameter("@v_bbr_code", v_bbr_code));
                        cmd.Parameters.Add(new SqlParameter("@v_bank_acc_no", txt_emp_bank_acc_no.Text));
                        cmd.Parameters.Add(new SqlParameter("@v_status", "ACTIVE"));
                        cmd.Parameters.Add(new SqlParameter("@v_payroll_allowed", "YES"));
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();

                        cmd.Connection.Close();

                    }
                }

                cmd.Dispose();
                v_bool = true;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
                System.Diagnostics.Debug.WriteLine("66dt.Columns.Count =====>" + dt.Columns.Count.ToString());
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Information.','Records saved successfully');", true);
                */
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