Timber Volume Estimation
========================================================
author: Mohd Azil Noor Salleh
date: Mon Feb 01 03:06:52 2016
transition: rotate

Executive Summary
========================================================
Overview

The program is utilized the Black Cherry Trees datasets (trees) in r. The purpose to to estimate the volume of timber produce by the trees using multivariate linear regression


```
lm(formula, data, subset, weights, na.action, method = "qr", 
    model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
    contrasts = NULL, offset)
```

Black Cherry Tree Data set
========================================================
This data set provides measurements of the girth, height and volume of timber in 31 felled black cherry trees. 
A data frame with 31 observations on 3 variables.

1. Girth	->numeric	tree diameter in inches
2. Height	->numeric	height in ft
3. Volume	->numeric	Volume of timber in cubic ft

First 3 observation

```r
head(trees,3)
```

```
  Girth Height Volume
1   8.3     70   10.3
2   8.6     65   10.3
3   8.8     63   10.2
```

Multivariate Linear Regression
========================================================
Building the predictor model:

```r
treesReg = lm(Volume ~ Girth + Height, data=trees)
summary(treesReg)
```

```

Call:
lm(formula = Volume ~ Girth + Height, data = trees)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.4065 -2.6493 -0.2876  2.2003  8.4847 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -57.9877     8.6382  -6.713 2.75e-07 ***
Girth         4.7082     0.2643  17.816  < 2e-16 ***
Height        0.3393     0.1302   2.607   0.0145 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 3.882 on 28 degrees of freedom
Multiple R-squared:  0.948,	Adjusted R-squared:  0.9442 
F-statistic:   255 on 2 and 28 DF,  p-value: < 2.2e-16
```

Estimate volume of timber produced 
========================================================
Use predict function. Feed the build model, and user input. Example: Girth = 19 inch and height = 80 ft

```r
newTree <- data.frame(Girth=19,Height=80)
predict(treesReg, newTree)[[1]]
```

```
[1] 58.60749
```
This value will be show at the shinyapps after user submit the input. Follow below links

Shiny apps: https://azilnoor.shinyapps.io/Developing-Data-Products/

Git Hub   :https://github.com/azilnoor/Developing-Data-Products
