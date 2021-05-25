## ---- echo = FALSE, message = FALSE-------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=F-------------------------------------------------------------------
#  obj=rmtfit(rec(id,time,status)~trt,data)

## ----eval=F-------------------------------------------------------------------
#  obj=rmtfit(id,time,status,trt,type="recurrent")

## ----eval=F-------------------------------------------------------------------
#  summary(obj,tau,Kmax)

## ----eval=F-------------------------------------------------------------------
#  summary(obj,tau,Kmax=1)

## ----eval=F-------------------------------------------------------------------
#  plot(obj,conf=TRUE)

## ----eval=F-------------------------------------------------------------------
#  bouquet(obj,Kmax)

## ----setup--------------------------------------------------------------------
library(rmt)
head(hfaction)

## -----------------------------------------------------------------------------
obj=rmtfit(rec(patid,time,status)~trt_ab,data=hfaction)
## print the event numbers by group
obj

# summarize the inference results for tau=3.5 years
# 
summary(obj,tau=3.5,Kmax=4)

## -----------------------------------------------------------------------------
# summarize the inference results for hospitalization as a whole
obj_sum=summary(obj,tau=3.5,Kmax=1)
obj_sum$tab

## ----fig.align='center',fig.width=7.2,fig.height=4.5--------------------------
# set-up plot parameters
oldpar <- par(mfrow = par("mfrow"))
par(mfrow=c(1,2))

# Bouquet plot
bouquet(obj,Kmax=4,main="Bouquet plot",cex.group=0.8, xlab="Restricted mean win/loss time (years)", 
        ylab="Follow-up time (years)", cex.main=0.8) #cex.group: font size of group labels#
# Plot of RMT in favor of treatment over time
plot(obj,conf=TRUE,col='red',conf.col='blue',conf.lty=2, xlab="Follow-up time (years)",
        ylab="RMT in favor of treatment (years)",main="Exercise training vs usual care",
     cex.main=0.8)
par(oldpar)

