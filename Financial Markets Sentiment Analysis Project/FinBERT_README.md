# Financial Markets Sentiment Analysis

> *All data used in this project is publicly available. News articles were retrieved via the Mediastack API and stock price data via Yahoo Finance.*

## Overview

A team project investigating whether pre-earnings financial news sentiment can predict abnormal stock returns around earnings announcements. Sentiment is scored using FinBERT — a transformer model fine-tuned specifically for financial text — and correlated against abnormal returns for four major US technology companies: Nvidia (NVDA), Microsoft (MSFT), Alphabet (GOOGL), and Apple (AAPL).

---

## Objectives

- Collect and filter financial news articles from the Mediastack API for each company
- Score article sentiment using the FinBERT transformer model
- Retrieve stock price data and calculate abnormal returns around earnings dates
- Apply event study methodology to assess whether pre-earnings sentiment predicts abnormal returns
- Evaluate the statistical relationship using OLS regression per company

---

## Key Findings

- Across all four companies, pre-earnings news sentiment showed no statistically significant ability to predict abnormal returns around earnings announcements
- Nvidia showed the strongest (though not significant) positive relationship between sentiment and abnormal returns
- Apple and Alphabet exhibited virtually no relationship
- Low R² values and limited sample sizes (15–16 usable event windows per company) constrained statistical power — an inherent limitation of earnings-based event studies given quarterly reporting cycles

---

## Limitations

- **Sample size:** Earnings-based event windows are narrow by design, resulting in small usable samples despite thousands of articles being collected
- **Data source breadth:** Mediastack returns a wide range of content, including non-financial articles, which introduce noise into the sentiment measure. Specialist financial data providers (e.g. Bloomberg, Refinitiv) would reduce this but require commercial licences
- **FinBERT scope:** While well-suited to financial text, FinBERT treats all articles equally regardless of outlet prominence or market influence

---

## Files

| File | Description |
|------|-------------|
| `MADYS_Team5_LSE_EP_FinBERT_Sentiment_Analysis.ipynb` | Full analysis notebook |

---

## Libraries Used

`pandas` `numpy` `torch` `transformers` `yfinance` `seaborn` `matplotlib` `statsmodels` `langdetect` `python-dotenv`
