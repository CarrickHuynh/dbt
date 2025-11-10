with cte as(
select 

to_timestamp(started_At) as started_At,
date(to_timestamp(started_At)) as date_stated_At,
hour(to_timestamp(started_At)) as hour_stated_At,



{{day_type('started_At')}} as day_type,


{{get_season('started_At')}} as season_type,


from 
{{source('demo','bike')}}

where started_At  != 'started_At'
)

select * from cte
