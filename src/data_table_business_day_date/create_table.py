import datetime
import pandas as pd
from config import PROJECT_ROOT,SRC_ROOT,CREDENTIAL_PATH, PROJECT_ID_STRING,DATASET_NAME_STRING,TABLE_NAME_STRING
print(PROJECT_ROOT,SRC_ROOT)
from utils import create_bq_table


def generate_daily_date_table(start='2000-01-01', end='2050-12-31'):
    """
    generate a pandas dataframe with daily dates ranging from start to end dates.
    """
    df = pd.DataFrame({"Date": pd.date_range(start, end)})
    df['Date'] = pd.to_datetime(df['Date'])
    df["Day"] = df.Date.dt.day_name()
    df["Weekday"] = df.Date.dt.weekday
    df['Week'] = df['Date'].dt.isocalendar().week
    df['Week'] = df['Week'].astype('int32')
    df["Quarter"] = df.Date.dt.quarter
    df["Year"] = df.Date.dt.year
    df["YearHalf"] = (df.Quarter + 1) // 2
    return df

def is_business_day(date):
    """
    Returns True if the date is a business day, False otherwise.
    """

    # Check if the date is a weekend.
    if date.weekday() == 5 or date.weekday() == 6:
        return False

    
    # Check if the date is a holiday.
    year = date.year

    # hoidays are not exact, and more holidays may be relevant to you
    holidays = [
    datetime.date(year, 1, 1),      # New Year's Day
    datetime.date(year, 3, 8),      # Good Friday
    datetime.date(year, 3, 15),     # Easter Monday
    datetime.date(year, 5, 29),     # Memorial Day
    datetime.date(year, 7, 4),      # Independence Day
    datetime.date(year, 9, 5),      # Labor Day
    datetime.date(year, 11, 11),    # Veterans Day
    datetime.date(year, 12, 25),    # Christmas Day
    ]
    for holiday in holidays:
        if date == holiday:
            return False

    return True
    
def main():
    # generate table across past and future dates
    df = generate_daily_date_table()
    # add a column that determines whether a date is a business day
    df['BusinessDay'] = df['Date'].apply(lambda row : is_business_day(row))
    # send your table to a designated BigQuery dataset
    create_bq_table(
        credential_path=CREDENTIAL_PATH,
        project_id_string=PROJECT_ID_STRING,
        dataset_name_string=DATASET_NAME_STRING,
        table_name_string=TABLE_NAME_STRING,
        df=df,
        write_type="replace"
        )

if __name__ == "__main__":
    main()