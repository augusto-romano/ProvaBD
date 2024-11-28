SELECT 
    funcionario.nome AS nome_funcionario,
    COUNT(DISTINCT pedido.idpedido) AS total_pedidos, 
    SUM(pedido.valor) AS valor_total_gasto
FROM 
    funcionario
JOIN 
    funcionario_has_pedido ON funcionario.idfuncionario = funcionario_has_pedido.funcionario_idfuncionario
JOIN 
    pedido ON funcionario_has_pedido.pedido_idpedido = pedido.idpedido
GROUP BY
    funcionario.nome;
    
SELECT 
    m.idmesa AS mesa_id,
    p.descricao AS produto_descricao,
    ph.quantidade AS quantidade_consumida
FROM 
    pedido_has_produto ph
JOIN 
    produto p ON ph.produto_idproduto = p.idproduto
JOIN 
    pedido pe ON ph.pedido_idpedido = pe.idpedido
JOIN 
    mesa m ON pe.mesa_id = m.idmesa
WHERE 
    p.idproduto = '1'; -- Substitua "NOME_DO_PRODUTO" pelo nome do produto que deseja consultar.
    
    
  DELIMITER $$

CREATE PROCEDURE redefinir_status(IN p_idmesa INT)
BEGIN
    UPDATE mesa
    SET status_idstatus = 4  -- Atualiza o status da mesa para 'Livre'
    WHERE idmesa = p_idmesa;
END $$

DELIMITER ;
    
    call redefinir_status(4);
    show procedure status;
    drop procedure redefinir_status;
    