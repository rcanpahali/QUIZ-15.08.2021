import React, { useEffect, useState } from 'react'
import { GetStaffList } from '../../../../services/hr-service';

const StaffListComponent = () => {

    const [staffListings, setStaffListings] = useState([]); // personel list object
    const [initialized, setInitialized] = useState(false); // page initialized state

    useEffect(() => {
        if (!initialized) {
            GetStaffListings();
            setInitialized(true);
        }
    }, []);

    // async request from hr-services
    const GetStaffListings = async () => {
        setStaffListings([]);
        try {
            const response = await GetStaffList();
            setStaffListings(response);
            console.log(staffListings)
        } catch (ex) {
            setInitialized(true);
            console.log(ex);
        }
    };

    return (<>
        <button onClick={() => GetStaffListings()} className="btn btn-primary my-2">Listeyi Getir</button>
        <h1 className="fw-light">Personel Listesi</h1>
        <hr />
        <table className="table table-dark">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Personel Adı</th>
                    <th scope="col">Departman</th>
                    <th scope="col">Pozisyon</th>
                    <th scope="col">Önceki Pozisyon</th>
                    <th scope="col">Şehir</th>
                    <th scope="col">Yönetici Adı</th>
                </tr>
            </thead>
            <tbody>
                {staffListings.length > 0 ? staffListings.map((s, i) => (
                    <tr key={s.StaffId}>
                        <th scope="row">{s.StaffId}</th>
                        <td>{s.StaffName} {s.StaffSurname} </td>
                        <td>{s.StaffDepartment}</td>
                        <td>{s.CurrentPositionName}</td>
                        <td>{s.PreviousPositionName}</td>
                        <td>{s.StaffLocation}</td>
                        <td>{s.ManagerName}</td>
                    </tr>)) :
                    <tr>
                        <td colSpan="7" align="center   ">
                            <h2>Yükleniyor...</h2>
                        </td>
                    </tr>
                }
            </tbody>
        </table>
    </>)
}

export default StaffListComponent
