-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 17 juin 2026 à 06:26
-- Version du serveur : 12.1.2-MariaDB
-- Version de PHP : 8.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omk_agents`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('ksbWJbci21UecOpIa2g5eTbfaqCpEJB3', 1, 'generator_expertise', '$2y$12$wv8ymV3/FvlKvJI5M0qCIOk8ojOdTVA6JG6Zd1xjVuXTHf8eDUdHy', 0x00000000000000000000000000000001, '2026-06-16 15:22:47', '2026-06-16 05:44:07');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(190) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(3, 'items', 1, 1, 'IA & IV 2026 - 1er Colloque IA & Informatique Verte', 'IA & IV 2026 - 1er Colloque IA & Informatique Verte\nIA & IV 2026 - 1er Colloque IA & Informatique Verte IA & IV 2026 Thématique Keynotes Axes Calendrier Soumission Organisateurs Comité Inscription EN Contact 1er Colloque Intelligence Artificielle & Informatique Verte L’humain au cœur de l’innovation pour un avenir responsable et éthique 24 & 25 Septembre 2026 Amphi : la maison de la recherche Université Paris 8 / Saint-Denis S\'inscrire au colloque En savoir plus Notre Vision Un Futur Technologique Humain & Durable 0 1 L’humain au cœur de l’innovation L’innovation n’est pas une fin en soi, mais sert les besoins et le bien-être des personnes. L’humain est le centre de toutes les décisions : technologies, produits, services. 0 2 Un avenir responsable L’innovation est conçue en tenant compte des impacts sociaux et environnementaux. Elle implique des choix réfléchis et durables, qui ne nuisent pas à la société ou à la planète. 0 3 Une démarche éthique Les actions et créations respectent des principes moraux : justice, transparence, équité. L’éthique garantit que l’innovation est honorable et respectueuse de toutes les parties prenantes. Thématique L \' e s s o r d e s t e c h n o l o g i e s d \' I A d a n s l e s t r a n s p o r t s e t l a m o b i l i t é d u r a b l e : v e r s u n n u m é r i q u e é c o - c o n ç u e t r e s p o n s a b l e Ce colloque explore l\'essor des technologies d\'intelligence artificielle dans une multitude de domaines, incluant le transport, la mobilité intelligente, la smart city et l\'écologie. Pour être exploitables dans des environnements urbains complexes, ces systèmes doivent traiter un grand volume de données hétérogènes (trafic, topologie des routes, qualité de l\'air, météo, etc.), tout en respectant les principes d\'un numérique éco-conçu. La dimension interdisciplinaire est au cœur de nos échanges. Nous accueillons des travaux issus de divers horizons : finance, technologie, art, musique, et bien d\'autres. Cette ouverture permet d\'aborder la question de l\'efficacité énergétique de l\'IA de manière systémique, non seulement lors de l\'apprentissage des modèles, mais sur l\'ensemble du cycle de vie des données. Actuellement, 6 intervenants de renom ont déjà confirmé leur participation, dont le Pr. Mustapha Ouladsine. Le colloque promet d\'être un carrefour d\'innovation et de responsabilité partagée. \" Pour qu\'une solution de prédiction environnementale soit réellement alignée avec ses objectifs, elle doit intégrer un critère d\'efficience énergétique dans toutes les étapes de son développement. \" Vision 2026 Convergence : IA & Humanité Intelligence Artificielle Modèles de prédiction performants pour le transport et la mobilité durable Informatique Verte Réduction de l\'empreinte environnementale des systèmes d\'information Efficacité Énergétique Optimisation du coût énergétique des pipelines de données Impact Environnemental Conception d\'outils d\'aide à la décision éco-responsables Mobilité & Smart City Optimisation des flux urbains et infrastructures transport éco-responsables Arts, Musique & Culture Exploration de la créativité numérique et de son impact sociétal et écologique Finance & Économie Verte Modèles de prédiction et algorithmes pour une finance durable et responsable Santé & Numérique Durable IA pour le diagnostic et le bien-être avec une infrastructure éco-conçue Cadres Fondateurs d\'Informatique Verte L\'informatique verte (green computing) s\'est construite autour de cadres fondateurs qui visent la réduction de l\'empreinte environnementale des systèmes d\'information tout au long de leur cycle de vie. Green Use Utilisation sobre Green Disposal Recyclage responsable Green Design Conception durable Green Manufacturing Fabrication écologique — Modèle en quatre piliers de Murugesan Taxonomie de l’IA Soutenable Mesure de l\'énergie et métriques Efficacité des modèles et architectures Optimisation au niveau système L’IA pour la soutenabilité environnementale Cette structuration clarifie le paysage, mais reste centrée sur les modèles et l\'infrastructure, laissant en retrait la couche pipeline qui précède l\'apprentissage. — D\'après Zhou et al. Questions de recherche centrales IA & Mobilité \" Quelle configuration de pipeline et quelle architecture logicielle permettent d\'obtenir un niveau de précision fixé avec le coût énergétique minimal ? \" \" Comment optimiser la latence des systèmes de décision critique tout en minimisant la consommation énergétique embarquée ? \" \" Quel est l\'impact réel de l\'IA sur la fluidité du trafic urbain face au coût énergétique global de son déploiement ? \" Art & Musique \" Comment concilier l\'expression artistique assistée par IA avec l\'impératif de sobriété numérique ? Quelle est la valeur de l\'art sous contrainte énergétique ? \" \" La sobriété numérique peut-elle devenir une nouvelle source d\'inspiration thématique pour les arts numériques ? \" \" Comment les algorithmes de composition peuvent-ils être \'éco-conçus\' sans sacrifier la complexité harmonique ? \" Technologie & Innovation \" Quels nouveaux paradigmes de développement logiciel émergent en plaçant l\'efficience énergétique au même niveau que la performance brute ? \" \" L\'Edge Computing est-il la réponse ultime à l\'hyper-consommation des infrastructures Cloud centralisées ? \" \" Comment standardiser les métriques de Green Computing pour les pipelines de données hétérogènes ? \" Sciences Humaines & Sociales \" Comment la gouvernance des données peut-elle favoriser un numérique plus équitable et responsable face à la fracture énergétique ? \" \" Quels sont les freins psychologiques et sociétaux à l\'adoption de technologies d\'IA plus sobres mais potentiellement moins performantes ? \" \" Quel rôle pour les politiques publiques dans la régulation de l\'empreinte carbone liée à l\'intelligence artificielle ? \" L\'informatique verte n\'est pas seulement une optimisation technique, mais une approche systémique et interdisciplinaire, mobilisant : Informatique Énergie Économie Sciences Environnementales Gouvernance IA ECO Science humaines Intervenants Keynotes Thierry Gruszka Head of Cisco Innovation Labs France Corporate Strategy, Development & Incubation – Office of CEO Keynote Speaker Khalid MEKOUAR Président et Directeur Pédagogique - ESISA Docteur Ingénieur en Informatique et Expert reconnu en ingénierie logicielle. Ex-Maître assistant à l\'Université Nice-Sophia Antipolis (France). Keynote Speaker Isam Shahrour Président de Smart Conseil Expert de premier plan en solutions intelligentes pour des systèmes durables, efficaces et résilients. Keynote Speaker Mustapha Ouladsine Vice-président Délégué au numérique pour la recherche Directeur de l\'Institut Laennec en sciences du numérique et IA pour la santé (Aix-Marseille Université). Keynote Speaker Mehdi Ammi Vice-président Numérique et IA - Université Paris 8 Professeur en informatique spécialisé en intelligence artificielle. Keynote Speaker Larbi Boubchir Professeur en informatique - Université Paris 8 Expert en traitement du signal et de l\'image, Université Paris 8. Keynote Speaker Cédric Plessiet Professeur en Arts et Technologies des nouvelles images (ATI) Université Paris 8 Keynote Speaker Ioan Roxin Professeur émérite Université Marie et Louis Pasteur (Franche-Comté) Keynote Speaker Richard CHBEIR Professeur en Informatique - Université de Pau et des Pays de l\'Adour (UPPA) Directeur du laboratoire LIUPPA. Directeur de l\'OpenCEMS Industrial Chair. Keynote Speaker Mustapha Lebbah Professeur des Universités Université Paris-Saclay – Campus : Université de Versailles (UVSQ) Keynote Speaker L\'Efficience Énergétique de Bout en Bout Pour qu\'une solution de prédiction soit alignée avec ses objectifs, elle doit intégrer un critère d\'efficience dans toutes les étapes, de l\'ingestion à l\'inférence. Ingestion & Flux Lecture des boucles de trafic, météo et capteurs IoT. Optimisation des accès disques et transferts avec NumPy et Arrow. 15-20% de l\'énergie totale Prétraitement Nettoyage et filtrage massifs. Étude de l\'impact énergétique du passage de Pandas à Polars (Rust-driven). 25-30% de l\'énergie totale Enrichissement Jointures géographiques complexes et normalisation. Optimisation via des stratégies d\'exécution paresseuse (Lazy). 20-25% de l\'énergie totale Apprentissage & Inférence Entraînement de modèles profonds et déploiement via PySpark pour la scalabilité distribuée. 30-40% de l\'énergie totale Choix des Bibliothèques Quantifier comment le coût varie selon l\'usage de Pandas, Polars, NumPy ou PySpark. Stratégies d\'Exécution Arbitrage entre exécution immédiate et paresseuse, mono-nœud vs distribué. Configuration Logicielle Optimisation fine des paramètres système et allocation dynamique des ressources. Axes de recherche Enjeux : Des thématiques élargies pour un impact global De la mobilité intelligente à la smart city, le colloque explore les synergies entre IA et développement durable à travers tous les secteurs d\'activité. Matériel Architectures basse consommation, DVFS, durabilité Logiciel Algorithmes sobres, code optimisé, faible complexité énergétique Virtualisation & Cloud Mutualisation, allocation dynamique, autoscaling Data Centers PUE, free cooling, énergies renouvelables Réseaux Protocoles économes, edge computing Analyse du Cycle de Vie (ACV) Méthode d\'évaluation de l\'impact environnemental de la production à la fin de vie Normes & Indicateurs ISO 14001, ISO 50001, Energy Star, EPEAT, PUE Métriques & Mesures Quantification du coût énergétique des pipelines de données Art et Créativité Numérique Nouveaux modes d\'expression artistique à l\'ère de l\'IA et de la sobriété Musique et Algorithmes Composition assistée et impact environnemental de la production sonore numérique Sciences Humaines et Sociales Éthique, gouvernance et impact sociétal de l\'IA durable Gouvernance et Éthique Régulation, transparence des algorithmes et responsabilité d\'innovation Dates importantes Calendrier 15 Mai 2026 Soumission des articles Date limite pour soumettre vos contributions 4 Juin 2026 Notification aux auteurs Réponse du comité scientifique 15 Juillet 2026 Articles finaux Remise des articles prêts à être publiés 16 Juin 2026 Inscription anticipée Date limite d\'inscription anticipée (auteurs) 5 Septembre 2026 Inscription tardive Date limite d\'inscription tardive Guide à la soumission Publication des actes Les propositions de communication (entre 4000 et 5500 mots) en format word, devront comporter : Le titre de la communication ; L’axe thématique concerné ; La problématique et le cadre théorique ; Le terrain, le corpus ou la méthodologie mobilisée et les résultats ; Une courte notice biographique (environ 5 lignes). Les articles acceptés seront publiés dans les actes du colloque, au format PDF, dotés d’un ISBN et d’un DOI. Une sélection d’articles sera invitée à proposer des versions étendues, sous forme de chapitres d’ouvrage, dans la série ( ), publiée par ISTE et Wiley (indexée dans ). D’autres contributions pourront être invitées à faire l’objet de publications dans des revues scientifiques internationales. Équipe Co-organisateurs Imad Saleh Université Paris 8 - France Samuel Szoniecky Université Paris 8 - France Youssef MEKOUAR ESISA - ESISA ANALYTICA - Fès, Maroc LAHMER Mohammed ESISA - ESISA ANALYTICA - Fès, Maroc Everardo Reyes Université Paris 8 - France Matthieu Quiniou Université Paris 8 – France Expertise Comité Scientifique En cours de construction et validation Antonio Carlos Xavier NEHTE, Universitade Federal De Pernanbuco, Brésil Amar Lakal Université de Bordeaux, France Aura Conci Federal Fluminense University, Brésil Christophe KOLSKI Université Polytechnique, Hauts-de-France Larbi Boubchir Université Paris 8, France Mehdi Ammi Université Paris 8, France Ioan Roxin ELLIADD, Université de Franche Comté, France Khalid Mekouar Président de l\'ESISA, Fès, Maroc Voir tous les membres (24) Participation Contact Frais de participation Gratuit Ouvert à toutes et à tous Lieu Amphi : La Maison de la Recherche Adresse Université Paris 8, Saint-Denis Contact Pour toute question concernant le colloque, la soumission d\'articles ou l\'inscription, n\'hésitez pas à nous contacter. Responsables Imad Saleh Youssef Mekouar Email imad.saleh@univ-paris8.fr y.mekouar@esisa.ac.ma Envoyer un email Documentation Références Scientifiques [ 1 ] Musa, A.A.; Malami, S.I.; Alanazi, F.; Ounaies, W.; Alshammari, M.; Haruna, S.I. Sustainable Traffic Management for Smart Cities Using Internet-of-Things-Oriented Intelligent Transportation Systems (ITS): Challenges and Recommendations. Sustainability 2023, 15, 9859. [ 2 ] Kim, M.; Schrader, M.; Yoon, H.-S.; Bittle, J.A. Optimal Traffic Signal Control Using Priority Metric Based on Real- Time Measured Traffic Information. Sustainability 2023, 15, 7637. [ 3 ] Shaygan, M.; Meese, C.; Li, W.; Zhao, X. Traffic prediction using artificial intelligence: Review of recent advances and emerging opportunities. Transp. Res. Part C Emerg. Technol. 2022, 145, 103921. [ 4 ] Foxcroft, J.; Antonie, L. Using Polars to Improve String Similarity Performance in Python. Int. J. Popul. Data Sci. 2024. 15. Saha, B. Green Computing. Int. J. Comput. Trends Technol. (IJCTT) 2014, 14, 46–51. [ 5 ] Rózycki, R.; Solarska, D.A.; Waligóra, G. Energy-Aware Machine Learning Models—A Review of Recent Techniques and Perspectives. Energies 2025, 18, 2810. [ 6 ] McKinney, W. pandas: A Foundational Python Library for Data Analysis and Statistics. Python High Perform. Sci. Comput. 2011, 14, 1–9 . 13. Bandi, R.; Amudhavel, J.; Karthik, R. Machine Learning with PySpark—Review. Indones. J. Electr. Eng. Comput. Sci. 2018, 12, 102–106. [ 7 ] Lin, X.; Wang, Y.; Pedram, M. A Reinforcement Learning-Based Power Management Framework for Green Computing Data Centers. In Proceedings of the 2016 IEEE International Conference on Cloud Engineering (IC2E), Berlin, Germany, 4– 8 April 2016; pp. 135–138. [ 8 ] Zhou, S.; Wei, C.; Song, C.; Fu, Y.; Luo, R.; Chang, W.; Yang, L. A Hybrid Deep Learning Model for Short-Term Traffic Flow Prediction Considering Spatiotemporal Features. Sustainability 2022, 14, 10039. [ 221 ] Biswas, S.; Wardat, M.; Rajan, H. The Art and Practice of Data Science Pipelines: A Comprehensive Study of Data Science Pipelines in Theory, in-the-Small, and in-the-Large. In Proceedings of the 44th International Conference on Software Engineering, Pittsburgh, PA, USA, 21–29 May 2022; pp. 2091–2103. [ 9 ] Harris, C.R.; Millman, K.J.; Van Der Walt, S.J.; Gommers, R.; Virtanen, P.; Cournapeau, D.; Wieser, E.; Taylor, J.; Berg, S.; Smith, N.J.; et al. Array Programming with NumPy. Nature 2020, 585, 357–362. Computers 2025, 14, 319 23 of 24. [ 10 ] Mekouar, Y. L\'apport de la data science dans le développement d\'une plateforme internet des objets (IdO) : GreenNav, modélisation spatio-temporelle des émissions de CO2 pour une navigation écologique assistée par IA (cas de Paris). Thèse, Université Paris 8, 2025. IA & IV 2026 Colloque IA & Informatique Verte 24 & 25 Septembre 2026 Université Paris 8, Saint-Denis © 2026 Colloque Intelligence Artificielle et Informatique Verte. Tous droits réservés.');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(190) DEFAULT NULL,
  `status` varchar(190) DEFAULT NULL,
  `class` varchar(190) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, '67738', 'completed', 'Common\\Job\\AddDatabaseIndexes', NULL, '2026-06-16T05:38:33+00:00 INFO (6): Adding 8 database indexes: fulltext_search/is_public, media/ingester, media/renderer, media/extension, resource/resource_type, value/type, value/lang, session/modified\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `fulltext_search` for column `is_public`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `fulltext_search` for column `is_public`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `ingester`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `media` for column `ingester`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `renderer`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `media` for column `renderer`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `extension`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `media` for column `extension`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `resource` for column `resource_type`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `resource` for column `resource_type`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `value` for column `type`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `value` for column `type`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `value` for column `lang`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `value` for column `lang`.\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `session` for column `modified`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added index on table `session` for column `modified`.\n2026-06-16T05:38:33+00:00 INFO (6): Successfully added 8 database indexes: fulltext_search/is_public, media/ingester, media/renderer, media/extension, resource/resource_type, value/type, value/lang, session/modified\n', '2026-06-16 05:38:32', '2026-06-16 05:38:33'),
(2, 1, '67740', 'completed', 'Common\\Job\\AddDatabaseIndexes', NULL, '2026-06-16T05:38:33+00:00 INFO (6): Adding 8 database indexes: fulltext_search/is_public, media/ingester, media/renderer, media/extension, resource/resource_type, value/type, value/lang, session/modified\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `fulltext_search` for column `is_public`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `fulltext_search` for column `is_public`: An exception occurred while executing \'ALTER TABLE `fulltext_search` ADD INDEX `is_public` (`is_public`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'is_public\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `ingester`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `media` for column `ingester`: An exception occurred while executing \'ALTER TABLE `media` ADD INDEX `ingester` (`ingester`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'ingester\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `renderer`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `media` for column `renderer`: An exception occurred while executing \'ALTER TABLE `media` ADD INDEX `renderer` (`renderer`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'renderer\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `media` for column `extension`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `media` for column `extension`: An exception occurred while executing \'ALTER TABLE `media` ADD INDEX `extension` (`extension`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'extension\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `resource` for column `resource_type`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `resource` for column `resource_type`: An exception occurred while executing \'ALTER TABLE `resource` ADD INDEX `resource_type` (`resource_type`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'resource_type\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `value` for column `type`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `value` for column `type`: An exception occurred while executing \'ALTER TABLE `value` ADD INDEX `type` (`type`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'type\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `value` for column `lang`.\n2026-06-16T05:38:33+00:00 ERR (3): Unable to add index on table `value` for column `lang`: An exception occurred while executing \'ALTER TABLE `value` ADD INDEX `lang` (`lang`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'lang\'\n2026-06-16T05:38:33+00:00 INFO (6): Adding index on table `session` for column `modified`.\n2026-06-16T05:38:34+00:00 ERR (3): Unable to add index on table `session` for column `modified`: An exception occurred while executing \'ALTER TABLE `session` ADD INDEX `modified` (`modified`);\':\n\nSQLSTATE[42000]: Syntax error or access violation: 1061 Duplicate key name \'modified\'\n', '2026-06-16 05:38:33', '2026-06-16 05:38:34');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(190) NOT NULL,
  `renderer` varchar(190) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(190) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(190) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617'),
('20240219000000'),
('20240614123811');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('Common', 1, '3.4.76');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'x', 'x', NULL),
(186, 1, 5, 'y', 'y', NULL),
(187, 1, 5, 'xRatingValue', 'xRatingValue', NULL),
(188, 1, 5, 'yRatingValue', 'yRatingValue', NULL),
(189, 1, 5, 'degradName', 'degradName', NULL),
(190, 1, 5, 'degradColors', 'degradColors', NULL),
(191, 1, 5, 'creationDate', 'creationDate', NULL),
(192, 1, 5, 'hasExistence', 'a comme existence', NULL),
(193, 1, 5, 'hasActant', 'a comme actant', NULL),
(194, 1, 5, 'hasPhysique', 'a comme physique', NULL),
(195, 1, 5, 'hasConcept', 'a comme concept', NULL),
(196, 1, 5, 'hasRapport', 'a comme rapport', NULL),
(197, 1, 5, 'hasCrible', 'a comme crible', NULL),
(198, 1, 5, 'cribleLabel', 'cribleLabel', NULL),
(199, 1, 5, 'cribleId', 'cribleId', NULL),
(200, 1, 5, 'cribleRatingValue', 'cribleRatingValue', NULL),
(201, 1, 5, 'distanceCenter', 'distance du centre', NULL),
(202, 1, 5, 'distanceConcept', 'distance du concept', NULL),
(203, 1, 5, 'ordreCrible', 'Ordre dans le crible', NULL),
(204, 1, 5, 'hasCribleCarto', 'a comme cartographie', NULL),
(205, 1, 5, 'hasSujet', 'a comme sujet', NULL),
(206, 1, 5, 'hasObjet', 'a comme objet', NULL),
(207, 1, 5, 'hasPredicat', 'a comme prédicat', NULL),
(208, 1, 5, 'hasMenu', 'a comme menu', NULL),
(209, 1, 5, 'hasArchetype', 'a comme archetype', NULL),
(210, 1, 6, 'inScheme', 'is in scheme', NULL),
(211, 1, 6, 'hasTopConcept', 'has top concept', NULL),
(212, 1, 6, 'topConceptOf', 'is top concept in scheme', NULL),
(213, 1, 6, 'altLabel', 'alternative label', 'The range of skos:altLabel is the class of RDF plain literals.'),
(214, 1, 6, 'hiddenLabel', 'hidden label', 'The range of skos:hiddenLabel is the class of RDF plain literals.'),
(215, 1, 6, 'notation', 'notation', NULL),
(216, 1, 6, 'note', 'note', NULL),
(217, 1, 6, 'changeNote', 'change note', NULL),
(218, 1, 6, 'definition', 'definition', NULL),
(219, 1, 6, 'editorialNote', 'editorial note', NULL),
(220, 1, 6, 'example', 'example', NULL),
(221, 1, 6, 'historyNote', 'history note', NULL),
(222, 1, 6, 'scopeNote', 'scope note', NULL),
(223, 1, 6, 'semanticRelation', 'is in semantic relation with', NULL),
(224, 1, 6, 'broader', 'has broader', 'Broader concepts are typically rendered as parents in a concept hierarchy (tree).'),
(225, 1, 6, 'narrower', 'has narrower', 'Narrower concepts are typically rendered as children in a concept hierarchy (tree).'),
(226, 1, 6, 'related', 'has related', 'skos:related is disjoint with skos:broaderTransitive'),
(227, 1, 6, 'broaderTransitive', 'has broader transitive', NULL),
(228, 1, 6, 'narrowerTransitive', 'has narrower transitive', NULL),
(229, 1, 6, 'member', 'has member', NULL),
(230, 1, 6, 'memberList', 'has member list', 'For any resource, every item in the list given as the value of the\n      skos:memberList property is also a value of the skos:member property.'),
(231, 1, 6, 'mappingRelation', 'is in mapping relation with', 'These concept mapping relations mirror semantic relations, and the data model defined below is similar (with the exception of skos:exactMatch) to the data model defined for semantic relations. A distinct vocabulary is provided for concept mapping relations, to provide a convenient way to differentiate links within a concept scheme from links between concept schemes. However, this pattern of usage is not a formal requirement of the SKOS data model, and relies on informal definitions of best practice.'),
(232, 1, 6, 'broadMatch', 'has broader match', NULL),
(233, 1, 6, 'narrowMatch', 'has narrower match', NULL),
(234, 1, 6, 'relatedMatch', 'has related match', NULL),
(235, 1, 6, 'exactMatch', 'has exact match', 'skos:exactMatch is disjoint with each of the properties skos:broadMatch and skos:relatedMatch.'),
(236, 1, 6, 'closeMatch', 'has close match', NULL),
(237, 1, 7, 'access', 'Access', 'Define an access to the resource.'),
(238, 1, 7, 'featured', 'Featured', 'Mark the resource as a featured one as soon as a value is set, whatever it is.'),
(239, 1, 7, 'new', 'New', 'Mark the resource as a new one as soon as a value is set, whatever it is.'),
(240, 1, 7, 'reserved', 'Reserved', 'Define the resource as a restricted access one as soon a value is set, whatever it is.'),
(241, 1, 7, 'selected', 'Selected', 'Mark the resource as a selected one as soon as a value is set, whatever it is.'),
(242, 1, 7, 'category', 'Category', 'A topic that can be used for some purposes.'),
(243, 1, 7, 'collection', 'Collection', 'A way to group resources.'),
(244, 1, 7, 'set', 'Set', 'A set to group resources together.'),
(245, 1, 7, 'subject', 'Subject', 'A subject to describe the resource.'),
(246, 1, 7, 'tag', 'Tag', 'Tag that can be used for some purposes or for upgrade from Omeka Classic.'),
(247, 1, 7, 'theme', 'Theme', 'A domain that can be used for some purposes.'),
(248, 1, 7, 'type', 'Type', 'A type that can be used for some purposes.'),
(249, 1, 7, 'coordinates', 'Coordinates', 'Numerical coordinates related to the resource, generaly the geographic position.'),
(250, 1, 7, 'data', 'Data', 'Any data that can be used for any purpose.'),
(251, 1, 7, 'dateStart', 'Date of start', 'Start date related to the resource, for example an embargo.'),
(252, 1, 7, 'dateEnd', 'Date of end', 'End date related to the resource, for example an embargo.'),
(253, 1, 7, 'location', 'Location', 'A location related to the resource, for example the place of publication.'),
(254, 1, 7, 'note', 'Note', 'A specific or generic information on a resource, generally for internal purposes.'),
(255, 1, 7, 'number', 'Number', 'A number related to the resource.'),
(256, 1, 7, 'rank', 'Rank', 'A rank or a position related to the resource.'),
(257, 1, 7, 'status', 'Status', 'The status of the resource, generally for internal purposes.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(3, 1, NULL, 4, NULL, 'IA & IV 2026 - 1er Colloque IA & Informatique Verte', 1, '2026-06-16 15:22:47', '2026-06-16 15:22:47', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'SemanticPosition', 'SemanticPosition', NULL),
(107, 1, 5, 'Crible', 'Crible', NULL),
(108, 1, 5, 'CriblePosition', 'CriblePosition', NULL),
(109, 1, 5, 'CribleCarto', 'Cartographie d\'un crible', NULL),
(110, 1, 5, 'Actant', 'Actant', NULL),
(111, 1, 5, 'Existence', 'Existence', NULL),
(112, 1, 5, 'Physique', 'Physique', NULL),
(113, 1, 5, 'Rapport', 'Rapport', NULL),
(114, 1, 5, 'Archetype', 'Archetype', NULL),
(115, 1, 5, 'Concept', 'Concept', NULL),
(116, 1, 6, 'Concept', 'Concept', NULL),
(117, 1, 6, 'ConceptScheme', 'Concept Scheme', NULL),
(118, 1, 6, 'Collection', 'Collection', NULL),
(119, 1, 6, 'OrderedCollection', 'Ordered Collection', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 1, NULL, NULL, 'Agent'),
(3, 1, 82, NULL, NULL, 'Report'),
(4, 1, 90, NULL, NULL, 'Web document'),
(5, 1, 107, NULL, NULL, 'Tool');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 35, NULL, NULL, 4, NULL, 0, 0, NULL),
(25, 2, 36, NULL, NULL, 5, NULL, 0, 0, NULL),
(26, 3, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(27, 3, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(28, 3, 2, NULL, NULL, 3, NULL, 0, 0, NULL),
(29, 2, 197, NULL, NULL, 6, NULL, 0, 0, NULL),
(30, 3, 11, NULL, NULL, 4, NULL, 0, 0, NULL),
(31, 3, 250, NULL, NULL, 5, NULL, 0, 0, NULL),
(32, 4, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(33, 4, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(34, 4, 121, NULL, NULL, 3, NULL, 0, 0, NULL),
(35, 4, 250, NULL, NULL, 4, NULL, 0, 0, NULL),
(36, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(37, 5, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(38, 5, 121, NULL, NULL, 3, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('2a12df2cb3fae45fa46119d2f343ac27', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313738313632333936312e3736363234383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223665326262643234356565383561613032366565343763393232353636656136223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313738313633303233373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313738313636373131343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313738313633313835323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313738313636373136313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223064333736316636356663663462313662326466343866303139366661656135223b733a33323a226233316234663234366239633663363266633139623763643336333534323935223b7d733a343a2268617368223b733a36353a2262333162346632343662396336633632666331396237636433363335343239352d3064333736316636356663663462313662326466343866303139366661656135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a223730306430356230656432396538326666383038653839646530383834633464223b733a33323a226563626365653832646138353334646233346664303465646661633366323930223b733a33323a226437316261663238643032346438616639623532373866316461356337646561223b733a33323a226661653436646333356535393965303235396335646531643832366561326262223b733a33323a226662656361326362386566396234386236633034383961366537313565383038223b733a33323a226131343030653837623663363663303033633638343535396335653666333734223b733a33323a223834356335323966383965303564653234333962366436633337333133373930223b733a33323a226465316332323633363336646537613062666339613036306365356462376539223b733a33323a223661663337666231396236666564303037376161326163633633663862376536223b733a33323a223666663137376166303835366636636335666266316565613835613334333765223b733a33323a223838393666633664303639616133323332356263353662396536653538643334223b733a33323a223439396133386638623237666561313733396336613539383333306637366263223b733a33323a223232663730336638636231343564616137323233626332303763373638376330223b733a33323a223761306662326662383931616531306433393262396131356134313431353034223b733a33323a223537326565613465663361306133353566323438616133623936333336376337223b733a33323a223134646363353264316436323463316237373534383864323762636262663734223b733a33323a226262386234633236333764353761313766346437623534663330306239333964223b733a33323a223238653137636632396535353438353932656235636132643866653635316439223b733a33323a223263383632333739326466343763326633313766393731633836663434623061223b733a33323a223438306537646464323432333335613065303131653461376537623465633461223b733a33323a223065393637663364306535353966316666303031373735386533623862396639223b733a33323a226566303336303634346266336534326337333664626561383832306137316233223b7d733a343a2268617368223b733a36353a2265663033363036343462663365343263373336646265613838323061373162332d3065393637663364306535353966316666303031373735386533623862396639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226338393130626437666339643832393764396261646530316136633166643639223b733a33323a223538333762336337303362396435366165383037663932626137383566663036223b733a33323a223666663763386433636666666435343737353236306166626631643035656663223b733a33323a223936323163666365373937323166383263383661666665626665343031383133223b733a33323a226137616230663364356233326333356131383135393661303434613732326234223b733a33323a223335343639653062356462386238363162396330663665346434363365316365223b733a33323a223730623237366266646135386632333234366230323163636233363639333533223b733a33323a223732656131373230616333356531613239313861353430333932366534626262223b733a33323a226538643931383337373033353535613031336166303961383062373538333762223b733a33323a223533356565396663663266666637346262643663366338376663373035366162223b733a33323a226466613338616432633764363533623563633533653663623964366333383334223b733a33323a226638613132306132303264666163633438626263333232396232636431646435223b733a33323a223933626335306465363464626664353963616132383630623732386136386132223b733a33323a223565653164636364643030363237346233393239643335663463376133663130223b733a33323a226336653865643030383961363566336266306665323938353030626432373236223b733a33323a223136613364633264626330626537626266316634303730343631353066376630223b7d733a343a2268617368223b733a36353a2231366133646332646263306265376262663166343037303436313530663766302d6336653865643030383961363566336266306665323938353030626432373236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a226239303561666638373734626434653137616336396565323837313361383338223b733a33323a226537636237366334346338396136643631666530353265653435656436393035223b733a33323a223435656138643663636234626164343235613534363964366535643237353466223b733a33323a226465373034616662313738343037303438363738663736313836306564663530223b733a33323a223434666332336461653339643831633838316365383635666263343933323466223b733a33323a223138363863323465303737663638353837393864636134653234383561373839223b733a33323a223838306265666539656130383133383030323366393633336534343739376339223b733a33323a226264623862313361393633646162303839616363313035326166623063633835223b733a33323a226534326534313337383232373436396263303361623437633330666462336131223b733a33323a223931323366666237316635323838666462383564633036353836656566613536223b733a33323a223666613863363536633538373536613634356432393538643737633236613031223b733a33323a223935633662633935336663363039663331623330636436363066663666633134223b733a33323a226433303462376664646134656334333830343938613737303639306235626165223b733a33323a226262663032396134663732633062663065613264626432663638323764303931223b733a33323a226466633061386539386534373334386364356265326134353637303239393437223b733a33323a223633343334353234663839323865333462613562336663353931663930303638223b733a33323a226336383837303438393535343939623435336265646538623630616239383961223b733a33323a223038636465386633636363613966303832393563616335633962303839383864223b733a33323a223538306637623061366633373336313961666265366438366166653530613431223b733a33323a223635313539616332666536316139666534303165373437643432616431306532223b733a33323a223132613036323838363861313436636630633964386264633430316638656631223b733a33323a223739343136373231383861326533656338666562653032376133343838346133223b733a33323a226230666265303935336138613430353433333263353365323535393138656233223b733a33323a223633393935363839613335666133373266653363333534623734663237343837223b733a33323a223231666235653136373735363038343136636662313766646262373230643361223b733a33323a223835303365336564623063353739616136303033363035306434643966623763223b733a33323a226261363531346134663234646537666136333365646562636336633939656137223b733a33323a223465633264653961663237333237343765333262393465306233653432366330223b733a33323a223030393634663663353435656366376235323661343663663835353237663231223b733a33323a223630373266313365636164633539653631613763303336326538303930353736223b733a33323a226438333238616238663237616234303135313962396365333035316130363062223b733a33323a223861636366646333353465306334376262396134643764356535653263353863223b733a33323a226231623336623065363263303431356662363331613735303165336662306338223b733a33323a223530643736656664623739613332623234653261346533613537386162303031223b733a33323a226634393733623939653461353966633865633035623833616261633133376430223b733a33323a226136633835613663393132633832386333383030396563353832363463626231223b733a33323a226137303266376534313932396263336232353166303064653233376265373231223b733a33323a226433633963663862626637356563393339623430346235356163656331396638223b733a33323a226536633662616164306635363761336662626137633361366339633031623663223b733a33323a226432323466383965626639323632343638366236343764376561323031386361223b733a33323a223135633933643230346265346639346534313262613261653130366265383133223b733a33323a223662346637313663313936643566653435306664376666393830346137653230223b733a33323a223761633233653862313239666262616635353765633735356236353334356139223b733a33323a226434383636623263323238663161376535316361323036343363373434343530223b733a33323a223432626635656337666562383531643633643461663238306431636462373332223b733a33323a226563613465323438633565643633386164653266326531613431643261653932223b733a33323a223933613964653566333665643034333065353061323237303631333233613831223b733a33323a226461623634383161333534376434666331663431363436623434656532623230223b733a33323a223632643936343735316265646463646632663266666434393764633137373537223b733a33323a226634333432303035633534653038373832373738356331396439383630613232223b733a33323a223666373062636536356566366263376566623630633137636637343232306531223b733a33323a226230303861316363396531656534623732323665303065373863373365376336223b733a33323a223432316463646531363435386161346561386537633631663433353564626330223b733a33323a223765383863353361666536303536353432643032616532326565366334303137223b7d733a343a2268617368223b733a36353a2237653838633533616665363035363534326430326165323265653663343031372d3432316463646531363435386161346561386537633631663433353564626330223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1781623961),
('34d867e1a33a0c0e520305507a7ec153', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313738313539323434332e3031373334393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223334643836376531613333613063306535323033303535303761376563313533223b7d7d, 1781592443),
('a4ad25dbc57a3f4f26f39e9a384d5283', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313738313539323338332e3335303132333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226134616432356462633537613366346632366633396539613338346435323833223b7d7d, 1781592383);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"samuel.szoniecky@univ-paris8.fr\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Agents\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.2.0\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `layout` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2026-06-16 05:17:16', '2026-06-16 05:17:17', '$2y$12$rvzPMUZgybFexrRYKJzJtO2T/TCteisBgjuyuGyuEUNuyFYKfj3HO', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"id\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"id\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"id\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('locale', 1, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(190) NOT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value_annotation_id`, `value`, `uri`, `is_public`) VALUES
(5, 3, 1, NULL, 'literal', NULL, NULL, 'IA & IV 2026 - 1er Colloque IA & Informatique Verte', NULL, 1),
(6, 3, 250, NULL, 'literal', NULL, NULL, 'IA & IV 2026 - 1er Colloque IA & Informatique Verte IA & IV 2026 Thématique Keynotes Axes Calendrier Soumission Organisateurs Comité Inscription EN Contact 1er Colloque Intelligence Artificielle & Informatique Verte L’humain au cœur de l’innovation pour un avenir responsable et éthique 24 & 25 Septembre 2026 Amphi : la maison de la recherche Université Paris 8 / Saint-Denis S\'inscrire au colloque En savoir plus Notre Vision Un Futur Technologique Humain & Durable 0 1 L’humain au cœur de l’innovation L’innovation n’est pas une fin en soi, mais sert les besoins et le bien-être des personnes. L’humain est le centre de toutes les décisions : technologies, produits, services. 0 2 Un avenir responsable L’innovation est conçue en tenant compte des impacts sociaux et environnementaux. Elle implique des choix réfléchis et durables, qui ne nuisent pas à la société ou à la planète. 0 3 Une démarche éthique Les actions et créations respectent des principes moraux : justice, transparence, équité. L’éthique garantit que l’innovation est honorable et respectueuse de toutes les parties prenantes. Thématique L \' e s s o r d e s t e c h n o l o g i e s d \' I A d a n s l e s t r a n s p o r t s e t l a m o b i l i t é d u r a b l e : v e r s u n n u m é r i q u e é c o - c o n ç u e t r e s p o n s a b l e Ce colloque explore l\'essor des technologies d\'intelligence artificielle dans une multitude de domaines, incluant le transport, la mobilité intelligente, la smart city et l\'écologie. Pour être exploitables dans des environnements urbains complexes, ces systèmes doivent traiter un grand volume de données hétérogènes (trafic, topologie des routes, qualité de l\'air, météo, etc.), tout en respectant les principes d\'un numérique éco-conçu. La dimension interdisciplinaire est au cœur de nos échanges. Nous accueillons des travaux issus de divers horizons : finance, technologie, art, musique, et bien d\'autres. Cette ouverture permet d\'aborder la question de l\'efficacité énergétique de l\'IA de manière systémique, non seulement lors de l\'apprentissage des modèles, mais sur l\'ensemble du cycle de vie des données. Actuellement, 6 intervenants de renom ont déjà confirmé leur participation, dont le Pr. Mustapha Ouladsine. Le colloque promet d\'être un carrefour d\'innovation et de responsabilité partagée. \" Pour qu\'une solution de prédiction environnementale soit réellement alignée avec ses objectifs, elle doit intégrer un critère d\'efficience énergétique dans toutes les étapes de son développement. \" Vision 2026 Convergence : IA & Humanité Intelligence Artificielle Modèles de prédiction performants pour le transport et la mobilité durable Informatique Verte Réduction de l\'empreinte environnementale des systèmes d\'information Efficacité Énergétique Optimisation du coût énergétique des pipelines de données Impact Environnemental Conception d\'outils d\'aide à la décision éco-responsables Mobilité & Smart City Optimisation des flux urbains et infrastructures transport éco-responsables Arts, Musique & Culture Exploration de la créativité numérique et de son impact sociétal et écologique Finance & Économie Verte Modèles de prédiction et algorithmes pour une finance durable et responsable Santé & Numérique Durable IA pour le diagnostic et le bien-être avec une infrastructure éco-conçue Cadres Fondateurs d\'Informatique Verte L\'informatique verte (green computing) s\'est construite autour de cadres fondateurs qui visent la réduction de l\'empreinte environnementale des systèmes d\'information tout au long de leur cycle de vie. Green Use Utilisation sobre Green Disposal Recyclage responsable Green Design Conception durable Green Manufacturing Fabrication écologique — Modèle en quatre piliers de Murugesan Taxonomie de l’IA Soutenable Mesure de l\'énergie et métriques Efficacité des modèles et architectures Optimisation au niveau système L’IA pour la soutenabilité environnementale Cette structuration clarifie le paysage, mais reste centrée sur les modèles et l\'infrastructure, laissant en retrait la couche pipeline qui précède l\'apprentissage. — D\'après Zhou et al. Questions de recherche centrales IA & Mobilité \" Quelle configuration de pipeline et quelle architecture logicielle permettent d\'obtenir un niveau de précision fixé avec le coût énergétique minimal ? \" \" Comment optimiser la latence des systèmes de décision critique tout en minimisant la consommation énergétique embarquée ? \" \" Quel est l\'impact réel de l\'IA sur la fluidité du trafic urbain face au coût énergétique global de son déploiement ? \" Art & Musique \" Comment concilier l\'expression artistique assistée par IA avec l\'impératif de sobriété numérique ? Quelle est la valeur de l\'art sous contrainte énergétique ? \" \" La sobriété numérique peut-elle devenir une nouvelle source d\'inspiration thématique pour les arts numériques ? \" \" Comment les algorithmes de composition peuvent-ils être \'éco-conçus\' sans sacrifier la complexité harmonique ? \" Technologie & Innovation \" Quels nouveaux paradigmes de développement logiciel émergent en plaçant l\'efficience énergétique au même niveau que la performance brute ? \" \" L\'Edge Computing est-il la réponse ultime à l\'hyper-consommation des infrastructures Cloud centralisées ? \" \" Comment standardiser les métriques de Green Computing pour les pipelines de données hétérogènes ? \" Sciences Humaines & Sociales \" Comment la gouvernance des données peut-elle favoriser un numérique plus équitable et responsable face à la fracture énergétique ? \" \" Quels sont les freins psychologiques et sociétaux à l\'adoption de technologies d\'IA plus sobres mais potentiellement moins performantes ? \" \" Quel rôle pour les politiques publiques dans la régulation de l\'empreinte carbone liée à l\'intelligence artificielle ? \" L\'informatique verte n\'est pas seulement une optimisation technique, mais une approche systémique et interdisciplinaire, mobilisant : Informatique Énergie Économie Sciences Environnementales Gouvernance IA ECO Science humaines Intervenants Keynotes Thierry Gruszka Head of Cisco Innovation Labs France Corporate Strategy, Development & Incubation – Office of CEO Keynote Speaker Khalid MEKOUAR Président et Directeur Pédagogique - ESISA Docteur Ingénieur en Informatique et Expert reconnu en ingénierie logicielle. Ex-Maître assistant à l\'Université Nice-Sophia Antipolis (France). Keynote Speaker Isam Shahrour Président de Smart Conseil Expert de premier plan en solutions intelligentes pour des systèmes durables, efficaces et résilients. Keynote Speaker Mustapha Ouladsine Vice-président Délégué au numérique pour la recherche Directeur de l\'Institut Laennec en sciences du numérique et IA pour la santé (Aix-Marseille Université). Keynote Speaker Mehdi Ammi Vice-président Numérique et IA - Université Paris 8 Professeur en informatique spécialisé en intelligence artificielle. Keynote Speaker Larbi Boubchir Professeur en informatique - Université Paris 8 Expert en traitement du signal et de l\'image, Université Paris 8. Keynote Speaker Cédric Plessiet Professeur en Arts et Technologies des nouvelles images (ATI) Université Paris 8 Keynote Speaker Ioan Roxin Professeur émérite Université Marie et Louis Pasteur (Franche-Comté) Keynote Speaker Richard CHBEIR Professeur en Informatique - Université de Pau et des Pays de l\'Adour (UPPA) Directeur du laboratoire LIUPPA. Directeur de l\'OpenCEMS Industrial Chair. Keynote Speaker Mustapha Lebbah Professeur des Universités Université Paris-Saclay – Campus : Université de Versailles (UVSQ) Keynote Speaker L\'Efficience Énergétique de Bout en Bout Pour qu\'une solution de prédiction soit alignée avec ses objectifs, elle doit intégrer un critère d\'efficience dans toutes les étapes, de l\'ingestion à l\'inférence. Ingestion & Flux Lecture des boucles de trafic, météo et capteurs IoT. Optimisation des accès disques et transferts avec NumPy et Arrow. 15-20% de l\'énergie totale Prétraitement Nettoyage et filtrage massifs. Étude de l\'impact énergétique du passage de Pandas à Polars (Rust-driven). 25-30% de l\'énergie totale Enrichissement Jointures géographiques complexes et normalisation. Optimisation via des stratégies d\'exécution paresseuse (Lazy). 20-25% de l\'énergie totale Apprentissage & Inférence Entraînement de modèles profonds et déploiement via PySpark pour la scalabilité distribuée. 30-40% de l\'énergie totale Choix des Bibliothèques Quantifier comment le coût varie selon l\'usage de Pandas, Polars, NumPy ou PySpark. Stratégies d\'Exécution Arbitrage entre exécution immédiate et paresseuse, mono-nœud vs distribué. Configuration Logicielle Optimisation fine des paramètres système et allocation dynamique des ressources. Axes de recherche Enjeux : Des thématiques élargies pour un impact global De la mobilité intelligente à la smart city, le colloque explore les synergies entre IA et développement durable à travers tous les secteurs d\'activité. Matériel Architectures basse consommation, DVFS, durabilité Logiciel Algorithmes sobres, code optimisé, faible complexité énergétique Virtualisation & Cloud Mutualisation, allocation dynamique, autoscaling Data Centers PUE, free cooling, énergies renouvelables Réseaux Protocoles économes, edge computing Analyse du Cycle de Vie (ACV) Méthode d\'évaluation de l\'impact environnemental de la production à la fin de vie Normes & Indicateurs ISO 14001, ISO 50001, Energy Star, EPEAT, PUE Métriques & Mesures Quantification du coût énergétique des pipelines de données Art et Créativité Numérique Nouveaux modes d\'expression artistique à l\'ère de l\'IA et de la sobriété Musique et Algorithmes Composition assistée et impact environnemental de la production sonore numérique Sciences Humaines et Sociales Éthique, gouvernance et impact sociétal de l\'IA durable Gouvernance et Éthique Régulation, transparence des algorithmes et responsabilité d\'innovation Dates importantes Calendrier 15 Mai 2026 Soumission des articles Date limite pour soumettre vos contributions 4 Juin 2026 Notification aux auteurs Réponse du comité scientifique 15 Juillet 2026 Articles finaux Remise des articles prêts à être publiés 16 Juin 2026 Inscription anticipée Date limite d\'inscription anticipée (auteurs) 5 Septembre 2026 Inscription tardive Date limite d\'inscription tardive Guide à la soumission Publication des actes Les propositions de communication (entre 4000 et 5500 mots) en format word, devront comporter : Le titre de la communication ; L’axe thématique concerné ; La problématique et le cadre théorique ; Le terrain, le corpus ou la méthodologie mobilisée et les résultats ; Une courte notice biographique (environ 5 lignes). Les articles acceptés seront publiés dans les actes du colloque, au format PDF, dotés d’un ISBN et d’un DOI. Une sélection d’articles sera invitée à proposer des versions étendues, sous forme de chapitres d’ouvrage, dans la série ( ), publiée par ISTE et Wiley (indexée dans ). D’autres contributions pourront être invitées à faire l’objet de publications dans des revues scientifiques internationales. Équipe Co-organisateurs Imad Saleh Université Paris 8 - France Samuel Szoniecky Université Paris 8 - France Youssef MEKOUAR ESISA - ESISA ANALYTICA - Fès, Maroc LAHMER Mohammed ESISA - ESISA ANALYTICA - Fès, Maroc Everardo Reyes Université Paris 8 - France Matthieu Quiniou Université Paris 8 – France Expertise Comité Scientifique En cours de construction et validation Antonio Carlos Xavier NEHTE, Universitade Federal De Pernanbuco, Brésil Amar Lakal Université de Bordeaux, France Aura Conci Federal Fluminense University, Brésil Christophe KOLSKI Université Polytechnique, Hauts-de-France Larbi Boubchir Université Paris 8, France Mehdi Ammi Université Paris 8, France Ioan Roxin ELLIADD, Université de Franche Comté, France Khalid Mekouar Président de l\'ESISA, Fès, Maroc Voir tous les membres (24) Participation Contact Frais de participation Gratuit Ouvert à toutes et à tous Lieu Amphi : La Maison de la Recherche Adresse Université Paris 8, Saint-Denis Contact Pour toute question concernant le colloque, la soumission d\'articles ou l\'inscription, n\'hésitez pas à nous contacter. Responsables Imad Saleh Youssef Mekouar Email imad.saleh@univ-paris8.fr y.mekouar@esisa.ac.ma Envoyer un email Documentation Références Scientifiques [ 1 ] Musa, A.A.; Malami, S.I.; Alanazi, F.; Ounaies, W.; Alshammari, M.; Haruna, S.I. Sustainable Traffic Management for Smart Cities Using Internet-of-Things-Oriented Intelligent Transportation Systems (ITS): Challenges and Recommendations. Sustainability 2023, 15, 9859. [ 2 ] Kim, M.; Schrader, M.; Yoon, H.-S.; Bittle, J.A. Optimal Traffic Signal Control Using Priority Metric Based on Real- Time Measured Traffic Information. Sustainability 2023, 15, 7637. [ 3 ] Shaygan, M.; Meese, C.; Li, W.; Zhao, X. Traffic prediction using artificial intelligence: Review of recent advances and emerging opportunities. Transp. Res. Part C Emerg. Technol. 2022, 145, 103921. [ 4 ] Foxcroft, J.; Antonie, L. Using Polars to Improve String Similarity Performance in Python. Int. J. Popul. Data Sci. 2024. 15. Saha, B. Green Computing. Int. J. Comput. Trends Technol. (IJCTT) 2014, 14, 46–51. [ 5 ] Rózycki, R.; Solarska, D.A.; Waligóra, G. Energy-Aware Machine Learning Models—A Review of Recent Techniques and Perspectives. Energies 2025, 18, 2810. [ 6 ] McKinney, W. pandas: A Foundational Python Library for Data Analysis and Statistics. Python High Perform. Sci. Comput. 2011, 14, 1–9 . 13. Bandi, R.; Amudhavel, J.; Karthik, R. Machine Learning with PySpark—Review. Indones. J. Electr. Eng. Comput. Sci. 2018, 12, 102–106. [ 7 ] Lin, X.; Wang, Y.; Pedram, M. A Reinforcement Learning-Based Power Management Framework for Green Computing Data Centers. In Proceedings of the 2016 IEEE International Conference on Cloud Engineering (IC2E), Berlin, Germany, 4– 8 April 2016; pp. 135–138. [ 8 ] Zhou, S.; Wei, C.; Song, C.; Fu, Y.; Luo, R.; Chang, W.; Yang, L. A Hybrid Deep Learning Model for Short-Term Traffic Flow Prediction Considering Spatiotemporal Features. Sustainability 2022, 14, 10039. [ 221 ] Biswas, S.; Wardat, M.; Rajan, H. The Art and Practice of Data Science Pipelines: A Comprehensive Study of Data Science Pipelines in Theory, in-the-Small, and in-the-Large. In Proceedings of the 44th International Conference on Software Engineering, Pittsburgh, PA, USA, 21–29 May 2022; pp. 2091–2103. [ 9 ] Harris, C.R.; Millman, K.J.; Van Der Walt, S.J.; Gommers, R.; Virtanen, P.; Cournapeau, D.; Wieser, E.; Taylor, J.; Berg, S.; Smith, N.J.; et al. Array Programming with NumPy. Nature 2020, 585, 357–362. Computers 2025, 14, 319 23 of 24. [ 10 ] Mekouar, Y. L\'apport de la data science dans le développement d\'une plateforme internet des objets (IdO) : GreenNav, modélisation spatio-temporelle des émissions de CO2 pour une navigation écologique assistée par IA (cas de Paris). Thèse, Université Paris 8, 2025. IA & IV 2026 Colloque IA & Informatique Verte 24 & 25 Septembre 2026 Université Paris 8, Saint-Denis © 2026 Colloque Intelligence Artificielle et Informatique Verte. Tous droits réservés.', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'https://jardindesconnaissances.univ-paris8.fr/onto/jdc#', 'jdc', 'Jardin des connaissances', ''),
(6, 1, 'http://www.w3.org/2004/02/skos/core#', 'skos', 'SKOS', ''),
(7, 1, 'https://omeka.org/s/vocabs/curation/', 'curation', 'curation', 'Generic and common properties that are useful in Omeka for the curation of resources. The use of more common or more precise ontologies is recommended when it is possible.');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`),
  ADD KEY `is_public` (`is_public`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`),
  ADD KEY `media_type` (`media_type`),
  ADD KEY `ingester` (`ingester`),
  ADD KEY `renderer` (`renderer`),
  ADD KEY `extension` (`extension`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `resource_type` (`resource_type`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified` (`modified`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `type` (`type`),
  ADD KEY `lang` (`lang`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
