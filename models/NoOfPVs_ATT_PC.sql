select postcode, count(pageview_datetime) as NoOfPVs
from users_extract01.postcode_history
group by postcode