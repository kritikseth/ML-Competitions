<h1 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  <a href="https://datahack.analyticsvidhya.com/contest/janatahack-cross-sell-prediction/" target="_blank">
  Analytics Vidhya- JanataHack Cross-sell Prediction
  </a>
</h1>

<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Participation Date:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
   <strong>[LIVE]</strong>  <small>11-09-2020 to 20-09-2020</small>
</p>

<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  TL;DR
</h3>

<details>
<summary>Expand</summary>
  The objective (classification) was to predict the probability a customer would opt for vehicle insurance of a company if the customer already has health insurance from the same company. Evaluation metric was ROC_AUC. The model finalised here was catboost (with early stopping in order to prevent overfitting).
  
  * Public Leaderboard- 0.8583
  * Private Leaderboard- 0.8626

</details>

<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Problem Statement:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
Your client is an Insurance company that has provided Health Insurance to its customers now they need your help in building a model to predict whether the policyholders (customers) from past year will also be interested in Vehicle Insurance provided by the company.

An insurance policy is an arrangement by which a company undertakes to provide a guarantee of compensation for specified loss, damage, illness, or death in return for the payment of a specified premium. A premium is a sum of money that the customer needs to pay regularly to an insurance company for this guarantee.

For example, you may pay a premium of Rs. 5000 each year for a health insurance cover of Rs. 200,000/- so that if, God forbid, you fall ill and need to be hospitalised in that year, the insurance provider company will bear the cost of hospitalisation etc. for upto Rs. 200,000. Now if you are wondering how can company bear such high hospitalisation cost when it charges a premium of only Rs. 5000/-, that is where the concept of probabilities comes in picture. For example, like you, there may be 100 customers who would be paying a premium of Rs. 5000 every year, but only a few of them (say 2-3) would get hospitalised that year and not everyone. This way everyone shares the risk of everyone else.

Just like medical insurance, there is vehicle insurance where every year customer needs to pay a premium of certain amount to insurance provider company so that in case of unfortunate accident by the vehicle, the insurance provider company will provide a compensation (called ‘sum assured’) to the customer.

Building a model to predict whether a customer would be interested in Vehicle Insurance is extremely helpful for the company because it can then accordingly plan its communication strategy to reach out to those customers and optimise its business model and revenue. 

Now, in order to predict, whether the customer would be interested in Vehicle insurance, you have information about demographics (gender, age, region code type), Vehicles (Vehicle Age, Damage), Policy (Premium, sourcing channel) etc.
</p>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Evaluation Metric:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
The evaluation metric for this hackathon is ROC_AUC score.
</p>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Dataset:
</h3>

* [Train](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_train.csv)
* [Test](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_test.csv)
* [Sample Submission](https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_sample_submission.csv)


```
!wget -O 'train.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_train.csv'
!wget -O 'test.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_test.csv'
!wget -O 'sample_submission.csv' 'https://raw.githubusercontent.com/kritikseth/Datasets/master/Analytics%20Vidhya/JanataHack%20Cross-sell%20Prediction/janatahack_cross_sell_prediction_sample_submission.csv'
````


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Scores:
</h3>

<dl>
  <dt>Public Leaderboard- 0.8583</dt>
  <dt>Private Leaderboard- 0.8626</dt>
</dl>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Approach:
</h3>

<p style="color: #333; font-family: 'Muli', sans-serif; margin-bottom: 15px;">
  Data cleaning consists of: log tranformation, label encoding, ordinal encoding, scaling, etc.
  
  Through feature engineering multiple new feaures were formulated
  
  Many models and modelling methods were tried (including stacking, voting), but because of all the categorical variables, catboost performed the bes for us.
</p>


<h3 style="color: 'black'; font-family: 'Lato', sans-serif; font-weight: 300; ">
  Connect with me:
</h3>

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/kritikseth)](https://www.linkedin.com/in/kritikseth)
[![Gmail Badge](https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:sethkritik@gmail.com)](mailto:sethkritik@gmail.com)
[![Medium Badge](https://img.shields.io/badge/-Medium-000000?style=flat-square&labelColor=000000&logo=medium&logoColor=white&link=https://medium.com/@kritikseth)](https://medium.com/@kritikseth)
[![Kaggle Badge](https://img.shields.io/badge/-Kaggle-20BEFF?style=flat-square&logo=Kaggle&logoColor=white&link=https://www.kaggle.com/kritikseth)](https://www.kaggle.com/kritikseth) 


<a href="https://kritikseth.github.io/ipynbtagredirect" target="_parent"><img src="https://raw.githack.com/kritikseth/kritikseth/master/assets/icons/kritik_ipynbtagredirect.svg" alt="Kritik Seth"/></a>
