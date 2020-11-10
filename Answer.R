currentN = 100
currentM = 100
r=0.1
K=1000000
timesteps=100

mod = data.frame(time=1:timesteps, noneNorm=rep(0,timesteps), noneMut=rep(0,timesteps), drugMut=rep(0,timesteps), drugNorm=rep(0,timesteps))

mod[1,2] = currentN
mod[1,3] = currentM
mod[1,4] = currentM
mod[1,5] = currentN

for(t in 2:timesteps){
  mod[t,2] <- mod[t-1, 2]+r*mod[t-1, 2]*(1-((mod[t-1, 2]+mod[t-1,3])/K))
  mod[t,3] <- mod[t-1, 3]+r*mod[t-1, 3]*(1-((mod[t-1, 2]+mod[t-1,3])/K))  
}

r1=0.05
r2= -0.1
for(t in 2:timesteps){
  mod[t,4] <- mod[t-1, 4]+r1*mod[t-1, 4]*(1-((mod[t-1, 4]+mod[t-1,5])/K))
  mod[t,5] <- mod[t-1, 5]+r2*mod[t-1, 5]*(1-((mod[t-1, 4]+mod[t-1,5])/K))  
}



mod2<-data.frame(time=c(mod$time,mod$time,mod$time),N=c(mod$noneNorm, mod$drugMut, mod$drugNorm),sim=rep(c("Normal, no drug","mutant popl with drug","normal popl with drug"),each=timesteps))

library(ggplot2)
ggplot(data=mod2,aes(x=time,y=N,color=sim)) + 
  geom_line() +
  theme_classic()