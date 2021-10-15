--Using our definition of types of “income neighborhood", what is the total number of officer allegations for all low income neighbors?
SELECT count(*)
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
WHERE median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000;

--What is the total number of officer allegations for all middle income neighbors?
SELECT COUNT(*)
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 30000
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;

--What is the total number of officer allegations for all high income neighbors?
SELECT COUNT(*)
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000;