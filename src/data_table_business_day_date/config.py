import datetime
import sys
sys.path.insert(1, 'C:\\...\\analyst-data-warehouse') # adding repo root to the system path so we can import any module

SYS_PATH = sys.path[1]

CREDENTIAL_PATH=f"{SYS_PATH}\\secret.json"
PROJECT_ID_STRING = ""
DATASET_NAME_STRING = "raw"
TABLE_NAME_STRING="dimDateBusinessDays"