-- --------------------------------------------------------
-- Host:                         157.245.112.159
-- Server version:               8.0.19 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             10.3.0.5876
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for lighthouse
CREATE DATABASE IF NOT EXISTS `lighthouse` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lighthouse`;

-- Dumping structure for table lighthouse.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.campuses
CREATE TABLE IF NOT EXISTS `campuses` (
  `_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `fk_campus_organizations`
    FOREIGN KEY (org_id) REFERENCES organizations (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'The client PK, used for FK constraints. Should never be exposed outside of the database.',
  `client_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Will be filled in using a v4 UUID provided by the app. Use this when needing to expose a client ID outside the database.',
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` datetime NOT NULL,
  `tanf` tinyint(1) unsigned NOT NULL,
  `at_risk` tinyint(1) unsigned NOT NULL,
  `transitional` tinyint(1) unsigned NOT NULL,
  `children` tinyint unsigned DEFAULT NULL,
  `adults` tinyint unsigned NOT NULL,
  `seniors` tinyint unsigned NOT NULL,
  `allergens` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `street` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apt` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Will contain the file name of the client''s QR Code image',
  `date_first_recorded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_visited` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `client_id` (`client_id`),
  UNIQUE KEY `qr_code_file_name` (`qr_code_file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.authorized_pickups
CREATE TABLE IF NOT EXISTS `authorized_pickups` (
  `client_id` int unsigned NOT NULL,
  `auth_client_id` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`auth_client_id`),
  CONSTRAINT `fk_authorized_pickups_clients_1`
    FOREIGN KEY (client_id) REFERENCES clients (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_authorized_pickups_clients_2`
    FOREIGN KEY (auth_client_id) REFERENCES clients (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.users
CREATE TABLE IF NOT EXISTS `users` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'The user PK, used for FK constraints. Should never be exposed outside of the database.',
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Will be filled in using a v4 UUID provided by the app. Use this when needing to expose a user ID outside the database.',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `org_id` tinyint unsigned NOT NULL,
  `needs_password_reset` tinyint(1) unsigned DEFAULT '0' COMMENT 'Will be a truthy value whenever someone requests that their password be reset.',
  `token_expiry_date` datetime DEFAULT NULL COMMENT 'The datetime value when the temp password token will expire.',
  `temp_password_token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Will be filled in only when the user requests a password change.',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visited` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `temp_password_token` (`temp_password_token`),
  CONSTRAINT `fk_users_organizations`
    FOREIGN KEY (org_id) REFERENCES organizations (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.counseling_notes
CREATE TABLE IF NOT EXISTS `counseling_notes` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `was_counseled` tinyint(1) unsigned NOT NULL,
  `is_baptized` tinyint(1) unsigned NOT NULL,
  `is_ccc_member` tinyint(1) unsigned NOT NULL,
  `member_where` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` tinyint unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`_id`),
  CONSTRAINT `fk_counseling_notes_organizations`
    FOREIGN KEY (org_id) REFERENCES organizations (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_counseling_notes_clients`
    FOREIGN KEY (client_id) REFERENCES clients (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_counseling_notes_users`
    FOREIGN KEY (`user_id`) REFERENCES users (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table lighthouse.queue
CREATE TABLE IF NOT EXISTS `queue` (
  `_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Surrogate key, isn''t really useful to reference.',
  `org_id` tinyint unsigned NOT NULL,
  `campus_id` smallint unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_num` mediumint unsigned NOT NULL,
  `is_present` tinyint(1) unsigned NOT NULL,
  `is_counseled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_completed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `ticket_num` (`ticket_num`),
  CONSTRAINT `fk_queue_organizations`
    FOREIGN KEY (`org_id`) REFERENCES organizations (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_queue_campus`
    FOREIGN KEY (`campus_id`) REFERENCES campuses (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_queue_client`
    FOREIGN KEY (`client_id`) REFERENCES clients (_id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
