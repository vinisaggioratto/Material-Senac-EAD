/*para limpar o banco de dados antes de inserir os novos dados,
remova os comentários dos comandos abaixo*/
/*
delete from venda;
alter table venda AUTO_INCREMENT = 1;

delete from produto;
alter table produto AUTO_INCREMENT = 1;

delete from cliente;
alter table cliente AUTO_INCREMENT = 1;

delete from funcionario;
alter table funcionario AUTO_INCREMENT = 1;

delete from cargo;
alter table cargo AUTO_INCREMENT = 1;
*/

INSERT INTO cliente(id, nome, cpf, endereco, sexo, telefone)
VALUES ('Mayra Gusmão','42186317001', 'Rua das Bromélias 10', 'F', '99 8598-1235'),
	('Iago Basílio','17964170090', 'Rua Brasil 10', 'M', '99 8878-1548'),
	('Aida Madruga','27176787000', 'Avenida Fontes 50', 'F', '99 7945-9878'),
	('Janaína Fortes','53093395070', 'Rua Camomila 95', 'F', '99 7944-7893'),
	('Nicolau Vaz Silva','24987742039', 'Avenida Fontes 80', 'M', '99 7944-6354'),
	('João Morgado','74488578004', 'Rua das Bromélias 100', 'M', '99 8888-1528'),
	('Joaquim Sá Coelho','72426183047', 'Rua Lírios 89', 'M', '99 7854-1718'),
	('Bruna Montenegro','84262948048', 'Rua Santos Dumont 98', 'F', '99 6897-6321'),
	('Laura Muniz','67533641027', 'Avenida Cascata 78', 'F', '99 7579-9453'),
	('José Goulart','09686683054', 'Rua Figueira 90', 'M', '99 6897-2568'),
	('Lúcia Vargas Souza','90569215099', 'Rua Lírios 68', 'F', '99 7789-3655');

INSERT INTO produto (nome, descricao, estoque, fabricante)
VALUES ('Ventilador de mesa', 'Ventilador branco 40cm 110v', 10, 'Bons Ventos'),
	('Aspirador de pó', 'Aspira pó e agua 110v', 15, 'Bons ventos'),
	('Batedeira planetária', 'Cor Branca 110v', 5, 'Casa & cia'),
	('Liquidificador', 'Cor Preta 110v', 7, 'Casa & cia'),
	('Processador', 'Cor Preta 110v', 7, 'Casa & cia'),
    ('Mixer', 'Cor Rosa 110v', 8, 'Ultralar'),
    ('Furadeira', '110v', 3, 'Casa & cia'),
    ('Forno Elétrico', '110v', 6, 'Ultralar'),
    ('Torradeira', '110v', 9, 'Ultralar'),
    ('Secador de cabelo', 'Cor Vermelha 2000w 110v', 17, 'Belle Tech'),
    ('Chapinha cerâmica', 'Cor azul bivolt', 8, 'Belle Tech'),
    ('Air Fryer', 'Bivolt', 3, 'Venus');
 
INSERT INTO cargo (descricao, salario, comissao)
VALUES ('Gerente', 5000, null),
	('Vendedor', 2500, 10),
	('Serviços Gerais', 1500, null),
	('Supervisor de Vendas', 2800, 10),
	('Estoquista', 2000, null);
  
INSERT INTO funcionario (nome, telefone, cpf, cargo_id)
VALUES ('Sílvio Cortês', '99 7898-1234', '84537768061', 2),
	('Amaro Valadão', '99 7534-1234', '03074142057', 2),
	('Marcos Valadão', '99 7534-7897', '40967947081', 2),
	('Domingas Souza Sá', '99 7534-1234', '51077408048', 4),
	('Marina Frazão', '99 7589-1854', '21788502000', 1),
	('Joana Freitas', '99 7589-7534', '85690938025', 3),
	('Aparício Dias', '99 7514-7884', '14131448025', 3),
	('Filomena da Luz', '99 7584-7884', '19641782070', 5);


INSERT INTO venda (data, data_envio, status, valor_total, cliente_id, funcionario_id)
VALUES 
('2020-10-17 10:00', '2020-10-17 10:00', 'FINALIZADO', 0, 2, 1),
('2020-11-20 11:00', '2020-12-20 17:00', 'ENTREGUE', 0, 4, 3),
('2020-12-27 13:30', '2020-12-27 13:30', 'FINALIZADO', 0, 2, 2),
('2021-01-15 10:00', '2021-01-15 10:00', 'FINALIZADO', 0, 10, 3),
('2021-01-28 14:15', '2021-01-28 14:15', 'FINALIZADO', 0, 8, 3),
('2021-02-10 15:00', '2021-03-10 10:00', 'ENTREGUE', 0, 5, 2),
('2021-06-13 18:00', '2021-07-15 11:00', 'ENTREGUE', 0, 2, 1),
('2021-11-25 09:00', '2021-11-25 09:00', 'FINALIZADO', 0, 7, 3),
('2022-01-12 16:10', null, 'FATURADO', 0, 8, 2),
('2022-02-01 17:00', null, 'FATURADO', 0, 6, 2);


INSERT INTO item_venda (quantidade, valor_unitario, venda_id, produto_id)
VALUES (1, 250.50, 1, 3),
 (1, 199.90, 1, 4),
 (1, 350.90, 1, 8),
 (2, 99.90, 2, 1),
 (1, 217.80, 2, 2),
 (2, 79.90, 3, 6),
 (1, 199.90, 4, 7),
 (1, 135.00, 5, 10),
 (3, 119.90, 5, 11),
 (1, 99.90, 5, 1),
 (1, 99.90, 6, 1),
 (1, 120.00, 7, 9),
 (1, 217.80, 8, 2),
 (1, 199.90, 8, 7),
 (1, 450.00, 9, 12),
 (2, 99.90, 10, 1);
 
UPDATE venda v 
SET valor_total = (SELECT sum(quantidade * valor_unitario) FROM item_venda iv WHERE iv.venda_id = v.id)
