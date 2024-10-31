
-- SOLUÇÃO 1)
/*==============================================================*/
/* Table: PEDIDO */
/*==============================================================*/
DROP TABLE PEDIDO CASCADE CONSTRAINT;
create table PEDIDO (
NUMERO NUMBER(6) not null,
DATA DATE not null,
PRAZO_ENTREGA DATE,
RUA varchar2(80),
NR NUMBER(4),
BAIRRO varchar2(50),
COMPLEMENTO varchar2(100),
CIDADE varchar2(50),
UF varchar2(2),
CEP varchar2(10),
TOTAL_FATURA NUMBER(8,2),
CODIGO_CLI NUMBER not null,
MATRICULA_VEN NUMBER not null
);
/*==============================================================*/
/* Table: ITEM_PRODUTO */
/*==============================================================*/
DROP TABLE ITEM_PRODUTO;
create table ITEM_PRODUTO (
CODIGO_PRO NUMBER not null,
NUMERO_PED NUMBER(6) not null,

QUANTIDADE NUMBER(5) not null,
PRECO_UNITARIO NUMBER(5,2) not null,
VALOR_ITEM NUMBER(7,2)
);
/*==============================================================*/
/* Table: CAPACIDADE_ESTOQUE */
/*==============================================================*/
DROP TABLE CAPACIDADE_ESTOQUE;
create table CAPACIDADE_ESTOQUE (
CODIGO_PRO NUMBER not null,
CODIGO_PRA NUMBER(3) not null,
QUANTIDADE NUMBER(5) not null
);
/*==============================================================*/
/* Table: ESTOQUE */
/*==============================================================*/
DROP TABLE ESTOQUE;
create table ESTOQUE (
DATA_ENTRADA DATE not null,
CODIGO_PRO NUMBER not null,
CODIGO_PRA NUMBER(3) not null,
QUANTIDADE NUMBER(5) not null,
DATA_VALIDADE DATE
);

-- SOLUÇÃO 2)
alter table PEDIDO
ADD constraint PK_PEDIDO primary key (NUMERO);
alter table ITEM_PRODUTO
ADD constraint PK_ITEM_PRODUTO primary key (CODIGO_PRO, NUMERO_PED);
alter table CAPACIDADE_ESTOQUE
ADD constraint PK_CAPACIDADE_ESTOQUE primary key (CODIGO_PRO, CODIGO_PRA);
alter table ESTOQUE
ADD constraint PK_ESTOQUE primary key (CODIGO_PRO, CODIGO_PRA,
DATA_ENTRADA);

-- SOLUÇÃO 3)
alter table PEDIDO
add constraint FK_PED_VENDEDOR foreign key (MATRICULA_VEN)

references VENDEDOR (MATRICULA);
alter table PEDIDO
add constraint FK_PED_CLIENTE foreign key (CODIGO_CLI)
references CLIENTE (CODIGO);
alter table ITEM_PRODUTO
add constraint FK_ITEM_PEDIDO foreign key (NUMERO_PED)
references PEDIDO (NUMERO);
alter table ITEM_PRODUTO
add constraint FK_ITEM_PRODUTO foreign key (CODIGO_PRO)
references PRODUTO (CODIGO);
alter table CAPACIDADE_ESTOQUE
add constraint FK_CAP_EST_PRATELEIRA foreign key (CODIGO_PRA)
references PRATELEIRA (CODIGO);
alter table CAPACIDADE_ESTOQUE
add constraint FK_CAP_EST_PRODUTO foreign key (CODIGO_PRO)
references PRODUTO (CODIGO);
alter table ESTOQUE
add constraint FK_EST_PRATELEIRA foreign key (CODIGO_PRA)
references PRATELEIRA (CODIGO);
alter table ESTOQUE
add constraint FK_EST_PRODUTO foreign key (CODIGO_PRO)
references PRODUTO (CODIGO);