## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=F-------------------------------------------------------------------
#  obj=rmtfit(ms(id,time,status)~trt,data)

## ----eval=F-------------------------------------------------------------------
#  obj=rmtfit(id,time,status,trt,type="multistate")

## ----eval=F-------------------------------------------------------------------
#  summary(obj,tau)

## ----eval=F-------------------------------------------------------------------
#  plot(obj,conf=TRUE)

## ----eval=F-------------------------------------------------------------------
#  bouquet(obj)

## ----setup--------------------------------------------------------------------
library(rmt)
head(colon_lev)

## -----------------------------------------------------------------------------
obj=rmtfit(ms(id,time,status)~rx,data=colon_lev)
## print the event numbers by group
obj

# summarize the inference results for tau=7.5 years
summary(obj,tau=7.5)

## ----fig.align='center',fig.width=7.2,fig.height=4.5--------------------------
# set-up plot parameters
oldpar <- par(mfrow = par("mfrow"))
par(mfrow=c(1,2))

# Bouquet plot
bouquet(obj,main="Bouquet plot",cex.group=0.8, xlab="Restricted mean win/loss time (years)",
        ylab="Follow-up time (years)") #cex.group: font size of group labels#
# Plot of RMT in favor of treatment over time
plot(obj,conf=TRUE,col='red',conf.col='blue',conf.lty=2, xlab="Follow-up time (years)",
        ylab="RMT in favor of treatment (years)",main="Overall")
par(oldpar)

## ----fig.align='center',fig.width=7.2,fig.height=4.5--------------------------
# set-up plot parameters
oldpar <- par(mfrow = par("mfrow"))
par(mfrow=c(1,2))

# Plot of component-wise RMT in favor of treatment over time
plot(obj,k=2,conf=TRUE,col='red',conf.col='blue',conf.lty=2, xlab="Follow-up time (years)",
        ylab="RMT in favor of treatment (years)",main="Survival")
plot(obj,k=1,conf=TRUE,col='red',conf.col='blue',conf.lty=2, xlab="Follow-up time (years)",
        ylab="RMT in favor of treatment (years)",main="Pre-relapse")

par(oldpar)

