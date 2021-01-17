select postcode, count(pageview_datetime) as NoOfPVs
from users_extract01.postcode_history
where EXTRACT(YEAR FROM pageview_datetime) = 2019
group by postcode