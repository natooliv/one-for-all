-- Desafio 5
-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma QUERY que possua duas colunas:

-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.

-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.

-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.
SELECT musik.musik_name AS cancao,
       COUNT(PH.musik_id) AS reproducoes
FROM SpotifyClone.musik
JOIN SpotifyClone.playback_history PH ON musik.musik_id = PH.musik_id
GROUP BY musik.musik_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
