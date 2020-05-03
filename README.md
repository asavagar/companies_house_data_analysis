We analyse Companies House data on ["basic company data"](http://download.companieshouse.gov.uk/en_output.html).

The main purpose is to present a chart of daily company incorporations, see `new_incorp_barplot.pdf`, or below:

![daily incorps graph](new_incorp_barplot.png "new_incorp_barplot.png")

This can be compared to daily policy interventions. 
 
### Covid-19 Policy Timeline
1. Mon 16 March -- Non-essential travel prohibited
2. Fri 20 March -- Pubs etc. closed
3. Mon 23 March -- Lockdown

The number of new incorporations decline sharply after the third week of March (week ending Fri 20th March), which is when lockdown measures were implemented strictly. 

Before and after the lockdown is implemented, the daily median goes from 2,664 to 2,070 incorporations per day. This is a fall in business creation of 22%. This is much less than comparable figures for the US. 

John Haltiwanger (US Census Bureau) shows a 42% decline in new business applications in the US for the week ending March 28 relative to the same week in 2019 (available [here](http://econweb.umd.edu/~haltiwan/first_look.pdf)). They use [BFS data](https://www.census.gov/data/experimental-data-products/weekly-business-formation-statistics.html), which allows them to focus on _business applications with planned wages_. This is an important distinction because it identifies "genuine" firms as opposed to entities created for accountancy purposes such as tax and restructuring reasons. Our data does not provide this distinction so we focus on all business incorporations regardless of their intended purpose.

## Data
The full data file in `.csv` format can be found here: [http://download.companieshouse.gov.uk/en_output.html](http://download.companieshouse.gov.uk/en_output.html).

This data reports basic company data of live companies on the register. It is the full companies register for the UK. Inactive companies are periodically removed. Therefore the register is informative about new incorporations for the recent past. It is less informative further back. This is because when companies are removed from the register so is their incorporation date. 

Historical data is available from the Companies House website:

  1. Companies House quarterly publication on [Incorporated Companies in the UK](https://www.gov.uk/search/research-and-statistics?content_store_document_type=published_statistics&keywords=Incorporated&organisations%5B%5D=companies-house&public_timestamp%5Bfrom%5D=&public_timestamp%5Bto%5D=)
  
  
  2. Latest statistical release _Incorporated Companies in the UK October to December 2019_ :
  https://www.gov.uk/government/statistics/incorporated-companies-in-the-uk-october-to-december-2019

## Code

* The basic company data file (_i.e._ the company register) is ~2GB so `00-read.R` reads in necessary variables and saves as a smaller `.csv`.

* `02_tidyanalyze.R` produces the output `new_incorp_barplot.pdf`.
