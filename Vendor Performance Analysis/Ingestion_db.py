import pandas as pd
import os
from sqlalchemy import create_engine
import time
import logging


# Configure logging
logging.basicConfig(
    filename="logs/ingestion_db.log",
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s",
    filemode="a",
)


def connect_to_db(username, password, host, port, database ):
    """Establishes a connection to the PostgreSQL database."""
    return create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}")


def load_raw_data():
    """Load all CSV files from the 'data' directory into PostgreSQL database."""
    start_time = time.time()
    for file in os.listdir('data'):
        if '.csv' in file:
            df = pd.read_csv('data/'+ file)
            logging.info(f"Loaded {file} with {len(df)} records.")
            table_name = file[:-4]  # remove .csv extension
            engine = connect_to_db("username", "password", "localhost", "port", "database")  # replace with actual credentials
            df.to_sql(table_name, engine, if_exists="replace", index=False)
            
    end_time = time.time()
    logging.info(f"Data ingestion completed in {end_time - start_time:.2f} seconds.")
    
if __name__ == "__main__":
    load_raw_data()