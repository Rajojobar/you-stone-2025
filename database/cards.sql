CREATE DATABASE IF NOT EXISTS `you-stone` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `you-stone`;

DROP TABLE IF EXISTS `cartes_effets`;

DROP TABLE IF EXISTS `cartes`;

DROP TABLE IF EXISTS `effets`;

DROP TABLE IF EXISTS `conditions`;

CREATE TABLE `cartes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `texte` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `type-carte` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition-type` text NOT NULL,
  `condition-valeur` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `effets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `effet-type` text NOT NULL,
  `effet-valeur` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `condition_effet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordre` int(11) NOT NULL,
  `id_condition` int(11) NOT NULL,
  `id_effet` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_condition` (`id_condition`),
  KEY `id_effet` (`id_effet`),
  CONSTRAINT `condition_effet_ibfk_1` FOREIGN KEY (`id_condition`) REFERENCES `conditions` (`id`),
  CONSTRAINT `condition_effet_ibfk_2` FOREIGN KEY (`id_effet`) REFERENCES `effets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `cartes_effets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordre` int(11) NOT NULL,
  `id_carte` int(11) NOT NULL,
  `id_effet` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_carte` (`id_carte`),
  KEY `id_effet` (`id_effet`),
  CONSTRAINT `cartes_effets_ibfk_1` FOREIGN KEY (`id_carte`) REFERENCES `cartes` (`id`),
  CONSTRAINT `cartes_effets_ibfk_2` FOREIGN KEY (`id_effet`) REFERENCES `effets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `cartes` (`id`, `nom`, `texte`, `image`, `type-carte`) VALUES
(1, 'Champi', '', 'image1.jpg', 'creat'),
(2, 'Bonhomme', '', 'image2.jpg', 'creat'),
(3, 'Madame', '', 'image3.jpg', 'creat'),
(4, 'Bijoutier', '', 'image4.jpg', 'creat'),
(5, 'Développeur', '', 'image5.jpg', 'creat'),
(6, 'Explosion', 'Détruit un monstre adverse', 'image6.jpg', 'sort'),
(7, 'Soupe Périmée', 'Affaiblit un adversaire', 'image7.jpg', 'sort'),
(8, 'Potion', 'Augmente l'' ATK d'' un monstre allié', 'image8.jpg', 'sort'),
(9, 'Frappe', 'Tue un ennemi', 'image9.jpg', 'sort'),
(10, 'Coup de vent', 'Renvoie un monstre ennemi en main', 'image10.jpg', 'sort');

INSERT INTO `effet` (`id`, `condition-type`, `condition-valeur`) VALUES
(1, `destroy`, `{"target": "creature", "location": "opponent-field" }`),
(2, `increase-atk`, `{"target": "creature", "location": "player-field", "value":500 }`),
(3, `decrease-atk`, `{"target": "creature", "location": "field", "value":200}`),
(4, `bounce`, `{"target": "creature", "location": "opponent-field" }`),
(5, `destroy`, `{"target": "all-creatures", "location": "opponent-field" }`)

INSERT INTO `condition` (`id`, `effet-type`, `effet-valeur`) VALUES
(1, `exists`, `{"target": "creature", "location": "opponent-field" }`),
(2, `exists`, `{"target": "creature", "location": "opponent-field", "count": 3 }`),
(3, `exists`, `{"target": "creature", "location": "player-field" }`)

INSERT INTO `cartes_effets` (`id`, `ordre`, `id_carte`, `id_effet`) VALUES
(1, 1, 6, 5),
(2, 1, 7, 3),
(3, 1, 8, 2),
(4, 1, 9, 1),
(5, 1, 10, 4);

INSERT INTO `condition_effet` (`id`, `ordre`, `id_condition`, `id_effet`) VALUES
(1, 1, 2, 1),
(2, 1, 1, 2),
(3, 1, 3, 3);
(4, 1, 1, 4);
(5, 1, 1, 5);