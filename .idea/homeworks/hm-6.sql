-- 1) Создать таблицы реакций и комментариев
CREATE TABLE video_reactions (
                                 id int,
                                 created_at timestamp,
                                 author_id int,
                                 value int,
                                 video_id int
);


CREATE TABLE video_comments (
                                id int,
                                created_at timestamp,
                                author_id int,
                                video_id int,
                                content varchar(256)
);


-- 2) Добавить несколько записей в каждую таблицу выше
INSERT INTO video_reactions (id, created_at, author_id, value, video_id)
VALUES
    (1, CURRENT_TIMESTAMP, 567, 5, 776),
    (2, CURRENT_TIMESTAMP, 23556, 4, 377),
    (3, CURRENT_TIMESTAMP, 442, 2, 512),
    (4, CURRENT_TIMESTAMP, 9998, 1, 689),
    (5, CURRENT_TIMESTAMP, 1502, 3, 245),
    (6, CURRENT_TIMESTAMP, 504, 5, 918),
    (7, CURRENT_TIMESTAMP, 975, 4, 7200),
    (8, CURRENT_TIMESTAMP, 10332, 1, 2541),
    (9, CURRENT_TIMESTAMP, 808, 3, 67),
    (10, CURRENT_TIMESTAMP, 777, 2, 334);


INSERT INTO video_comments (id, created_at, author_id, video_id, content)
VALUES
    (1, CURRENT_TIMESTAMP, 724, 776, 'Incredible content! Cant get enough of it!'),
    (2, CURRENT_TIMESTAMP, 189, 776, 'This is mind-blowing, such an eye-opener.'),
    (3, CURRENT_TIMESTAMP, 503, 776, 'Absolutely love the way you present your ideas!'),
    (4, CURRENT_TIMESTAMP, 876, 67, 'Wow, this is truly inspiring, thanks for sharing!'),
    (5, CURRENT_TIMESTAMP, 291, 67, 'This video made my day, thank you for creating it!'),
    (6, CURRENT_TIMESTAMP, 612, 918, 'Im speechless. This deserves all the attention!'),
    (7, CURRENT_TIMESTAMP, 95, 918, 'You never fail to amaze me with your creativity!'),
    (8, CURRENT_TIMESTAMP, 438, 2541, 'This is the kind of content the world needs more of.'),
    (9, CURRENT_TIMESTAMP, 128, 334, 'Thank you for sharing such valuable insights!'),
    (10, CURRENT_TIMESTAMP, 365, 334, 'Your perspective is so refreshing, keep it coming!');
