-- Desafio 8
-- Mostre uma relação dos álbuns produzidos por uma pessoa artista específica, neste caso "Elis Regina". Para isto crie uma QUERY que o retorno deve exibir as seguintes colunas:

-- O nome da pessoa artista, com o alias "artista".

-- O nome do álbum, com o alias "album".

-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
SELECT artistas.artista_nome AS artista,
       albuns.album_nome AS album
FROM SpotifyClone.artistas
JOIN SpotifyClone.albuns ON artistas.artista_id = albuns.artista_id
WHERE artistas.artista_nome = 'Elis Regina';
