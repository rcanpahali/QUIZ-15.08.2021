import React from 'react'
import StaffListComponent from '../components/hr/staff-list'

const Home = props => (

    <div className="col-lg-10 col-md-9 mx-auto">
        <h1 className="fw-light">Hipotez Konsept</h1>
        <p className="lead text-muted">
            İnsan Kaynakları departmanı olarak senin desteğine ihtiyacımız var!
            Çalışanlarımızın sitemizde listeleneceği bir sayfa geliştirmeye çalışıyoruz.
            En büyük değerimiz olan çalışanlarımızı gururla listeleyeceğimiz bu sayfayı en güncel teknolojileri kullanarak geliştirmeni rica ediyoruz.
        </p>
        <StaffListComponent />
    </div>

)


export default Home