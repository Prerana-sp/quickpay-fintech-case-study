# SQL Answers

## Q1
### Query
Count transactions by status
### Result Summary
- captured: highest count (around 18 transactions)
- failed: second highest (around 7 transactions)
- chargeback: lowest count (around 5 transactions)

## Q2
### Query
Calculate total captured GMV by merchant
### Result Summary
- Beta Stores has highest captured GMV
- Alpha Mart is second highest
- Delta Travels, City Pharma, Eco Home follow

## Q3
### Query
Top 10 merchants by captured GMV
### Result Summary
- Beta Stores: highest captured GMV
- Alpha Mart: second
- Eco Home: third
- City Pharma: fourth
- Delta Travels: fifth

## Q4
### Query
Daily GMV and successful transaction count
### Result Summary
- GMV varies daily between 2026-03-01 and 2026-03-06
- Peak GMV observed around 2026-03-03 and 2026-03-05
- Daily successful transactions range from 2 to 6

## Q5
### Query
Merchants with chargeback ratio above 1%
### Result Summary
- All merchants have chargeback ratio above 1%
- Alpha Mart and Beta Stores have highest chargeback counts
- Delta Travels also has one chargeback

## Q6
### Query
Regions with average risk score above 50 and more than 20 transactions
### Result Summary
- APAC region qualifies with avg risk score above 50 and more than 20 transactions
- EU and US regions have fewer than 20 transactions so they do not qualify

## Q7
### Query
Users with 3 or more failed or chargeback transactions on same day
### Result Summary
- User U008 has 3 or more failed or chargeback transactions on 2026-03-05
- This flags U008 as a high risk user

## Q8
### Query
Chargeback count, unique affected users, and chargeback amount by merchant
### Result Summary
- Beta Stores: highest chargeback amount
- Alpha Mart: second highest
- Each merchant has at least 1 chargeback transaction
- U008 appears as affected user across multiple merchants
