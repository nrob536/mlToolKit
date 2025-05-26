# Example R code
data <- genEmploymentData(200)  # Or your processed survival data
write.csv(data, "./dat/employment_survival_data.csv", row.names = FALSE)

# If you want to export estimated survival from survfit
km_fit <- survfit(Surv(Time, Event) ~ 1, data = data)
surv_summary <- summary(km_fit)
df_km <- data.frame(time = surv_summary$time,
                    surv = surv_summary$surv,
                    lower = surv_summary$lower,
                    upper = surv_summary$upper)
write.csv(df_km, "./dat/km_survival_curve.csv", row.names = FALSE)
