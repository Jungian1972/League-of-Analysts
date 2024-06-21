##Produces a win/lose data set of size N
N = 4000
Simulated_Data <- rbinom(size = 1, n = N, prob = .5)

##Calculates the confidence interval.. typical frequentist approach
Confidence_Interval <- qbinom(p = c(0.025, 0.975), size = length(Simulated_Data), prob = mean(Simulated_Data))/length(Simulated_Data)
Confidence_Interval

##Calculates the Bayesian Credibility Interval which is similar to the confidence interval, but has an easier interpretation
Credibility_Interval <- c() %>%
  append(qbeta(0.025, (length(Simulated_Data)-sum(Simulated_Data == 1)+1), (sum(Simulated_Data == 1)+1))) %>%
  append(qbeta(0.975, (length(Simulated_Data)-sum(Simulated_Data == 1)+1), (sum(Simulated_Data == 1)+1)))
Credibility_Interval  
         