-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 18 Décembre 2018 à 14:23
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `papocar`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id_adresse` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''adresse',
  `numVoie_adresse` int(11) NOT NULL COMMENT 'Numéro de voie de l''adresse',
  `libVoie_adresse` varchar(50) DEFAULT NULL COMMENT 'Nom de voie de l''adresse',
  `cp_adresse` int(5) DEFAULT NULL COMMENT 'Code postale de ville de l''adresse',
  `ville_adresse` varchar(50) DEFAULT NULL COMMENT 'Ville de l''adresse'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adresse des utilisateurs et des étapes';

-- --------------------------------------------------------

--
-- Structure de la table `composer_trajetetape`
--

CREATE TABLE `composer_trajetetape` (
  `id_composer_trajet_etape` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant liant les etapes aux trajets',
  `id_etape_composer_trajetEtape` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''étape',
  `id_trajet_composer_trajetEtape` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du trajet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant la liaison entre les étapes et les trajets';

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE `etape` (
  `id_etape` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''étape',
  `id_adresse_etape` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''adresse de l''étape',
  `dateArrivee_etape` datetime NOT NULL COMMENT 'Heure d''arriver à l''étape',
  `dateDepart_etape` datetime NOT NULL COMMENT 'Heure de départ de l''étape'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les étapes';

-- --------------------------------------------------------

--
-- Structure de la table `expedier_messagerieutilisateur`
--

CREATE TABLE `expedier_messagerieutilisateur` (
  `id_expedier_messagerie_utilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''éxpédition du message',
  `id_utilisateur_expedier_messagerieutilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''utilisateur  de l''éxpédition du message',
  `id_messagerie_expedier_messagerieUtilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du message  de l''éxpédition du message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les expédition entre les utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `messagerie`
--

CREATE TABLE `messagerie` (
  `id_messagerie` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du message',
  `sujet_messagerie` varchar(100) NOT NULL COMMENT 'Sujet du message',
  `message_messagerie` text NOT NULL COMMENT 'Message',
  `status_messagerie` varchar(50) NOT NULL COMMENT 'Status du message',
  `date_messagerie` datetime NOT NULL COMMENT 'Date du message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les messages';

-- --------------------------------------------------------

--
-- Structure de la table `proposer_trajetutilisateur`
--

CREATE TABLE `proposer_trajetutilisateur` (
  `id_proposer_trajet_utilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de la proposition de trajet',
  `id_utilisateur_proposer` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''utilisateur de la proposition de trajet',
  `id_trajet_proposer` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du trajet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les propositions de trajet';

-- --------------------------------------------------------

--
-- Structure de la table `recevoir_messagerie_utilisateur`
--

CREATE TABLE `recevoir_messagerie_utilisateur` (
  `id_recevoir_messagerie_utilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de la réception du message',
  `id_utilisateur_recevoir_messagerieutilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de l''utilisateur  de la réception',
  `id_messagerie_recevoir_messagerieUtilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du message  de la réception '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les reception des msg entre les utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `reserver_trajetutilisateur`
--

CREATE TABLE `reserver_trajetutilisateur` (
  `id_reserver_trajet_utilisateur` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de la réservation du trajet',
  `id_utilisateur_reserver` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant de l''utilisateur de la réservation du trajet',
  `id_trajet_reserver` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant du trajet de la réservation ',
  `date_reserver_trajetUtilisateur` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de la réservation du trajet',
  `code_reserver_trajetutilisateur` varchar(20) NOT NULL COMMENT 'code de la réservation du trajet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les réservation de trajet';

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `id_trajet` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant du trajet',
  `duree_trajet` time NOT NULL COMMENT 'Durée du trajet',
  `distance_trajet` double NOT NULL COMMENT 'Distance du trajet',
  `prix_trajet` double NOT NULL COMMENT 'Prix du trajet'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les trajets';

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant de l''utilisateur',
  `nom_utlitisateur` varchar(50) NOT NULL COMMENT 'Nom de l''utilisateur',
  `prenom_utlisateur` varchar(50) NOT NULL COMMENT 'Prénom de l''utilisateur',
  `pseudo_utlilisateur` varchar(50) NOT NULL COMMENT 'Pseudo de l''utilisateur',
  `password_utilisateur` varchar(50) NOT NULL COMMENT 'Mot de passe de l''utilisateur',
  `email_utilisateur` varchar(50) NOT NULL COMMENT 'email de l''utilisateur',
  `tel_utilisateur` varchar(10) DEFAULT NULL COMMENT 'Numéro de téléphone de l''utilisateur',
  `dateNaissance_utlisateur` date NOT NULL COMMENT 'Date de naissance de l''utilisateur',
  `possedeVoiture_utilisateur` tinyint(1) NOT NULL DEFAULT '0' COMMENT '"true" si l''utilisateur pssède une voiture et "false" si il ne spossède pas de voiture',
  `nbBagage-utilisateur` int(1) DEFAULT '0' COMMENT 'Nombre de bagage de l''utilisateur',
  `id_adresse_utlisateur` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant de l''adresse de l''utilisateur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id_voiture` int(10) UNSIGNED NOT NULL COMMENT 'Identifiant de la voiture',
  `immat_voiture` varchar(10) NOT NULL COMMENT 'Immatriculation de la voiture',
  `nbPlaceTotal_voiture` int(1) DEFAULT NULL COMMENT 'Nombre palace total de la voiture',
  `nbPlaceDispo_voiture` int(1) NOT NULL COMMENT 'Nombre de place disponible de la voiture',
  `id_uitilsateur_voiture` int(11) UNSIGNED NOT NULL COMMENT 'Identifiant du conducteur de la voiture'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table gérant les voitures';

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`);

--
-- Index pour la table `composer_trajetetape`
--
ALTER TABLE `composer_trajetetape`
  ADD PRIMARY KEY (`id_composer_trajet_etape`),
  ADD KEY `id_etape_composer_trajetEtape` (`id_etape_composer_trajetEtape`,`id_trajet_composer_trajetEtape`),
  ADD KEY `FK_composer_trajet` (`id_trajet_composer_trajetEtape`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`id_etape`),
  ADD KEY `id_adresse_etape` (`id_adresse_etape`);

--
-- Index pour la table `expedier_messagerieutilisateur`
--
ALTER TABLE `expedier_messagerieutilisateur`
  ADD PRIMARY KEY (`id_expedier_messagerie_utilisateur`),
  ADD KEY `id_utilisateur_espedier_messagerieutilisateur` (`id_utilisateur_expedier_messagerieutilisateur`,`id_messagerie_expedier_messagerieUtilisateur`),
  ADD KEY `FK_expedier_messagerie` (`id_messagerie_expedier_messagerieUtilisateur`);

--
-- Index pour la table `messagerie`
--
ALTER TABLE `messagerie`
  ADD PRIMARY KEY (`id_messagerie`);

--
-- Index pour la table `proposer_trajetutilisateur`
--
ALTER TABLE `proposer_trajetutilisateur`
  ADD PRIMARY KEY (`id_proposer_trajet_utilisateur`);

--
-- Index pour la table `recevoir_messagerie_utilisateur`
--
ALTER TABLE `recevoir_messagerie_utilisateur`
  ADD PRIMARY KEY (`id_recevoir_messagerie_utilisateur`),
  ADD KEY `id_utilisateur_recevoir_messagerieutilisateur` (`id_utilisateur_recevoir_messagerieutilisateur`,`id_messagerie_recevoir_messagerieUtilisateur`),
  ADD KEY `FK_recevoir_messagerie` (`id_messagerie_recevoir_messagerieUtilisateur`);

--
-- Index pour la table `reserver_trajetutilisateur`
--
ALTER TABLE `reserver_trajetutilisateur`
  ADD PRIMARY KEY (`id_reserver_trajet_utilisateur`),
  ADD KEY `id_utilisateur_reserver` (`id_utilisateur_reserver`,`id_trajet_reserver`),
  ADD KEY `FK_reserver_trajet` (`id_trajet_reserver`);

--
-- Index pour la table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`id_trajet`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email_utilisateur` (`email_utilisateur`,`pseudo_utlilisateur`),
  ADD KEY `id_adresse_utlisateur` (`id_adresse_utlisateur`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id_voiture`),
  ADD KEY `id_uitilsateur_voiture` (`id_uitilsateur_voiture`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''adresse';
--
-- AUTO_INCREMENT pour la table `composer_trajetetape`
--
ALTER TABLE `composer_trajetetape`
  MODIFY `id_composer_trajet_etape` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant liant les etapes aux trajets';
--
-- AUTO_INCREMENT pour la table `etape`
--
ALTER TABLE `etape`
  MODIFY `id_etape` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''étape';
--
-- AUTO_INCREMENT pour la table `expedier_messagerieutilisateur`
--
ALTER TABLE `expedier_messagerieutilisateur`
  MODIFY `id_expedier_messagerie_utilisateur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''éxpédition du message';
--
-- AUTO_INCREMENT pour la table `messagerie`
--
ALTER TABLE `messagerie`
  MODIFY `id_messagerie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du message';
--
-- AUTO_INCREMENT pour la table `proposer_trajetutilisateur`
--
ALTER TABLE `proposer_trajetutilisateur`
  MODIFY `id_proposer_trajet_utilisateur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la proposition de trajet';
--
-- AUTO_INCREMENT pour la table `recevoir_messagerie_utilisateur`
--
ALTER TABLE `recevoir_messagerie_utilisateur`
  MODIFY `id_recevoir_messagerie_utilisateur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la réception du message';
--
-- AUTO_INCREMENT pour la table `reserver_trajetutilisateur`
--
ALTER TABLE `reserver_trajetutilisateur`
  MODIFY `id_reserver_trajet_utilisateur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la réservation du trajet';
--
-- AUTO_INCREMENT pour la table `trajet`
--
ALTER TABLE `trajet`
  MODIFY `id_trajet` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du trajet';
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''utilisateur';
--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id_voiture` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la voiture';
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `composer_trajetetape`
--
ALTER TABLE `composer_trajetetape`
  ADD CONSTRAINT `FK_composer_etape` FOREIGN KEY (`id_etape_composer_trajetEtape`) REFERENCES `etape` (`id_etape`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_composer_trajet` FOREIGN KEY (`id_trajet_composer_trajetEtape`) REFERENCES `trajet` (`id_trajet`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etape`
--
ALTER TABLE `etape`
  ADD CONSTRAINT `FK_etape_adresse` FOREIGN KEY (`id_adresse_etape`) REFERENCES `adresse` (`id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `expedier_messagerieutilisateur`
--
ALTER TABLE `expedier_messagerieutilisateur`
  ADD CONSTRAINT `FK_expedier_messagerie` FOREIGN KEY (`id_messagerie_expedier_messagerieUtilisateur`) REFERENCES `messagerie` (`id_messagerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_expedier_utilisateur` FOREIGN KEY (`id_utilisateur_expedier_messagerieutilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `proposer_trajetutilisateur`
--
ALTER TABLE `proposer_trajetutilisateur`
  ADD CONSTRAINT `FK_proposer_trajet` FOREIGN KEY (`id_proposer_trajet_utilisateur`) REFERENCES `trajet` (`id_trajet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_proposer_utilisateur` FOREIGN KEY (`id_proposer_trajet_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `recevoir_messagerie_utilisateur`
--
ALTER TABLE `recevoir_messagerie_utilisateur`
  ADD CONSTRAINT `FK_recevoir_messagerie` FOREIGN KEY (`id_messagerie_recevoir_messagerieUtilisateur`) REFERENCES `messagerie` (`id_messagerie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_recevoir_utilisateur` FOREIGN KEY (`id_utilisateur_recevoir_messagerieutilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reserver_trajetutilisateur`
--
ALTER TABLE `reserver_trajetutilisateur`
  ADD CONSTRAINT `FK_reserver_trajet` FOREIGN KEY (`id_trajet_reserver`) REFERENCES `trajet` (`id_trajet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_reserver_utilisateur` FOREIGN KEY (`id_utilisateur_reserver`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_utilisateur_adresse` FOREIGN KEY (`id_adresse_utlisateur`) REFERENCES `adresse` (`id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `FK_voiture_utilisateur` FOREIGN KEY (`id_voiture`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
