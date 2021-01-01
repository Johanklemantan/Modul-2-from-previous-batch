SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

-- NO 1.1
SELECT ci.ID,ci.Name,co.Code,ci.District,ci.Population
FROM country co
JOIN city ci
ON ci.CountryCode=co.Code
WHERE co.Code = 'IDN'
ORDER BY ci.Population DESC
LIMIT 10;

-- NO 1.2
SELECT ci.ID, ci.Name,ci.District,co.Name AS negara,ci.Population
FROM country co
JOIN city ci
ON ci.CountryCode=co.Code
ORDER BY ci.Population DESC
LIMIT 10;

-- NO 1.3
SELECT Code,Name,Continent,Region,IndepYear AS tahun_merdeka
FROM country
WHERE IndepYear IS NOT NULL
ORDER BY tahun_merdeka
LIMIT 10;

-- NO 1.4
SELECT Continent AS Benua, COUNT(Name) AS Jumlah_Negara, SUM(Population) AS Populasi, AVG(LifeExpectancy) AS Rata_AngkaHrpnHdp
FROM country
GROUP BY Continent
HAVING Jumlah_Negara > 10 
ORDER BY Populasi DESC;

-- NO 1.5
SELECT Name AS Nama, Continent AS Benua, LifeExpectancy AS AngkaHarapanHidup, GNP
FROM country
WHERE Continent = 'Asia'
AND LifeExpectancy > (SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Europe')
ORDER BY AngkaHarapanHidup DESC;

-- NO 1.6
SELECT cl.CountryCode, co.Name, cl.Language, cl.IsOfficial,cl.Percentage
FROM countrylanguage cl
JOIN country co
ON co.Code = cl.CountryCode
WHERE Language = 'English' AND IsOfficial = 'T'
ORDER BY Percentage DESC
LIMIT 10;

-- NO 1.7
SELECT co.Name AS Negara_ASEAN, co.Population AS Populasi_Negara, co.GNP, ci.Name AS IbuKota, ci.Population AS Populasi_Ibukota
FROM country co
JOIN city ci
ON ci.CountryCode = co.Code
WHERE ci.Name IN ('Bandar Seri Begawan','Phnom Penh','Dili','Jakarta','Vientiane','Kuala Lumpur','Rangoon (Yangon)','Manila','Singapore','Bangkok','Hanoi')
ORDER BY Negara_ASEAN ASC;

-- NO 1.8
SELECT co.Name AS Negara_G20, co.Population AS Populasi_Negara, co.GNP, ci.Name AS IbuKota, ci.Population AS Populasi_Ibukota
FROM country co
JOIN city ci
ON ci.CountryCode = co.Code
WHERE ci.Name IN ('Buenos Aires','Canberra','BrasÃ­lia','Ottawa','Peking','Paris','Berlin','New Dehli','Jakarta','Tokyo','Ciudad de MÃ©xico','Moscow','Riyadh','Pretoria','Seoul','Ankara','London','Washington')
ORDER BY Negara_G20 ASC;

-- NO 2.4
SELECT co.Name AS Negara_ASEAN, co.SurfaceArea
FROM country co
JOIN city ci
ON ci.CountryCode = co.Code
WHERE ci.Name IN ('Bandar Seri Begawan','Phnom Penh','Dili','Jakarta','Vientiane','Kuala Lumpur','Rangoon (Yangon)','Manila','Singapore','Bangkok','Hanoi')
ORDER BY Negara_ASEAN ASC;
