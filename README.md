Breast Cancer Tumor Feature Analysis & Biomarker Exploration:

A small attempt to identify statistically significant tumor features (potential biomarkers) and evaluate their predictive ability using logistic regression.

# Overview

This project analyzes breast cancer tumor data to identify significant features (potential biomarkers) and build a predictive model to classify tumors as malignant (M) or benign (B).

# Objectives
- Perform exploratory data analysis
- Identify statistically significant tumor features
- Rank features based on importance (biomarker exploration)
- Build a logistic regression model for prediction
- Evaluate model performance

# Dataset
- 569 observations
- Multiple numerical features describing tumor characteristics
- Target variable: diagnosis (M = Malignant, B = Benign)
  
# Workflow

1. Data Cleaning
Removed unnecessary columns (id, empty column)
Converted diagnosis to factor

2. Exploratory Analysis
Checked class distribution
Visualized tumor radius differences using boxplots

3. Statistical Analysis
Performed t-tests on key features:
radius_mean
texture_mean
area_mean
perimeter_mean
Identified statistically significant differences

4. Biomarker Exploration
Ranked all features using p-values
Selected top features as potential biomarkers

5. Correlation Analysis
Generated correlation heatmap
Identified relationships between tumor features

6. Model Building
Logistic Regression used
Trained on 70% of data
Tested on 30% of data

7. Model Evaluation
Confusion Matrix
Accuracy calculation
ROC Curve and AUC score
Results
Accuracy: ~92%
AUC: ~0.97
Strong separation between malignant and benign tumors

# Visualizations:

- Boxplot
- Correlation Heatmap
- ROC Curve

# Tools & Libraries
- R
- tidyverse
- ggplot2
- corrplot
- pROC
- Conclusion

This project demonstrates how statistical testing and machine learning can be combined to identify important tumor features and build an accurate predictive model.

Author
Merik Patel
