# LSE Data Analytics Portfolio

A collection of data analytics projects completed as part of the LSE Data Analytics Online Career Accelerator. Projects cover a range of analytical techniques including exploratory data analysis, machine learning, NLP, and financial sentiment analysis.

---

## Projects

| Project | Description | Tools |
|--------|-------------|-------|
| [NHS Appointment Data Analysis](#1-nhs-appointment-data-analysis) | EDA and capacity analysis of NHS appointment data | Python, Pandas, Matplotlib, Seaborn |
| [Turtle Games Customer Analytics](#2-turtle-games-customer-analytics) | ML and NLP on retail customer data | Python, R, Scikit-learn, NLTK, VADER |
| [Financial Markets Sentiment Analysis](#3-financial-markets-sentiment-analysis) | FinBERT sentiment analysis correlated with stock returns | Python, HuggingFace Transformers, yFinance |

---

## 1. NHS Appointment Data Analysis

**Files:** `NHS Appointment Data/Trickle_Alex_DA201_Assignment_Notebook.ipynb`

> *Based on real NHS data that has been anonymised prior to analysis.*

An exploratory analysis of NHS appointment data across multiple regional datasets, investigating capacity utilisation, appointment attendance patterns, seasonality, and data quality issues.

**Key areas covered:**
- Data validation and cleaning across multiple joined datasets
- Regional appointment volume analysis and capacity assessment
- Seasonality trends in appointment demand
- Analysis of appointment mode (in-person vs remote) and wait times
- Twitter/social data analysis alongside appointment data
- Recommendations on data quality improvements

**Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`, `datetime`, `re`, `collections`

---

## 2. Turtle Games Customer Analytics

**Files:** `Turtle Games Data Project/Trickle_Alex_DA301_Assignment_Notebook.ipynb`, `Turtle Games Data Project/Trickle_alex_DA301_R_Script.R`

> *This project uses a fictitious dataset created for educational purposes. Turtle Games and all associated data are entirely fictional.*

A multi-technique analysis of customer behaviour for a fictional games retailer, exploring how customers accumulate loyalty points and how their reviews can be used to inform marketing strategy.

**Key areas covered:**
- Loyalty point modelling using linear regression and decision trees
- Customer segmentation via K-Means clustering
- NLP on customer reviews: tokenisation, lemmatisation, and word frequency analysis
- Sentiment analysis using VADER and TextBlob
- Statistical modelling and visualisation in R (ggplot2, corrplot)
- Multiple linear regression in R with goodness-of-fit analysis (R² ≈ 0.84)

**Python libraries:** `pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`, `nltk`, `textblob`, `vaderSentiment`, `wordcloud`, `statsmodels`

**R libraries:** `dplyr`, `ggplot2`, `moments`, `corrplot`, `openxlsx`

---

## 3. Financial Markets Sentiment Analysis

**Files:** `Financial Markets Sentiment Analysis Project/MADYS_Team5_LSE_EP_FinBERT_Sentiment_Analysis.ipynb`

> *All data used in this project is publicly available. News articles were retrieved via the Mediastack API and stock price data via Yahoo Finance.*

A team project investigating whether pre-earnings financial news sentiment — scored using the FinBERT transformer model — can predict abnormal stock returns around earnings announcements for major US tech companies (NVDA, MSFT, GOOGL, AAPL).

**Key areas covered:**
- News article collection and language filtering via the Mediastack API
- Financial sentiment scoring using FinBERT (HuggingFace Transformers)
- Stock return data retrieval and abnormal return calculation via yFinance
- Event study methodology with earnings-window analysis
- OLS regression of sentiment scores against abnormal returns by company
- Critical evaluation of model limitations and data quality constraints

**Libraries:** `pandas`, `numpy`, `torch`, `transformers`, `yfinance`, `seaborn`, `matplotlib`, `statsmodels`, `langdetect`, `dotenv`

---

## Skills & Technologies

| Category | Tools |
|----------|-------|
| **Languages** | Python, R |
| **Data Manipulation** | pandas, numpy, dplyr |
| **Visualisation** | matplotlib, seaborn, ggplot2, corrplot |
| **Machine Learning** | scikit-learn (linear regression, decision trees, K-Means clustering) |
| **NLP & Sentiment** | NLTK, TextBlob, VADER, FinBERT (HuggingFace Transformers) |
| **Statistical Modelling** | statsmodels, OLS regression, R (moments, lm) |
| **Financial Data** | yFinance, event study methodology |
| **APIs** | Mediastack |
