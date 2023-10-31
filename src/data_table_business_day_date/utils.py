def create_bq_table(credential_path, project_id_string, dataset_name_string, table_name_string, df, write_type="replace"):
    
    """
    Send a pre-formatted batch tracking file to a designated BigQuery table location

    Parameters
    ----------
    credential_path : string
        path to service account
    project_id_string : string
        project name
    dataset_name_string : string
        dataset name
    table_name_string : string
        table name
    df : DataFrame
        DataFrame of a formatted batch file.
    write_type : string
        "replace" or "append"

    Returns
    -------
    None : None
        writes dataframe to designated BigQuery location
    """
    from google.oauth2 import service_account
    import pandas_gbq
    credentials = service_account.Credentials.from_service_account_file(credential_path)
    

    destination_table_string=dataset_name_string+"."+table_name_string

    schema = [
    {'name': 'Date', 'type': 'DATE'},
    {'name': 'Day', 'type': 'STRING'},
    {'name': 'Weekday', 'type': 'INT64'},
    {'name': 'Week', 'type': 'INT64'},
    {'name': 'Quarter', 'type': 'INT64'},
    {'name': 'Year', 'type': 'INT64'},
    {'name': 'YearHalf', 'type': 'INT64'},
    {'name': 'BusinessDay', 'type': 'BOOLEAN'},
]

    df.to_gbq( # batch_tracking_file
            destination_table=destination_table_string, 
            project_id=project_id_string, 
            chunksize=2000, 
            if_exists=write_type,
            table_schema=schema,
            credentials=credentials)