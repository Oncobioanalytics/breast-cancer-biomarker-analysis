# Loading Libraries:

install.packages(c("tidyverse", "corrplot"))
library(tidyverse)
library(corrplot)
library(pROC)

# Loading Data:

data <- read.csv("data.csv")

head(data)
str(data)

# Data Cleaning:

data <- data %>%
  select(-id, -X)

data$diagnosis <- as.factor(data$diagnosis)

# Understanding Target

table(data$diagnosis)
prop.table(table(data$diagnosis))

# Visualization:

ggplot(data, aes(x = diagnosis, y = radius_mean, fill = diagnosis)) +
  geom_boxplot() +
  labs(title = "Tumor Radius Distribution by Diagnosis") +
  theme_minimal()

# Statistical Testing (Biomarker Check):

t.test(radius_mean ~ diagnosis, data = data)
t.test(texture_mean ~ diagnosis, data = data)
t.test(area_mean ~ diagnosis, data = data)
t.test(perimeter_mean ~ diagnosis, data = data)

# Correlation Analysis:

cor_matrix <- cor(data %>% select(-diagnosis))
corrplot(cor_matrix, method = "color")

# Biomarker Ranking:

p_values <- sapply(data %>% select(-diagnosis), function(x) {
  t.test(x ~ data$diagnosis)$p.value
})

p_values <- sort(p_values)

p_values

# Visualization of Top Biomarkers:

top_features <- names(p_values)[1:5]

for(feature in top_features) {
  print(
    ggplot(data, aes_string(x = "diagnosis", y = feature, fill = "diagnosis")) +
      geom_boxplot() +
      ggtitle(feature) +
      theme_minimal()
  )
}

# Train-Test Split:

set.seed(123)

train_index <- sample(1:nrow(data), 0.7 * nrow(data))

train_data <- data[train_index, ]

test_data <- data[-train_index,]

# Logistic Regression Model:

model <- glm(diagnosis ~ radius_mean + texture_mean + perimeter_mean,
             data = train_data,
             family = binomial)

summary(model)

# Prediction:

pred_prob <- predict(model, newdata = test_data, type = "response")

pred_class <- ifelse(pred_prob > 0.5, "M", "B")

# Evaluation:

### For Matrix:

table(Predicted = pred_class, Actual = test_data$diagnosis)

### Accuracy:

mean(pred_class == test_data$diagnosis)

# ROC Curve

install.packages("pROC")
library(pROC)

roc_obj <- roc(test_data$diagnosis, pred_prob)

plot(roc_obj)

auc(roc_obj)
