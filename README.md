# companies_house_data_analysis
I analyse Companies House data on _"basic company data"_. 

The main purpose is to present a chart of daily company incorporations, see `new_incorp_barplot.pdf`. This can be compared to daily policy interventions. 

### Covid timeline
1. Mon 16 March -- Non-essential travel prohibited
2. Fri 20 March -- Pubs etc. closed
3. Mon 23 March -- Lockdown


## Data
The full data file in `.csv` format can be found here: http://download.companieshouse.gov.uk/en_output.html

This data reports basic company data of live companies on the register. It is the full companies register for the UK. Inactive companies are periodically removed. Therefore the register is informative about new incorporations for the recent past. It is less informative further back as companies are removed from the register and so is their incorporation date disappears from the dataset. However historical data is available from the Companies House website:

  1. Companies House quarterly publication on [Incorporated Companies in the UK](https://www.gov.uk/search/research-and-statistics?content_store_document_type=published_statistics&keywords=Incorporated&organisations%5B%5D=companies-house&public_timestamp%5Bfrom%5D=&public_timestamp%5Bto%5D=)
  
  
  2. Latest statistical release _Incorporated Companies in the UK October to December 2019_ :
  https://www.gov.uk/government/statistics/incorporated-companies-in-the-uk-october-to-december-2019

## Code

* The basic company data file (_i.e._ the company register) is ~2GB so `00-read.R` reads in necessary variables and saves as a smaller `.csv`.

* `02_tidyanalyze.R` produces the output `new_incorp_barplot.pdf`.

Comments Welcome!

