-- LİMİT --

-- Kisiler tablosundan ilk 5 veriyi listeleyiniz
select * from kisiler limit 5

--ilk iki veriden sonra 5 veriyi listeleyiniz
select * from kisiler limit 5 OFFSET 2

-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler where id>5 limit 2

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 offset 3


-- IS NULL, IS NOT NULL, COALESCE --
/*
IS NULL ve IS NOT NULL, Boolean operatorleridir. Bİr ifadenin NULL olup olmadığını kontrol eder
COALESCE (Birleştirme) ise bir fonksiyondur ve içerisindeki parametrelerden NULL olmayan ilk ifadeyi döndürür
*/

CREATE TABLE insanlar 
(
    ssn CHAR(9), 
    isim VARCHAR(50), 
    adres VARCHAR(50) 
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

-- isim'i null olanlari sorgula
SELECT * from insanlar where isim is null; 

--null olmayanları listeleyelim
select * from insanlar where isim is not null;

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
UPDATE insanlar 
SET isim = 'NO NAME'
WHERE isim is null;

-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
UPDATE insanlar 
SET isim = null
WHERE isim = 'NO NAME';


--NOT : Çoklu değişimde her değişim için SET .. WHERE isim IS NULL gibi 
--ifade yazmamak için COALESCE(Birleştirme) kullanılır.

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/



UPDATE insanlar
SET isim = coalesce (isim, 'HENUZ ADRES GİRİLMEDİ'),
    adres = coalesce (adres, 'HENUZ ADRES GİRİLMEDİ'),
	ssn = coalesce (ssn, 'NO SSN');
------ Bu kullanım sadece NULL olanlara özeldir-----
select * from insanlar;
