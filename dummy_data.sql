USE Chat;

DELETE FROM Users;
DELETE FROM Channels;
DELETE FROM Messages;
DELETE FROM Users;
DELETE FROM Users;

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