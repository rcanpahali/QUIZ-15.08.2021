## Data Seeder Kurulum Adımları

Dosyaları aşağıdaki sıralama ile Oracle Database tarafında (PL/SQL Editor, TOAD vb. bir editör ile) çalıştırınız.

```bash
1. STAFF.sql
2. POSITION.sql
3. STAFF_POSITION_HISTORY.sql
4. F_GET_STAFF_LIST.sql
```

Tüm DDL'ler başarıyla aktarıldıktan sonra aşağıdaki sorgu yardımı ile kontrol edebilirsiniz. Aşağıdaki sorgudan toplam 4 adet kayıt dönmesi gerekmektedir.

```sql
SELECT * FROM TABLE(F_GET_STAFF_LIST);
```

Tablo yapılarının görselleştirilmiş hallerine "Ekran Görüntüleri" klasöründen ulaşabilirsiniz.