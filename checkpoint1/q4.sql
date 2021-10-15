--Among the officer allegations with complaints filed in the low income neighborhood, what percentage of the cases are dismissed?
SELECT CAST(SUM(case
                    when data_officerallegation.final_outcome like 'No Action Taken'
                        then 1
                    else 0 end) AS float) / COUNT(*) AS dismissedCases
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;

--Among the officer allegations with complaints filed in the middle income neighborhood, what percentage of the cases are dismissed?
SELECT CAST(SUM(case
                    when data_officerallegation.final_outcome like 'No Action Taken'
                        then 1
                    else 0 end) AS float) / COUNT(*) AS dismissedCases
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--Among the officer allegations with complaints filed in the high income neighborhood, what percentage of the cases are dismissed?
SELECT CAST(SUM(case
                    when data_officerallegation.final_outcome like 'No Action Taken'
                        then 1
                    else 0 end) AS float) / COUNT(*) AS dismissedCases
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;