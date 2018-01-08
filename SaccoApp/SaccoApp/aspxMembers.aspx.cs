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
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace SaccoApp
{
    public partial class aspxMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["serenehrdbConnectionString"].ConnectionString;
        }


        protected void txtInitMonthlyContrib_TextChanged(object sender, EventArgs e)
        {
            txtInitMonthlyContrib.Text = Regex.Replace(txtInitMonthlyContrib.Text, "[^0-9]", "");
            //System.Diagnostics.Debug.WriteLine("Key changed =====>" + txtInitMonthlyContrib.Text);
        }

        protected void txtCurrentContribution_TextChanged(object sender, EventArgs e)
        {
            txtCurrentContribution.Text = Regex.Replace(txtCurrentContribution.Text, "[^0-9]", "");
            //System.Diagnostics.Debug.WriteLine("Key changed =====>" + txtCurrentContribution.Text);
        }

        protected void btnEmpPhoto_Click(object sender, EventArgs e)
        {
            if (imgEmpPhoto.Visible == false)
            {
                imgEmpPhoto.Visible = true;
                DispalyImgFromDb();
            }
            else
            {
                imgEmpPhoto.Visible = false;

            }
        }

        protected void btnUploadEmpPhoto_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {
                System.Diagnostics.Debug.WriteLine("Uploading =====>");
                if (!fupEmpPhotoUpload.HasFile)
                {
                    //checking if file uploader has no file selected 
                }
                else
                {
                    int fileLength = fupEmpPhotoUpload.PostedFile.ContentLength;
                    byte[] pic = new byte[fileLength];

                    fupEmpPhotoUpload.PostedFile.InputStream.Read(pic, 0, fileLength);

                    /*
                    System.IO.MemoryStream stream1 = new System.IO.MemoryStream(pic, true);
                    System.Diagnostics.Debug.WriteLine("Uploading ttttttttt  ");
                    stream1.Write(pic, 0, pic.Length);
                    System.Diagnostics.Debug.WriteLine("Uploading xxxxxxxxx  ");
                    Bitmap m_bitmap = (Bitmap)Bitmap.FromStream(stream1, true);
                    System.Diagnostics.Debug.WriteLine("Uploading yyyyyyyy  ");
                    Response.ContentType = "Image/jpeg";
                    m_bitmap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    */

                    string base64String = Convert.ToBase64String(pic, 0, pic.Length);
                    imgEmpPhoto.ImageUrl = "data:image/png;base64," + base64String;
                    imgEmpPhoto.Visible = true;

                    //System.Diagnostics.Debug.WriteLine("imgEmpPhoto Url=" + imgEmpPhoto.ImageUrl);
                }
            }
            catch (Exception ex)
            {
                errMessage = "Error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
            }
        }

        protected void btnSaveEmpPhoto_Click(object sender, EventArgs e)
        {
            String errMessage;
            String v_user;
            string v_photo_stream;
            

            SqlCommand cmd = new SqlCommand("update_member_photo", new SqlConnection(GetConnectionString()));

            v_user = System.Web.HttpContext.Current.User.Identity.Name;

            try
            {
                v_photo_stream = imgEmpPhoto.ImageUrl; // MyImageToBase64(imgEmpPhoto, System.Drawing.Imaging.ImageFormat.Bmp);
                System.Diagnostics.Debug.WriteLine("imgEmpPhoto Url=" + imgEmpPhoto.ImageUrl);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txt_MemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@v_photo_stream", v_photo_stream));
                cmd.Parameters.Add(new SqlParameter("@v_photo_updatedby", v_user));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();

                cmd.Connection.Close();
                cmd.Dispose();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Success.','Photo has been saved successfully.');", true);
            }
            catch (Exception ex)
            {
                errMessage = "Error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
            }
            finally
            {
                cmd.Dispose();
            }
        }

        protected void DispalyImgFromDb()
        {
            String errMessage;
            SqlCommand cmd = new SqlCommand("get_member_photo", new SqlConnection(GetConnectionString()));

            try
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txt_MemberNo.Text));
                cmd.Connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    try
                    {
                        imgEmpPhoto.ImageUrl = reader.GetString(0);
                        imgEmpPhoto.Visible = true;
                        System.Diagnostics.Debug.WriteLine("db imgEmpPhoto.ImageUrl =====> " + imgEmpPhoto.ImageUrl);
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Empty Image =====> " + ex.Message.ToString());
                        imgEmpPhoto.ImageUrl = "Empty";

                    }
                }
                cmd.Connection.Close();
                cmd.Dispose();


            }
            catch (Exception ex)
            {
                errMessage = "Error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);
            }
            finally
            {
                cmd.Dispose();
            }
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

        protected void ddlSex_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtSex.Text = ddlSex.SelectedValue;
            //System.Diagnostics.Debug.WriteLine("ddlSex.SelectedValue =====>" + ddlSex.SelectedValue);
        }

        protected void ddlEmploymentTerms_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEmploymentTerms.Text = ddlEmploymentTerms.SelectedValue;
            //System.Diagnostics.Debug.WriteLine("ddlEmploymentTerms.SelectedValue =====>" + ddlEmploymentTerms.SelectedValue);
        }

        protected void clearCtrls()
        {
            txt_MemberNo.Text = "";
            txt_other_names.Text = "";
            txt_surname.Text = "";
            txt_DOB.Text = "";
            txtTotShares.Text = "";
            txtStation.Text = "";
            txtStaffNo.Text = "";
            txtSex.Text = "";
            ddlSex.SelectedIndex = 0;
            txtRegFee.Text = "";
            txtRegDate.Text = "";
            txtRank.Text = "";
            txtProvince.Text = "";
            txtPINNo.Text = "";
            txtPassBookFee.Text = "";
            txtOfficeTelNo.Text = "";
            txtOfficeAddr.Text = "";
            txtInitShares.Text = "";
            txtIDNo.Text = "";
            txtHomeTelNo.Text = "";
            txtHomeAddr.Text = "";
            txtEmploymentTerms.Text = "";
            ddlEmploymentTerms.SelectedIndex = 0;
            txtEmployer.Text = "";
            txtDistrict.Text = "";
            txtDepartment.Text = "";
            txtCurrentContribution.Text = "";
            txtCompanyCode.Text = "";
            txtAsAtDate.Text = "";
            txtAccountNo.Text = "";
            imgEmpPhoto.ImageUrl = "Empty";

        }
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            String errMessage;
            try
            {
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";

                clearCtrls();
                btnAdd.Enabled = false;
                btnSave.Enabled = true;
                btnSaveNAddNew.Enabled = true;
                btnDelete.Enabled = true;
                Editing.Visible = true;
                pnlEditingData.Visible = true;
                ListView1.Visible = true;
                pnlDisplayImportData.Visible = false;
                
                txt_MemberNo.Text = GridView1.SelectedRow.Cells[1].Text.Trim().Replace("&nbsp;", "");
                txtStaffNo.Text = GridView1.SelectedRow.Cells[2].Text.Trim().Replace("&nbsp;", "");
                txtIDNo.Text = GridView1.SelectedRow.Cells[3].Text.Trim().Replace("&nbsp;", "");
                txtAccountNo.Text = GridView1.SelectedRow.Cells[4].Text.Trim().Replace("&nbsp;", "");
                txt_surname.Text = GridView1.SelectedRow.Cells[5].Text.Trim().Replace("&nbsp;", "");
                txt_other_names.Text = GridView1.SelectedRow.Cells[6].Text.Trim().Replace("&nbsp;", "");
                txtSex.Text = GridView1.SelectedRow.Cells[7].Text.Trim().Replace("&nbsp;", "");
                ddlSex.Text = GridView1.SelectedRow.Cells[7].Text.Trim().Replace("&nbsp;", "");

                txt_DOB.Text = GridView1.SelectedRow.Cells[8].Text.Trim().Replace("&nbsp;", "");
                txtEmployer.Text = GridView1.SelectedRow.Cells[9].Text.Trim().Replace("&nbsp;", "");
                txtDepartment.Text = GridView1.SelectedRow.Cells[10].Text.Trim().Replace("&nbsp;", "");
                txtRank.Text = GridView1.SelectedRow.Cells[11].Text.Trim().Replace("&nbsp;", "");
                txtEmploymentTerms.Text = GridView1.SelectedRow.Cells[12].Text.Trim().Replace("&nbsp;", "");
                ddlEmploymentTerms.Text = GridView1.SelectedRow.Cells[12].Text.Trim().Replace("&nbsp;", "");

                txtOfficeAddr.Text = GridView1.SelectedRow.Cells[13].Text.Trim().Replace("&nbsp;", "");
                txtOfficeTelNo.Text = GridView1.SelectedRow.Cells[14].Text.Trim().Replace("&nbsp;", "");
                txtHomeAddr.Text = GridView1.SelectedRow.Cells[15].Text.Trim().Replace("&nbsp;", "");
                txtHomeTelNo.Text = GridView1.SelectedRow.Cells[16].Text.Trim().Replace("&nbsp;", "");
                txtRegFee.Text = GridView1.SelectedRow.Cells[17].Text.Trim().Replace("&nbsp;", "");
                txtInitShares.Text = GridView1.SelectedRow.Cells[18].Text.Trim().Replace("&nbsp;", "");
                txtAsAtDate.Text = GridView1.SelectedRow.Cells[19].Text.Trim().Replace("&nbsp;", "");
                txtCurrentContribution.Text = GridView1.SelectedRow.Cells[20].Text.Trim().Replace("&nbsp;", "");
                txtRegDate.Text = GridView1.SelectedRow.Cells[21].Text.Trim().Replace("&nbsp;", "");

                txtProvince.Text = GridView1.SelectedRow.Cells[28].Text.Trim().Replace("&nbsp;", "");
                txtDistrict.Text = GridView1.SelectedRow.Cells[29].Text.Trim().Replace("&nbsp;", "");
                txtStation.Text = GridView1.SelectedRow.Cells[30].Text.Trim().Replace("&nbsp;", "");
                txtCompanyCode.Text = GridView1.SelectedRow.Cells[31].Text.Trim().Replace("&nbsp;", "");
                txtPINNo.Text = GridView1.SelectedRow.Cells[32].Text.Trim().Replace("&nbsp;", "");
                txtTotShares.Text = GridView1.SelectedRow.Cells[33].Text.Trim().Replace("&nbsp;", "");

                DispalyImgFromDb();


            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            String errMessage;
            try
            {
                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                clearCtrls();
                btnAdd.Enabled = false;
                btnSave.Enabled = true;
                btnSaveNAddNew.Enabled = true;
                btnDelete.Enabled = true;
                Editing.Visible = true;
                pnlEditingData.Visible = true;
                ListView1.Visible = true;
                pnlDisplayImportData.Visible = false;

                Label txt_MemberNoLabel = (Label)e.Item.FindControl("MemberNoLabel");
                Label txt_StaffNoLabel = (Label)e.Item.FindControl("StaffNoLabel");
                Label txt_IDNoLabel = (Label)e.Item.FindControl("IDNoLabel");
                Label txt_AccNoLabel = (Label)e.Item.FindControl("AccNoLabel");
                Label txt_SurNameLabel = (Label)e.Item.FindControl("SurNameLabel");
                Label txt_OtherNamesLabel = (Label)e.Item.FindControl("OtherNamesLabel");
                Label txt_SexLabel = (Label)e.Item.FindControl("SexLabel");
                Label txt_DOBLabel = (Label)e.Item.FindControl("DOBLabel");
                Label txt_EmployerLabel = (Label)e.Item.FindControl("EmployerLabel");
                Label txt_DeptLabel = (Label)e.Item.FindControl("DeptLabel");
                Label txt_RankLabel = (Label)e.Item.FindControl("RankLabel");
                Label txt_TermsLabel = (Label)e.Item.FindControl("TermsLabel");
                Label txt_PresentAddrLabel = (Label)e.Item.FindControl("PresentAddrLabel");
                Label txt_OfficeTelNoLabel = (Label)e.Item.FindControl("OfficeTelNoLabel");
                Label txt_HomeAddrLabel = (Label)e.Item.FindControl("HomeAddrLabel");
                Label txt_HomeTelNoLabel = (Label)e.Item.FindControl("HomeTelNoLabel");
                Label txt_RegFeeLabel = (Label)e.Item.FindControl("RegFeeLabel");
                Label txt_RegDateLabel = (Label)e.Item.FindControl("RegDateLabel");
                Label txt_InitSharesLabel = (Label)e.Item.FindControl("InitSharesLabel");
                Label txt_AsAtDateLabel = (Label)e.Item.FindControl("AsAtDateLabel");
                Label txt_MonthlyContrLabel = (Label)e.Item.FindControl("MonthlyContrLabel");
                Label txt_ApplicDateLabel = (Label)e.Item.FindControl("ApplicDateLabel");
                Label txt_EffectDateLabel = (Label)e.Item.FindControl("EffectDateLabel");
                Label txt_SignedLabel = (Label)e.Item.FindControl("SignedLabel");
                Label txt_AcceptedLabel = (Label)e.Item.FindControl("AcceptedLabel");
                Label txt_ArchivedLabel = (Label)e.Item.FindControl("ArchivedLabel");
                Label txt_WithdrawnLabel = (Label)e.Item.FindControl("WithdrawnLabel");
                Label txt_IsGuarantorLabel = (Label)e.Item.FindControl("IsGuarantorLabel");
                Label txt_ProvinceLabel = (Label)e.Item.FindControl("ProvinceLabel");
                Label txt_DistrictLabel = (Label)e.Item.FindControl("DistrictLabel");
                Label txt_StationLabel = (Label)e.Item.FindControl("StationLabel");
                Label txt_CompanyCodeLabel = (Label)e.Item.FindControl("CompanyCodeLabel");
                Label txt_PINLabel = (Label)e.Item.FindControl("PINLabel");
                Label txt_ShareCapLabel = (Label)e.Item.FindControl("ShareCapLabel");
                Label txt_BankCodeLabel = (Label)e.Item.FindControl("BankCodeLabel");
                Label txt_PassBookFeeLabel = (Label)e.Item.FindControl("PassBookFeeLabel");

                txt_MemberNo.Text = txt_MemberNoLabel.Text;
                txt_other_names.Text = txt_OtherNamesLabel.Text;
                txt_surname.Text = txt_SurNameLabel.Text;
                txt_DOB.Text = txt_DOBLabel.Text;
                txtTotShares.Text = txt_ShareCapLabel.Text;
                txtStation.Text = txt_StationLabel.Text;
                txtStaffNo.Text = txt_StaffNoLabel.Text;
                txtSex.Text = txt_SexLabel.Text;
                ddlSex.Text = txt_SexLabel.Text;

                txtRegFee.Text = txt_RegFeeLabel.Text;
                txtRegDate.Text = txt_RegDateLabel.Text;
                txtRank.Text = txt_RankLabel.Text;
                txtProvince.Text = txt_ProvinceLabel.Text;
                txtPINNo.Text = txt_PINLabel.Text;
                txtPassBookFee.Text = txt_PassBookFeeLabel.Text;
                txtOfficeTelNo.Text = txt_OfficeTelNoLabel.Text;
                txtOfficeAddr.Text = txt_PresentAddrLabel.Text;
                txtInitShares.Text = txt_InitSharesLabel.Text;
                txtIDNo.Text = txt_IDNoLabel.Text;
                txtHomeTelNo.Text = txt_HomeTelNoLabel.Text;
                txtHomeAddr.Text = txt_HomeAddrLabel.Text;
                txtEmploymentTerms.Text = txt_TermsLabel.Text;
                ddlEmploymentTerms.Text = txt_TermsLabel.Text;

                txtEmployer.Text = txt_EmployerLabel.Text;
                txtDistrict.Text = txt_DistrictLabel.Text;
                txtDepartment.Text = txt_DeptLabel.Text;
                txtCurrentContribution.Text = txt_MonthlyContrLabel.Text;
                txtCompanyCode.Text = txt_CompanyCodeLabel.Text;
                txtAsAtDate.Text = txt_AsAtDateLabel.Text;
                txtAccountNo.Text = txt_AccNoLabel.Text;

                DispalyImgFromDb();

            }
            catch (Exception ex)
            {
                errMessage = "Error..." + ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            v_update_type = "Add";
            txtUpdateType.Text = "Add";
            btnAdd.Enabled = false;
            btnSave.Enabled = true;
            btnSaveNAddNew.Enabled = true;
            btnDelete.Enabled = false;
            Editing.Visible = true;
            pnlEditingData.Visible = true;
            ListView1.Visible = false;
            pnlDisplayImportData.Visible = false;
            clearCtrls();

        }

        protected String v_update_type;

        protected void btnSave_Click(object sender, EventArgs e)
        {

            if (MemberDtls_Update(txtUpdateType.Text))
            {
                btnAdd.Enabled = true;
                btnSave.Enabled = true;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                Editing.Visible = true;
                pnlEditingData.Visible = true;
                GridView1.Visible = true;
                GridView1.DataBind();
                pnlDisplayImportData.Visible = false;

                v_update_type = "Edit";
                txtUpdateType.Text = "Edit";
                //clearCtrls();
            }
            else { }
        }

        protected void btnSaveNAddNew_Click(object sender, EventArgs e)
        {
            if (MemberDtls_Update(txtUpdateType.Text))
            {
                btnAdd.Enabled = false;
                btnSave.Enabled = true;
                btnSaveNAddNew.Enabled = true;
                btnDelete.Enabled = false;
                Editing.Visible = true;
                pnlEditingData.Visible = true;
                GridView1.Visible = false;
                GridView1.DataBind();
                pnlDisplayImportData.Visible = false;

                clearCtrls();
                v_update_type = "Add";
                txtUpdateType.Text = "Add";
            }
            else { }

        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        private Boolean MemberDtls_Update(String UpdateType)
        {
            Boolean v_bool;
            String errMessage;
            String v_user = System.Web.HttpContext.Current.User.Identity.Name;
            String v_MemberNo; //output MemberNo
            try
            {
                decimal v_ShareCap, v_reg_fee, v_MonthlyContr, v_PassBookFee;
                if (String.IsNullOrEmpty(v_user)){ v_user = "Admin"; }

                txtTotShares.Text = txtTotShares.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtTotShares.Text))
                {
                    v_ShareCap = 0;
                }
                else
                {
                    v_ShareCap = Convert.ToDecimal(txtTotShares.Text);
                }
                
                txtRegFee.Text = txtRegFee.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtRegFee.Text))
                {
                    v_reg_fee = 0;
                }
                else
                {
                    v_reg_fee = Convert.ToDecimal(txtRegFee.Text);
                }
                txtPassBookFee.Text = txtPassBookFee.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtPassBookFee.Text))
                {
                    v_PassBookFee = 0;
                }
                else
                {
                    v_PassBookFee = Convert.ToDecimal(txtPassBookFee.Text);
                }
                txtInitMonthlyContrib.Text = txtInitMonthlyContrib.Text.Replace("&nbsp;", "");
                if (String.IsNullOrEmpty(txtInitMonthlyContrib.Text))
                {
                    v_MonthlyContr = 0;
                }
                else
                {
                    v_MonthlyContr = Convert.ToDecimal(txtInitMonthlyContrib.Text);
                }

                SqlCommand cmd = new SqlCommand("BS_member_update", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@UpdateType", UpdateType));
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txt_MemberNo.Text));
                cmd.Parameters.Add(new SqlParameter("@SurName", txt_surname.Text));
                cmd.Parameters.Add(new SqlParameter("@OtherNames", txt_other_names.Text));
                cmd.Parameters.Add(new SqlParameter("@DOB", txt_DOB.Text));
                cmd.Parameters.Add(new SqlParameter("@ShareCap", v_ShareCap));
                cmd.Parameters.Add(new SqlParameter("@Station", txtStation.Text));
                cmd.Parameters.Add(new SqlParameter("@StaffNo", txtStaffNo.Text));
                cmd.Parameters.Add(new SqlParameter("@Sex", txtSex.Text));
                cmd.Parameters.Add(new SqlParameter("@RegFee", v_reg_fee));
                cmd.Parameters.Add(new SqlParameter("@RegDate", txtRegDate.Text));
                cmd.Parameters.Add(new SqlParameter("@Rank", txtRank.Text));
                cmd.Parameters.Add(new SqlParameter("@Province", txtProvince.Text));
                cmd.Parameters.Add(new SqlParameter("@PIN", txtPINNo.Text));
                cmd.Parameters.Add(new SqlParameter("@PassBookFee", v_PassBookFee));
                cmd.Parameters.Add(new SqlParameter("@OfficeTelNo", txtOfficeTelNo.Text));
                cmd.Parameters.Add(new SqlParameter("@OfficeAddr", txtOfficeAddr.Text));
                cmd.Parameters.Add(new SqlParameter("@InitShares", txtInitShares.Text));
                cmd.Parameters.Add(new SqlParameter("@IDNo", txtIDNo.Text));
                cmd.Parameters.Add(new SqlParameter("@HomeTelNo", txtHomeTelNo.Text));
                cmd.Parameters.Add(new SqlParameter("@HomeAddr", txtHomeAddr.Text));
                cmd.Parameters.Add(new SqlParameter("@Terms", txtEmploymentTerms.Text));
                cmd.Parameters.Add(new SqlParameter("@Employer", txtEmployer.Text));
                cmd.Parameters.Add(new SqlParameter("@District", txtDistrict.Text));
                cmd.Parameters.Add(new SqlParameter("@Department", txtDepartment.Text));
                cmd.Parameters.Add(new SqlParameter("@MonthlyContr", v_MonthlyContr));
                cmd.Parameters.Add(new SqlParameter("@CompanyCode", txtCompanyCode.Text));
                cmd.Parameters.Add(new SqlParameter("@AsAtDate", txtAsAtDate.Text));
                cmd.Parameters.Add(new SqlParameter("@AccNo", txtAccountNo.Text));
                cmd.Parameters.Add(new SqlParameter("@v_user", v_user));
                cmd.Parameters.Add(new SqlParameter("@v_MemberNo", SqlDbType.VarChar));
                cmd.Parameters["@v_MemberNo"].Direction = ParameterDirection.Output;
                cmd.Parameters["@v_MemberNo"].Size = 45;
                //cmd.Parameters["@v_MemberNo"].SqlDbType = SqlDbType.NVarChar;

                cmd.Connection.Open();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 000 AccNo v_user=" + v_user);
                cmd.ExecuteNonQuery();
                v_MemberNo = cmd.Parameters["@v_MemberNo"].Value.ToString();
                System.Diagnostics.Debug.WriteLine("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 111 AccNo v_MemberNo=" + v_MemberNo + " no=  "+ cmd.Parameters["@v_MemberNo"].Value.ToString());
                cmd.Connection.Close();
                cmd.Dispose();
                txt_MemberNo.Text = txt_MemberNo.Text;
                txtSurnameSrch.Text = txt_surname.Text;
                txtOtherNameSrch.Text = txt_other_names.Text;
                txtIDNo.Text = txtIDNo.Text;

                //System.Diagnostics.Debug.WriteLine("@v_user===>" + v_user + " v_MemberNo=" + v_MemberNo);
                GridView1.DataBind();
                btnEditPnl.Enabled = false;

                v_bool = true;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
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
                MemberDtls_Import();
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

        [DataObjectMethod(DataObjectMethodType.Insert)]
        protected Boolean MemberDtls_Import()
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            btnSave.Enabled = false;
            btnSaveNAddNew.Enabled = false;
            btnDelete.Enabled = false;
            Editing.Visible = false;
            pnlEditingData.Visible = false;
            GridView1.Visible = true;
            GridView1.DataBind();
            pnlDisplayImportData.Visible = false;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {
                SqlCommand cmd = new SqlCommand("BS_delete_member", new SqlConnection(GetConnectionString()));

                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add(new SqlParameter("@MemberNo", txt_MemberNo.Text));
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                //System.Diagnostics.Debug.WriteLine("@v_user===>" + v_user + " v_MemberNo=" + v_MemberNo);
                
                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                GridView1.DataBind();
                btnEditPnl.Enabled = false;
                
                Editing.Visible = false;
                pnlEditingData.Visible = false;
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
            btnSaveNAddNew.Enabled = false;
            btnDelete.Enabled = false;
            Editing.Visible = false;
            pnlEditingData.Visible = false;
            txtMemberNoSrch.Text = txt_MemberNo.Text;
            GridView1.Visible = true;
            GridView1.DataBind();
            pnlDisplayImportData.Visible = false;

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
            ListView1.Visible = true;
            pnlDisplayImportData.Visible = true;
        }
        protected void btnRptViewHide_Click(object sender, EventArgs e)
        {

        }

        protected void writeTextFile() {
            Int64 x;
            String path;

            try
            {
                //Open the File
                path = Server.MapPath("~/Test1.txt");
                System.Diagnostics.Debug.WriteLine("path =====>" + path);
                StreamWriter sw = new StreamWriter(path, true, Encoding.ASCII);

                //Writeout the numbers 1 to 10 on the same line.
                for (x = 0; x < 10; x++)
                {
                    sw.Write(x);
                }

                //close the file
                sw.Close();
                sw.Dispose();
            }
            catch (Exception e)
            {
                //Console.WriteLine("Exception: " + e.Message);
                System.Diagnostics.Debug.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                //Console.WriteLine("Executing finally block.");
                System.Diagnostics.Debug.WriteLine("Executing finally block.");
            }
        }

        protected void readTextFile() {
            String line;
            String path;
            try
            {
                path = Server.MapPath("~/Sample.txt");
                System.Diagnostics.Debug.WriteLine("path =====>" + path);

                //Example 1--------------------------------------------------------------------------------
                if (!File.Exists(path))
                {
                    System.Diagnostics.Debug.WriteLine("{0} does not exist.", path);
                    return;
                }
                //Pass the file path and file name to the StreamReader constructor
                StreamReader sr = new StreamReader(path);

                //Read the first line of text
                line = sr.ReadLine();
                
                //Continue to read until you reach end of file
                System.Diagnostics.Debug.WriteLine("Example 1 ----- Continue to read until you reach end of file.");
                while (line != null)
                {
                    //write the lie to console window
                    //Console.WriteLine(line);
                    System.Diagnostics.Debug.WriteLine("line=" + line);
                    //Read the next line
                    line = sr.ReadLine();
                }

                //close the file
                sr.Close();
                sr.Dispose();
                //Console.ReadLine();
                //----------------------------------------------------------------------------------------

                //Example 2--------------------------------------------------------------------------------
                // Open a stream and read it back. 
                System.Diagnostics.Debug.WriteLine("Example 2 ----- Open a stream and read it back.");
                using (FileStream fs = File.OpenRead(path))
                {
                    byte[] b = new byte[1024];
                    UTF8Encoding temp = new UTF8Encoding(true);
                    while (fs.Read(b, 0, b.Length) > 0)
                    {
                        Console.WriteLine(temp.GetString(b));
                        System.Diagnostics.Debug.WriteLine("line="+temp.GetString(b));
                    }
                }
                //----------------------------------------------------------------------------------------
            }
            catch (Exception e)
            {
                //Console.WriteLine("Exception: " + e.Message);
                System.Diagnostics.Debug.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                //Console.WriteLine("Executing finally block.");
                System.Diagnostics.Debug.WriteLine("Executing finally block.");
            }
        }
        protected void ReadXMLFile()
        {
            XmlReader xReader = XmlReader.Create(Server.MapPath("~/TernTenders.xml"));
            while (xReader.Read())
            {
                switch (xReader.NodeType)
                {
                    case XmlNodeType.Element:
                        ListBox1.Items.Add("<" + xReader.Name + ">");
                        break;
                    case XmlNodeType.Text:
                        ListBox1.Items.Add(xReader.Value);
                        break;
                    case XmlNodeType.EndElement:
                        ListBox1.Items.Add("</" + xReader.Name + ">");
                        break;
                } // end of switch  
            } //end of while  
            xReader.Close();
            xReader.Dispose();
        } //end of button click event  


        protected void btnWriteTxt_Click(object sender, EventArgs e)
        {
            writeTextFile();
        }
        protected void btnReadTxt_Click(object sender, EventArgs e)
        {
            readTextFile();
        }
        protected void btnReadXML_Click(object sender, EventArgs e)
        {
            ReadXMLFile();
        }

        protected void btnGenRpt_Click(object sender, EventArgs e)
        {
            String errMessage;
            try
            {

                if (lblReportName.Text == "Registered Members Report")
                {
                    //rvPaySlip_001.LocalReport.ReportPath = "Reports/rptPaySlip_001.rdlc";
                    //rvPaySlip_001.LocalReport.Refresh();
                }
                else if (lblReportName.Text == "Member Statement Report")
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
        protected void ReportsMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            String menuSelected = ReportsMenu.SelectedValue.ToString();
            if (String.IsNullOrEmpty(menuSelected) || menuSelected=="Reports") {
                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
                GridView1.Visible = true;
                pnlDisplayAllRecs.Visible = true;
                pnlDisplayImportData.Visible = false;
                pnlReports.Visible = false;
            }
            else { 
                //clearCtrls();
                btnAdd.Enabled = false;
                btnSave.Enabled = false;
                btnSaveNAddNew.Enabled = false;
                btnDelete.Enabled = false;
                Editing.Visible = false;
                pnlEditingData.Visible = false;
                GridView1.Visible = false;
                pnlDisplayAllRecs.Visible = false;
                pnlDisplayImportData.Visible = false;
                pnlReports.Visible = true;

                lblReportName.Text = menuSelected;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','" + menuSelected + "');", true);
            }
        }



    }
}