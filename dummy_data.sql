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
    'YfNwyWSkdmn+fqwgdfGlaKI3WxxNeubkVlgNUMISCy5N0UNiUqjQSUxwF6MoVCEKs27UPNoJwKDG2EJcSlO/Iw==' -- hp}Epj3c*2c}4FDiuH]pWQ_`>~_sZi
), (        -- id=2
    'jaro.filip@lgs-hu.eu',
    'Jaro',
    'gmTLNSg8ZQ2iaeJc+Bv7Gk68sNco314HjqwqRf9QCHXPIqyuXyitE5ORgh20543s757J8IL8pSm/3ZWIB+oqbQ==' -- z)Y)Pq7%)-4Q<Z@UkN7RP`K%v@f?uA
), (        -- id=3
    'dominik.hein@lgs-hu.eu',
    'Cobalt',
    'o9u+9pQ8lwr/AXhd5dE4voyXLGxxlnCY2VyGvaQqVycQzwD9yqbxhpWrYyuvhq56Od66eXJ6/ZzbeSckz12aTQ==' -- cK(u)45_)3Y3]V+e*%Fy^s?h-Ha[#y
), (        -- id=4
    'mirko.leon.weih@lgs-hu.eu',
    'Mirco',
    'JVdBXq9C/OA1VarLl7I396Rh9uEb3p+aQHlkVOBPVOpFBQ72ZJQdwJhyQp2Wi2cN8egXLBy2s0jnKiXMrXHd3Q==' -- mWe1h_1234
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
    'FRIEND'
), (
    1,
    3,
    '',
    'FRIEND'
), (
    1,
    4,
    '<3',
    'BLOCKED'
), (
    2,
    1,
    '',
    'FRIEND'
), (
    2,
    3,
    '',
    'FRIEND'
), (
    3,
    1,
    '',
    'FRIEND'
), (
    3,
    2,
    '',
    'FRIEND'
), (
    3,
    4,
    '',
    'FRIEND'
), (
    4,
    1,
    'der dude, den ich fragen muss, wenn ich nicht mit meinem macbook klar komme',
    'FRIEND'
), (
    4,
    2,
    '',
    'FRIEND'
), (
    4,
    3,
    '',
    'FRIEND'
);

INSERT INTO Channels (
    type,
    name
) VALUES (  -- mirko-felix; id=1
    'DM',
    null
), (        -- mirko-dominik; id=2
    'DM',
    null
), (        -- dominik-jaro; id=3
    'DM',
    null
), (        -- dominik-jaro-felix; id=4
    'PRIVATE_GROUP',
    'Mircos Dekopauschale ist Wucher'
), (        -- felix; id=5
    'PUBLIC_GROUP',
    'BG13'
), (        -- felix; id=6
    'PUBLIC_GROUP',
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
    'TEXT'
), (
    1,
    4,
    NOW(),
    'nee, bin grad in der Kirche.. Du kennst mich doch',
    'TEXT'
), (
    1,
    1,
    NOW(),
    'Hurensohn',
    'TEXT'
), (
    1,
    1,
    NOW(),
    'ich block dich',
    'TEXT'
), (
    2,
    3,
    NOW(),
    'Mirco, können wir morgen Abend zu dir in den Garten?',
    'TEXT'
), (
    2,
    4,
    NOW(),
    'Ja klar, wie jeder weiß bin ich ja sehr gastfreundlich. Aber die dekopauschale beträgt natürlich wie gewohnt 5€',
    'TEXT'
), (
    3,
    3,
    NOW(),
    'Mirco ist schon dumm, oder?',
    'TEXT'
), (
    3,
    2,
    NOW(),
    'Ja, aber da kann der arme doch nichts für :(',
    'TEXT'
), (
    4,
    2,
    NOW(),
    'Mirco hat mich grad wieder vier stunden lang zugequatscht und dann bemerkt, dass er einfach dumm ist.',
    'TEXT'
), (
    4,
    1,
    NOW(),
    'Bruh. Kenn ich irgendwoher... Ich weiß schon, warum ich jetzt mal mit Dominik zusammenarbeiten wollte',
    'TEXT'
), (
    4,
    3,
    NOW(),
    'Ja, der dude ist echt liebenswürdig aber schon echt anstrengend.',
    'TEXT'
), (
    4,
    1,
    NOW(),
    'Ist das eigentlich Mobbing? Ne, oder? Außerdem schreiben wir ja gerade in einem privaten channel. Mirko bekommt also nichts mit, wenn wir hier über ihn lästern:)',
    'TEXT'
);