-- Desafio 7
-- Mostre uma relação de todos os álbuns produzidos por cada pessoa artista, ordenada pela quantidade de seguidores que ela possui, de acordo com os detalhes a seguir. Para tal, crie uma QUERY com as seguintes colunas:

-- A primeira coluna deve exibir o nome da pessoa artista, com o alias "artista".

-- A segunda coluna deve exibir o nome do álbum, com o alias "album".

-- A terceira coluna deve exibir a quantidade de pessoas seguidoras que aquela pessoa artista possui e deve possuir o alias "pessoas_seguidoras".

-- Seus resultados devem estar ordenados de forma decrescente, baseando-se no número de pessoas seguidoras. Em caso de empate no número de pessoas, ordene os resultados pelo nome da pessoa artista em ordem alfabética e caso existam artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente.
SELECT artistas.artista_nome AS artista,
       albuns.album_nome AS album,
       COUNT(user_follows.artista_id)AS pessoas_seguidoras
FROM SpotifyClone.artistas
JOIN SpotifyClone.albuns ON artistas.artista_id = albuns.artista_id
JOIN SpotifyClone.user_follows ON artistas.artista_id = user_follows.artista_id
GROUP BY albuns.album_nome, artistas.artista_nome
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;
