import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
# Import data
# dtype={x:"category" for x in ["smoke","alcho","active","cardio"]}
df = pd.read_csv(r"medical_examination.csv")

# Add 'overweight' column
df['overweight'] = ((df["weight"] /
                     ((df["height"] / 100)**2)) > 25).astype(int)

# Normalize data by making 0 always good and 1 always bad. If the value of 'cholesterol' or 'gluc' is 1, make the value 0. If the value is more than 1, make the value 1.
for colmn in ["cholesterol", "gluc"]:
    df.loc[df[colmn] == 1, colmn] = 0
    df.loc[df[colmn] >= 1, colmn] = 1
# print(df[["cholesterol", "gluc"]].value_counts())

# print(df.info())


# Draw Categorical Plot
def draw_cat_plot():
    columns = ['cholesterol', 'gluc', 'smoke', 'alco', 'active', 'overweight']

    # Create DataFrame for cat plot using `pd.melt` using just the values from 'cholesterol', 'gluc', 'smoke', 'alco', 'active', and 'overweight'.
    df_cat = df.melt(value_vars=columns, id_vars="cardio")
    # print(df_cat)

    melted = df_cat

    # Group and reformat the data to split it by 'cardio'. Show the counts of each feature. You will have to rename one of the columns for the catplot to work correctly.

    melted = melted.reset_index().groupby(
        ["cardio", "variable", "value"]).agg("count").rename(columns={
            'index': 'total'
        }).reset_index()

    # Get the figure for the output

    catplot = sns.catplot(
        data=melted,
        kind="bar",
        col="cardio",
        hue="value",
        y="total",
        x="variable",
    )
    fig = catplot.figure
    # Do not modify the next two lines
    fig.savefig('catplot.png')
    return fig


# Draw Heat Map


def draw_heat_map():
    # Clean the data
    condition = ((df['ap_lo'] <= df['ap_hi']) &
                 (df['height'] >= df['height'].quantile(0.025)) &
                 (df["height"] <= df["height"].quantile(0.975)) &
                 (df['weight'] >= df['weight'].quantile(0.025)) &
                 (df["weight"] <= df["weight"].quantile(0.975)))
    # print(condition)
    df_heat = df[condition]

    # Calculate the correlation matrix
    corr = df_heat.corr()

    # Generate a mask for the upper triangle
    mask = np.triu(np.ones_like(corr, dtype=bool))
    # print(mask)

    # Set up the matplotlib figure
    fig, ax = plt.subplots(figsize=[10, 10])

    # Draw the heatmap with 'sns.heatmap()'
    sns.heatmap(data=corr,
                mask=mask,
                ax=ax,
                annot=True,
                fmt=".1f",
                linewidths=.5,
                cbar_kws={'shrink': .5})

    # Do not modify the next two lines
    fig.savefig('heatmap.png')
    return fig
