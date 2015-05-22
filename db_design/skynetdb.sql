SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX full_index ON aauth_pms;
DROP INDEX user_id_index ON aauth_user_variables;



/* Drop Tables */

DROP TABLE IF EXISTS aauth_groups;
DROP TABLE IF EXISTS aauth_perms;
DROP TABLE IF EXISTS aauth_perm_to_group;
DROP TABLE IF EXISTS aauth_perm_to_user;
DROP TABLE IF EXISTS aauth_pms;
DROP TABLE IF EXISTS aauth_system_variables;
DROP TABLE IF EXISTS aauth_users;
DROP TABLE IF EXISTS aauth_user_to_group;
DROP TABLE IF EXISTS aauth_user_variables;




/* Create Tables */

CREATE TABLE aauth_groups
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	name varchar(100),
	definition text,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_perms
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	name varchar(100),
	definition text,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_perm_to_group
(
	perm_id int(11) unsigned DEFAULT 0 NOT NULL,
	group_id int(11) unsigned DEFAULT 0 NOT NULL,
	PRIMARY KEY (perm_id, group_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_perm_to_user
(
	perm_id int(11) unsigned DEFAULT 0 NOT NULL,
	user_id int(11) unsigned DEFAULT 0 NOT NULL,
	PRIMARY KEY (perm_id, user_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_pms
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	sender_id  NOT NULL,
	receiver_id  NOT NULL,
	title varchar(255) NOT NULL,
	message text,
	date datetime,
	read boolean DEFAULT '48',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_system_variables
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	key varchar(100) NOT NULL,
	value text,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_users
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	email varchar(100) NOT NULL,
	pass varchar(50) NOT NULL,
	name varchar(100),
	banned boolean DEFAULT '48',
	last_login datetime,
	last_activity datetime,
	last_login_attempt datetime,
	forgot_exp text,
	remember_time datetime,
	remember_exp text,
	verification_code text,
	ip_address text,
	login_attempts int DEFAULT 0,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_user_to_group
(
	user_id int(11) unsigned DEFAULT 0 NOT NULL,
	group_id int(11) unsigned DEFAULT 0 NOT NULL,
	PRIMARY KEY (user_id, group_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE aauth_user_variables
(
	id int(11) unsigned NOT NULL AUTO_INCREMENT,
	user_id int(11) unsigned NOT NULL,
	key varchar(100) NOT NULL,
	value text,
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



/* Create Indexes */

CREATE INDEX full_index USING BTREE ON aauth_pms (id ASC, sender_id ASC, receiver_id ASC, read ASC);
CREATE INDEX user_id_index USING BTREE ON aauth_user_variables (user_id ASC);



