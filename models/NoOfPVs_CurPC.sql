With CPC as (
        With Cur_PC_id as (select id, max(pageview_datetime) as max_date_time
        from users_extract01.postcode_history
        group by id)
        select a.id, b.postcode, max_date_time from 
        Cur_PC_id as a
        Left join users_extract01.postcode_history as b
        on a.max_date_time =b.pageview_datetime and a.id = b.id
) 
select CPC.postcode, Count(PCH.pageview_datetime) as NoOfPVs
from CPC
left join users_extract01.postcode_history as PCH
on PCH.id=CPC.id and PCH.postcode=CPC.postcode
Group by CPC.postcode