import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
from calendar import month_name

register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)

df = pd.read_csv(r"fcc-forum-pageviews.csv",
                 index_col="date",
                 parse_dates=["date"])

# Clean data
bot_thres = df["value"].quantile(0.025)
up_thres = df["value"].quantile(1 - 0.025)
df = df[(df["value"] > bot_thres) & (df["value"] < up_thres)]


def draw_line_plot(df=df):

    # Draw line plot
    fig, ax = plt.subplots()
    df.plot(kind="line", figsize=[16, 5], style="r", ax=ax)
    ax.set_title("Daily freeCodeCamp Forum Page Views 5/2016-12/2019")
    ax.set_xlabel("Date")
    ax.set_ylabel("Page Views")
    plt.xticks(rotation=0)
    # Save image and return fig (don't change this part)
    fig.savefig('line_plot.png', dpi=300)
    # plt.show()
    return fig


def draw_bar_plot(df=df):
    # Copy and modify data for monthly bar plot
    df_bar = df.copy()
    monthly_avg = df_bar.groupby([df_bar.index.year,
                                  df_bar.index.month]).mean()
    monthly_avg.rename_axis(["year", "month"], inplace=True)
    monthly_avg.reset_index(inplace=True)
    fig, ax = plt.subplots(figsize=(20, 8))
    chart = monthly_avg.pivot_table(index="year",
                                    columns="month",
                                    values="value")
    # Draw bar plot
    chart.plot(kind="bar", ax=ax, width=0.8)

    ax.set_xlabel("Years")
    ax.set_ylabel("Average Page Views")
    plt.legend(month_name[1:])

    # Save image and return fig (don't change this part)
    fig.savefig('bar_plot.png')
    # plt.show()
    return fig


def draw_box_plot():
    # Prepare data for box plots (this part is done!)
    df_box = df.copy()
    df_box.reset_index(inplace=True)

    df_box['Year'] = df_box["date"].dt.year
    df_box['Month'] = df_box["date"].apply(lambda date: date.strftime('%b'))
    df_box["month_no"] = df_box["date"].dt.month

    #print(df_box)

    # Draw box plots (using Seaborn)
    fig, ax = plt.subplots(ncols=2, figsize=[18, 6])
    sns.boxplot(data=df_box, x="Year", y="value", hue="Year", ax=ax[0])
    sns.boxplot(data=df_box.sort_values(by="month_no"),
                x="Month",
                y="value",
                hue="Month",
                ax=ax[1])
    ax[0].set_title("Year-wise Box Plot (Trend)")
    ax[1].set_title("Month-wise Box Plot (Seasonality)")

    for a in ax:
        a.set_ylabel("Page Views")
    # Save image and return fig (don't change this part)
    #plt.show()

    fig.savefig('box_plot.png')
    return fig


"""
old same output

def draw_bar_plot():
    # Copy and modify data for monthly bar plot
    df_bar = df.copy()
    colors=plt.cm.tab20
    colors=[colors(i) for i in range(20)]

    monthly_avg = df_bar.groupby(
        [df_bar.index.year, df_bar.index.month]).mean()
    monthly_avg.rename_axis(["year","month"],inplace=True)

    df_reset=monthly_avg.reset_index()

    fig, ax = plt.subplots(figsize=(12, 8))
    nmonths=12+1

    df_reset["tim"]=df_reset["year"]+df_reset["month"]/nmonths

    #df_reset.set_index("tim",inplace=True)
    print(df_reset)


    # Draw bar plot
    if 0:
        sns.barplot(x='month', y='value', data=df_reset)

    elif 0:
        for year in df_reset['year'].unique():
            year_data = df_reset[df_reset['year'] == year]
            plt.bar(year_data.index, year_data['value'], label=str(year))
    else:
        bar_width=1/nmonths
        for i in range (1,13):
            cur_df=df_reset[df_reset["month"]==i]
            plt.bar(cur_df["tim"],cur_df["value"],color=colors[i],width=bar_width)
    ax.set_title("Daily freeCodeCamp Forum Page Views 5/2016-12/2019")
    ax.set_xlabel("Date")
    ax.set_ylabel("Page Views")
    plt.legend(month_name[1:])
    # plt.tight_layout()

    # Save image and return fig (don't change this part)
    plt.show()
    exit()
    fig.savefig('bar_plot.png')
    return fig
# IAMAJAYPRO
    """
