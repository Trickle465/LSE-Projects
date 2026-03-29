# NHS Appointment Data Analysis

> *Based on real NHS data that has been anonymised prior to analysis.*

## Overview

An exploratory data analysis of NHS appointment records, investigating how the health service utilises its capacity, how patients attend (or miss) appointments, and where data quality issues may be limiting accurate reporting.

The analysis draws on four datasets covering actual appointment durations, regional appointment volumes, national category breakdowns, and related social media (Twitter) data.

---

## Objectives

- Assess whether NHS daily appointment capacity (1.2 million) is being exceeded
- Identify regional variation in appointment volumes
- Explore seasonality in appointment demand across the year
- Analyse appointment attendance rates and wait times
- Investigate social sentiment alongside appointment trends
- Highlight data quality issues and make recommendations

---

## Key Findings

- Total appointment capacity does not appear to be exceeded nationally, however regional allocation of that capacity relative to population demand could not be assessed due to data limitations
- General Practice dominates appointment volumes, accounting for approximately 91.5% of all appointments
- Demand is lower in summer months and peaks in autumn, potentially linked to seasonal behaviour patterns such as school term start
- The number of missed appointments remained broadly consistent month-to-month, suggesting the types of appointments most frequently missed are not general practice consultations
- A concerning upward trend in wait times exceeding two weeks was identified in the final three months of the dataset
- Data quality is a significant issue — unmapped or unknown values appear across every categorical field, with Service Setting having the second largest category as "Unmapped"

---

## Recommendations

- Regional capacity data should be broken down and compared against regional demand for more accurate analysis
- Data entry processes should be updated to reduce unmapped/unknown values through improved system validation and staff training
- The increase in long wait times in the final months warrants further investigation

---

## Files

| File | Description |
|------|-------------|
| `Trickle_Alex_DA201_Assignment_Notebook.ipynb` | Full analysis notebook |

---

## Libraries Used

`pandas` `numpy` `matplotlib` `seaborn` `datetime` `re` `collections`
