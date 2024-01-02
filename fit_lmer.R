library(lmerTest)
fit_lmer <- function(predictor, data) {
  formula <- as.formula(paste("probit.case ~ ", predictor, " + time + (time|iso_code)"))
  
  model <- lmer(formula, data = data, REML = FALSE, lmerControl(optimizer = "bobyqa"))
  bic_value <- bic(model)
  bic_value$npi = predictor
  return(bic_value)
}