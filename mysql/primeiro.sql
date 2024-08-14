-- Meu primeiro arquivo DUMP para MySQL

-- Apaga o banco de dados caso ele exista
-- --------------- ATENÇÃO! ----------------- --
-- Remova este comando após a publicação da versão de produção
DROP DATABASE IF EXISTS primeiro;

-- Cria o banco de dados
-- Define a tabela de caracteres UTF-8 (utf8mb4)
-- Define as buscas para UTF-8 case-insensitive
-- --------------- ATENÇÃO! ----------------- --
-- Remova este comando após a publicação da versão de produção
CREATE DATABASE primeiro 
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

-- Definir o banco de dados com o qual vamos trabalhar
USE primeiro;

-- Modela a tabela `employee`
CREATE TABLE employee (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(127) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(63) NOT NULL,
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_status ENUM('on','off', 'del') DEFAULT 'on'
);

-- Modela a tabela `contact`
CREATE TABLE contact (
    cont_id INT PRIMARY KEY AUTO_INCREMENT,
    cont_name VARCHAR(127) NOT NULL,
    cont_email VARCHAR(255) NOT NULL,
    cont_subject VARCHAR(63),
    cont_message TEXT,
    cont_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cont_status ENUM ('recebido', 'lido', 'respondido', 'apagado') DEFAULT 'recebido'
);

-- Modela a tabela `article`
CREATE TABLE article (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_content TEXT,
    art_author INT, -- Chave estrangeira para `employee`
    art_status ENUM('on', 'off', 'del') DEFAULT 'on',
    -- Especifica a chave estrangeira
    FOREIGN KEY (art_author) REFERENCES employee(user_id)
);


-- Inserindo alguns `employee` fake para testes
INSERT INTO employee (
    user_name,
    user_email,
    user_password
) VALUES (
    "Joca da Silva",
    "joca@silva.com",
    SHA1("senha123")
), (
    "Setembrino Trocatapas",
    "set@brino.com",
    SHA1("senha123")
), (
    "Marineuza Siriliano",
    "mari@neuza.com",
    SHA1("senha123")
);

-- Insere alguns `contact` fake para testes
INSERT INTO `contact` (
    `cont_name`,
    `cont_email`,
    `cont_subject`,
    `cont_message`
) VALUES (
    'Hemegarda',
    'hemen@garda.com',
    'Estou precisando de ajuda',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac posuere mi. Sed venenatis ultrices elementum. Curabitur vestibulum interdum nunc, at cursus diam tristique a. Etiam placerat dui quis ipsum luctus, eu malesuada massa tempor. Curabitur leo nisi, malesuada ac tincidunt eu, finibus ut velit. Nam imperdiet hendrerit leo, non aliquam ex cursus ut. Nulla semper ex leo, non condimentum lacus mattis et. Aliquam accumsan vitae erat ut fermentum. Cras non nulla et odio tincidunt consectetur. Aliquam eros velit, vestibulum vitae nunc a, porttitor hendrerit arcu. Suspendisse potenti. Duis quis orci condimentum, tincidunt ex sodales, malesuada felis. Ut tincidunt, neque a aliquet dictum, libero tortor maximus tortor, sit amet ultricies est eros et arcu.'
);

-- Insere alguns `article` fake para testes
INSERT INTO `article` (
    `art_title`,
    `art_intro`,
    `art_content`,
    `art_author`
) VALUES (
    'Como espirrar na Alemanha',
    'js dfisd gbdsjg bisadg sdkgn sd gsda glasd',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac posuere mi. Sed venenatis ultrices elementum. Curabitur vestibulum interdum nunc, at cursus diam tristique a. Etiam placerat dui quis ipsum luctus, eu malesuada massa tempor. Curabitur leo nisi, malesuada ac tincidunt eu, finibus ut velit. Nam imperdiet hendrerit leo, non aliquam ex cursus ut. Nulla semper ex leo, non condimentum lacus mattis et. Aliquam accumsan vitae erat ut fermentum. Cras non nulla et odio tincidunt consectetur. Aliquam eros velit, vestibulum vitae nunc a, porttitor hendrerit arcu. Suspendisse potenti. Duis quis orci condimentum, tincidunt ex sodales, malesuada felis. Ut tincidunt, neque a aliquet dictum, libero tortor maximus tortor, sit amet ultricies est eros et arcu.',
    '2'
);