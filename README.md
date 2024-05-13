# Philadelphia Commodities Contracts

## Data Source

Data Source: OpenDataPhilly-Commodities Contracts <br/>
Link: https://opendataphilly.org/datasets/commodities-contracts/ </br>
These data come from Philadelphia City Open Data. The data set represents contracts that are bid and awarded by the City's Procurement Department, for supplies, equipment, non-professional services, and public works. Each data set includes information regarding contracts that were renewed or received payment during the given quarter.

### Data Dictionary

You can check the data dictionary file in `docs` folder, or you can check the table below. <br/>

| Field Name | Description | Type |
|------|------|------|
| Bid_Number|The original bid number under which the current contract was obtained.|Text|
|Contract_Amount|Total amount awarded by a contract over entire duration. Does not represent amount disbursed within that quarter.|Currency|
|Contract_Description|The general category of contracted services.|Text|
|Contract_Number|The current contract number.|Text|
|Contract_Type|The type of contract - whether it is a Public Works contract or SS&E (supplies, equipment, and non-professional services).|Text|
|Department_Name|The name of the contracting department. Due to the manner in which data is captured for public works contracts versus how it is captured for supplies, equipment and non-professional services contracts (SS&E), a department name is not available for SS&E contracts.|Text|
|End_Date|The end date of the current term of the contract.|Numeric|
|Quarter|Quarter of fiscal year in which the payment(s) (if any) occurred for the current contract.|Text|
|Remaining_Contract_Months|The number of months remaining on the current term of the contract. If the months remaining is zero, this means the end date expired during the time period reported.|Numeric|
|Start_Date|The start date of the current term of the contract.|Numeric|
|Total_Contract_Months|The number of months allowed on the current contract.|Numeric|
|Total_Transactions|The total amount of all payments initiated during the reported quarter. This does not represent the total amount of payments for the life of the contract or for the active term, only those initiated during the reported quarter. Additionally, the payments|Numeric|
|Vendor_Name|The name of the vendor currently holding the contract.|Text|

## Storage

The raw data extract from data source is stored in Azure.

## Modeling

This project use a star schema. </br>
Model and schema of the data warehouse can be seen in the `model` folder. The scripts that create data warehouse are in `scripts` folder. </br>

![star shema of this project](/model/star_schema.png)

## Transformation

A ETL data pipeline is built. The data is downloaded from the staging and transformated, then loaded into Azure PostgrSQL Data Warehous.

### Azure PostgrSQL

Server name: cis9440-hw.postgres.database.azure.com
<!---Admin username: homework--->
<!---password: cis9440-hw--->

## Data Serving

### Data Visualization

Tableau Link: https://public.tableau.com/views/phila_commodities_contracts/Dashboard1
