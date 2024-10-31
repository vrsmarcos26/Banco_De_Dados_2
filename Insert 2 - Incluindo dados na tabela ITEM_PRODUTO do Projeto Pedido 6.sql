-- 1. Produto 207 para todos os pedidos pares e ano menor 2018, com a quantidade 100 e preço unitário R$ 10.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 207, NUMERO, 100, 10.00, 100 * 10.00
FROM PEDIDO
WHERE MOD(NUMERO, 2) = 0 AND EXTRACT(YEAR FROM DATA) < 2018;

-- 2. Produto 206 para todos os pedidos ímpares e ano igual 2018, com a quantidade 50 e preço unitário R$ 12.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 206, NUMERO, 50, 12.00, 50 * 12.00
FROM PEDIDO
WHERE MOD(NUMERO, 2) = 1 AND EXTRACT(YEAR FROM DATA) = 2018;

-- 3. Produto 207 para todos os pedidos pares e ano igual 2018, com a quantidade 150 e preço unitário R$ 14.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 207, NUMERO, 150, 14.00, 150 * 14.00
FROM PEDIDO
WHERE MOD(NUMERO, 2) = 0 AND EXTRACT(YEAR FROM DATA) = 2018;

-- 4. Produto 206 para todos os pedidos ímpares e ano menor 2018, com a quantidade 200 e preço unitário R$ 8.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 206, NUMERO, 200, 8.00, 200 * 8.00
FROM PEDIDO
WHERE MOD(NUMERO, 2) = 1 AND EXTRACT(YEAR FROM DATA) < 2018;

-- 5. Produto 208 para todos sem endereço de entrega e ano igual 2017, com a quantidade 80 e preço unitário R$ 18.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 208, NUMERO, 80, 18.00, 80 * 18.00
FROM PEDIDO
WHERE RUA IS NULL AND EXTRACT(YEAR FROM DATA) = 2017;

-- 6. Produto 208 para todos sem endereço de entrega e ano igual 2018, com a quantidade 70 e preço unitário R$ 20.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 208, NUMERO, 70, 20.00, 70 * 20.00
FROM PEDIDO
WHERE RUA IS NULL AND EXTRACT(YEAR FROM DATA) = 2018;

-- 7. Produto 202 para todos pedidos com endereço de entrega e dia ímpar de entrega, com a quantidade 60 e preço unitário R$ 15.00
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 202, NUMERO, 60, 15.00, 60 * 15.00
FROM PEDIDO
WHERE RUA IS NOT NULL AND TO_CHAR(PRAZO_ENTREGA, 'DD') IN ('1', '3', '5', '7', '9', '11', '13', '15', '17', '19', '21', '23', '25', '27', '29', '31');

-- 8. Produto 205 para todos pedidos com endereço de entrega e dia par da data do pedido, com a quantidade 90 e preço unitário R$ 11.50
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 205, NUMERO, 90, 11.50, 90 * 11.50
FROM PEDIDO
WHERE RUA IS NOT NULL AND TO_CHAR(DATA, 'DD') IN ('2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30');

-- 9. Produto 203 para todos pedidos com endereço de entrega e dia ímpar da data de pedido, com a quantidade 550 e preço unitário R$ 21.35
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 203, NUMERO, 550, 21.35, 550 * 21.35
FROM PEDIDO
WHERE RUA IS NOT NULL AND TO_CHAR(DATA, 'DD') IN ('1', '3', '5', '7', '9', '11', '13', '15', '17', '19', '21', '23', '25', '27', '29', '31');

-- 10. Produto 204 para todos pedidos sem endereço de entrega e dia par da data do pedido, com a quantidade 150 e preço unitário R$ 25.85
INSERT INTO ITEM_PRODUTO (CODIGO_PRO, NUMERO_PED, QUANTIDADE, PRECO_UNITARIO, VALOR_ITEM)
SELECT 204, NUMERO, 150, 25.85, 150 * 25.85
FROM PEDIDO
WHERE RUA IS NULL AND TO_CHAR(DATA, 'DD') IN ('2', '4', '6', '8', '10', '12', '14', '16', '18', '20', '22', '24', '26', '28', '30');
