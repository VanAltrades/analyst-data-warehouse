import datetime
import sys
import os
# sys.path.insert(1, 'C:\\...\\analyst-data-warehouse') # adding repo root to the system path so we can import any module
# sys.path.append('../..')

# SYS_PATH = sys.path[0]
# PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
SRC_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.append(SRC_ROOT)
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
CREDENTIAL_PATH = os.path.join(PROJECT_ROOT, 'secret.json')


# CREDENTIAL_PATH=f"{SYS_PATH}\\secret.json"
PROJECT_ID_STRING = "e-commerce-demo-v"
DATASET_NAME_STRING = "raw"
TABLE_NAME_STRING="dimDateBusinessDays"