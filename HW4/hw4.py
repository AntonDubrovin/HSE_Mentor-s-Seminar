from trino.dbapi import connect
from trino.auth import BasicAuthentication
import pandas as pd

conn = connect(
    host="localhost",
    port=8080,
    user="user",
    catalog="postgresql",
    schema="public",
    auth=BasicAuthentication("user", "")
)

cur = conn.cursor()

cur.execute("SHOW TABLES FROM postgresql.public")
tables = cur.fetchall()
print("Таблицы в базе:")
for table in tables:
    print(table[0])

cur.execute("SELECT * FROM postgresql.public.products LIMIT 5")
results = cur.fetchall()
df = pd.DataFrame(results, columns=[desc[0] for desc in cur.description])
print("\nПервые 5 строк из таблицы products:")
print(df)

cur.execute("""
SELECT category, 
       COUNT(*) as count, 
       AVG(price) as avg_price
FROM postgresql.public.products 
GROUP BY category
""")
results = cur.fetchall()
df_agg = pd.DataFrame(results, columns=[desc[0] for desc in cur.description])
print("Статистика по категориям:")
print(df_agg)

cur.execute("SELECT COUNT(*) as total_rows FROM postgresql.public.products")
total = cur.fetchone()
print(f"Всего строк в таблице: {total[0]}")

cur.close()
conn.close()