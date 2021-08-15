namespace KKTCELL_SOAP_BACKEND.Models.HR
{
    public class StaffModel
    {
        public int StaffId { get; set; }
        public string StaffName { get; set; }
        public string StaffSurname { get; set; }
        public string StaffDepartment { get; set; }
        public string CurrentPositionName { get; set; }
        public string PreviousPositionName { get; set; }
        public string ManagerName { get; set; }
        public string StaffLocation { get; set; }
    }
}
