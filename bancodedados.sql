-- criando dataBase
CREATE DATABASE ControleEstoque;
USE ControleEstoque;

-- Dando privilegios para os usuario
CREATE USER 'admin'@'localhost' IDENTIFIED by 'senha_admin';
GRANT ALL PRIVILEGES ON controleestoque.* to 'admin'@'localhost';

create user 'comprador'@'localhost'	identified BY 'senha_comprador';
create user 'vendedor'@'localhost' identified by 'senha_vendedor';

-- Criando tabelas de produtos, entradas e saidas
create table produtos (
		id_produto INT auto_increment primary key,
		nome_produto varchar (255),
        descricao text,
        preco_unitario decimal(10, 2)
        );
        
create table ENTRADAS_ESTOQUES (
        id_entrada INT auto_increment primary key,
        id_produto int,
        quantidade int,
        data_entrada date,
        foreign key (id_produto) references produtos (id_produto)
        );
        
create table SAIDA_ESTOQUES (
        id_saida INT auto_increment primary key,
        id_produto int,
        quantidade int,
        data_saida date,
        foreign key (id_produto) references produtos (id_produto)
        );
        
-- Criando insert para produtos

insert into produtos (nome_produto, descricao, preco_unitario)
		values ('ip Black Carolina Herrera', 'Perfume Masculino Eau De Parfum 200ml', '555.99');
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('ip Black Carolina Herrera', 'Perfume Masculino Eau De Parfum 200ml', 555.99);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Paco Rabanne', '1 Million Pour Homme Edt 200ml', 529.00);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Ferrari Black', 'Masculino Eau De Toilette - 125ml', 172.99);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('PERFUME PACO RABANNE INVICTUS', 'VICTORY MASCULINO EAU DE PARFUM', 590.99);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Bad Boy Eau de Toilette', 'Carolina Herrera', 479.00);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Egeo Spicy Vibe', 'Desodorante Colônia 90ml', 51.90);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Explorer Eau de Parfum', 'MontBlanc', 369.99);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Colônia Masculina Cr7', 'Play It Cool, Jequiti, 100 Ml', 129.00);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Perfume Sauvage Masculino', 'Eau de Parfum 100ml', 820.00);
insert into PRODUTOS (nome_produto, descricao, preco_unitario) values ('Calvin Klein', 'Perfume Ck Be Edt 200Ml, Calvin Klein', 237.99);

SELECT * from controleestoque.produtos
where id_produto = 1;

-- Criando a Entrada de estoque
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (1, 80, '2014-12-11');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (1, 90, '2016-11-31');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (1, 20, '2011-1-1');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (2, 88, '2005-05-1');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (2, 11, '2002-02-2');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (2, 22, '2009-09-9');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (3, 90, '2007-07-22');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (4, 88, '2012-09-12');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (5, 122, '2023-02-26');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (6, 43, '2016-09-7');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (7, 77, '2009-01-8');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (8, 100, '2001-05-31');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (9, 888, '2017-11-27');
insert into ENTRADAS_ESTOQUES (id_produto, quantidade, data_entrada) values (10, 453, '1999-12-29');


SELECT * from controleestoque.entradas_estoque;


-- Criando a saida de estoque

insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (1, 55, '2019-06-');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (1, 66, '2016-06-19');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (1, 77, '2013-06-15');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (2, 22, '2022-11-5');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (2, 33, '2023-09-1');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (2, 11, '2011-01-12');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (3, 80, '2009-07-28');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (4, 20, '2015-10-02');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (5, 100, '2023-10-30');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (6, 10, '2017-11-02');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (7, 44, '2022-06-09');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (8, 90, '2009-02-05');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (9, 444, '2020-09-21');
insert into SAIDA_ESTOQUES (id_produto, quantidade, data_saida) values (10, 251, '2023-09-31');

-- comando para ver tabelas
select * from controleestoque.saida_estoques;

-- selecionar um item que voce queira
select * from controleestoque.produtos where  nome_produto like '%-%';

-- calcular o total de entradas de estoque para cada produto
select id_produto, SUM(quantidade) as total_entradas
from controleestoque.SAIDA_ESTOQUES
group by id_produto;


-- usando inner join para somar tabelas
select 
	tbproduto.id_produtos,
    tbproduto.nome_produtos,
    tbentrada.total_entrada,
    tbsaida.total_saida,
    (tbentrada.total_entrada) - (tbsaida.total_saida) as saldo_atual
    from controleestoque.produtos tbprodutos
    inner join (select id_produtos, SUM(quantidade) as total_entrada
			from controleestoque.ENTRADAS_ESTOQUES
            group by id_produtos) tbentrada
            on tbprodutos.id_produtos = tbentrada.id_produtos
	inner join (select id_produtos, SUM(quantidade) as total_saida
            from controleestoque.SAIDA_ESTOQUES
            group by id_produtos) tbsaida
            on tbproduto.id_produto = tbsaida.id_produtos; 
	
-- Alterar a quantidade de uma entrada de estoque
update controleestoque.entradas_estoques set quantidade = 60 where id_entrada = 1;
update controleestoque.entradas_estoques set quantidade = 650 where id_entrada = 10;
update controleestoque.entradas_estoques set quantidade = 960 where id_entrada = 5;


-- Selecionando todos os produtos
select * from produtos;

-- Listando as operações  de entrada
select id_entrada, data_entrada from ENTRADAS_ESTOQUES where data_entrada between '2014-01-01' and '2023-01-01';

-- listando as operações de saida
select * from SAIDA_ESTOQUES where data_saida = '2009-01-12';

-- calculando o total de cada produto
select id_produto, sum(quantidade) as total_entradas from entradas_estoques group by id_produto;




