"""
------------------------------------------------------
create a dummy table for product information
------------------------------------------------------

how is created this dummy table
______________________________________________________

saved a list of distinct products from our ga dimensions table
    select distinct product_id
    from `e-commerce-demo-v.dimensions.ga`

here we assume that your company has an accurate table with product information that can be joined to the ga dims table

I exported the sql results to a google sheet and applied the following functions
price: =RANDBETWEEN(5,125)
title_length: =LEN(A2)
has description: =if(RAND()>0.5,TRUE,FALSE)
description_length: =IF(D2=TRUE,,RANDBETWEEN(50,350))
has_image: =if(RAND()>0.5,TRUE,FALSE)
lead_time: =RANDBETWEEN(1,5)
gender: =IF(REGEXMATCH(A2,"women"),"F",IF(REGEXMATCH(A2,"men"),"M",))

then i exported the csv to this directory
"""

from config import SYS_PATH, CREDENTIAL_PATH, PROJECT_ID_STRING,DATASET_NAME_STRING,TABLE_NAME_STRING, PATH_TO_CSV
import pandas as pd
from src.utils import create_bq_table

def main():
    # set the csv with dummy data as a dataframe object
    df = pd.read_csv(PATH_TO_CSV)
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