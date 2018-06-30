# Installing rethinking package
install.packages(c("coda","mvtnorm","devtools","loo"))
library(devtools)
devtools::install_github("rmcelreath/rethinking")


p_grid <- seq(from=0, to=1, length.out = 1000)
p_grid
# Creating an array of values for the prior
prior <- rep(1,1000)
# Finding the likelihood of each of the prior value
likelihood <- dbinom(6, size=9, prob=p_grid)
# Finding the posterior probability for each of the each of prior
posterior <- likelihood*prior
posterior <- posterior/sum(posterior)
# sampling from the prior values in the probability of posterior
samples <- sample(p_grid, prob = posterior, size = 10000, replace = TRUE)
plot(samples)
library(rethinking)
dens(samples)

# probability that the p is less than 0.5
sum(samples<.5)/1000

# getting the 10% and 90% values
quantile(samples, c(.1, .9))
# hdpi of 50%
HPDI(samples, prob = .5)

# Finding the point estimate for the quadratic loss
loss_values <- sapply(prior, function(d) sum(posterior*((d-prior)**2)))

min(loss_values)
# loss_values
# prior
# posterior

rbinom(10, size = 2, prob = .7)
