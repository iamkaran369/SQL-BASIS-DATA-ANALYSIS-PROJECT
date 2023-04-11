--SHOW THE FIRST 10 ROWS OF THE DATASET
SELECT * FROM titanic limit 10

--FIND THE NUMBER OF PASSENGERS WHO SURVIVED
select count(survived)
from titanic
where survived=1

--FIND THE AVERAGE AGE OF ALL PASSENGERS
select avg(age)
from titanic

--FIND THE NUMBER OF PASSENGERS IN EACH CLASS
select pclass,count(pclass)
from titanic
group by pclass

--FIND THE FIRST 10 ROWS OF THE DATASET SORTED BY PASSENGER CLASS IN DECENDING ORDER
select * from titanic
order by pclass desc
limit 10

--FIND THE NUMBER OF PASSENGERS IN EACH CLASS SORTED BY CLASS IN ASCENDING ORDER
select count(passengerid),pclass from titanic
group by pclass
order by pclass asc

--FIND THE AVERAGE FARE PAID BY PASSENGERS IN EACH CLASS
SELECT avg(fare) as average_fare,pclass FROM titanic
group by pclass 

--FIND THE NAME OF THE PASSENGER WITH THE HIGHEST FARE
select name,max(fare) as max_fare from titanic
group by name
order by max_fare desc limit 3

--FIND THE NAME OF THE PASSENGER WHO HAD THE HIGHEST AGE AMONG THE SURVIVORS
select name,age from titanic
where age = (select max(age) from titanic where survived=1) 

--FIND THE NUMBER OF PASSENGER WHO PAID MORE THAN THE AVERAGE FARE
select count(passengerid) as number_of_passenger from titanic
where fare > (select avg(fare) from titanic)

--FIND THE NAME OF THE PASSENGER WHO HAD THE MOST PARENTS OR CHILDREN ON BOARD
select name,parch from titanic
where parch = (select max(parch) from titanic)

--FIND THE NUMBER OF MALE AND FEMALE PASSENGER WHO SURVIVED AND ORDER THE RESULT BY SEX IN ASCENDING ORDER
select count(sex),sex from titanic
where survived  =1
group by sex
order by sex

--FIND THE NAME,AGE AND AFRE OF THE OLDEST PASSENGER WHO SURVIVED
select name,age,fare from titanic
where age = (select max(age) from titanic where survived = 1)

--FIND THE NAME AND AGE  OF THE YOUNGEST FEMALE PASSENGER WHO SURVIVED IN THIRD CLASS
select name,age from titanic
where sex = 'female' and pclass = 3 and survived = 1
and age = (select min(age) from titanic where  sex='female' and pclass=3 and survived = 1)

--FIND NUMBER OF MALE AND FEMALE PASSENGERS
select 
	sum(case when sex = 'male' then 1 else 0 end) as number_of_male,
	sum(case when sex = 'female' then 1 else 0 end) as number_of_female
	from titanic
	
--SELECT ALL THE PASSENGER WHO TRAVELED IN A CABIN WAS NOT SHARED BY OTHER PASSENGERS
select * from titanic
where cabin not in (select cabin from titanic group by cabin having count(cabin)>1) 


