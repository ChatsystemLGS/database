DROP DATABASE IF EXISTS Chat;
CREATE DATABASE Chat;
USE Chat;

CREATE TABLE Users (
    id SERIAL NOT NULL,
    emailAddress VARCHAR() UNIQUE NOT NULL,
    nickname VARCHAR() UNIQUE NOT NULL,
    passwordHash VARCHAR() NOT NULL,
    PRIMARY KEY (userA, userB)
);

-- stores relationship of userB to userA -> is userB a friend of userA?
CREATE TABLE userRelationship (
    userA BIGINT UNSIGNED NOT NULL,
    userB BIGINT UNSIGNED NOT NULL,

    isFriend BOOLEAN NOT NULL,
    isBlocked BOOLEAN NOT NULL,

    type ENUM('friend', 'blocked') NOT NULL DEFAULT 'friend',


    PRIMARY KEY (userA, userB)
);

CREATE TABLE Roles(
    id SERIAL NOT NULL,
    type VARCHAR() NOT NULL UNIQUE,
    description VARCHAR() NOT NULL,
    PRIMARY KEY (id)
);
-- roles as enum?
-- can one user have multiple roles?

CREATE TABLE Channel(
    id SERIAL NOT NULL,
    type ENUM('dm', 'publicGroup', 'privateGroup') NOT NULL,
    name VARCHAR() NOT NULL UNIQUE, -- unique?-> find channel by name
);

CREATE TABLE channelMembers (
    user BIGINT UNSIGNED NOT NULL,
    channel BIGINT UNSIGNED NOT NULL,
    isAdmin BOOLEAN NOT NULL,

    PRIMARY KEY (user, channel),

    CONSTRAINT FK_User FOREIGN KEY (user) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_Channel FOREIGN KEY (channel) REFERENCES Channels(id) ON DELETE CASCADE
);

CREATE TABLE Message(
    id SERIAL NOT NULL,

--  data BLOB
--  data VARBINARY
--  data BINARY

    PRIMARY KEY (id)
);