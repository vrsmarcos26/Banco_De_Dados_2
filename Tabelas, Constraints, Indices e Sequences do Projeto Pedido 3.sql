-- SOLUÇÃO 1)
alter table PEDIDO
add constraint CK_NUMERO_PEDIDO check (NUMERO BETWEEN 1 AND 99999);
-- SOLUÇÃO 2)
CREATE UNIQUE INDEX IND_CNPF_PF
ON PF (CNPF DESC);
CREATE UNIQUE INDEX IND_CNPF_PJ
ON PJ (CNPJ DESC)
-- SOLUÇÃO 3)
drop sequence SEQ_ITEM_ID;
create sequence SEQ_ITEM_ID start with 2 increment by 2;