############ Completely randomized design ############
############    Script for Normality, Homoscedasticity and ANOVA    ############

######## ----------------- Income Data ---------------- ########
Income data: Treatments - TR; Observations - Y 
F<-read.table("soybean peroxide_assumptions.txt")
F
TR<-F[,1]; Y<-F[,2]; TR;Y

######## -------------- Means of Treatments -------------- ########

med <- tapply(Y,FTR,mean,na.rm=T); med

## Box_Plot Graphic per Treatment 
par(mfrow=c(1,1))
plot(Y~FTR)
boxplot(Y~FTR)$out #this line of the script inform the outliers

######## ------------------ Diagnoses ------------------ #########

## -- Basic Graphics: Histogram, BoxPlot and qq-line of Residuos- ##
#install.packages("car")
par(mfrow=c(2,2))
rs <- rstudent(mod);                         # rs = studentized residuals
hist(rs, main="histogram"); boxplot(rs, main="boxplot")
qqnorm(rs, main="normality"); qqline(rs)
require(car); 
qqPlot(rs,main="envelope")

## "Normal distribution test".
##### ---------------- Cramer-von Mises ----------------  #####
# rs <- rstudent(mod)                # Especifique o vetor
#install.packages("nortest")
require(nortest)
cvm.test(rs)
# H0 (data has normal distribution). p>0.05 don't reject H0.


############ -------- Homoscedasticity test ------ ############
#

bartlett.test(Y~FTR)                          # homoscedacity test
 
######## ------------- Means of treatments---------------#########

## means of treatments
med <- tapply(Y,FTR,mean,na.rm=T); med

## Graphic representation of treatment means
lmin <- min(med,na.rm=T); lmax <- max(med,na.rm=T)
barplot(med,ylim=c(lmin,lmax))

######## ---- ANOVA ---- ########

FTR <- as.factor(TR)
FTR

mod <- aov(Y~FTR)
anv <- anova(mod); anv
#(H0=means are equal), when p<0.05 we reject H0#
cv <- 100*sqrt(anv$"Mean Sq"[length(anv$"Mean Sq")])/mean(Y,na.rm=T)
cv

## Comparison of means.
##### -------------------- Tukey Test --------------------  #####
#install.packages("agricolae"); 
require(agricolae)
t_tukey <- HSD.test(mod, "FTR", group=T,alpha=0.05)  # Define alpha
t_tukey

require(agricolae)
t_duncan <- duncan.test(mod,"FTR",alpha=0.05)        # Define alpha
t_duncan

t_snk <- SNK.test(mod, "FTR", alpha=0.05)            # Define alpha
t_snk