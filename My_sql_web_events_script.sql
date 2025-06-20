CREATE SCHEMA Web_events;

USE Web_events;
SELECT *
FROM web_events;

CREATE VIEW TotalRecords AS
select count(distinct  account_id)
from web_events;


-- top five most used channels 
CREATE VIEW Top_used_charnel AS 
select channel, count(*) as event_count
from web_events
group by channel 
order by event_count desc
limit 5;


-- ---web events in 2016
CREATE VIEW 2016_Web_events AS 
select date_format(Occur_at, '%Y-%M-01') as month, count(*)
from web_events
where Occur_at between '2016-01-01' and '2016-12-31'
group by month 
order by month;

-- ---account had the most wed events 
CREATE VIEW Top_Account AS 
select account_id, count(*) as event_count
from web_events 
group by account_id 
order by event_count desc 
limit 1;


-- --first and last record web event
CREATE VIEW Last_First_Event_Date AS 
select min(Occur_at) as firstevent, max(Occur_at)lastevent 
from web_events;

-- --channels with 100 events and above
CREATE VIEW Channelwithover100events AS 
select Channel, count(*) as event_count
from web_events
group by Channel 
having count(*) >100;

-- ---web events happened on weekend 
CREATE VIEW Weekend_Records AS 
SELECT COUNT(*)
FROM web_events
WHERE DAYOFWEEK(occur_at) IN (1, 7);

-- --web events happened in the first quarter
CREATE VIEW First_Quarter_Events_Records AS 
 

-- --account had the earliest web event 
select account_id, occur_at
from web_events
order by occur_at asc
limit 1;


-- --web events occered per day on average 
CREATE VIEW avgeventsperday AS 
select count(*)/count(distinct date (occur_at)) as avg_per_day
from web_events;

-- --day had the highest number of web events 
CREATE VIEW daywithmostevents AS 
select date(occur_at) as event_date, count(*) as event_count
from web_events
group by event_date 
order by event_count desc
limit 1;

-- --percentage of web events that occurred through each channel 
CREATE VIEW ChannelPercentage AS 
select channel, count(*)*100.0/(select count(*)
from web_events) as percentage
from web_events
group by channel ;

-- ----number of events per channel for each month in 2016
CREATE VIEW Channel_event_countpermonth AS 
select date_format(occur_at, '%Y-%M-01') as month, channel, count(*) as event_count
from web_events
where occur_at between '2016-01-01' and '2016-12-31'
group by month, channel 
order by month, event_count desc;


--
select count(*)
from web_events
where extract(hour from Occur_at)>=18;
 

