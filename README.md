# Radiografia das Transações Bancárias — Primeiros Sinais de Risco

Projeto de análise exploratória de dados (EDA) aplicado a um cenário de Prevenção a Fraudes e Operações em uma fintech, usando SQL e Python.

## Contexto

Simulação de uma demanda real de um time de Prevenção a Fraudes e Operações de uma fintech de pagamentos: antes de qualquer modelo de fraude, era preciso entender o comportamento geral das transações — volumes, valores, canais, horários — para depois decidir onde vale a pena investigar mais a fundo.

## Problema de negócio

O time de Fraude/Operações não tinha visibilidade consolidada sobre o volume e o perfil das transações, o que dificultava priorizar onde investigar comportamentos fora do padrão.

## Objetivo

Mapear o volume, o perfil e o comportamento das transações, identificando contas e padrões que se destacam (valores atípicos, alta frequência, canais fora do padrão), para orientar onde o time deve olhar com mais atenção.

## Dataset

- **Nome:** Bank Transaction Dataset for Fraud Detection
- **Fonte:** Kaggle — valakhorasani
- **Registros:** 2.512 transações, 16 colunas
- **Observação:** dataset sintético/anonimizado (localizações nos EUA) e sem rótulo de fraude explícito — o desafio é justamente construir critérios próprios para apontar o que merece atenção, como acontece em muitos cenários reais.

Principais colunas: `TransactionID`, `AccountID`, `TransactionAmount`, `TransactionDate`, `TransactionType`, `Channel`, `Location`, `CustomerAge`, `CustomerOccupation`, `AccountBalance`, `LoginAttempts`, `TransactionDuration`, `PreviousTransactionDate`.

## Ferramentas

- SQL (MySQL) para exploração inicial e métricas agregadas
- Python (pandas, matplotlib) para inspeção, limpeza e análise exploratória
-- Jupyter Notebook
  
## Metodologia

1. Exploração inicial via SQL: volumes, valores, canais, contas mais ativas.
2. Inspeção e limpeza dos dados em Python: tipos, nulos, duplicidades, conversão de datas.
3. Análise exploratória: distribuição de valores, comportamento por canal, ocupação dos clientes, identificação de transações fora do padrão.

## Principais análises

- Volume e ticket médio por canal (ATM, Branch, Online) e por tipo (Crédito/Débito)
- Contas com maior número de transações
- Distribuição dos valores de transação (histograma)
- Ocupação mais frequente entre os clientes
 
## Principais insights

- O valor total transacionado é próximo entre os três canais (ATM, Branch e Online), sem um canal dominante isoladamente.
- Um pequeno grupo de contas concentra bem mais transações que a média (até 12 transações, contra uma média geral bem menor), o que já indica quais contas merecem prioridade em uma investigação futura.

## Recomendações

- Priorizar a checagem manual das contas com maior frequência de transações.
- Definir um processo recorrente de recálculo dessas métricas (dashboard) para acompanhar mudanças de comportamento ao longo do tempo.
  
## Limitações

- Dataset sintético, sem rótulo de fraude — as conclusões são exploratórias, não preditivas.
- Localizações e valores não refletem o mercado brasileiro.
- Análise em tabela única (sem normalização), adequada para este primeiro nível de exploração, mas limitada para relacionar múltiplas dimensões de cliente/conta em análises futuras.
  
## Conclusão

Esta primeira etapa entrega uma visão consolidada do comportamento transacional e já aponta candidatos a investigação prioritária. Os próximos passos/projetos devem aprofundar a análise temporal e comportamental para apoiar decisões de Fraude e Operações.

## Como executar

```bash
pip install pandas matplotlib
```
1. Baixe o dataset em data/ a partir do link do Kaggle acima (não incluído neste
repositório).
2. Rode os scripts SQL em sql/ em um banco MySQL.
3. Abra os notebooks em python/ no Jupyter
