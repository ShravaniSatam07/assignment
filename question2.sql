--Which industry in the organization has the highest renewal rate?
SELECT TOP 1 industry , count(renewed) as number_of_renewal from industry_client_details
INNER JOIN subscription_information
ON industry_client_details.client_id =subscription_information.client_id
where renewed= 1 
group by industry
order by  number_of_renewal desc;

--Have imported iindustry_client_details.csv and subscription_information.cvs with the same table name in dbo schema.
--have applied inner join between the two table to get the clients that are common in both the table
--for nenwed true is taken as 1 and false is taken as 0
--the qbove query gives the topmost industry for which there was maximum nenewals.