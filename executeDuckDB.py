import duckdb

con = duckdb.connect('dev.duckdb')

con.execute("""
CREATE TABLE raw_payments AS 
SELECT *
FROM (VALUES
    (1, 101, 50.00, '2023-10-01'),
    (2, 102, 75.00, '2023-10-02'),
    (3, 101, 20.00, '2023-10-03')
) AS t(payment_id, customer_id, amount, payment_date);
""")

con.close()