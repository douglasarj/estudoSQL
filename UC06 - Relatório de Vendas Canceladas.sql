-- UC06 - Relatório de Vendas Canceladas

SELECT 
pp.nome AS 'Nome Atendente',
p.descricao AS 'Nome Produto',
SUM(iv.valor_total) AS 'Valor Total Cancelado'
FROM itens_venda iv
INNER JOIN venda v ON v.id_venda = iv.id_venda
INNER JOIN atendente a ON a.id_atendente = v.id_atendente
INNER JOIN pessoa pp ON pp.id_pessoa = a.id_atendente
INNER JOIN produto p ON p.id_produto = iv.id_produto

WHERE iv.cancelado = TRUE
GROUP BY pp.nome, p.descricao;
    
    
