select count(distinct u.id) as nonExpertsBestAnswer, a.monthId as periodAnswer
	from user u inner join answer a on u.id = a.userId
 	where u.ex = 0 and a.accepted = 1 group by a.monthId;
