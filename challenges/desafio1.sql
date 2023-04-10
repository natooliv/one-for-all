DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.spotify_planos(
    plano_id INT PRIMARY KEY ,
    plano_nome VARCHAR(50) NOT NULL,
    plano_preco DECIMAL(4,2) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.spotify_planos (plano_id, plano_nome, plano_preco)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  CREATE TABLE SpotifyClone.usuarios_data(
    usuario_id INT PRIMARY KEY,
    usuario_nome VARCHAR(100),
    usuario_idade INT,
    data_de_entrada DATE,
    plano_id INT, FOREIGN KEY(plano_id) REFERENCES spotify_planos(plano_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.usuarios_data (usuario_id, usuario_nome, usuario_idade, data_de_entrada, plano_id)
  VALUES
    (1, 'Barbara Liskov', 82, '2019-10-20', 1),
    (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
    (3, 'Ada Lovelace', 37, '2017-12-30', 2),
    (4, 'Martin Fowler', 46, '2017-01-17', 2),
    (5, 'Sandi Metz', 58,  '2018-04-29', 2),
    (6, 'Paulo Freire', 19, '2018-02-14', 3),
    (7, 'Bell Hooks', 26, '2018-01-05', 3),
    (8, 'Christopher Alexander', 85, '2019-06-05', 4),
    (9, 'Judith Butler', 45, '2020-05-13', 4),
    (10, 'Jorge Amado', 58, '2017-02-17', 4);

  CREATE TABLE SpotifyClone.artistas	(
    artista_id INT PRIMARY KEY,
    artista_nome VARCHAR(100)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artistas (artista_id, artista_nome)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

  CREATE TABLE SpotifyClone.albuns (
    album_id INT PRIMARY KEY,
    album_nome VARCHAR(100),
    release_year YEAR,
    artista_id INT, FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.albuns (album_id, album_nome, release_year, artista_id)
  VALUES
    (1, 'Renaissance', '2022', 1),
    (2, 'Jazz', '1978', 2),
    (3, 'Hot Space', '1982', 2),
    (4, 'Falso Brilhante', '1998', 3),
    (5, 'Vento de Maio', '2001', 3),
    (6, 'QVVJFA?',  '2003', 4),
    (7, 'Somewhere Far Beyond', '2007', 5),
    (8, 'I Put A Spell On You', '2012', 6);

  CREATE TABLE SpotifyClone.musik (
    musik_id INT PRIMARY KEY,
    musik_name VARCHAR(150),
    musik_duration INT,
    album_id INT, FOREIGN KEY(album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.musik (musik_id, musik_name, musik_duration, album_id)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais',  105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard’s musik', 244, 7),
    (10, 'Feeling Good', 100, 8);

  CREATE TABLE SpotifyClone.playback_history (
    playback_id INT,
    playback_date DATETIME,
    usuario_id INT, 
    musik_id INT, 
    FOREIGN KEY(usuario_id) REFERENCES usuarios_data(usuario_id),
    FOREIGN KEY(musik_id) REFERENCES musik(musik_id),
    PRIMARY KEY(playback_id, playback_date)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.playback_history (playback_id, playback_date, usuario_id, musik_id)
  VALUES
    (1, '2022-02-28 10:45:55', 1, 8),
    (2, '2020-05-02 05:30:35', 1, 2),
    (3, '2020-03-06 11:22:33', 1, 10),
    (4, '2022-08-05 08:05:17', 2, 10),
    (5, '2020-01-02 07:40:33', 2, 7),
    (6, '2020-11-13 16:55:13', 3, 10),
    (7, '2020-12-05 18:38:30', 3, 2),
    (8, '2021-08-15 17:10:10', 4, 8),
    (9, '2022-01-09 01:44:33', 5, 8),
    (10, '2020-08-06 15:23:43', 5, 5),
    (11, '2017-01-24 00:31:17', 6, 7),
    (12, '2017-10-12 12:35:20', 6, 1),
    (13, '2011-12-15 22:30:49', 7, 4),
    (14, '2012-03-17 14:56:41', 8, 4),
    (15, '2022-02-24 21:14:22', 9, 9),
    (16, '2015-12-13 08:30:22', 10, 3);
    
  CREATE TABLE SpotifyClone.user_follows (
    follow_id INT,
    usuario_id INT, 
    artista_id INT, 
    FOREIGN KEY(usuario_id) REFERENCES usuarios_data(usuario_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
    PRIMARY KEY(follow_id, usuario_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.user_follows (follow_id, usuario_id, artista_id)
  VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 1, 3),
  (4, 2, 1),
  (5, 2, 3),
  (6, 3, 2),
  (7, 4, 4),
  (8, 5, 5),
  (9, 5, 6),
  (10, 6, 6),
  (11, 6, 1),
  (12, 7, 6),
  (13, 9, 3),
  (14, 10, 2);
