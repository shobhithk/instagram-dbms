DROP DATABASE IF EXISTS instagram;

CREATE DATABASE instagram;

USE instagram;

CREATE TABLE user_account (
	id VARCHAR(255) NOT NULL,
	user_email VARCHAR(255) NOT NULL,
	user_password VARCHAR(255) NOT NULL,
	user_full_name VARCHAR(255) NOT NULL,
	user_avatar VARCHAR(255) NOT NULL,
  	user_number_of_posts INT NULL,
  	user_number_of_followers INT NULL,
  	user_number_of_following INT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE post (
	id BIGINT NOT NULL AUTO_INCREMENT,
	post_content VARCHAR(255) NOT NULL,
	post_category INT NOT NULL,
	post_created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	post_created_by VARCHAR(255) NOT NULL,
	post_number_of_reactions INT NULL,
	foreign key(post_created_by) references user_account(id),
	PRIMARY KEY (id)
);

CREATE TABLE post_reaction (
	post_id BIGINT NOT NULL,
	user_id VARCHAR(255) NOT NULL,
	foreign key(post_id) references post(id),
	foreign key(user_id) references user_account(id),
	PRIMARY KEY (post_id,user_id)
);

CREATE TABLE user_notification (
	id BIGINT NOT NULL AUTO_INCREMENT,
    notification_image VARCHAR(255) NOT NULL,
	notification_message VARCHAR(255) NOT NULL,
	user_id VARCHAR(255) NOT NULL,
	foreign key(user_id) references user_account(id),
	PRIMARY KEY (id)
);

CREATE TABLE user_follower (
	follower_id VARCHAR(255) NOT NULL,
	user_id VARCHAR(255) NOT NULL,
	foreign key(follower_id) references user_account(id),
	foreign key(user_id) references user_account(id),
	PRIMARY KEY (follower_id,user_id)
);


