import sys
sys.path.insert(1, 'C:\\...\\analyst-data-warehouse') # adding repo root to the system path so we can import any module

SYS_PATH = sys.path[1]

CREDENTIAL_PATH=f"{SYS_PATH}\\secret.json"
PROJECT_ID_STRING = ""
DATASET_NAME_STRING = "dimensions"
TABLE_NAME_STRING="d_product"
PATH_TO_CSV = f"{SYS_PATH}\\src\\data_table_product_dimensions\\productDim.csv" 