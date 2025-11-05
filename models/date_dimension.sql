with cte as(
select 

to_timestamp(started_At) as started_At,
date(to_timestamp(started_At)) as date_stated_At,
hour(to_timestamp(started_At)) as hour_stated_At,


case 
when dayname(to_timestamp(started_At)) in ('Sat','Sun')
then 'Weekend'
else 'Ngày làm việc'
end as day_type,

case 
when month(to_timestamp(started_At)) in (12,1,2)
then 'Winter'
when  month(to_timestamp(started_At)) in (3,4,5)
then 'Srping'
when  month(to_timestamp(started_At)) in (6,7,8)
then 'Summer'
else 'Autum'
end as month_type
from 
{{source('demo','bike')}}

where started_At  != 'started_At'
)

select * from cte
