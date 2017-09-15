#  The Role of Expert Users in Informal Learning Spaces: An Analytical Overview of Their Behavior and Ways to Connect to Them

## Summary
This project is part of a scientific research. We are interested in understanding the role of experts in online communities.
You can find here the analysis of the paper " The Role of Expert Users in Informal Learning Spaces: An Analytical Overview of Their Behavior and Ways to Connect to Them" published at xxx.
In other words, you will find here everything you need to reproduce this research.
First, read the paper and then follow the instructions below.

## Environment
- MySQL database version 5.6.31 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 15.10
- HeidiSQL version 9.3.0.4984
- R version 3.2.3 

## Dataset Instructions

In this research, we used two datasets. 
We used the first dataset to perform experiments to identify experts and worthy discussions. 
The second one, to find the topic of expertise of an experts using semantic techniques.

## How did we extract the data?
We used the stackexchange API (http://api.stackexchange.com/docs/) to extract data from biology Q&A (http://biology.stackexchange.com/). Then, we loaded the data into MySQL.

### Dataset to Identify Experts and Worthy Discussions (dataset 1)

- Open folder database/biology
- Unzip bio-database.sql.zip
- Run bio-database.sql


### Dataset to Identify the Topic of Expertise (dataset 2)

- Download the scripts from https://github.com/thiagoprocaci/qarepo
- Run createDatabase.sql
- Run the other scripts and follow the instructions avaliable at https://github.com/thiagoprocaci/qarepo.

#### Comments about the database tables of dataset 2
The names of the tables were written in Portuguese. 
We translated the names in order to help you to understand.

Table name         | Translation (english)
------------------ | ------------------
usuario            | user
pergunta           | question
resposta           | answer
comentariopergunta | comments on question
comentarioresposta | comments on answer
forum              | forum
anotacoes          | annotations
entidades          | entities
tag                | tag
perguntatag        | question tag

We also translated some important table fields:

Field name         | Translation (english)
------------------ | ------------------
id                 | id
reputacao          | reputation
nome               | name
titulo             | title
texto              | text
usuarioID          | user id
forumID            | forum id
perguntaID         | question id
respostaID         | answer id
tagID              | tag id
dataCriacao        | creation date
votosPositivos     | number of votes up
votosNegativos     | number of votes down
numeroVisualizacao | number of visualizations
tipo               | type
titulo_pergunta    | Question title
texto_pergunta     | Question text
texto_resposta     | Answer text
comentario_pergunta| Comment on question text
comentario_resposta| Comment on answer text


## Experiments

### Section 4.1 - Reputation and Participation Analysis

- Using dataset 1
- Open folder: reputation_participation 
- Execute: Rscript reputation.R

### Section 4.2 - Quality of Interactions

- Using dataset 1
- Open folder: quality_interaction 
- Execute: Rscript qualityInteraction.R

### Section 4.3 - Users Interactions and Evolution Analysis

- Using dataset 1
- Open folder: interactions_evolution 
- Execute: Rscript evolution.R

### Section 4.4 - Best Answers Analysis

- Using dataset 1
- Open folder: best_answer 
- Execute: Rscript best.R

### Section 4.5 - Discussion Length Analysis

- Using dataset 1 
- Open folder discussion_length/part-1
- Execute: Rscript discussion.R
- Open folder discussion_length/part-2
- Execute: Rscript discussion.R

### Section 5.1 - Correlation Analysis

- Using dataset 1
- Open folder: graph_correlarions 
- Execute: Rscript graph.R


### Section 7.3.1. Top 50 Users with Highest Reputation Grouped by Expertise

- Using dataset 2
- Open folder: grouped_expertise 
- Execute: Rscript table-5.R

### Section 7.3.2. Groups of Users with More Answers

- Using dataset 2
- Open folder: grouped_answers
- Execute: Rscript table-6.R

### Section 7.3.3. Recommendation Testing

- Using dataset 2
- Open folder: recommendation
- Execute: Rscript table-7.R


