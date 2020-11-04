<h1 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  <a href="https://datahack.analyticsvidhya.com/contest/janatahack-independence-day-2020-ml-hackathon/" target="_blank">
    Analytics Vidhya- JanataHack Independence Day 2020
  </a>
</h1>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Problem Statement:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
  Researchers have access to large online archives of scientific articles. As a consequence, finding relevant articles has become more difficult. Tagging or topic modelling provides a way to give token of identification to research articles which facilitates recommendation and search process.
  Given the abstract and titles for a set of research articles, predict the topics for each article included in the test set. 
Note that a research article can possibly have more than 1 topics. The research article abstracts are sourced from the following 6 topics:
</p>


* Computer Science
* Mathematics
* Physics
* Statistics
* Quantitative Biology
* Quantitative Finance


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Evaluation Metric:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
Submissions are evaluated on micro F1 Score between the predicted and observed topics for each article in the test set
</p>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Dataset:
</h3>

* [Train](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_train.csv)
* [Test](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_test.csv)
* [Sample Submission](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_sample_submission.csv)


```
!wget -O 'train.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_train.csv'
!wget -O 'test.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_test.csv'
!wget -O 'sample_submission.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Independence%20Day%202020%20/janatahack_independence_day_2020_sample_submission.csv'
````


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Scores:
</h3>

<dl>
  <dt>Public Leaderboard- 0.7527</dt>
  <dt>Private Leaderboard- 0.7466</dt>
</dl>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Approach:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
  Data was cleaned using a python package I made- <a href="https://pypi.org/project/swachhdata/">swachhdata</a>
  
  Many models were tried like: LGBM, SVC, Logistic but in the end XGBoost was selected.
</p>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Connect with me:
</h3>

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/kritikseth)](https://www.linkedin.com/in/kritikseth)
[![Gmail Badge](https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:sethkritik@gmail.com)](mailto:sethkritik@gmail.com)
[![Medium Badge](https://img.shields.io/badge/-Medium-000000?style=flat-square&labelColor=000000&logo=medium&logoColor=white&link=https://medium.com/@kritikseth)](https://medium.com/@kritikseth)
[![Kaggle Badge](https://img.shields.io/badge/-Kaggle-20BEFF?style=flat-square&logo=Kaggle&logoColor=white&link=https://www.kaggle.com/kritikseth)](https://www.kaggle.com/kritikseth) 


<a href="https://kritikseth.github.io/ipynbtagredirect" target="_parent"><img src="https://raw.githack.com/kritikseth/kritikseth/master/assets/icons/kritik_ipynbtagredirect.svg" alt="Kritik Seth"/></a>
