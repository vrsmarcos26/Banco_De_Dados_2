/*BD2 - 2o Bim -Atividade de SQL - Exercícios de DML - Update - Alterando dados na tabela
ITEM_PRODUTO do Projeto Pedido
Queries implementadas na linguagem SQL aplicadas no SGBDR Oracle, apoiadas no
SqlDeveloper. Utilizar o MER Físico e BD Pedido disponibilizado para treinamento da disciplina
de Banco de Dados.
Alterar dados na tabela ITEM_PRODUTO em conformidade com os enunciados a seguir:*/

-- a. Para os itens dos pedidos de NUMERO menor que 20 e maior que 50, com e produtos com código de 203 a 205, inclusive: Multiplicar a QUANTIDADE por 2
-- RESOLUÇÃO:
UPDATE ITEM_PRODUTO
SET QUANTIDADE = QUANTIDADE * 2
WHERE NUMERO_PED < 20 OR NUMERO_PED > 50
  AND CODIGO_PRO BETWEEN 203 AND 205;

-- b. Para o cliente de CODIGO ímpar com vendedor de MATRICULA par: somar 15 na QUANTIDADE.
-- RESOLUÇÃO:
UPDATE ITEM_PRODUTO IP
SET QUANTIDADE = QUANTIDADE + 15
WHERE EXISTS (
  SELECT 1
  FROM PEDIDO P
  WHERE P.NUMERO = IP.NUMERO_PED
    AND MOD(P.CODIGO_CLI, 2) = 1
    AND MOD(P.MATRICULA_VEN, 2) = 0
);

-- c. Para pedidos com NUMERO múltiplo de 3: Retirar R$ 0.50 no valor de cada preço unitário.
-- RESOLUÇÃO:
UPDATE ITEM_PRODUTO
SET PRECO_UNITARIO = PRECO_UNITARIO - 0.50
WHERE NUMERO_PED IN (
  SELECT NUMERO
  FROM PEDIDO
  WHERE MOD(NUMERO, 3) = 0
);

-- d. Ajustar o valor total de cada item de produto no pedido (VALOR_ITEM), em conformidade com a quantidade e preço unitário.
-- RESOLUÇÃO:
UPDATE ITEM_PRODUTO
SET VALOR_ITEM = QUANTIDADE * PRECO_UNITARIO;

-- e. Ajustar o total da fatura de todos os pedidos, em conformidade com os valores dos itens incluídos em cada pedido.
-- RESOLUÇÃO:
UPDATE PEDIDO P
SET TOTAL_FATURA = (
  SELECT SUM(IP.VALOR_ITEM)
  FROM ITEM_PRODUTO IP
  WHERE IP.NUMERO_PED = P.NUMERO
)
WHERE P.NUMERO IN (
  SELECT DISTINCT NUMERO_PED
  FROM ITEM_PRODUTO
);

COMMIT; -- Confirma as alterações no banco de dados
