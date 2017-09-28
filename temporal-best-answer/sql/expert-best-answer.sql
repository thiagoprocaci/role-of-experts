select count(distinct u.id) as expertsBestAnswer, a.monthId as periodAnswer
	from user u inner join answer a on u.id = a.userId
 	where u.ex = 1 and a.accepted = 1 group by a.monthId;
