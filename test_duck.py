import test_duck

con = test_duck.connect("dev.duckdb")

print(con.execute("Select * from stg_patients").fetchdf())