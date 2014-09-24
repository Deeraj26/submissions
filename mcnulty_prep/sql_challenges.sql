Challenge1: 
Who has played the most matches total in all of US Open, AUST Open, French Open?  Answer this both for men and women.
MEN: Rafael Nadal with 21 matches
| Richard Gasquet         |            13 |
| Tommy Robredo           |            14 |
| Roger Federer           |            15 |
| Novak Djokovic          |            17 |
| Stanislas Wawrinka      |            17 |
| David Ferrer            |            17 |
| Rafael Nadal            |            21 |
+-------------------------+---------------+

    select player, sum(count) as number_of_matches from (select player1 as player, count(*) as count from 
 	aus_men_2013 group by player1 
 	UNION ALL select player2 as player, count(*) as  count from aus_men_2013 group by player2 
 	UNION ALL select player1 as player, count(*) as count from french_men_2013 group by player1 
 	UNION ALL select player2 as player, count(*) as count from french_men_2013 group by player2  
 	UNION ALL select player1 as player, count(*) as count from us_men_2013 group by player1  	
 	UNION ALL select player2 as player, count(*) as count from us_men_2013 group by player2 ) AS temporary_table group by player 
 	order by number_of_matches desc LIMIT 5;

  Angelique Kerber           |             8 |
| Eugenie Bouchard           |             8 |
| Sloane Stephens            |             8 |
| Ana Ivanovic               |             9 |
| Dominika Cibulkova         |             9 |
| Jelena Jankovic            |             9 |
| Na Li                      |             9 |
| Agnieszka Radwanska        |            11 |
| Victoria Azarenka          |            11 |
| Serena Williams            |            11 |
| Maria Sharapova            |            11 |
+----------------------------+---------------+
WOMEN: Serena Williams, Maria Sharapova, Agnieszka Radwanska, & Victoria Azarenka with 11 matches
select player, sum(count) as number_of_matches from
 	(select player1 as player, count(*) as  count from aus_women_2013 group by player1
 	UNION ALL select player2 as player, count(*) as count from aus_women_2013 group by player2 
 	UNION ALL select player1 as player, count(*) as count from french_women_2013 group by player1 
	UNION ALL select player2 as player, count(*) as count from french_women_2013 group by player2 
 	UNION ALL select player1 as player, count(*) as count from us_women_2013 group by player1 
 	UNION ALL select player2 as player, count(*) as count from us_women_2013 group by player2) AS 
 	temporary_table group by player order by number_of_matches desc LIMIT 5;

Challenge 2:
 Who has the highest first serve percentage? (Just the maximum value in a single match)
| Carlos Berlocq          | 84                |
| Rafael Nadal            | 84                |
| Gael Monfils            | 84                |
+-------------------------+-----

MEN: Nadal,
     Monfils, and 
     Berlocq with 84%
select player, max(max_serve_p) as maxfsp from (select player1 as player, 
 	max(FSP_1) as max_serve_p from aus_men_2013 group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from aus_men_2013  
 	group by player2 
 	UNION ALL select player1 as player , max(FSP_1) as max_serve_p  
 	from french_men_2013 group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from 
 	french_men_2013 group by player2    
 	UNION ALL select player1 as player , max(FSP_1) as max_serve_p from us_men_2013 
 	group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from us_men_2013  
 	group by player2) AS temporary_table group by player order by maxfsp desc LIMIT 5;

WOMEN:  S. Errani with 93%
select player, max(max_serve_p) as maxfsp from (select player1 as player, 
 	max(FSP_1) as max_serve_p from aus_women_2013 group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from 
 	aus_women_2013 group by player2 
 	UNION ALL select player1 as player , max(FSP_1) as max_serve_p  
 	from french_women_2013 group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from 
 	french_women_2013 group by player2    
 	UNION ALL select player1 as player , max(FSP_1) as max_serve_p from 
 	us_women_2013 group by player1    
 	UNION ALL select player2 as player, max(FSP_2) as max_serve_p  from 
 	us_women_2013  group by player2) AS temporary_table group by player order by maxfsp  
 	desc LIMIT 5;


Challenge 3:
What are the unforced error percentages of the top three players with the most wins?

 TOP 3 MEN WITH MOST WINS:
 Rafael Nadal (21.2%),
 Stanislas Wawrinka (23.8%),
 David Ferrer (21.6%),
select player, sum(wins) as Total_Wins from (select player1 as player, count(*) as wins 
 	from aus_men_2013 where result=1 group by player1    
 	UNION ALL select player2 as player, count(*) as wins from aus_men_2013 where result=0 group by 
 	player2 
 	UNION ALL select player1 as player, count(*) as wins from french_men_2013 where result=1 group by 
 	player1    
 	UNION ALL select player2 as player, count(*) as wins from french_men_2013 where result=0 group by 
 	player2    
 	UNION ALL select player1 as player , count(*) as wins from us_men_2013 where result=1 group by  	player1    
 	UNION ALL select player2 as player, count(*) as wins from us_men_2013  where result=0
 	group by player2) AS table_temp group by player order by Total_Wins desc LIMIT 4;

select player, sum(UFE) as SUM_UNFORCED_ERRORS, sum(total_points) as SUM_TOTAL_POINTS_LOST, 
                (100*(sum(UFE)/sum(total_points))) as percent_unforced_error from 
                (
          	select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from aus_men_2013  
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from aus_men_2013   
 	UNION ALL select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from french_men_2013   
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from french_men_2013   
 	UNION ALL select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from us_men_2013   
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from us_men_2013
                ) AS table_temp 
      	where player in (select player from (
 select player, sum(count) as no_of_matches from ( 
 select player1 as player, count(*) as count from aus_men_2013 group by player1
 UNION ALL select player2 as player, count(*) as count from aus_men_2013 group by player2 
 UNION ALL select player1 as player, count(*) as count from french_men_2013 group by player1 
 UNION ALL select player2 as player, count(*) as count from french_men_2013 group by player2 
 UNION ALL select player1 as player, count(*) as count from us_men_2013 group by player1
 UNION ALL select player2 as player, count(*) as count from us_men_2013 group by player2 ) 
  AS table_temp  group by player order by  no_of_matches desc  ) as table_temp3 limit 3 )) group by player;




TOP 3 WOMEN WITH MOST WINS: 
Serena Williams (43.2%), 
Victoria Azarenka (38.9%), 
Agnieszka Radwanska (27.5%)


select player, sum(wins) as Total_Wins from (select player1 as player, count(*) as wins 
 	from aus_women_2013 where result=1 group by player1    
 	UNION ALL select player2 as player, count(*) as wins from aus_women_2013 where result=0 group by 
 	player2 
 	UNION ALL select player1 as player, count(*) as wins from french_women_2013 where result=1 group by 
 	player1    
 	UNION ALL select player2 as player, count(*) as wins from french_women_2013 where result=0 group by 
 	player2    
 	UNION ALL select player1 as player, count(*) as wins from us_women_2013 where result=1 group by player1    
 	UNION ALL select player2 as player, count(*) as wins from us_women_2013  where result=0
 	group by player2) AS table_temp group by player order by Total_Wins desc LIMIT 3;

select player, sum(UFE) as SUM_UNFORCED_ERRORS, sum(total_points) as SUM_TOTAL_POINTS_LOST, 
                (100*(sum(UFE)/sum(total_points))) as percent_unforced_error from (
          	select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from aus_women_2013  
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from aus_women_2013   
 	UNION ALL select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from french_women_2013  
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from french_women_2013   
 	UNION ALL select player1 as player, UFE_1 as UFE, (TPW_2) as total_points from us_women_2013   
 	UNION ALL select player2 as player, UFE_2 as UFE, (TPW_1) as total_points from us_women_2013
                ) AS table_temp where player in ((select player from (
 select player, sum(count) as no_of_matches from ( 
 select player1 as player, count(*) as count from aus_women_2013 group by player1
 UNION ALL select player2 as player, count(*) as count from aus_women_2013 group by player2 
 UNION ALL select player1 as player, count(*) as count from french_women_2013 group by player1 
 UNION ALL select player2 as player, count(*) as count from french_women_2013 group by player2 
 UNION ALL select player1 as player, count(*) as count from us_women_2013 group by player1
 UNION ALL select player2 as player, count(*) as count from us_women_2013 group by player2 ) 
  AS table_temp  group by player order by  no_of_matches desc  ) ) group by player;


