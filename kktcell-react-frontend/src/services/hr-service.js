import { nodeAPI } from "../utils/axiosHeader";

// axios pre-defined header
export const GetStaffList = () =>
    nodeAPI.get("hr/GetStaffList"
    ).then(
        (res) => {
            return JSON.parse(res.data.GetStaffListResult);
        }
    );