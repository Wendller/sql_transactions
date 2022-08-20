CREATE DATABASE banking_db;

-- Criando tabela de contas
CREATE TABLE IF NOT EXISTS accounts(
 	id BIGSERIAL PRIMARY KEY,
 	agency VARCHAR NOT NULL,
 	acc_number VARCHAR NOT NULL UNIQUE
 );
 

-- Criando tipo de transação
CREATE TYPE transaction_type AS ENUM ('deposit', 'withdraw', 'ticket_payment', 'transfer_payment', 'transfer_receipt');


-- Criando tabela de transações
CREATE TABLE IF NOT EXISTS transactions(
	id BIGSERIAL PRIMARY KEY,
  	type transaction_type NOT NULL,
  	transaction_date DATE NOT NULL,
  	transaction_value NUMERIC(7, 2) NOT NULL,
  	account_id INT NOT NULL,
 	FOREIGN KEY (account_id) REFERENCES accounts(id)
);


-- Criando tabela de transferências
CREATE TABLE IF NOT EXISTS transfer_transactions(
	id BIGSERIAL PRIMARY KEY,
  	origin_account_id INT NOT NULL,
  	destination_account_id INT NOT NULL,
  	transaction_id INT NOT NULL,
 	FOREIGN KEY (origin_account_id) REFERENCES accounts(id),
  	FOREIGN KEY (destination_account_id) REFERENCES accounts(id),
  	FOREIGN KEY (transaction_id) REFERENCES transactions(id)
);


-- Inserindo index para busca por tipo de transferência
CREATE INDEX ON transactions(type);


-- Inserindo contas 
INSERT INTO 
	accounts (agency, acc_number)
VALUES 
	('0001', '12345678'),
    ('0001', '00023223'),
    ('0003', '12399023'),
    ('0003', '22989193'),
    ('1124', '83475622'),
    ('1607', '28567408'),
    ('1945', '11453561'),
    ('0023', '00012894'),
    ('0004', '34454652'),
    ('0002', '11133453')
;


-- Inserindo transações 2021.2 & 2022.1
INSERT INTO 
	transactions (type, transaction_date, transaction_value, account_id)
VALUES 
	('deposit', '2021-12-04', 1000, 1),
    ('deposit', '2021-12-04', 500, 2),
    ('deposit', '2021-12-04', 1600, 6),
    ('deposit', '2021-12-06', 10000, 7),
    ('withdraw', '2021-12-12', 160, 2),
    ('withdraw', '2021-12-18', 1000, 7),
    ('ticket_payment', '2021-12-20', 256.98, 7),
    ('ticket_payment', '2022-01-28', 160, 6),
    ('withdraw', '2022-01-30', 120, 7),
    ('withdraw', '2022-02-08', 280, 7),
    ('deposit', '2022-02-08', 300, 3),
    ('deposit', '2022-02-12', 1000, 4),
    ('deposit', '2022-02-15', 5000, 6),
    ('ticket_payment', '2022-02-20', 256.98, 7),
    ('ticket_payment', '2022-02-20', 89.90, 3),
    ('deposit', '2022-02-22', 600, 4),
    ('deposit', '2022-02-26', 1000, 9),
    ('deposit', '2022-03-07', 70, 1),
    ('deposit', '2022-03-11', 120, 3),
    ('ticket_payment', '2022-03-11', 119.99, 3),
    ('withdraw', '2022-03-17', 400, 7),
    ('ticket_payment', '2022-03-20', 256.98, 7),
    ('ticket_payment', '2022-03-26', 119.99, 6),
    ('withdraw', '2022-04-05', 40, 1),
    ('withdraw', '2022-04-03', 200, 2),
    ('deposit', '2022-04-08', 15000, 5),
    ('deposit', '2022-04-09', 1100, 2),
    ('deposit', '2022-04-14', 200, 6),
    ('ticket_payment', '2022-04-14', 200, 6),
    ('ticket_payment', '2022-04-20', 256.98, 7),
    ('ticket_payment', '2022-04-22', 56.98, 4),
    ('withdraw', '2022-04-22', 50, 4),
    ('deposit', '2022-04-28', 3000, 10),
    ('deposit', '2022-05-03', 1000, 1),
    ('deposit', '2022-05-03', 500, 2),
    ('deposit', '2022-05-08', 1600, 6),
    ('deposit', '2022-05-11', 8000, 7),
    ('ticket_payment', '2022-05-14', 150, 1),
    ('ticket_payment', '2022-05-18', 300, 2),
    ('ticket_payment', '2022-05-20', 2714.96, 7),
    ('deposit', '2022-05-23', 300, 3),
    ('deposit', '2022-05-29', 1000, 4),
    ('withdraw', '2022-06-03', 89, 10),
    ('deposit', '2022-06-05', 40, 1),
    ('ticket_payment', '2022-06-05', 40, 1),
    ('withdraw', '2022-06-12', 120, 10),
    ('withdraw', '2022-06-15', 350, 7),
    ('ticket_payment', '2022-06-18', 400, 7),
    ('ticket_payment', '2022-06-20', 111.20, 4),
    ('ticket_payment', '2022-06-24', 89.90, 10),
	('deposit', '2022-06-29', 3893.34, 1)
;

    
-- Inserindo transações 2022.2
INSERT INTO 
	transactions (type, transaction_date, transaction_value, account_id)
VALUES 
	('deposit', '2022-07-08', 4000, 10),
	('deposit', '2022-07-15', 500, 9),
    ('ticket_payment', '2022-07-18', 1000, 10),
    ('deposit', '2022-07-19', 2000, 6),
    ('withdraw', '2022-07-21', 110, 6),
    ('ticket_payment', '2022-07-25', 400, 6),
    ('ticket_payment', '2022-07-30', 60, 9),
    ('withdraw', '2022-08-07', 120, 1),
    ('withdraw', '2022-08-16', 300, 10),
    ('ticket_payment', '2022-08-20', 69.89, 4),
    ('ticket_payment', '2022-08-23', 56, 2),
    ('deposit', '2022-08-26', 100, 3),
	('deposit', '2022-08-28', 5000, 7),
    ('ticket_payment', '2022-09-01', 1000, 7),
    ('ticket_payment', '2022-09-04', 48.89, 4),
    ('withdraw', '2022-09-11', 90, 3),
    ('deposit', '2022-09-18', 460, 10),
    ('deposit', '2022-09-26', 180, 4),
    ('deposit', '2022-09-30', 600, 6),
    ('deposit', '2022-09-30', 3500, 9),
    ('withdraw', '2022-10-10', 1800, 7),
    ('withdraw', '2022-10-18', 90, 9),
    ('ticket_payment', '2022-10-24', 60, 9),
    ('ticket_payment', '2022-10-28', 467.79, 10),
    ('deposit', '2022-11-02', 250, 1),
    ('deposit', '2022-11-02', 900, 6),
    ('withdraw', '2022-11-08', 100, 1),
    ('ticket_payment', '2022-11-12', 150, 4),
    ('ticket_payment', '2022-11-16', 67.90, 3),
    ('deposit', '2022-11-21', 2000, 2),
    ('ticket_payment', '2022-11-26', 150, 5),
    ('ticket_payment', '2022-11-28', 63.90, 3),
    ('withdraw', '2022-12-05', 90, 1),
    ('withdraw', '2022-12-09', 300, 2),
    ('ticket_payment', '2022-12-12', 48, 2),
    ('ticket_payment', '2022-12-14', 960.86, 2),
    ('ticket_payment', '2022-12-14', 63.90, 3),
    ('withdraw', '2022-12-15', 100, 7),
    ('withdraw', '2022-12-19', 550, 9),
    ('deposit', '2022-12-22', 6000, 5),
    ('ticket_payment', '2022-12-28', 467.79, 10),
    ('deposit', '2022-12-29', 2000, 1),
    ('ticket_payment', '2022-12-29', 3000, 5)
 ;	
 
 
-- Inserindo transferências 2022
-- (No backend, o melhor provavelmente seria uma transação atômica, para nos certificarmos de que toda transação do tipo transferência
-- registraria não apenas a transação em si como também as informações de conta origem e destino na tabela transfer_transactions)
INSERT INTO
	transactions (type, transaction_date, transaction_value, account_id)
VALUES
	('transfer_payment', '2022-02-05', 120, 7),
	('transfer_receipt', '2022-01-02', 100, 6),
	('transfer_payment', '2022-01-24', 300, 2),
	('transfer_payment', '2022-03-16', 60, 4),
	('transfer_payment', '2022-09-22', 460, 10)
;

INSERT INTO
	transfer_transactions (origin_account_id, destination_account_id, transaction_id)
VALUES
	(7, 1, (SELECT id FROM transactions t WHERE t.type = 'transfer_payment' AND t.transaction_date = '2022-02-05' AND t.account_id = 7)),
	(6, 10, (SELECT id FROM transactions t WHERE t.type = 'transfer_receipt' AND t.transaction_date = '2022-01-02' AND t.account_id = 6)),
	(2, 4, (SELECT id FROM transactions t WHERE t.type = 'transfer_payment' AND t.transaction_date = '2022-01-24' AND t.account_id = 2)),
	(4, 8, (SELECT id FROM transactions t WHERE t.type = 'transfer_payment' AND t.transaction_date = '2022-03-16' AND t.account_id = 4)),
	(10, 3, (SELECT id FROM transactions t WHERE t.type = 'transfer_payment' AND t.transaction_date = '2022-09-22' AND t.account_id = 10))
;
	
 

-- Criando índice parcial para busca de pagamentos de boletos 
CREATE INDEX ON transactions(type, transaction_date) WHERE type = 'ticket_payment';


-- Query para retornar o total de pagamentos de boletos de cada mês do ano atual
SELECT EXTRACT(MONTH FROM t.transaction_date) as month, sum(t.transaction_value) as ticket_payment_amount
  	FROM transactions t
  	WHERE t.type = 'ticket_payment' AND EXTRACT(YEAR FROM t.transaction_date) = EXTRACT(YEAR FROM CURRENT_DATE) 
    GROUP BY (month);
