using CSV, DataFrames, Plots

# Read the survival curve data exported from R
km_data = CSV.read(string(pwd(),"/mlToolKit/dat/km_survival_curve.csv"), DataFrame)



# Plot survival curve with confidence intervals
plot(
    km_data.time, km_data.surv,
    ribbon = (km_data.surv .- km_data.lower, km_data.upper .- km_data.surv),
    xlabel = "Time",
    ylabel = "Survival Probability",
    title = "Kaplan-Meier Survival Curve",
    legend = false,
    lw = 2
)

savefig(string(pwd(),"/mlToolKit/figures/survival-plot.png"))  # Save plot as PNG
