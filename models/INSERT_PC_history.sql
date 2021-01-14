INSERT INTO users_extract01.postcode_history
    SELECT a.id, a.postcode, pageview_datetime FROM users_extract01.users_extract a
        LEFT JOIN 
            users_extract01.pageviews_extract b 
        ON a.id = b.id
    WHERE DATE(pageview_datetime) >= DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY);