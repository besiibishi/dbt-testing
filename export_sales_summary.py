import duckdb

con = duckdb.connect("dev.duckdb")

df = con.execute("Select * from sales_summary").fetch_df()

# export to csv

df.to_csv("sales_summary.csv", index=False)

print("Exported sales_summary to sales_summary.csv")