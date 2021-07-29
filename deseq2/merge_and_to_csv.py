
import os
import glob
import pandas as pd

path = 'deseq_input/*.tsv'
file_extension = '.tsv'
all_filenames = [i for i in glob.glob(f"*{path}")]

headerList = input("Enter column names: ")
headerList = headerList.split()
dataframes_list = []


for file in all_filenames:
    df = pd.read_table(file, index_col=0, header=None)
    dataframes_list.append(df)

for df in dataframes_list:
    df = df[~df[1].astype(str).str.startswith('__')]

dataframe_test = pd.concat(dataframes_list, axis=1)
dataframe_test.index.names = ['ID']
dataframe_test = dataframe_test.apply(pd.to_numeric, errors='coerce').fillna(0, downcast='infer')

dataframe_test.to_csv('readCounts.csv', header=headerList)
print(dataframe_test)


