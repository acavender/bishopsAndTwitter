# Data notes

The list of bishops and dioceses in Bishops_and_dioceses_all.xlsx was taken from <https://www.usccb.org/about/bishops-and-dioceses/all-dioceses>. Last accessed: 8 July 2023. The information is correct as of that date.

Information on followers, tweets, following, and cost to download in Twitter_bishops.xlsx taken from <exportdata.io> on 8 July 2023.

Archbishop Andrew Bellisario originally appeared twice. I removed him from the dataset in his capacity as Apostolic Administrator of Fairbanks and kept him as Archbishop of Anchorage-Juneau. (This was done in all spreadsheets: Bishops_and_dioceses_all.xlsx, Bishops_and_dioceses_Roman.xlsx, and Twitter_bishops.xlsx.)

## July 10, 2023

I downloaded county-level election returns from Harvard's Dataverse <dataverse.harvard.edu>: <https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ>. Citation: MIT Election Data and Science Lab, 2018, "County Presidential Election Returns 2000-2020", <https://doi.org/10.7910/DVN/VOQCHQ>, Harvard Dataverse, V11, UNF:6:HaZ8GWG8D2abLleXN3uEig== [fileUNF].

## July 15, 2023

Downloaded all-geocodes-v2020.xlsx from <https://www.census.gov/geographies/reference-files/2020/demo/popest/2020-fips.html>.

I don't seem able to match districts to counties in Alaska, so I may want to look only at the lower 48. If I recall correctly, the bishops in Alaska, Hawaii, and the Virgin Islands aren't really engaged on Twitter, anyway.

## Data cleaning process

- Download county-level election returns for 2000-2020 as noted above.
- Since I want to focus on the lower 48 states, remove Alaska and Hawaii from the dataset.
- Since I'm only interested in the two major parties, remove third parties from the dataset.
- Re-organize data in a new spreadsheet so that I have the data in my preferred columns.
- Some Georgia and Virginia counties were broken out by type of voting as well as by party and year, so I needed to aggregate those for analysis.
  
### Added on July 28

  The above note regarding Georgia and Virginia counties is actually true of counties in 11 states:

  1. Arizona
  2. Arkansas
  3. Georgia
  4. Iowa
  5. Kentucky (It turns out Kentucky didn't actually report by vote type. For some reason, they called what they called "TOTAL" in other years "ELECTION DAY.")
  6. Maryland
  7. North Carolina
  8. Oklahoma
  9. South Carolina
  10. Utah
  11. Virginia

Fortunately, those states only broke out reports by type in 2020. For all other years, they simply reported by candidate for each county.

I used a pivot table to see what the correct totals (by party) should be for counties in each of those states.

## August 4, 2023

When I plugged data into Tableau, I found the following four geographical locations that couldn't be matched. I did with them as indicated in the table below:

| Location          | Solution                                                                                                    |
| ----------------- | ----------------------------------------------------------------------------------------------------------- |
| Federal precinct  | This is in Rhode Island. Removed from the data set because it isn't a county.                               |
| Maine UOCAVA      | These are uniformed service and overseas voters. Removed from the data set because they aren't in a county. |
| Statewide writein | This is in Connecticut. Removed from the dataset because it isn't a county.                                 |
| Kansas City       | This is in Missouri. I don't know why this was separated out. Since KC is in Jackson County, I added these numbers to that county's total.                                                                                                            |
