# 🧠 SQL Server Performance Tuning

Projeto focado em otimização de queries no SQL Server, demonstrando análise de performance com Execution Plan e STATISTICS IO, além da aplicação de índices para melhoria de eficiência.

---

# 🇧🇷 Versão em Português

## 📌 Cenário

Foi analisada uma query na base **AdventureWorks2019** que apresentava baixa performance devido a um anti-pattern:

* Uso de função na coluna (`YEAR(OrderDate)`)
* Quebra de SARGabilidade
* Geração de **Scan**
* Alto consumo de IO

---

## 🔍 Análise Inicial

### 📊 Índices Originais

![Indices Originais](docs/imagens/Indices_Originais.png)

---

### 🧨 Remoção de Índices

![Remocao de Indices](docs/imagens/Remocao_De_Indices.png)

---

### 📉 Plano de Execução (Antes)

![Plano Antes](docs/imagens/Plano_De_Execucao_Antes.png)

---

### 📊 Estatísticas de IO (Antes)

![IO Antes](docs/imagens/Estatisticas_Antes.png)

---

### 💬 Mensagens (Antes)

![Mensagem Antes](docs/imagens/Mensagem_Antes.png)

---

## ⚠️ Problema Identificado

* Predicado não SARGável (`YEAR(OrderDate)`)
* Alto número de **logical reads (686)**
* Execução com **Index Scan**

---

## 🚀 Solução Aplicada

✔ Reescrita da query com filtro por intervalo
✔ Criação de índice composto:

```sql
CREATE NONCLUSTERED INDEX IX_Perf_Customer_OrderDate
ON Sales.SalesOrderHeader (CustomerID, OrderDate)
INCLUDE (SalesOrderID);
```

---

## 📈 Resultados Após Otimização

### 📉 Plano de Execução (Depois)

![Plano Depois](docs/imagens/Plano_De_Execucao_Depois.png)

---

### 📊 Estatísticas de IO (Depois)

![IO Depois](docs/imagens/Estatisticas_Depois.png)

---

### 💬 Mensagens (Depois)

![Mensagem Depois](docs/imagens/Mensagem_Depois.png)

---

## 📊 Comparativo

| Métrica           | Antes | Depois |
| ----------------- | ----- | ------ |
| Logical Reads     | 686   | 2 🔥   |
| Plano de Execução | Scan  | Seek   |

---

## 🧠 Aprendizados

* Evitar funções em colunas filtradas
* Utilizar índices compostos
* Interpretar Execution Plan
* Analisar performance com STATISTICS IO

---

# 🇺🇸 English Version

## 📌 Scenario

This project demonstrates how to analyze and optimize a SQL Server query using execution plan and IO statistics.

The performance issue was caused by a common anti-pattern:

* Function applied to a column (`YEAR(OrderDate)`)
* Breaking SARGability
* Causing scan operations and high IO

---

## 🔍 Initial Analysis

### 📊 Original Indexes

![Original Indexes](docs/imagens/Indices_Originais.png)

---

### 🧨 Index Removal

![Index Removal](docs/imagens/Remocao_De_Indices.png)

---

### 📉 Execution Plan (Before)

![Execution Plan Before](docs/imagens/Plano_De_Execucao_Antes.png)

---

### 📊 IO Statistics (Before)

![IO Before](docs/imagens/Estatisticas_Antes.png)

---

### 💬 Messages Output (Before)

![Messages Before](docs/imagens/Mensagem_Antes.png)

---

## ⚠️ Identified Problem

* Non-sargable predicate (`YEAR(OrderDate)`)
* High logical reads (686)
* Execution using Scan

---

## 🚀 Applied Solution

✔ Query rewritten using date range
✔ Composite index created:

```sql
CREATE NONCLUSTERED INDEX IX_Perf_Customer_OrderDate
ON Sales.SalesOrderHeader (CustomerID, OrderDate)
INCLUDE (SalesOrderID);
```

---

## 📈 Results After Optimization

### 📉 Execution Plan (After)

![Execution Plan After](docs/imagens/Plano_De_Execucao_Depois.png)

---

### 📊 IO Statistics (After)

![IO After](docs/imagens/Estatisticas_Depois.png)

---

### 💬 Messages Output (After)

![Messages After](docs/imagens/Mensagem_Depois.png)

---

## 📊 Comparison

| Metric         | Before | After |
| -------------- | ------ | ----- |
| Logical Reads  | 686    | 2 🔥  |
| Execution Plan | Scan   | Seek  |

---

## 🧠 Key Learnings

* Avoid functions on indexed columns
* Use composite indexes
* Understand execution plans
* Analyze performance using STATISTICS IO
