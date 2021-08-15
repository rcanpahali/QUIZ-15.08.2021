using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using KKTCELL_SOAP_BACKEND.Models.HR;
using Oracle.ManagedDataAccess.Client;

namespace KKTCELL_SOAP_BACKEND.Services
{
    /// <summary>
    /// Returns related service calls from Human Resources
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class HrService : WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetStaffList()
        {
            // Staff list will be placed here
            var lst = new List<StaffModel>();
            // Read Oracle connection string from Web.config
            var conString = ConfigurationManager.ConnectionStrings["ORACLE"].ConnectionString;
            //Create oracle connection
            using (var con = new OracleConnection(conString))
            {
                con.Open();
                // Call F_GET_STAFF_LIST from logged in scheme (returns table)
                const string query = "SELECT * FROM TABLE(F_GET_STAFF_LIST)";
                using (var cmd = new OracleCommand(query, con))
                {

                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        // Pass reader values to variables
                        int pStaffId = Convert.ToInt32(reader[0]);
                        string pStaffName = reader[1].ToString().Trim();
                        string pStaffSurname = reader[2].ToString().Trim();
                        string pStaffDepartment = reader[3].ToString().Trim();
                        string pCurrentPositionName = reader[4].ToString().Trim();
                        string pPreviousPositionName = reader[5].ToString().Trim();
                        string pManagerName = reader[6].ToString().Trim();
                        string pStaffLocation = reader[7].ToString().Trim();

                        // Push into the list to return
                        lst.Add(new StaffModel()
                        {
                            StaffId = pStaffId,
                            StaffName = pStaffName,
                            StaffSurname = pStaffSurname,
                            StaffDepartment = pStaffDepartment,
                            CurrentPositionName = pCurrentPositionName,
                            PreviousPositionName = pPreviousPositionName,
                            ManagerName = pManagerName,
                            StaffLocation = pStaffLocation
                        });
                    }

                }
            }

            var res = new JavaScriptSerializer().Serialize(lst);
            return res;
        }
    }
}
