--Number of people living in low income neighborhoods
SELECT sum(data_racepopulation.count) AS population
FROM data_area,
     data_racepopulation
WHERE data_area.median_income is not null
  and data_area.id = data_racepopulation.area_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;

--Number of people living in middle income neighborhoods
SELECT sum(data_racepopulation.count) AS population
FROM data_area,
     data_racepopulation
WHERE data_area.median_income is not null
  and data_area.id = data_racepopulation.area_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--Number of people living in high income neighborhoods
SELECT sum(data_racepopulation.count) AS population
FROM data_area,
     data_racepopulation
WHERE data_area.median_income is not null
  and data_area.id = data_racepopulation.area_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;