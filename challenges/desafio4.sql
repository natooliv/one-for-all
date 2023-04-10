-- Desafio 4
-- Crie uma QUERY que deve mostrar as pessoas usuárias que estavam ativas a partir do ano de 2021, se baseando na data mais recente no histórico de reprodução.

-- A primeira coluna deve possuir o alias "pessoa_usuaria" e exibir o nome da pessoa usuária.

-- A segunda coluna deve ter o alias "status_pessoa_usuaria" e exibir se a pessoa usuária está ativa ou inativa.

-- O resultado deve estar ordenado em ordem alfabética.
SELECT usuarios_data.usuario_nome AS pessoa_usuaria,
       IF(MAX(PH.playback_date) >= DATE('2021-01-01'), 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.usuarios_data
JOIN SpotifyClone.playback_history PH ON usuarios_data.usuario_id = PH.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
