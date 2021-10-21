--Among the officer allegations with complaints filed in the low neighborhood, what are the final outcomes?
SELECT COUNT(*), data_officerallegation.final_outcome
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000
GROUP BY data_officerallegation.final_outcome;

--Among the officer allegations with complaints filed in the middle neighborhood, what are the final outcomes?
SELECT COUNT(*), data_officerallegation.final_outcome
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
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000
GROUP BY data_officerallegation.final_outcome;

--Among the officer allegations with complaints filed in the high neighborhood, what are the final outcomes?
SELECT COUNT(*), data_officerallegation.final_outcome
FROM data_area,
    data_allegation,
    data_allegation_areas,
    data_officerallegation
where data_area.median_income is not null
  and data_allegation_areas.area_id = data_area.id
  and data_allegation_areas.allegation_id = data_allegation.crid
  and data_allegation.crid = data_officerallegation.allegation_id
  and data_allegation.is_officer_complaint = true
  and cast(replace(substring(data_area.median_income, 2), ',', '') as int) > 75000
GROUP BY data_officerallegation.final_outcome;