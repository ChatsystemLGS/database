DROP DATABASE IF EXISTS Chat;

CREATE DATABASE Chat;

USE Chat;

CREATE TABLE Users (
    id SERIAL NOT NULL,
    emailAddress VARCHAR(255) UNIQUE NOT NULL,
    nickname VARCHAR(255) NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'debug'),
    PRIMARY KEY (id)
);

-- stores relationship of userB to userA -> is userB a friend of userA?
CREATE TABLE userRelationship (
    userA BIGINT UNSIGNED NOT NULL,
    userB BIGINT UNSIGNED NOT NULL,
    note VARCHAR(255) NOT NULL DEFAULT '',
    type ENUM('friend', 'blocked') NOT NULL DEFAULT 'friend',
    CONSTRAINT FK_userRelationship_userA FOREIGN KEY (userA) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_userRelationship_userB FOREIGN KEY (userB) REFERENCES Users(id) ON DELETE CASCADE,
    PRIMARY KEY (userA, userB)
);

CREATE TABLE Channels (
    id SERIAL NOT NULL,
    type ENUM('dm', 'publicGroup', 'privateGroup') NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE channelMembers (
    user BIGINT UNSIGNED NOT NULL,
    channel BIGINT UNSIGNED NOT NULL,
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT FK_channelMembers_user FOREIGN KEY (user) REFERENCES Users(id) ON DELETE CASCADE,
    CONSTRAINT FK_channelMembers_channel FOREIGN KEY (channel) REFERENCES Channels(id) ON DELETE CASCADE,
    PRIMARY KEY (user, channel)
);

CREATE TABLE Message (
    id SERIAL NOT NULL,
    channel BIGINT UNSIGNED NOT NULL,
    author BIGINT UNSIGNED NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    data VARBINARY(255),
    dataType ENUM(
        'text',
        'file:txt',
        'file:png',
        'file:gif',
        'file:pdf'
    ) NOT NULL,
    CONSTRAINT FK_Message_channel FOREIGN KEY (channel) REFERENCES Channels(id) ON DELETE CASCADE,
    CONSTRAINT FK_Message_author FOREIGN KEY (author) REFERENCES Users(id),
    PRIMARY KEY (id)
);