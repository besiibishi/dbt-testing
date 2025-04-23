# import test_duck

# con = test_duck.connect("dev.duckdb")

# print(con.execute("Select * from stg_patients").fetchdf())

import duckdb

con = duckdb.connect("dev.duckdb")
df = con.execute("SELECT * FROM doctor_summary").fetchdf()
print(df)