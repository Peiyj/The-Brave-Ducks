--What is the rate of increase for officer complaints for low income neighborhoods between 2002-2007 and 2007-2012 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2002.01.01' and data_allegation.incident_date < '2006.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2007.01.01' and
                                                         data_allegation.incident_date < '2011.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;

--What is the rate of increase for officer complaints for low income neighborhoods between 2007-2012 and 2012-2017 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2007.01.01' and data_allegation.incident_date < '2011.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2012.01.01' and
                                                         data_allegation.incident_date < '2016.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;

--What is the rate of increase for officer complaints for middle income neighborhoods between 2002-2007 and 2007-2012 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2002.01.01' and data_allegation.incident_date < '2006.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2007.01.01' and
                                                         data_allegation.incident_date < '2011.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--What is the rate of increase for officer complaints for middle income neighborhoods between 2007-2012 and 2012-2017 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2007.01.01' and data_allegation.incident_date < '2011.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2012.01.01' and
                                                         data_allegation.incident_date < '2016.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--What is the rate of increase for officer complaints for high income neighborhoods between 2002-2007 and 2007-2012 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2002.01.01' and data_allegation.incident_date < '2006.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2007.01.01' and
                                                         data_allegation.incident_date < '2011.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;

--What is the rate of increase for officer complaints for high income neighborhoods between 2007-2012 and 2012-2017 timeframes? 
SELECT CAST(SUM(case
                    when data_allegation.incident_date > '2007.01.01' and data_allegation.incident_date < '2011.12.31'
                        then 1
                    else 0 end) AS float) / SUM(case
                                                    when data_allegation.incident_date > '2012.01.01' and
                                                         data_allegation.incident_date < '2016.12.31' then 1
                                                    else 0 end) AS percentageIncrease
FROM data_area,
     data_allegation,
     data_allegation_areas
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;