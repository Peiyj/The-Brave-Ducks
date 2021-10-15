--What is the percentage of misconduct allegations (illegal search, use of force etc) out of all allegations for these low income neighborhoods?
SELECT CAST(SUM(case
                    when data_allegationcategory.category like 'Use Of Force' or
                         data_allegationcategory.category like 'Illegal Search' then 1
                    else 0 end) AS FLOAT) /
       COUNT(*) AS misconductPercentage
FROM data_area,
     data_allegation,
     data_allegation_areas,
     data_allegationcategory
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.most_common_category_id = data_allegationcategory.id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;


--What is the percentage of misconduct allegations (illegal search, use of force etc) out of all allegations for these middle income neighborhoods?
SELECT CAST(SUM(case
                    when data_allegationcategory.category like 'Use Of Force' or
                         data_allegationcategory.category like 'Illegal Search' then 1
                    else 0 end) AS FLOAT) /
       COUNT(*) AS misconductPercentage
FROM data_area,
     data_allegation,
     data_allegation_areas,
     data_allegationcategory
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.most_common_category_id = data_allegationcategory.id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--What is the percentage of misconduct allegations (illegal search, use of force etc) out of all allegations for these high income neighborhoods?
SELECT CAST(SUM(case
                    when data_allegationcategory.category like 'Use Of Force' or
                         data_allegationcategory.category like 'Illegal Search' then 1
                    else 0 end) AS FLOAT) /
       COUNT(*) AS misconductPercentage
FROM data_area,
     data_allegation,
     data_allegation_areas,
     data_allegationcategory
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.most_common_category_id = data_allegationcategory.id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;