-- generate complainants for each allegation in upper, middle, low income neighborhoods
SELECT data_complainant.allegation_id as crid,
       data_complainant.race,
       data_complainant.gender,
       CASE
           WHEN cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000 THEN 'Low'
           WHEN cast(replace(substring(data_area.median_income, 2), ',', '') as int) >= 30000 AND
                cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000 THEN 'Middle'
           ELSE 'High'
       END AS neighborhood_income_level
FROM data_complainant,
     data_allegation,
     data_officerallegation,
     data_area,
     data_allegation_areas
WHERE data_complainant.allegation_id = data_allegation.crid
    AND data_allegation.crid = data_officerallegation.allegation_id
    AND data_allegation_areas.area_id = data_area.id
    AND data_allegation_areas.allegation_id = data_allegation.crid;

-- generate allegations.csv
SELECT data_allegation.crid,
       data_allegation.summary,
       data_officerallegation.disciplined,
       data_officer.id as officer_id,
       data_allegationcategory.category,
       data_officer.race,
       data_officer.gender,
       data_allegation.location as district_name
FROM data_officerallegation, data_officer, data_allegation, data_allegationcategory
WHERE data_officerallegation.allegation_id = data_allegation.crid
      AND data_officer.id = data_officerallegation.officer_id
      AND data_allegationcategory.id = data_allegation.most_common_category_id
      AND data_allegation.summary IS NOT NULL
      AND data_allegation.summary NOT LIKE ''
      AND data_officerallegation.disciplined IS NOT NULL
      AND data_allegation.location IS NOT NULL
      AND data_allegation.location NOT LIKE '';

-- low income neighborhood complaints
SELECT data_allegation.cr_text
FROM data_allegation,
     data_area,
     data_allegation_areas
WHERE data_allegation.cr_text IS NOT NULL
  AND data_area.median_income IS NOT NULL
  AND data_allegation.cr_text NOT LIKE '\W*((?i)None Entered(?-i))\W*'
  AND data_allegation_areas.area_id = data_area.id
  AND data_allegation_areas.allegation_id = data_allegation.crid
  AND cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 30000; 

-- middle income neighborhood complaints
SELECT data_allegation.cr_text
FROM data_allegation,
     data_area,
     data_allegation_areas,
     data_officerallegation,
     data_allegationcategory
WHERE data_allegation.cr_text IS NOT NULL
  AND data_area.median_income IS NOT NULL
  AND data_allegation.cr_text NOT LIKE '\W*((?i)None Entered(?-i))\W*'
  AND data_officerallegation.allegation_id = data_allegation.crid
  AND data_allegationcategory.id = data_allegation.most_common_category_id
  AND data_allegation_areas.area_id = data_area.id
  AND data_allegation_areas.allegation_id = data_allegation.crid
  AND cast(replace(substring(data_area.median_income, 2), ',', '') as int) >= 30000
  AND cast(replace(substring(data_area.median_income, 2), ',', '') as int) < 75000;
;

-- high income neighborhood complaints
SELECT data_allegation.cr_text
FROM data_allegation,
     data_area,
     data_allegation_areas,
     data_officerallegation,
     data_allegationcategory
WHERE data_allegation.cr_text IS NOT NULL
  AND data_area.median_income IS NOT NULL
  AND data_allegation.cr_text NOT LIKE '\W*((?i)None Entered(?-i))\W*'
  AND data_officerallegation.allegation_id = data_allegation.crid
  AND data_allegationcategory.id = data_allegation.most_common_category_id
  AND data_allegation_areas.area_id = data_area.id
  AND data_allegation_areas.allegation_id = data_allegation.crid
  AND cast(replace(substring(data_area.median_income, 2), ',', '') as int) >= 75000;

