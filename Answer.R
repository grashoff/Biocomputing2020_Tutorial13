# Set parameter and state variable values
N = 100:1000000
M = 100:1000000
rN = 0.1
rM = 0.1
K = 1000000
# Plot quantities of interest
par(mfrow=c(1,2))
plot(N,rN*N*(1-(N+M)/K),type='l',lwd=2,xlab="N",ylab="N(t+1)-N(t)")
abline(h=0,lty=3)
lines(M,rM*M*(1-(N+M)/K),type='l', col = "blue")
rM = 0.05
lines(N,(rN*N*(1-(N+M)/K)*(-1)),type='l', col = "red")
lines(M,rM*M*(1-(N+M)/K),type='l', col = "green")