#  The Role of Expert Users in Informal Learning Spaces: An Analytical Overview of Their Behavior and Ways to Connect to Them

## Summary
This project is part of a scientific research. We are interested in understanding the role of experts in online communities.
You can find here the analysis of the paper " The Role of Expert Users in Informal Learning Spaces: An Analytical Overview of Their Behavior and Ways to Connect to Them" published at xxx.
In other words, you will find here everything you need to reproduce this research.
First, read the paper and then follow the instructions below.

### Dataset Instructions

In this research, we used two datasets. we used the first dataset to perform experiments to identify experts and worthy discussions. 

The second one, to find the topic of expertise of an experts using semantic techniques.


## Environment
- MySQL database version 5.6.31 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 15.10
- HeidiSQL version 9.3.0.4984


### Dataset to Identify Experts and Worthy Discussions

- Open folder database/biology
- Unzip bio-database.sql.zip
- Run bio-database.sql


### Dataset to Identify the Topic of Expertise

- Download the scripts from https://github.com/thiagoprocaci/qarepo
- Run createDatabase.sql
- Run the other scripts and follow the instructions avaliable at https://github.com/thiagoprocaci/qarepo.


## How did we extract the data?
We used the stackexchange API (http://api.stackexchange.com/docs/) to extract data from biology Q&A (http://biology.stackexchange.com/). Then, we loaded the data into MySQL.



