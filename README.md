# Projeto SQL: Sistema de Gerenciamento de Farmácia (Módulo MySQL)

Este repositório contém o script SQL completo para a implementação de um banco de dados de um sistema de farmácia. O projeto foi desenvolvido como parte do **Módulo MySQL (Parte 2)** do curso **"Bancos de Dados SQL e NoSQL do Básico ao Avançado"** da **Geek University** (Udemy).

## Sobre o Projeto:

O objetivo deste projeto prático foi consolidar conhecimentos em modelagem e manipulação de bancos de dados relacionais utilizando MySQL. Ele demonstra um fluxo completo, desde a definição da estrutura até a realização de consultas complexas para extração de insights.

## Conteúdo do Arquivo `script_completo_farmacia.sql`:

O arquivo `script_completo_farmacia.sql` inclui as seguintes etapas e conceitos:

1.  **Criação do Banco de Dados e Seleção:**
    * `DROP DATABASE IF EXISTS farmacia;`
    * `CREATE DATABASE farmacia;`
    * `USE farmacia;`
2.  **DDL (Data Definition Language) - Definição da Estrutura:**
    * Criação de tabelas essenciais para um sistema de farmácia: `tipos_produtos`, `fabricantes`, `medicos`, `clientes`, `produtos`, `compras`, `produtos_compra`, e `receitas_medica`.
    * Definição de chaves primárias (`PRIMARY KEY`) e chaves estrangeiras (`FOREIGN KEY`) para estabelecer relacionamentos e garantir a integridade referencial entre as tabelas.
    * Utilização de `AUTO_INCREMENT` e tipos de dados adequados como `INT`, `VARCHAR`, `TEXT`, `DECIMAL`, `DATE`.
3.  **DML (Data Manipulation Language) - Inserção de Dados:**
    * Comandos `INSERT INTO` para popular todas as tabelas com dados de teste, simulando um cenário real de farmácia.
4.  **DQL (Data Query Language) - Consultas SQL:**
    * **Consultas Básicas:** `SELECT *` e `SELECT` de colunas específicas, com `ORDER BY`.
    * **Consultas Complexas com JOINs:** Exemplos práticos de como combinar dados de múltiplas tabelas usando `INNER JOIN` para:
        * Listar compras e clientes.
        * Incluir produtos e quantidades em compras.
        * Calcular o valor total de cada compra.
        * Associar compras, clientes, produtos e médicos de receitas.
        * Resumir vendas por fabricante.
    * **LEFT JOIN:** Demonstração de listagem de médicos e produtos receitados, mesmo que não haja compra associada.
    * **Funções de Agregação:** Aplicação de `SUM()` para totalização de valores.
    * **Cláusulas:** Uso de `WHERE` para filtragem e `GROUP BY` para agrupamento de resultados.
    * **Aliases:** Utilização de `AS` para facilitar a leitura das consultas.
5.  **Operações DML Adicionais:**
    * **UPDATE:** Exemplos de atualização de dados existentes em tabelas.
    * **DELETE:** Demonstração de remoção de registros, com atenção à integridade referencial.

Este script é uma excelente base para entender a construção e manipulação de um banco de dados relacional em MySQL, servindo como um sólido portfólio de habilidades em SQL.

---

**Autor:** Cleverson Moura Andrade
