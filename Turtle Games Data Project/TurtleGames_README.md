# Turtle Games Customer Analytics

> *This project uses a fictitious dataset created for educational purposes. Turtle Games and all associated data are entirely fictional.*

## Overview

A multi-technique customer analytics project for a fictional games retailer, combining machine learning, statistical modelling, and natural language processing to understand customer behaviour and loyalty point accumulation. The analysis spans both Python and R, reflecting a real-world workflow where different tools are used for different stages of analysis.

---

## Objectives

- Understand what drives customer loyalty point accumulation
- Segment customers into meaningful behavioural clusters
- Assess whether customer reviews can be used to inform marketing campaigns
- Build and evaluate predictive models for loyalty points in both Python and R

---

## Key Findings

**Loyalty Points**
- Spending score and remuneration are the strongest predictors of loyalty point accumulation
- A multiple linear regression model built in R achieved an R² of approximately 0.84, indicating strong explanatory power
- Age becomes statistically significant when controlling for spending score and remuneration, though its effect size is small

**Customer Segmentation**
- K-Means clustering identified distinct customer segments based on spending behaviour and remuneration, providing a basis for targeted marketing

**Sentiment Analysis**
- The vast majority of customer reviews carry positive sentiment, with compound VADER scores strongly skewed towards +1
- Review summaries show more neutral sentiment than full reviews, functioning more as concise descriptors than expressions of opinion

---

## Files

| File | Description |
|------|-------------|
| `Trickle_Alex_DA301_Assignment_Notebook.ipynb` | Main Python analysis notebook |
| `Trickle_alex_DA301_R_Script.R` | R script for EDA, correlation analysis, and regression modelling |

---

## Libraries Used

**Python:** `pandas` `numpy` `scikit-learn` `matplotlib` `seaborn` `statsmodels` `nltk` `textblob` `vaderSentiment` `wordcloud`

**R:** `dplyr` `ggplot2` `moments` `corrplot` `openxlsx`
