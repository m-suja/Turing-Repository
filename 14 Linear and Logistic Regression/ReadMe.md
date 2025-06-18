# Task
To perform an analysis and fit a logistic regression model for predicting 10-year risk of coronary heart disease (CHD).

# Source
The dataset is publically available on the Kaggle website, and it is from an ongoing cardiovascular study on residents of the town of Framingham, Massachusetts. The classification goal is to predict whether the patient has 10-year risk of future coronary heart disease (CHD).The dataset provides the patients’ information. It includes over 4,000 records and 15 attributes. Variables Each attribute is a potential risk factor. There are both demographic, behavioral and medical risk factors.

# Data Description
Demographic<br>
1. Sex: male or female("M" or "F")<br>
2. Age: Age of the patient;(Continuous - Although the recorded ages have been truncated to whole numbers, the concept of age is continuous)<br>

Behavioral<br>
3. is_smoking: whether or not the patient is a current smoker ("YES" or "NO")<br>
4. Cigs Per Day: the number of cigarettes that the person smoked on average in one day.(can be considered continuous as one can have any number of cigarettes, even half a cigarette.)<br>

Medical( history )<br>
5. BP Meds: whether or not the patient was on blood pressure medication (Nominal)<br>
6. Prevalent Stroke: whether or not the patient had previously had a stroke (Nominal)<br>
7. Prevalent Hyp: whether or not the patient was hypertensive (Nominal)<br>
8. Diabetes: whether or not the patient had diabetes (Nominal)<br>

Medical(current)<br>
9. Tot Chol: total cholesterol level (Continuous)<br>
10. Sys BP: systolic blood pressure (Continuous)<br>
11. Dia BP: diastolic blood pressure (Continuous)<br>
12. BMI: Body Mass Index (Continuous)<br>
13. Heart Rate: heart rate (Continuous - In medical research, variables such as heart rate though in fact discrete, yet are considered continuous because of large number of possible values.)<br>
14. Glucose: glucose level (Continuous)<br>

Predict variable (desired target)<br>
15. 10 year risk of coronary heart disease CHD(binary: “1”, means “Yes”, “0” means “No”)<br>

# Structure
The structure is as follows:
1. Data Cleaning
2. EDA
3. Data Modelling and Testing
4. Improvements

# Go to [Notebook](https://github.com/TuringCollegeSubmissions/smanan-PYDA.4.4/blob/main/M4S4.ipynb)
