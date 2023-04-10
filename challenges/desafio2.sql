-- Desafio 2
-- Crie uma QUERY que exiba três colunas:

-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".

-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".

-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".

-- ✨ Dica: Considerando que a tabela está normalizada, você pode usar as chaves estrangeiras para juntar as tabelas, ou usar sub-queries de forma que seja possível extrair o resultado
SELECT 
    COUNT(musik.musik_id) AS cancoes,
    COUNT(DISTINCT albuns.artista_id) AS artistas,
    COUNT(DISTINCT albuns.album_id) AS albuns
FROM SpotifyClone.musik
JOIN SpotifyClone.albuns ON musik.album_id = albuns.album_id
JOIN SpotifyClone.artistas ON albuns.artista_id = artistas.artista_id;
