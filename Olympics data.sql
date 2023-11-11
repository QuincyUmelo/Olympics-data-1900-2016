SELECT * FROM olympics.olympics_data;

Select count(Sex), Sex
from olympics.olympics_data
group by Sex;

-- 1
select count(Games)
from olympics.olympics_data;

-- 2
select Games
from olympics.olympics_data
Order by Year_ desc;

-- 3
select count(distinct NOC), Games, Year_
from olympics.olympics_data
group by Games, Year_
order by Year_ desc;

-- 4
select count(NOC), Games, Year_
from olympics.olympics_data
group by Games, Year_
order by count(NOC) desc, Year_ desc;

-- 5
select NOC
from olympics.olympics_data;


select Games, NOC
from olympics.olympics_data
where NOC in (select NOC from olympics.olympics_data);

-- 6
select count(distinct Sport)
from olympics.olympics_data
where Season =("Summer");

select count(distinct Games), Sport
from olympics.olympics_data
where Season =("Summer")
Group by Sport
Order by count(distinct Games) desc;

-- 7
select count(Sport), Sport, Games
from olympics.olympics_data
Group by Sport, Games
order by count(Sport) asc
limit 1
;

-- 8
select count(distinct Sport), Games, Year_
from olympics.olympics_data
Group by Games, Year_
order by Year_ desc
;

-- 9
select *
from olympics.olympics_data
where Medal =("Gold") and Age <> "NA"
order by Age desc;

-- 10
select count(Sex)
from olympics.olympics_data
where Sex ="F";

select count(Sex)
from olympics.olympics_data
where Sex ="M";

select round((select count(Sex) from olympics.olympics_data where Sex ="M")/(select count(Sex) from olympics.olympics_data where Sex ="F"),0) as ratio;

-- 11
select count(Medal) as Medal, Name_, (dense_rank () over (Order by count(Medal) desc)) as Rank_
from olympics.olympics_data
where Medal ="Gold"
Group by Name_
Order by count(Medal) desc
;

-- 12
select count(Medal), Name_
from olympics.olympics_data
where Medal in ("Gold", "Silver", "Bronze")
Group by Name_
Order by count(Medal) desc
limit 5;

-- 13
select count(Medal), NOC
from olympics.olympics_data
where Medal in ("Gold", "Silver", "Bronze")
Group by NOC
Order by count(Medal) desc
limit 5;

-- 14
with T1 as
(select count(Medal) as Gold, NOC
from olympics.olympics_data
where Medal ="Gold"
Group by NOC, Medal
Order by count(Medal) desc),

T2 as
(select count(Medal) as Silver, NOC
from olympics.olympics_data
where Medal ="Silver"
Group by NOC, Medal
Order by count(Medal) desc),

T3 as
(select count(Medal) as Bronze, NOC
from olympics.olympics_data
where Medal ="Bronze"
Group by NOC, Medal
Order by count(Medal) desc)


-- 15 & 16
select count(Medal) as Gold, NOC, Games
from olympics.olympics_data
where Medal ="Gold"
Group by NOC, Medal, Games
Order by count(Medal) desc;

select count(Medal) as Silver, NOC, Games
from olympics.olympics_data
where Medal ="Silver"
Group by NOC, Medal, Games
Order by count(Medal) desc;

select count(Medal) as Bronze, NOC, Games
from olympics.olympics_data
where Medal ="Bronze"
Group by NOC, Medal, Games
Order by count(Medal) desc;

-- 18
select distinct NOC
from olympics.olympics_data
where Medal in ("Bronze", "Silver") and Medal <> "Gold";

-- 19
select count(Medal), Sport
from olympics.olympics_data
where NOC="IND"
Group by Sport
order by count(Medal) desc;

-- 20
select count(Medal), Games
from olympics.olympics_data
where NOC="IND" and Sport ="Hockey"
Group by Games
order by count(Medal) desc;

select count(distinct games), sport
from olympics.olympics_data
group by sport
order by count(distinct games) desc;
