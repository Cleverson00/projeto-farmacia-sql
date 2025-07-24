-- ###############################################################
--  PROJETO: SISTEMA DE FARMÁCIA - MÓDULO MYSQL (GEEK UNIVERSITY)
--  Foco: Modelagem, DDL, DML, Consultas SQL (DQL - Joins, Agregações)
-- ###############################################################

-- Autor: Cleverson Moura Andrade
/*
Descrição: Este script SQL contém a implementação completa de um banco de dados para um sistema de farmácia,
desenvolvido durante o Módulo MySQL Parte 2 do curso "Bancos de Dados SQL e NoSQL do Básico ao Avançado"
da Geek University (Udemy).

O projeto abrange:
- Criação da estrutura do banco de dados e tabelas (DDL).
- Inserção de dados de teste (DML).
- Realização de consultas SQL básicas e complexas, utilizando:
    - Filtros (WHERE) e Ordenação (ORDER BY)
    - Diferentes tipos de JOINS (INNER JOIN, LEFT JOIN) para combinar dados de múltiplas tabelas.
    - Funções de agregação (SUM, COUNT) e agrupamento de dados (GROUP BY, HAVING).
    - Aliases para tabelas e colunas.
- Demonstração da aplicação de UPDATE e DELETE com foco na integridade referencial.
*/

-- ###############################################################
--  BANCO DE DADOS: FARMACIA
--  Foco: Criação de Estrutura (DDL) e Inserção de Dados (DML)
-- ###############################################################

-- Remover o banco de dados se ele já existir para garantir um início limpo
DROP DATABASE IF EXISTS farmacia;
CREATE DATABASE farmacia;
USE farmacia;

-- Criação das Tabelas (DDL)
-- Adaptei a tabela produtos_compra para incluir um ID, essencial para receitas_medica
CREATE TABLE tipos_produtos (
    id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE fabricantes (
    id INT NOT NULL AUTO_INCREMENT,
    fabricante VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medicos (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    cep VARCHAR(10),
    localidade VARCHAR(100),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE produtos (
    id INT NOT NULL AUTO_INCREMENT,
    produto VARCHAR(100) NOT NULL,
    designacao TEXT,
    composicao TEXT,
    preco_venda DECIMAL(10, 2) NOT NULL,
    id_tipo_produto INT NOT NULL,
    id_fabricante INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo_produto) REFERENCES tipos_produtos(id),
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

CREATE TABLE compras (
    id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE produtos_compra (
    id INT NOT NULL AUTO_INCREMENT,
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_compra) REFERENCES compras(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE receitas_medica (
    id INT NOT NULL AUTO_INCREMENT,
    id_produto_compra INT NOT NULL,
    id_medico INT NOT NULL,
    receita VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (id_produto_compra) REFERENCES produtos_compra(id),
    FOREIGN KEY (id_medico) REFERENCES medicos(id)
);

-- Inserindo dados de teste (DML)
-- Tipos Produtos
INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Diversos');

-- Fabricantes
INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (fabricante) VALUES ('Palmolive');

-- Medicos
INSERT INTO medicos (nome, crm) VALUES ('Alfredo Muniz', '123123SP');
INSERT INTO medicos (nome, crm) VALUES ('Fernanda Ailva', '3423423MG');
INSERT INTO medicos (nome, crm) VALUES ('Julieta Santana', '56546SC');

-- Clientes
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
    VALUES ('Felicity Jones','Rua da Paz, 34', '(11) 2345-8899', '34.567-098', 'Santos', '234.789.433-98');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
    VALUES ('Angelina Jolie','Rua do Ipiranga, 456', '(21) 7544-3234', '56.654-567', 'Rio de Janeiro', '345.678.234-12');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf)
    VALUES ('Ricardo Chavez','Rua Certa, 678', '(21) 2678-3984', '12.4569-223', 'Planaltina', '786.123.445-31');

-- Produtos
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
    VALUES ('Dipirona', 'Dores em geral', 'Metilpropileno', '12.44', 1, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
    VALUES ('Sabonete', 'Limpeza', 'Sei lah', '3.56', 2, 2);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
    VALUES ('Protetor Solar', 'Protetor Solar', 'Soro de abacate', '98.12', 2, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante)
    VALUES ('Dorflex', 'Dores de cabeca', 'Anador', '8.99', 1, 1);

-- Compras
INSERT INTO compras (id_cliente, data) VALUES (1, '2019-03-10');
INSERT INTO compras (id_cliente, data) VALUES (2, '2019-04-15');
INSERT INTO compras (id_cliente, data) VALUES (1, '2019-05-18');

-- Produtos Compra
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 1, 2); -- ID 1
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 2, 3); -- ID 2
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (2, 3, 1); -- ID 3
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (3, 1, 1); -- ID 4

-- Receitas Medicas
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (3, 2, 'receita2.pdf');
INSERT INTO receitas_medica (id_produto_compra, id_medico, receita) VALUES (4, 1, 'receita3.pdf');

-- ###############################################################
--  CONSULTAS SQL (DQL)
--  Foco: Seleção, Filtro, Ordenação, Joins e Agregações
-- ###############################################################

-- Consultas Simples
SELECT * FROM tipos_produtos;
SELECT id FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos ORDER BY tipo ASC;

SELECT * FROM fabricantes;
SELECT * FROM medicos;
SELECT * FROM clientes;
SELECT * FROM compras;

SELECT * FROM produtos_compra WHERE quantidade > 2;

SELECT * FROM receitas_medica;

-- Consultas Complexas (com JOINs e Agregações)

-- Exemplo: Listar ID da compra, nome do cliente e data da compra.
SELECT com.id AS Id_Compra,
       cli.nome AS Cliente,
       com.data AS Data_Compra
FROM compras AS com
  INNER JOIN clientes AS cli
    ON com.id_cliente = cli.id;

-- Exemplo: Incluir nome do produto e quantidade comprada em cada compra.
SELECT cp.id AS Id_Compra,
       cli.nome AS Cliente,
       cp.data AS Data_Compra,
       prod.produto AS Produto,
       procom.quantidade AS Quantidade
FROM compras AS cp
  INNER JOIN clientes AS cli
  ON cp.id_cliente = cli.id
    INNER JOIN produtos_compra AS procom
    ON procom.id_compra = cp.id
      INNER JOIN produtos AS prod
      ON prod.id = procom.id_produto;

-- Exemplo: Exibir ID da compra, nome do cliente, valor total de cada compra e data da compra.
SELECT comp.id AS Id_Compra,
       cli.nome AS Cliente,
       comp.data AS Data_Compra,
       SUM(prod.preco_venda * procom.quantidade) AS Valor_Total
FROM compras AS comp
  INNER JOIN clientes AS cli
  ON comp.id_cliente = cli.id
    INNER JOIN produtos_compra AS procom
    ON procom.id_compra = comp.id
      INNER JOIN Produtos AS prod
      ON prod.id = procom.id_produto
GROUP BY comp.id, cli.nome, comp.data;

-- Exercício: Listar ID da compra, nome do cliente, nome do produto e nome do médico que prescreveu a receita.
SELECT comp.id AS Id_Compra,
       cli.nome AS Cliente,
       prod.produto AS Produto,
       med.nome AS Médico
FROM compras AS comp
  INNER JOIN clientes AS cli
  ON cli.id = comp.id_cliente
    INNER JOIN produtos_compra AS procom
    ON procom.id_compra = comp.id
      INNER JOIN receitas_medica AS recmed
      ON recmed.id_produto_compra = procom.id
        INNER JOIN medicos AS med
        ON med.id = recmed.id_medico
          INNER JOIN produtos AS prod
          ON prod.id = procom.id_produto;

-- Exercício: Clientes com Compras e Seus Produtos
SELECT comp.id AS Id_Compra,
       cli.nome AS Cliente,
       comp.data AS Data,
       prod.produto AS Produto,
       procom.quantidade AS Quantidade
FROM clientes AS cli
  INNER JOIN compras AS comp
  ON comp.id_cliente = cli.id
    INNER JOIN produtos_compra AS procom
    ON procom.id_compra = comp.id
      INNER JOIN produtos AS prod
      ON prod.id = procom.id_produto;

-- Exercício de Fixação 2: Resumo de Vendas por Fabricante
SELECT fabri.fabricante AS Fabricantes,
       SUM(prod.preco_venda * procom.quantidade) AS Valor_Total_Vendas
FROM fabricantes AS fabri
  INNER JOIN produtos AS prod
  ON prod.id_fabricante = fabri.id
    INNER JOIN produtos_compra AS procom
    ON procom.id_produto = prod.id
GROUP BY fabri.fabricante;

-- Exercício: Médicos e Produtos Receitados (Mesmo que não tenham sido comprados)
SELECT med.nome AS Médico,
       prod.produto AS Produto_Prescrito
FROM medicos AS med
  LEFT JOIN receitas_medica AS recmed
  ON recmed.id_medico = med.id
    LEFT JOIN produtos_compra AS procom
    ON procom.id = recmed.id_produto_compra
      LEFT JOIN produtos AS prod
      ON prod.id = procom.id_produto;

-- ###############################################################
--  OPERAÇÕES DML Adicionais (UPDATE e DELETE)
--  Foco: Alteração e Exclusão Segura de Dados
-- ###############################################################

-- Exemplo de UPDATE: Alterar o tipo de produto com ID 3 para 'Higiene Pessoal'
UPDATE tipos_produtos
SET tipo = 'Higiene Pessoal'
WHERE id = 3;

-- Exemplo de UPDATE: Alterar o preço de venda e designação de um produto
UPDATE produtos
SET preco_venda = 15.00, designacao = 'Novo design para dores'
WHERE id = 1;

-- Exemplo de DELETE (Seguro): Remover uma receita médica e, depois, o item de compra
-- NOTA: Remover o item de compra id=2 para demonstração de delete
-- DESCOMENTE AS LINHAS ABAIXO PARA EXECUTAR O DELETE
-- DELETE FROM receitas_medica WHERE id_produto_compra = 2;
-- DELETE FROM produtos_compra WHERE id = 2;

-- Exemplo de DELETE (com erro de chave estrangeira, se tentar diretamente)
-- DESCOMENTE A LINHA ABAIXO PARA VER O ERRO DE CHAVE ESTRANGEIRA
-- DELETE FROM produtos WHERE id = 1;