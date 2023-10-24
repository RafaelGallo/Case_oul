#Questão banco de dados
# Monte uma query com MySQL que retorne para cada pais a quantidade de estados e o número total de habitantes.
# Considere as seguintes tabelas: tabele name: 
# cidades estado_id 1 cidade São Paulo 
  #habitantes 12.800.000 1 
  #santos 433.966 2 
  #Rio de Janeiro 6.320.000 3 
  #Las Vegas 644.644 4 
  # Dallas 1.345.000 5 
  # Montreal 1.780.00 

#Segunda tabela Name: 
  # estados estado_id 1 
  # estado Sao Paulo pais Brasil 2 
  # Rio de janeiro Brasil 3 
  # Nevada Estados Unidos 4 
  # Texas Estados Unidos 5 
  # Quebec Canada 6

REATE TABLE estados (
    estado_id INT PRIMARY KEY,
    estado VARCHAR(255),
    pais VARCHAR(255)
);

CREATE TABLE cidades (
    cidade_id INT PRIMARY KEY,
    cidade VARCHAR(255),
    estado_id INT,
    habitantes INT
);

INSERT INTO estados (estado_id, estado, pais) VALUES
    (1, 'Sao Paulo', 'Brasil'),
    (2, 'Rio de Janeiro', 'Brasil'),
    (3, 'Nevada', 'Estados Unidos'),
    (4, 'Texas', 'Estados Unidos'),
    (5, 'Quebec', 'Canadá');

INSERT INTO cidades (cidade_id, cidade, estado_id, habitantes) VALUES
    (1, 'São Paulo', 1, 12800000),
    (2, 'Santos', 1, 433966),
    (3, 'Rio de Janeiro', 2, 6320000),
    (4, 'Las Vegas', 3, 644644),
    (5, 'Dallas', 4, 1345000),
    (6, 'Montreal', 5, 1780000);

SELECT estados.pais AS País, 
       COUNT(*) AS Quantidade_de_Estados, 
       SUM(cidades.habitantes) AS Total_de_Habitantes
FROM estados
LEFT JOIN cidades ON estados.estado_id = cidades.estado_id
GROUP BY estados.pais;
