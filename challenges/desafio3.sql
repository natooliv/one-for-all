-- Crie uma QUERY que deverá ter apenas três colunas:

-- A primeira coluna deve possuir o alias "pessoa_usuaria" e exibir o nome da pessoa usuária.

-- A segunda coluna deve possuir o alias "musicas_ouvidas" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.

-- A terceira coluna deve possuir o alias "total_minutos" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.

-- Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.
SELECT usuarios_data.usuario_nome AS pessoa_usuaria,
       COUNT(PH.musik_id) AS musicas_ouvidas,
       ROUND(SUM(musik.musik_duration) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios_data
JOIN SpotifyClone.playback_history PH ON usuarios_data.usuario_id = PH.usuario_id
JOIN SpotifyClone.musik ON PH.musik_id = musik.musik_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;


