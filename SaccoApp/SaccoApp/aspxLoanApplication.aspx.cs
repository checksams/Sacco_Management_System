using System;
using System.Collections.Generic;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void ReportsMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            String menuSelected = ReportsMenu.SelectedValue.ToString();
            if (String.IsNullOrEmpty(menuSelected) || menuSelected == "Reports")
            {
                btnAdd.Enabled = true;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                //Editing.Visible = false;
                //pnlEditingData.Visible = false;
                //pnlDisplayImportData.Visible = false;
                //pnlReports.Visible = false;
            }
            else
            {
                btnAdd.Enabled = false;
                btnSave.Enabled = false;
                btnDelete.Enabled = false;
                //Editing.Visible = false;
                //pnlEditingData.Visible = false;
                //pnlDisplayImportData.Visible = false;
                //pnlReports.Visible = true;

                //lblReportName.Text = menuSelected;
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','" + menuSelected + "');", true);
            }
        }

        protected void GridView1_ItemCommand(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process btn clicked');", true);
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Info.','Process button clicked');", true);
            String errMessage;
            String v_user;
            try
            {
                /*
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
                */

            }
            catch (Exception ex)
            {
                errMessage = ex.Message.ToString();
                errMessage = errMessage.ToString().Replace("'", "");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "MyJavaFunction('Error.','" + errMessage + "');", true);
                System.Diagnostics.Debug.WriteLine("ERROR =====>" + ex.Message + "..\n " + errMessage);


            }
        }




    }
}