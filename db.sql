DROP DATABASE IF EXISTS Chat;

CREATE DATABASE Chat;

USE Chat;

CREATE TABLE Users (
    id SERIAL NOT NULL,
    emailAddress VARCHAR(255) UNIQUE NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    profilePicture LONGBLOB, -- stores png images... i know, bad practice and very slow but easy
    passwordHash VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'DEBUG'),
    PRIMARY KEY (id)
);

-- stores relationship of userB to userA -> is userB a friend of userA?
CREATE TABLE userRelationships (
    userA BIGINT UNSIGNED NOT NULL,
    userB BIGINT UNSIGNED NOT NULL,
    note VARCHAR(255) NOT NULL DEFAULT '',
    type ENUM('FRIEND', 'BLOCKED') NOT NULL DEFAULT 'FRIEND',
    CONSTRAINT FK_userRelationships_userA FOREIGN KEY (userA) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_userRelationships_userB FOREIGN KEY (userB) REFERENCES Users(id) ON DELETE CASCADE,
    PRIMARY KEY (userA, userB)
);

CREATE TABLE Channels (
    id SERIAL NOT NULL,
    type ENUM('DM', 'PUBLIC_GROUP', 'PRIVATE_GROUP') NOT NULL,
    name VARCHAR(255) DEFAULT NULL, -- DMs derive their channelname from the two participants -> can be NULL
    channelPicture LONGBLOB DEFAULT NULL, -- not happy about that either...
    PRIMARY KEY (id)
);

CREATE TABLE channelMembers ( -- user "user" is in channel "channel" and is admin of channel if "isAdmin"
    user BIGINT UNSIGNED NOT NULL,
    channel BIGINT UNSIGNED NOT NULL,
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT FK_channelMembers_user FOREIGN KEY (user) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_channelMembers_channel FOREIGN KEY (channel) REFERENCES Channels(id) ON DELETE CASCADE,
    PRIMARY KEY (user, channel)
);

CREATE TABLE Messages (
    id SERIAL NOT NULL,
    channel BIGINT UNSIGNED NOT NULL,
    author BIGINT UNSIGNED, -- can be null if author gets deleted
    timestamp TIMESTAMP NOT NULL,
    data LONGBLOB NOT NULL, -- also not great but idc
    dataType ENUM(
        'TEXT',
        'FILE_TXT',
        'FILE_PNG',
        'FILE_GIF',
        'FILE_PDF'
    ) NOT NULL,
    CONSTRAINT FK_Messages_channel FOREIGN KEY (channel) REFERENCES Channels(id) ON DELETE CASCADE,
    CONSTRAINT FK_Messages_author FOREIGN KEY (author) REFERENCES Users(id) ON DELETE SET NULL,
    PRIMARY KEY (id)
);