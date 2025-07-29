USE VendasDB;

CREATE VIEW vw_resumo_vendas AS
SELECT fVendas_etl.CustoUnitario, fVendas_etl.PrecoUnitario, fVendas_etl.QtdVenda, fVendas_etl.QtdDevolucao, fVendas_etl.VlrDevolucao,
fVendas_etl.VlrDesconto, fVendas_etl.PrecoUnitario * fVendas_etl.QtdVenda AS VlrVenda, dProduto_etl.NomeProduto, dProduto_etl.Marca, dProduto_etl.Classe, 
dLojas_etl.TipoLoja, dLojas_etl.NomeLoja, dCalendario_etl.Ano, dCalendario_etl.Mes, dCalendario_etl.Dia, dCalendario_etl.DiadaSemana, dCalendario_etl.SemanaAno, 
dCalendario_etl.SemanaMes, dCalendario_etl.Trimestre, dCalendario_etl.Semestre FROM fVendas_etl
JOIN dLojas_etl ON dLojas_etl.idLoja = fVendas_etl.idLoja 
JOIN dCalendario_etl ON dCalendario_etl.Data = fVendas_etl.Data 
JOIN dProduto_etl ON dProduto_etl.idProduto = fVendas_etl.idProduto;

SELECT * FROM vw_resumo_vendas;

-- Caso não utilize os dados tratados no processo de ETL, podem ocorrer erros devido à presença de espaços nos nomes das colunas.