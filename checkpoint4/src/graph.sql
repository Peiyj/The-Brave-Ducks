SELECT da1.officer_id src, da2.officer_id dst, COUNT(DISTINCT da1.allegation_id) relationship
FROM data_officerallegation da1,
     data_officerallegation da2,
     data_allegationcategory dcat
WHERE da1.allegation_id = da2.allegation_id
  AND da1.allegation_category_id = dcat.id
  AND da1.officer_id < da2.officer_id
  AND (dcat.category like 'Illegal Search' or dcat.category like 'Use Of Force')
GROUP BY da1.officer_id, da2.officer_id
ORDER BY count(*) DESC;

SELECT da.officer_id id, first_name || ' ' || last_name officer_name, COUNT(DISTINCT da.allegation_id) misconduct_count
FROM
     data_officerallegation da,
     data_officer doff,
     data_allegationcategory dcat
WHERE da.allegation_category_id = dcat.id
  AND doff.id = da.officer_id
  AND (dcat.category like 'Illegal Search' or dcat.category like 'Use Of Force')
GROUP BY da.officer_id, officer_name;