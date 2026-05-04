SELECT
    p.cd_produto,
    p.nm_produto,
    c.nm_categoria,
    f.nm_fantasia AS nm_fornecedor,
    p.vl_preco_venda
FROM tb_produto p
INNER JOIN tb_categoria c ON p.cd_categoria = c.cd_categoria
INNER JOIN tb_fornecedor f ON p.cd_fornecedor = f.cd_fornecedor;

SELECT
    cli.nm_cliente,
    v.cd_venda,
    v.dt_venda,
    v.vl_total_venda
FROM tb_cliente cli
LEFT JOIN tb_venda v ON cli.cd_cliente = v.cd_cliente;

SELECT
    v.cd_venda,
    v.dt_venda,
    v.vl_total_venda,
    func.nm_funcionario
FROM tb_venda v
RIGHT JOIN tb_funcionario func ON v.cd_funcionario = func.cd_funcionario;

SELECT
    v.cd_venda,
    cli.nm_cliente,
    p.nm_produto,
    iv.qt_item,
    iv.vl_subtotal
FROM tb_venda v
JOIN tb_cliente cli ON v.cd_cliente = cli.cd_cliente
JOIN tb_item_venda iv ON v.cd_venda = iv.cd_venda
JOIN tb_produto p ON iv.cd_produto = p.cd_produto
ORDER BY v.cd_venda;

SELECT nm_produto, vl_preco_venda FROM tb_produto WHERE cd_produto = 1;

UPDATE tb_produto SET vl_preco_venda = 2750.00 WHERE cd_produto = 1;

SELECT * FROM tb_historico_preco;

SELECT p.nm_produto, e.qt_disponivel
FROM tb_estoque e
JOIN tb_produto p ON e.cd_produto = p.cd_produto
WHERE e.cd_produto = 2;

CALL sp_abrir_venda(1, 1, @v_venda_atual);

CALL sp_inserir_item_venda(@v_venda_atual, 2, 2);

CALL sp_inserir_item_venda(@v_venda_atual, 3, 5);

SELECT p.nm_produto, e.qt_disponivel
FROM tb_estoque e
JOIN tb_produto p ON e.cd_produto = p.cd_produto
WHERE e.cd_produto IN (2, 3);

SELECT cd_venda, dt_venda, vl_total_venda, st_venda
FROM tb_venda
WHERE cd_venda = @v_venda_atual;

CALL sp_reajustar_precos_categoria(1, 10.00);
SELECT nm_produto, vl_preco_venda FROM tb_produto WHERE
cd_categoria = 1;
