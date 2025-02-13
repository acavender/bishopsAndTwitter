SELECT year, state, county_name as county, candidate, party, candidatevotes, totalvotes, round((candidatevotes/totalvotes*100),2) AS percentvote FROM electionResults.countyResults
WHERE party = "DEMOCRAT" OR party = "REPUBLICAN"
order by state, county, year
