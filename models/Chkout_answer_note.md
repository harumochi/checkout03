I would suggest scheduling queries in BigQuery as it seems to be easy like shown below.
 Firstly, I assume that the “pageviews_extract” and “users_extract” tables are scheduled already. 
Secondly, I would create a new table called “postcode_history” (postcode_history01.sql in Github) and schedule daily to incrementally insert new rows like shown in “INSERT_PC_history.sql” in Github. 
e.g. Lets say new rows from the day before (DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY))
Basically, the “postcode_history” table keeps all the POSTCODE history per ID.
 
To answer both Q1 and Q2, I created sample queries as it was suggested.
•	Q1: Number of pageviews, on a given time period (hour, day, month, etc), per postcode -based on the current/most recent postcode of a user.
•	Q2: Number of pageviews, on a given time period (hour, day, month, etc), per postcode -based on the postcode a user was in at the time when that user made a pageview.

For the Q1, I used the “postcode_history” table to get the most recent postcode of each ID, then counted the “pageview_datetime” (please refer to “NoOfPVs_CurPC.sql” in Github).

For the Q2, I hope that I understood the question correctly because it became a simpler query, “NoOfPVs_ATT_PC.sql” in Github, compared to the Q1. For  this sample, I assume that someone wants to see data from “2019”. It counts the “pageview_datetime” based on the postcode a user was in at the time (in 2019) when that user made a pageview.
