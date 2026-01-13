# Import lib
import pandas as pd


#Load Dataset
df=pd.read_csv('stocks.csv')
#check
df.head()
df.info()
df.shape

# Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')
df.columns

# convert data column to database
df['date'] = pd.to_datetime(df['date'],errors='coerce')

#convert numeric column correct data types
numeric_cols = ['open','high','low','close','adj_close','volume']

df[numeric_cols]= df[numeric_cols].apply(pd.to_numeric,errors='coerce')

#remove rows with missing values
df = df.dropna()

#remove duplicate rows
df = df.drop_duplicates()

#remove logically incorrect records (high<low)
df=df[df['high']>=df['low']]

#sort data for consistency
df = df.sort_values(by=['ticker','date'])

#reset index
df.reset_index(drop=True,inplace=True)

#save cleaned dataset
df.to_csv('stocks.csv',index=False)