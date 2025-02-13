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

## November 28, 2023

I've been playing with data in Tableau over the last few weeks. I was having difficulty with missing counties and the like.

So I made the decision to keep the data about bishops and their number of Tweets, but started over with county election data and the list of counties in each Roman Catholic diocese.

I downloaded election data from [Harvard's MIT Election Data and Science Lab](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ). The citation:

> MIT Election Data and Science Lab, 2018, "County Presidential Election Returns 2000-2020", [https://doi.org/10.7910/DVN/VOQCHQ](https://doi.org/10.7910/DVN/VOQCHQ), Harvard Dataverse, V11, UNF:6:HaZ8GWG8D2abLleXN3uEig== [fileUNF]
>
I made a copy of the dataset, then removed Alaska and Hawaii. I also created a pivot table enabling me to see election results (and votes per candidate) for each county and year.

I also downloaded a fresh copy of the counties_by_diocese.csv file from [kburchfiel](https://github.com/kburchfiel/us_diocese_mapper).

I made a copy of *that* dataset, removing all dioceses that aren't in the Lower 48. (So I removed Alaska, Hawaii, and the Virgin Islands.) I also corrected "DoÃ±a Ana" and "DoÃ±a Ana County" to "Doña Ana" and "Doña Ana County."

I also figured out how to create groups so that I can see the dioceses without the underlying county lines. That took a little bit. Of course, I have to do it diocese by diocese, which is a little slow! But it works.

## February 4, 2025

Since Connecticut has switched from counties to planning regions, I could not get my map to display correctly in Tableau. I downloaded a 2020 shape file of counties from <https://www.census.gov/cgi-bin/geo/shapefiles/index.php>. I had to do that using the Wayback Machine, because when I tried to download directly from the site, all attempts to download threw a 403 error.

## February 6, 2025

Tried to download the 2020 cartographic boundary file  from <https://www.census.gov/geographies/mapping-files/time-series/geo/cartographic-boundary.2020.html#list-tab-1883739534>. (And was able to do it — I didn't have to resort to using the Wayback Machine.)

From that page, I downloaded the following file: <https://www2.census.gov/geo/tiger/GENZ2020/shp/cb_2020_us_all_500k.zip>.

I extracted that .zip file. Inside were additional .zip files. Since I wanted county data, I chose cb_2020_us_county_500k.zip. I extracted that file, and from it I chose cb_2020_us_county_500k.shp, which I connected to Tableau. That gave me a good map of U.S. counties, without extending county boundaries out into the Great Lakes.

In Tableau, I also added original_counties_by_diocese.csv as a data source. I then set up a relationship between the two files, after making sure data types matched: Countyns (from the CSV file) = COUNTYNS (from the shape file).

In a Tableau worksheet, I then set up a hierarchy using data from the table pulled from the shape file: State Name, County Name (renamed from Name). I used that hierarchy to plot a map of counties, then dragged Diocese (from the table pulled from the CSV file) on to Color in the Marks shelf.

That gave me a lovely map of U.S. counties, color-coded by diocese.

Then, using Option 3 described on this help page: [Create Territories on a Map](https://help.tableau.com/current/pro/desktop/en-us/maps_custom_territories.htm), I gave Diocese a geographic role based on county. I was then able to remove all items from the shelf except for Diocese and COLLECT([Geometry]) (if I removed the latter, Connecticut got messed up again).

I then went to the color marks card and selected Border: None. That removed the county lines, leaving me with a lovely color-coded map of the dioceses, without county lines. Helpfully, hovering over county lines *does* show the individual counties. For visual clarity, I manually changed the colors for adjoining dioceses to which Tableau had assigned the same color.

Because I used the shape file, Connecticut counties and dioceses appear correctly; there are no odd gaps in the map.

## February 13, 2025

Built an initial election results map.

Tried to find demographic religious data by county, but couldn't do that yet.
