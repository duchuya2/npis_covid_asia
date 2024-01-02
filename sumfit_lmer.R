library(lmerTest)
sumfit_lmer <- function(predictor, data) {
  formula <- as.formula(paste("probit.case ~ ", predictor, " + time + (time|iso_code)"))
  model <- lmer(formula, data = data, REML = FALSE, lmerControl(optimizer = "bobyqa"))
  sum_model <- as.data.frame(summary(model)[["coefficients"]])
  sum_model$predictor = predictor
  return(sum_model)
}