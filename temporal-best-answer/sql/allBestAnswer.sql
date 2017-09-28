select count(distinct u.id) as numberUserBestAnswer, a.monthId as periodAnswer
	from user u inner join answer a on u.id = a.userId
 	where a.accepted = 1 group by a.monthId;
