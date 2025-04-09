select * from logs_v2;
select * from transactions_v2;


-- 4.1
select currency, SUM(amount) from transactions_v2 where currency in ("USD", "EUR", "RUB") group by currency;

-- 4.2.
select is_fraud, COUNT(*) as COUNT, SUM(amount) as MAX_AMOUNT, AVG(amount) as AVG_AMOUNT from transactions_v2 group by is_fraud;

-- 4.3.
select TO_DATE(transaction_date), COUNT(*) as COUNT, SUM(amount) as SUM_AMOUNT, AVG(amount) as AVG_AMOUNT from transactions_v2 group by TO_DATE(transaction_date);

-- 4.4.
select HOUR(transaction_date), COUNT(*) as COUNT, SUM(amount) as SUM_AMOUNT, AVG(amount) as AVG_AMOUNT from transactions_v2 group by HOUR(transaction_date);

-- 4.5.
select transaction_id, COUNT(*) from transactions_v2 tv left join logs_v2 lv on lv.transactionid = tv.transaction_id group by transaction_id order by count(*) desc