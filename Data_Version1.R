############################################################
# 1. نصب و فراخوانی پکیج‌های پرکاربرد تحلیل داده
############################################################

install.packages(c(
  "tidyverse",
  "data.table",
  "readxl",
  "ggplot2",
  "caret",
  "corrplot",
  "randomForest",
  "xgboost"
))

library(tidyverse)
library(data.table)
library(readxl)
library(ggplot2)
library(caret)
library(corrplot)
library(randomForest)
library(xgboost)


############################################################
# 2. وارد کردن داده‌ها
############################################################

# CSV File
data <- read.csv("data.csv")

# Excel File
data_excel <- read_excel("data.xlsx")

# مشاهده داده‌ها
head(data)
tail(data)

# ساختار داده
str(data)

# خلاصه آماری
summary(data)


############################################################
# 3. مدیریت داده‌ها (Data Cleaning)
############################################################

# تعداد مقادیر گمشده در هر ستون
colSums(is.na(data))

# حذف ردیف‌های دارای مقدار گمشده
data_clean <- na.omit(data)

# جایگزینی Missing Values با میانگین
data$column[is.na(data$column)] <- mean(
  data$column,
  na.rm = TRUE
)


# حذف ستون
data <- data %>%
  select(-column_name)


# تغییر نام ستون‌ها
data <- data %>%
  rename(
    new_name = old_name
  )


############################################################
# 4. انتخاب و فیلتر داده‌ها
############################################################

# انتخاب ستون‌ها
data %>%
  select(column1, column2)


# فیلتر کردن داده‌ها

data %>%
  filter(age > 30)


# مرتب‌سازی

data %>%
  arrange(age)


# ایجاد ستون جدید

data <- data %>%
  mutate(
    new_variable = column1 / column2
  )


############################################################
# 5. آمار توصیفی (Descriptive Statistics)
############################################################

mean(data$column)

median(data$column)

sd(data$column)

var(data$column)

min(data$column)

max(data$column)


# تعداد نمونه‌ها

nrow(data)

ncol(data)


############################################################
# 6. تحلیل همبستگی (Correlation Analysis)
############################################################

# ماتریس همبستگی

cor_matrix <- cor(
  data,
  use="complete.obs"
)

print(cor_matrix)


# نمایش Heatmap همبستگی

corrplot(
  cor_matrix,
  method="color"
)


############################################################
# 7. مصورسازی داده‌ها با ggplot2
############################################################


# Scatter Plot

ggplot(data, aes(
  x = column1,
  y = column2
)) +
  geom_point()


# Line Plot

ggplot(data, aes(
  x=time,
  y=value
)) +
  geom_line()


# Histogram

ggplot(data, aes(
  x=value
)) +
  geom_histogram(
    bins=30
  )


# Boxplot

ggplot(data, aes(
  x=group,
  y=value
)) +
  geom_boxplot()


# نمودار میله‌ای

ggplot(data, aes(
  x=category
)) +
  geom_bar()



############################################################
# 8. تقسیم داده به Train و Test
############################################################

set.seed(123)

index <- createDataPartition(
  data$target,
  p=0.8,
  list=FALSE
)

train <- data[index,]

test <- data[-index,]


############################################################
# 9. رگرسیون خطی (Linear Regression)
############################################################


model_lm <- lm(
  target ~ feature1 + feature2,
  data=train
)


summary(model_lm)


# Prediction

prediction <- predict(
  model_lm,
  test
)


############################################################
# 10. ارزیابی مدل Regression
############################################################


# RMSE

RMSE(
  prediction,
  test$target
)


# R2

R2(
  prediction,
  test$target
)


############################################################
# 11. Random Forest
############################################################


rf_model <- randomForest(
  target ~ .,
  data=train,
  ntree=500
)


prediction_rf <- predict(
  rf_model,
  test
)


RMSE(
  prediction_rf,
  test$target
)


############################################################
# 12. XGBoost Model
############################################################


train_matrix <- xgb.DMatrix(
  data = as.matrix(
    train[,-which(names(train)=="target")]
  ),
  label=train$target
)


test_matrix <- xgb.DMatrix(
  data = as.matrix(
    test[,-which(names(test)=="target")]
  )
)


xgb_model <- xgboost(
  data=train_matrix,
  nrounds=100,
  objective="reg:squarederror"
)


prediction_xgb <- predict(
  xgb_model,
  test_matrix
)



############################################################
# 13. PCA (Principal Component Analysis)
############################################################


pca <- prcomp(
  data,
  scale=TRUE
)


summary(pca)


plot(
  pca
)



############################################################
# 14. خوشه‌بندی K-means
############################################################


clusters <- kmeans(
  data,
  centers=3
)


clusters$cluster



############################################################
# 15. آزمون‌های آماری
############################################################


# T-test

t.test(
  group1,
  group2
)


# ANOVA

anova_model <- aov(
  value ~ group,
  data=data
)

summary(anova_model)



############################################################
# 16. ذخیره خروجی‌ها
############################################################


write.csv(
  data,
  "processed_data.csv"
)


saveRDS(
  model_lm,
  "model.rds"
)


############################################################
# 17. گزارش سریع داده‌ها
############################################################


glimpse(data)

describe(data)