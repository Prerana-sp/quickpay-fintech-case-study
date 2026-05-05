# Spreadsheet Answers

## Cleaning Steps
- Removed extra spaces from merchant names and status fields
- Standardized all text fields to consistent casing
- Converted date format from DD-MM-YYYY to YYYY-MM-DD
- Extracted numeric risk scores from formats like score:62 and risk-83
- Standardized gateway region to uppercase (APAC, EU, US)
- Filled missing regions based on currency (INR=APAC, EUR=EU, USD=US)

## Standardization Rules
- Merchant names: used PROPER(TRIM()) to fix casing
- Status: captured, failed, chargeback (all lowercase)
- Risk score: extracted numbers from score:XX and risk-XX formats
- Region: APAC, EU, US (all uppercase)
- Date: YYYY-MM-DD format

## Lookup and Enrichment Logic
- Converted amounts to USD using exchange_rates.csv
- INR x 0.012 = USD
- EUR x 1.08 = USD
- USD x 1.0 = USD

## Final Answers
- Total raw rows: 30
- Total cleaned rows: 30
- Invalid or missing rows handled: 0 removed, blanks filled
- Top region by GMV: APAC
- Number of high value transactions: 8
- Number of high risk transactions: 9
- Top merchant by captured GMV: Beta Stores

## Formula Samples
- Clean merchant: =PROPER(TRIM(SUBSTITUTE(C2,"  "," ")))
- Clean date: =TEXT(DATE(MID(B2,7,4),MID(B2,4,2),LEFT(B2,2)),"YYYY-MM-DD")
- Clean status: =IF(ISNUMBER(SEARCH("chargeback",F2)),"chargeback",IF(ISNUMBER(SEARCH("failed",F2)),"failed","captured"))
- Clean risk score: =IF(ISNUMBER(VALUE(TRIM(G2))),VALUE(TRIM(G2)),IF(ISNUMBER(SEARCH("score:",G2)),VALUE(TRIM(MID(G2,FIND(":",G2)+1,10))),IF(ISNUMBER(SEARCH("risk-",G2)),VALUE(TRIM(MID(G2,FIND("-",G2)+1,10))),""))
- Amount USD: =IF(E2="INR",D2*0.012,IF(E2="EUR",D2*1.08,D2))
- High value flag: =IF(AND(O2="APAC",P2>5000),1,IF(AND(O2="EU",P2>6000),1,IF(AND(O2="US",P2>7000),1,0)))
- High risk flag: =IF(OR(N2>=70,ISNUMBER(SEARCH("chargeback",F2))),1,0)
