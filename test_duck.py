# import test_duck

# con = test_duck.connect("dev.duckdb")

# print(con.execute("Select * from sales_summary").fetchdf())

import duckdb

con = duckdb.connect("dev.duckdb")
df = con.execute('SELECT * from mart_product_reviews').fetchdf()
print(df)