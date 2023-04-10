-- Desafio 9
-- Crie uma QUERY que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária "Barbara Liskov" e a consulta deve retornar a seguinte coluna:

-- O valor da quantidade, com o alias "musicas_no_historico".
SELECT  COUNT (playback_history.usuario_id) AS musicas_no_historico
FROM SpotifyClone.playback_history
WHERE playback_history.usuario_id = 1;
