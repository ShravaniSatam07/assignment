--How many finance lending and blockchain clients does the organization have?

SELECT industry , COUNT (client_id) as number_of_client FROM industry_client_details
WHERE industry in('finance lending' ,'block chain')
GROUP BY industry;

--Have imported the industry_client_detais.csv using task-> importflat file -> given the same name to the table as csv and the table is created with dbo schema.
--above query gives the number of finance lending and blockchain clients for the organization . the number is given individually for finance lending and block chain.