create table users_extract01.postcode_history as (
    SELECT a.id, a.postcode, pageview_datetime FROM users_extract01.users_extract a
        LEFT JOIN 
        users_extract01.pageviews_extract b 
        ON a.id = b.id)
;