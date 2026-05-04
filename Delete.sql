DELETE FROM tb_venda WHERE cd_venda = 1;

DELETE FROM tb_item_venda WHERE cd_venda = @v_venda_atual;

DELETE FROM tb_venda WHERE cd_venda = @v_venda_atual;

SELECT * FROM tb_venda WHERE cd_venda = @v_venda_atual;
