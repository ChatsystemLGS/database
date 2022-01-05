USE Chat;

DELETE FROM Users;
DELETE FROM Channels;
DELETE FROM Messages;

ALTER TABLE Users AUTO_INCREMENT = 1;
ALTER TABLE Channels AUTO_INCREMENT = 1;
ALTER TABLE Messages AUTO_INCREMENT = 1;

INSERT INTO Users (
    emailAddress,
    nickname,
    passwordHash
) VALUES (  -- id=1
    'felix.hauptmann@lgs-hu.eu',
    'lixo',
    'f32i98fz97wezru2g3z98sduf8z89z8ug'
), (        -- id=2
    'jaro.filip@lgs-hu.eu',
    'Jaro',
    'fdoifh398hfosiduf893z9fuds9fz9z38'
), (        -- id=3
    'dominik.hein@lgs-hu.eu',
    'Cobalt',
    'd389ds8fu0j0w9fuds90uf39fsfj3dh8z'
), (        -- id=4
    'mirko.leon.weih@lgs-hu.eu',
    'Mirco',
    'che9w8zf93h98gze890gz398zg83z8rzg'
);

INSERT INTO userRelationships (
    userA,
    userB,
    note,
    type
) VALUES (
    1,
    2,
    '',
    'friend'
), (
    1,
    3,
    '',
    'friend'
), (
    1,
    4,
    '<3',
    'blocked'
), (
    2,
    1,
    '',
    'friend'
), (
    2,
    3,
    '',
    'friend'
), (
    3,
    1,
    '',
    'friend'
), (
    3,
    2,
    '',
    'friend'
), (
    3,
    4,
    '',
    'friend'
), (
    4,
    1,
    'der dude, den ich fragen muss, wenn ich nicht mit meinem macbook klar komme',
    'friend'
), (
    4,
    2,
    '',
    'friend'
), (
    4,
    3,
    '',
    'friend'
);

INSERT INTO Channels (
    type,
    name
) VALUES (  -- mirko-felix; id=1
    'dm',
    null
), (        -- mirko-dominik; id=2
    'dm',
    null
), (        -- dominik-jaro; id=3
    'dm',
    null
), (        -- dominik-jaro-felix; id=4
    'privateGroup',
    'Mircos Dekopauschale ist Wucher'
), (        -- felix; id=5
    'publicGroup',
    'BG13'
), (        -- felix; id=6
    'publicGroup',
    'IT BG13'
);

INSERT INTO channelMembers ( -- user "user" is in channel "channel" and is admin of channel if "isAdmin"
    user,
    channel,
    isAdmin
) VALUES (
    1,
    1,
    FALSE
), (
    4,
    1,
    FALSE
), (
    4,
    2,
    FALSE
), (
    3,
    2,
    FALSE
), (
    3,
    3,
    FALSE
), (
    2,
    3,
    FALSE
), (
    1,
    4,
    TRUE
), (
    2,
    4,
    FALSE
), (
    3,
    4,
    TRUE
), (
    1,
    5,
    TRUE
), (
    1,
    6,
    TRUE
);

INSERT INTO Messages (
    channel,
    author,
    timestamp,
    data,
    dataType
) VALUES (
    1,
    1,
    NOW(),
    'Hallo Mirko. Hast du heute schon irgendwas für informatik gemacht?',
    'text'
), (
    1,
    4,
    NOW(),
    'nee, bin grad in der Kirche.. Du kennst mich doch',
    'text'
), (
    1,
    1,
    NOW(),
    'Hurensohn',
    'text'
), (
    1,
    1,
    NOW(),
    'ich block dich',
    'text'
), (
    2,
    3,
    NOW(),
    'Mirco, können wir morgen Abend zu dir in den Garten?',
    'text'
), (
    2,
    4,
    NOW(),
    'Ja klar, wie jeder weiß bin ich ja sehr gastfreundlich. Aber die dekopauschale beträgt natürlich wie gewohnt 5€',
    'text'
), (
    3,
    3,
    NOW(),
    'Mirco ist schon dumm, oder?',
    'text'
), (
    3,
    2,
    NOW(),
    'Ja, aber da kann der arme doch nichts für :(',
    'text'
), (
    4,
    2,
    NOW(),
    'Mirco hat mich grad wieder vier stunden lang zugequatscht und dann bemerkt, dass er einfach dumm ist.',
    'text'
), (
    4,
    1,
    NOW(),
    'Bruh. Kenn ich irgendwoher... Ich weiß schon, warum ich jetzt mal mit Dominik zusammenarbeiten wollte',
    'text'
), (
    4,
    3,
    NOW(),
    'Ja, der dude ist echt liebenswürdig aber schon echt anstrengend.',
    'text'
), (
    4,
    1,
    NOW(),
    'Ist das eigentlich Mobbing? Ne, oder? Außerdem schreiben wir ja gerade in einem privaten channel. Mirko bekommt also nichts mit, wenn wir hier über ihn lästern:)',
    'text'
);