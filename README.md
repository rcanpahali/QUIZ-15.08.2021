# KKTCELL QUIZ - Kurulum Adımları

Ekteki adımları takip ederek kurulumu gerçekleştirebilirsiniz.

## 1. React Front-End Uygulamasının Kurulumu

Projenin kök dizinine (kktcell-react-frontend) PowerShell veya Command Prop kullanarak navigate olunuz, ve gerekli modülleri install ediniz.

```bash
npm install
```
Projenin kök dizininde bulunan environment variable'ları ".env.local" dosyasından görüntüleyebilirsiniz. REACT_APP_API_URL değişkeni, NodeJS Back-End portunu belirleyen değişlendir.

```javascript
PORT=3000
REACT_APP_ENV="development"
REACT_APP_API_URL="http://localhost:4000/"
```
Aşağıdaki komut yardımı ile kktcell-react-frontend projesini başlatınız.

```bash
npm start
```

## 2. NodeJS Back-End Uygulamasının Kurulumu

Projenin klasörüne (kktcell-express-backend) PowerShell veya Command Prop penceresi kullanarak navigate olunuz, ve gerekli modülleri install ediniz.

```bash
npm install
```

Aşağıdaki komut yardımı ile kktcell-react-frontend projesini başlatınız.

```bash
npm start
```

Uygulama localhost:4000 portu üzerinden yayınlanmaktadır. Örnek servis call aşağıdadır, tarayıcınızdan aşağıdaki URL'e giderek test edebilirsiniz.

```bash
http://localhost:4000/hr/GetStaffList
```
## 3. SOAP Back-End Servisi Kurulumu

Projenin klasörüne (kktcell-soap-backend) giriniz, KKTCELL-SOAP-BACKEND.sln isimli solution'ı Visual Studio 2017/2019 uygulaması ile açınız. Database configuration işlemini, solution içerisinde root seviyede bulunan Web.config dosyasını düzenleyerek gerçekleştiriniz.

Web.config dosyası içerisinde "***" ile belirtilen alanlara, kendi ORACLE sunucunuzun tanımlamalarını yazınız.

```xml
  <connectionStrings>
    <add name="ORACLE"
         connectionString="Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=***)(PORT=***)))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=***)));User Id=***;Password=***;"
         providerName="Oracle.DataAccess.Client"/>
  </connectionStrings>
```
Uygulama localhost:5000 portu üzerinden yayınlanmaktadır. Örnek servis call aşağıdadır, tarayıcınızdan aşağıdaki URL'e giderek soap servisi invoke edebilirsiniz.

```bash
http://localhost:5000/Services/HrService.asmx
```

Eğer uygulama localhost:5000 üzerinden çalışmazsa hatalar meydana gelecektir, uygulamaya port tanımlama işlemini; KKTCELL-SOAP-BACKEND projesine sağ click > Properties > Web > Project Url > "http://localhost:5000/" yazdıktan sonra Virtual Directory tanımlayarak gerçekleştirebilirsiniz.

http://localhost:5000/ adresi tarayıcıda render edilecek şekilde configure edilmemiştir, direkt yukarıda belirtilen .ASMX sayfasına gidebilirsiniz.

## 4. Database Kurulumu

Database operasyonlarına ait DDL'leri "Database Seeder" klasöründen yukarıdan aşağıya sıralı bir şekilde çalıştırabilirsiniz.


## License
[MIT](https://choosealicense.com/licenses/mit/)