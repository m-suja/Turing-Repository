# Task
Analyze the A/B test and provide recommendations.

**Notes**

The dataset is aggregated by LocationID, PromotionID and week. You should aggregate by LocationID and PromotionID before conducting the statistical tests.
Since there are three marketing campaigns and you have to select the best-performing one, you will have to conduct several tests, comparing campaigns against one another. This kind of testing is known as pairwise comparisons and it suffers from the multiple testing problem - if we run a lot of tests, there’s an increased chance of getting a type I error (false positive). It is therefore suggested to use the confidence level of 99% instead of the traditional 95%.

# Results and Conclusion
**Fast Food Marketing Campaign A/B Test Analysis**						
								
**Scenario**	

A fast-food chain plans to add a new item to its menu. However, they are still undecided between three possible marketing campaigns for promoting the new product. In order to determine which promotion has the greatest effect on sales, the new item is introduced at locations in several randomly selected markets. A different promotion is used at each location, and the weekly sales of the new item are recorded for the first four weeks.								
								
**Goal**		

Evaluate A/B testing results and decide which marketing strategy works the best.								
								
**Target Metric**	

SalesInThousands: sales amount for a specific LocationID and Promotion								
								
**Data Preparation**	

Aggregate Fast Food Marketing Campaign data by campaign groups (e.g., Campaign A(1) , Campaign B (2) , Campaign C(3)) using [SQL](https://github.com/m-suja/Turing-Repository/blob/main/10%20A%3AB%20Testing/AB%20test%20SQL).								
								
**Calculations**	

The table contains the numbers necessary to analyze the A/B test and reach a decision.  You can find the query in SQL sheet.								

| Metric              | Campaign A   | Campaign B   | Campaign C   |
|--------------------|-------------|-------------|-------------|
| **Mean Sales**     | 232.40      | 189.32      | 221.46      |
| **Standard Deviation (SD)** | 64.11       | 57.99       | 65.54       |
| **Sample Size (n)** | 43          | 47          | 47          |					
				
								
**Hypothesis**	

Here I have analysed three fast food marketing campaign by using pairwise comparison. 								
For testing, I compare each campaign with one another i.e. A vs B, B vs C and C vs A and attempt to evaluate my hypothesis. The hypothesis are: from the test. I use t-tests as we compare the mean sales in multiple groups.								
								
**For A vs B**	

H0 (Null Hypothesis): There is no statistically significant difference between campaign A and campaign B.								
H1 (Alternative Hypothesis): There is a statistically significant difference between Campaign A and Campaign B.								
								
**For B vs C**

H0 (Null Hypothesis): There is no statistically significant difference between campaign B and campaign C.								
H1 (Alternative Hypothesis): There is a statistically significant difference between Campaign B and Campaign C.								
								
**For C vs A**

H0 (Null Hypothesis): There is no statistically significant difference between campaign C and campaign A.								
H1 (Alternative Hypothesis): There is a statistically significant difference between Campaign C and Campaign A.								
								
**Calculations**

Using the Evan Miller A/B Test Calculator, I ran the t-test, the result of which are given below:								
								
## 📊 Pairwise Comparison of Campaigns

| Comparison  | Significant at 95% | Significant at 99% | P-value  |
|------------|-------------------|-------------------|----------|
| **A vs B** | ✅ Yes            | ✅ Yes            | 0.00128  |
| **B vs C** | ✅ Yes            | ❌ No             | 0.0136   |
| **C vs A** | ❌ No             | ❌ No             | 0.43     |				
								
**Bonferroni Adjustment**

Using Bonferroni adjustment at 95% confidence level:								
Adjusted alpha =	0.01666666667							
								
**Conclusion**							

1. Campaign A:
   - Appears to outperform Promotion B (statistically significant) at both confidence level and with Bonferroni adjustment.
   - No significant difference compared to Promotion C, but the strong performance against B suggests A is likely the best.								
								
2. Campaign B:
   - The result is statistically significant at the 95% confidence level but not significant at the 99% confidence level.
   - This suggests a moderate difference between Promotions B and C.
   - Action: While Promotion B may show better performance than Promotion C at 95%, the evidence is not strong enough at 99%, so further investigation may be needed.								
								
3. Campaign C:
   - Shows no significant difference compared to A.
   - Performs moderately differently from B at the 95% confidence level but not robustly.								
								
I also used Bonferroni adjustment at 95% confidence interval to reduce Type I errors. As p value for A < adjusted alpha, we can clearly reject the null hypothesis. Hence, we reject the null hypothesis and accept the alternative hypothesis.								
								
**Next Steps**							
- Choose Promotion A as the top-performing promotion based on its strong significant difference from B and comparable performance with C.								
- Consider further testing or segmentation analysis to understand if specific market factors (e.g., MarketSize, AgeOfStore) influence these results.								
  
