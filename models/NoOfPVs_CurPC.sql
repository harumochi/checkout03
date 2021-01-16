WITH Cur_PC as (select id, postcode, max(pageview_datetime) as date_time
from users_extract01.postcode_history
where (postcode is not null and pageview_datetime is not null)
group by id, postcode)
select CPC.id, CPC.postcode, Count(PCH.pageview_datetime) as NoOfPVs
from Cur_PC as CPC
left join 
(select*from users_extract01.postcode_history
where 
DATE(pageview_datetime) >= DATE_SUB(CURRENT_DATE, INTERVAL 180 DAY)
) as PCH
on PCH.id=CPC.id and PCH.postcode=CPC.postcode
Group by CPC.id, CPC.postcode