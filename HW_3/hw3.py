from minio import Minio
import pandas as pd
import io

client = Minio(
    "localhost:9000",
    access_key="minioadmin",
    secret_key="minioadmin",
    secure=False
)

buckets = client.list_buckets()
for bucket in buckets:
    print(bucket.name)

bucket_name = "hw3"
if not client.bucket_exists(bucket_name):
    client.make_bucket(bucket_name)
    print(f"Бакет {bucket_name} создан")

data = {
    'Имя': ['Анна', 'Борис', 'Виктор', 'Дарья'],
    'Возраст': [25, 30, 35, 28],
    'Город': ['Москва', 'Санкт-Петербург', 'Казань', 'Екатеринбург'],
    'Оценка': [4.5, 3.8, 4.2, 4.9]
}
df = pd.DataFrame(data)
print(df)

csv_data = df.to_csv(index=False).encode('utf-8')
csv_stream = io.BytesIO(csv_data)

client.put_object(
    bucket_name,
    "data.csv",
    data=csv_stream,
    length=len(csv_data),
    content_type='text/csv'
)
print("Файл загружен")

response = client.get_object(bucket_name, "data.csv")
downloaded_data = response.read()
response.close()

df_loaded = pd.read_csv(io.BytesIO(downloaded_data))
print(df_loaded)

if df.equals(df_loaded):
    print("Данные совпадают")