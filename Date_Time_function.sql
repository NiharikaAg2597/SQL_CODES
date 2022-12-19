

DATE AND TIME FUNCTION :---->


https://docs.snowflake.com/en/sql-reference/functions/convert_timezone.html


----If we want to extract only particular interval /date or year or month at that time will use date_truc command.

DATE_TRUNC() is a function used to round or truncate a timestamp to the interval you need. 
When used to aggregate data, it allows you to find time-based trends like daily purchases or messages per second.

Syntax:    DATE_TRUNC(‘[interval]’, time_column)

Ex:-->

Format of date :

YYYY-MM-DD   :  2022-12-17

When we extract as per year :   YYYY-MM-DD     2022-12-17
When we extract as per month:   YYYY-MM-DD     2022-01-01
When we extract as per date :   YYYY-MM-DD     2022-12-17
When we extract as per week :   YYYY-MM-DD     2022-12-17




select current_date;   ---- It will show current date

select current_time;   ----It wiill show current time

select current_timestamp;  ----It will show current time and include microsecond as well. Also it include date part.

--converting timezone. || convert_timezone() function.

select convert_timezone('UTC', current_timestamp) as UTC_timezone;   

--alias ||  its a nick name.

select
 current_timestamp() as current_time,
 convert_timezone('UTC',current_timestamp) as now_in_UTC,
 convert_timezone('Europe/London', current_timestamp) as now_in_EUR;
 
 
 select convert_timezone('Europe/Warsaw','UTC','2019-01-01 00:00:00' ::timestamp_ntz) as conversion;
 
 
 --------If we want to extract only particular interval /date or year or month at that time will use date_truc() function.

--get year from date
select date_trunc('year',current_date) as yr_from_date; --2022-01-01

--when date is in string or number first we need to convert it in date datatype using to_date('') or date('')function.
select date_trunc('year',to_date('2022-12-17')) as yr_from_date; --2022-01-01
select date_trunc('year',date('2022-12-17')) as yr_from_date; --2022-01-01



--get month from date
select date_trunc('mon',current_date) as mon_from_date; --2022-12-01


--get day from date
select date_trunc('day',current_date) as day_from_date;  --2022-12-17

--get week from date  ---It will extract particular week day
select date_trunc('week',current_date) as immediate_monday_from_date;  --2022-12-12  || current date: 2022-12-17

--get which week we are in from starting of the month || week()
select week(current_date) as week_from_start_of_year;    ---50   --2022-12-17


--get only current date
select date(current_date) as date;    --2022-12-17

--get only current year
select year(current_date) as only_Year;   --2022

--get only current month
select month(current_date) as only_month;   --12

--get only current day
select day(current_date) as only_day;   --17

--taking dates as per interval
select day (current_date - interval '10 days');

---extracting quarter
select quarter(current_date) as qtr;

--It will extract day, hour, minute, second, month.
select 
current_timestamp(),
day(current_timestamp) as day,
hour(current_timestamp) as hour,
minute(current_timestamp) as minute,
second(current_timestamp) as second,
month(current_timestamp) as month;

------alternative||  Both output are same.
select 
current_timestamp(),
day(current_timestamp()) as day,
hour(current_timestamp()) as hour,
minute(current_timestamp()) as minute,
second(current_timestamp()) as second,
month(current_timestamp()) as month;

 
 
 --It will extract date,year ,month, day in one cmd..
 
 select current_date(),
 year(current_date) as only_current_year,
 month(current_date) as only_current_month,
 day(current_date) as only_current_day;
 
 -----alternative |||both output is same
 
 select current_date(),
 year(current_date()) as only_current_year,
 month(current_date()) as only_current_month,
 day(current_date()) as only_current_day;


---last day  

select last_day(current_date()) as last_day;     --2022-12-31

select last_day(current_date()- interval '3 month') as last_day;   --2022-09-30

select last_day(date('2022-11-12')) as last_day_nov; ---2022-11-30

select last_day(to_date('2022-10-23')) as last_day_oct;  --2022-10-31

select last_day(date('2022-11-12') -interval '4 month') as last_day_of_july;   --2022-07-31


select extract(year , current_date) as year;
select extract(month , current_date) as month;
select extract(day , current_date) as day;
select extract(week , current_date) as week;
select extract(hour,current_timestamp) as hour;
select extract(minute,current_timestamp) as minute;
select extract(second,current_timestamp) as second;

------Alternative

select extract(year from current_date) as year;
select extract(month from current_date) as month;
select extract(day from current_date) as day;
select extract(week from current_date) as week;
select extract(hour from current_timestamp) as hour;
select extract(minute from current_timestamp) as minute;
select extract(second from current_timestamp) as second;

-----Alternatve

select extract(year , date('2022-12-17')) as year;
select extract(month , date('2022-12-17')) as mth;
select extract(day , date('2022-12-17')) as day;

------Alternative

select extract(year , to_date('2022-12-17')) as year;
select extract(month , to_date('2022-12-17')) as mth;
select extract(day ,to_date('2022-12-17')) as day;


----Note:::   We should always use date_trunc in place of extract. 
--so to avoid confusion when playing with huge dataset contaiing old data

-----Changing the default format ( yyyy-mm-dd) of date as per our requirement : to_char() :-->it first change date into char

select to_char(to_date('2022-12-17'),'DD-MM-YYYY' )as changed_format;   --17-12-2022

select to_char(to_date('2022-12-17') ,'MM-YYYY') as changed_format;   --12-2022

select to_char(current_date , 'MM-YY') as changed_date;       --12-22

select to_char(date('2022-12-17'),'DD-MM-YY') as changed_date;    --17-12-22

select to_char(date('2022-12-17'),'MON-YYYY') as changed_date;     --Dec-2022

select to_char(date('2022-12-17'),'MON-YY') as changed_date;      --Dec-22

select to_char(date('2022-12-17'),'DY') as changed_date;      --Sat

select to_char(date('2022-12-17'),'DY-MON-DD-MM-YYYY') as changed_date;      -- Sat-Dec-17-12-2022


---for dayname

select dayname(current_date);   --Sat
select dayname(to_date('2022-12-17'))  --Sat


---for checking date difference

select datediff('month','2022-12-12','2021-10-14') as month;    -- -14

select datediff('month','2021-10-14','2022-12-12') as month;    -- 14

select datediff('day','2021-10-14','2022-12-12') as day_difference;   --424

select datediff('year','2021-10-14','2022-12-12') as year_differenece;  --1


