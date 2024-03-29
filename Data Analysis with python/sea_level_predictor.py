import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress
import numpy as np


def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv')

    # Create scatter plot
    df.plot(x="Year", y="CSIRO Adjusted Sea Level", kind="scatter")

    # Create first line of best fit
    line1 = linregress(df["Year"], df["CSIRO Adjusted Sea Level"])
    slope = line1.slope
    intercept = line1.intercept
    line_intercepts = np.arange(df["Year"].min(), 2051)
    plt.plot(line_intercepts, slope * line_intercepts + intercept)

    # Create second line of best fit
    recent_df = df[df["Year"] >= 2000]
    line2 = linregress(recent_df["Year"],
                       recent_df["CSIRO Adjusted Sea Level"])
    slope_recent = line2.slope
    intercept_recent = line2.intercept
    line_intercepts_recent = np.arange(recent_df["Year"].min(), 2051)
    plt.plot(line_intercepts_recent,
             slope_recent * line_intercepts_recent + intercept_recent)

    # Add labels and title
    plt.xlabel("Year")
    plt.ylabel("Sea Level (inches)")
    plt.title("Rise in Sea Level")

    if False:  # see in interactive output
        plt.show()

    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()
