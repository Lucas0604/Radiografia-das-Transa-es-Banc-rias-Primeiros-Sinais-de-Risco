-- 1. Liste todas as colunas e os 10 primeiros registros de transacoes, ordenados pela data mais recente.]
SELECT *
FROM bank_transactions_data_2
ORDER BY TransactionDate DESC
LIMIT 10;

-- 2. Quantas transações distintas existem por canal?
SELECT 
	DISTINCT(Channel),
    COUNT(*)
FROM bank_transactions_data_2
GROUP BY Channel;

-- 3. Qual o valor total (SUM) e o valor médio (AVG) transacionado, agrupado por tipo (crédito/débito)?
SELECT 
	TransactionType,
    ROUND(SUM(TransactionAmount)),
    ROUND(AVG(TransactionAmount))
FROM bank_transactions_data_2
GROUP BY TransactionType;

-- 4. Quais são as 10 transações de maior valor? Retorne id_conta, valor, canal e data.
SELECT 
	AccountID,
    TransactionAmount,
    Channel,
    TransactionDate
FROM bank_transactions_data_2
ORDER BY TransactionAmount DESC
LIMIT 10;

-- 5. Quantas contas distintas (DISTINCT id_conta) aparecem na base?
SELECT
	COUNT(DISTINCT AccountID),
    COUNT(*)
FROM bank_transactions_data_2;

-- 6. Qual o valor mínimo, máximo e médio de transação por canal?
SELECT
	Channel,
	MIN(TransactionAmount),
    MAX(TransactionAmount),
    AVG(TransactionAmount)
FROM bank_transactions_data_2
GROUP BY Channel;
	
-- 7. Liste as contas (id_conta) com mais de 5 transações registradas, usando GROUP BY + HAVING.
SELECT 
	AccountID,
    COUNT(*) AS transacoes
FROM bank_transactions_data_2
GROUP BY AccountID
HAVING transacoes > 5
ORDER BY transacoes DESC;

-- 8. Filtre as transações realizadas entre duas datas específicas (escolha um intervalo de 30 dias) 
-- e conte quantas ocorreram.
SELECT COUNT(*)
FROM bank_transactions_data_2
WHERE TransactionDate BETWEEN '2023-05-01%' AND '2023-06-01%';

-- 9. Qual a ocupacao_cliente mais frequente na base? (dica: como uma mesma conta aparece várias vezes, pense se 
-- você precisa de DISTINCT id_conta antes de contar ocupação, ou se contar por transação já responde à pergunta de negócio 
-- pense em qual das duas faz mais sentido aqui).
SELECT 
	CustomerOccupation,
    COUNT(*) AS Qtd
FROM bank_transactions_data_2
GROUP BY CustomerOccupation
ORDER BY Qtd DESC
LIMIT 1;

-- 10. Ordene os canais pelo valor total transacionado, do maior para o menor.
SELECT Channel, ROUND(SUM(TransactionAmount),2) as valor_total
FROM bank_transactions_data_2
GROUP BY Channel
ORDER BY valor_total DESC;

