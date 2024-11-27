-- UC06 - Criar um relatório Rank Atendente    
    
SELECT 
pp.nome AS 'Nome Atendente',
SUM(v.valor_total) AS 'Total Vendas'
FROM venda v
INNER JOIN atendente a ON a.id_atendente = v.id_atendente
INNER JOIN pessoa pp ON pp.id_pessoa = a.id_atendente
WHERE v.situacao = 'concluida'  
GROUP BY pp.nome
ORDER BY `Total Vendas` DESC;  

