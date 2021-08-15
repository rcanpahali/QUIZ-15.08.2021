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
            var lst = new List<StaffModel>();
            var conString = ConfigurationManager.ConnectionStrings["ORACLE"].ConnectionString;
            using (var con = new OracleConnection(conString))
            {
                con.Open();
                const string query = "SELECT * FROM TABLE(F_GET_STAFF_LIST)";
                using (var cmd = new OracleCommand(query, con))
                {

                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {

                        int pStaffId = Convert.ToInt32(reader[0]);
                        string pStaffName = reader[1].ToString().Trim();
                        string pStaffSurname = reader[2].ToString().Trim();
                        string pStaffDepartment = reader[3].ToString().Trim();
                        string pCurrentPositionName = reader[4].ToString().Trim();
                        string pPreviousPositionName = reader[5].ToString().Trim();
                        string pManagerName = reader[6].ToString().Trim();
                        string pStaffLocation = reader[7].ToString().Trim();

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
