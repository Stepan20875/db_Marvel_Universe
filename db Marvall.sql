--01 Вывод всех данных:
SELECT * FROM superheroes

--02 Вывод имен героев с белыми волосами и голубыми глазами:
SELECT "name", "eye", "hair"
FROM superheroes
WHERE "eye" = 'Blue Eyes' AND "hair" = 'White Hair'

--03 Проверка гипотезы о героях с красными волосами и зелеными глазами:

SELECT "align", COUNT(*)
FROM superheroes
WHERE "hair" = 'Red Hair' AND "eye" = 'Green Eyes'
GROUP BY "align"

--04 Пять самых часто встречающихся цветов волос среди героинь с голубыми глазами:

SELECT "hair", COUNT(*) AS count
FROM superheroes
WHERE "gender" = 'Female Characters' AND "eye" = 'Blue Eyes'
GROUP BY "hair"
ORDER BY count DESC
LIMIT 5

-- 05 Цвета глаз, встречающиеся только у мужчин, но не у женщин:

SELECT DISTINCT "eye"
FROM superheroes
WHERE "gender" = 'Male Characters'
  AND "eye" NOT IN (SELECT "eye" FROM superheroes WHERE "gender" = 'Female Characters')
  AND "eye" IS NOT NULL