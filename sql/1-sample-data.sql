USE `lighthouse`;

INSERT INTO `organizations` (`name`)
VALUES
  ('Lighthouse');

INSERT INTO `campuses` (`name`, `org_id`)
VALUES
  ('Jonestown', 1),
  ('Nebraska', 1),
  ('Salty', 1);

INSERT INTO `user_roles` (`title`)
VALUES
  ('Org Admin'),
  ('Minister'),
  ('Staff'),
  ('Sys Admin');

INSERT INTO `clients` (
  `_id`, `client_id`, `first_name`,
  `last_name`, `alias`, `dob`, `tanf`,
  `at_risk`, `transitional`, `children`,
  `adults`, `seniors`, `allergens`,
  `street`, `apt`, `city`, `state`,
  `zip`, `qr_code_file_name`, `date_first_recorded`,
  `date_last_visited`
)
VALUES
  (
    1, '55-132-6095', 'Kay', 'Lesslie',
    'Kay Lesslie', '1956-12-05 20:51:31',
    1, 0, 1, 0, 4, 8, 'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio',
    '4235 Marquette Circle', '1688',
    'Lubbock', 'GA', '30458', NULL, '2019-09-17 23:21:44',
    '2016-07-02 12:24:53'
  ),
  (
    2, '10-627-9155', 'Sibbie', 'Kirkby',
    'Sibbie Kirkby', '2001-05-25 21:18:51',
    0, 0, 1, 2, 7, 0, 'tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at',
    '8 Rowland Plaza', '1295', 'Evansville',
    'GA', '30458', NULL, '2010-02-15 03:16:38',
    '2017-06-26 15:54:34'
  ),
  (
    3, '47-659-3095', 'Cyndy', 'Reinmar',
    'Cyndy Reinmar', '2004-05-30 00:24:56',
    0, 0, 0, 0, 3, 4, 'tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu',
    '4 Lawn Alley', '103', 'Hicksville',
    'GA', '30458', NULL, '2011-10-09 13:05:08',
    '2014-01-08 17:14:55'
  ),
  (
    4, '64-736-1773', 'Constance', 'Garroway',
    'Constance Garroway', '2019-01-14 20:33:30',
    0, 1, 0, 2, 0, 8, 'quam a odio in hac habitasse platea dictumst maecenas',
    '44125 Coolidge Place', '905', 'Saint Louis',
    'GA', '30458', NULL, '2016-05-15 20:19:24',
    '2014-04-20 22:26:16'
  ),
  (
    5, '54-948-1660', 'Clayson', 'Clingan',
    'Clayson Clingan', '1981-02-03 15:35:36',
    1, 1, 0, 1, 9, 2, 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus',
    '78 Kensington Point', '342', 'Hialeah',
    'GA', '30458', NULL, '2018-02-01 03:36:34',
    '2019-10-28 21:33:31'
  ),
  (
    6, '29-969-7099', 'Maurie', 'Halpeine',
    'Maurie Halpeine', '1953-07-27 06:36:29',
    1, 0, 0, 4, 6, 9, NULL, '7466 Glacier Hill Plaza',
    '1158', 'Spokane', 'GA', '30458',
    NULL, '2013-11-08 17:42:27', '2011-06-17 15:20:58'
  ),
  (
    7, '70-441-6335', 'Sher', 'Flowerdew',
    'Sher Flowerdew', '1933-10-01 19:50:52',
    0, 1, 0, 7, 8, 4, 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc',
    '51 Rusk Road', '198', 'Staten Island',
    'GA', '30458', NULL, '2019-12-16 12:45:00',
    '2014-05-26 00:49:39'
  ),
  (
    8, '78-596-5937', 'Nora', 'Lawland',
    'Nora Lawland', '2013-01-26 11:50:34',
    1, 1, 1, 5, 9, 5, 'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum',
    '23 Pawling Center', '321', 'Pittsburgh',
    'GA', '30458', NULL, '2011-06-02 21:12:16',
    '2010-08-04 20:23:39'
  ),
  (
    9, '28-559-3391', 'Suzann', 'Trevorrow',
    'Suzann Trevorrow', '2003-10-23 13:09:28',
    0, 1, 1, 4, 4, 6, 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed',
    '36231 Macpherson Trail', '1127',
    'Pasadena', 'GA', '30458', NULL, '2011-02-27 22:54:18',
    '2017-04-25 19:56:39'
  ),
  (
    10, '73-495-9095', 'Dorrie', 'Dartnall',
    'Dorrie Dartnall', '1958-07-14 21:02:33',
    0, 0, 1, 1, 2, 8, NULL, '0 Toban Pass',
    '1956', 'Aiken', 'GA', '30458', NULL,
    '2019-09-14 02:55:16', '2015-12-01 07:47:47'
  ),
  (
    11, '57-589-0783', 'Geraldine', 'Stiggles',
    'Geraldine Stiggles', '1959-04-07 04:23:48',
    1, 1, 0, 2, 3, 2, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum',
    '43 Orin Pass', '1754', 'Norwalk',
    'GA', '30458', NULL, '2013-03-08 18:00:04',
    '2019-05-13 16:10:51'
  ),
  (
    12, '99-966-5109', 'Lara', 'Levinge',
    'Lara Levinge', '1968-03-08 19:17:14',
    0, 1, 1, 4, 0, 0, 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus',
    '064 Gerald Hill', '1937', 'Fort Wayne',
    'GA', '30458', NULL, '2017-10-13 07:54:40',
    '2014-12-16 14:58:10'
  ),
  (
    13, '50-540-7505', 'Julie', 'Kettley',
    'Julie Kettley', '1997-06-27 21:14:54',
    0, 1, 0, 9, 5, 10, NULL, '002 Esker Pass',
    '913', 'Hattiesburg', 'GA', '30458',
    NULL, '2012-03-09 21:19:13', '2016-11-18 09:51:13'
  ),
  (
    14, '92-829-8081', 'Janetta', 'Gwinnett',
    'Janetta Gwinnett', '1976-02-13 04:25:11',
    1, 0, 0, 3, 3, 1, NULL, '74 Sutteridge Plaza',
    '694', 'Washington', 'GA', '30458',
    NULL, '2018-12-01 11:15:23', '2017-01-01 17:18:54'
  ),
  (
    15, '39-525-3098', 'Jonie', 'Tidder',
    'Jonie Tidder', '1990-03-29 05:41:33',
    1, 0, 0, 2, 10, 1, 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti',
    '76662 Summit Junction', '1328',
    'Philadelphia', 'GA', '30458', NULL,
    '2010-09-20 04:49:02', '2017-05-27 11:29:36'
  ),
  (
    16, '35-258-0700', 'Pat', 'Bristowe',
    'Pat Bristowe', '1922-01-13 22:43:31',
    0, 1, 0, 5, 2, 7, 'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in',
    '6919 Luster Drive', '539', 'Seattle',
    'GA', '30458', NULL, '2010-12-14 22:06:58',
    '2017-04-09 19:19:08'
  ),
  (
    17, '53-500-4197', 'Bren', 'Inchan',
    'Bren Inchan', '1987-05-21 12:46:51',
    1, 0, 1, 9, 3, 5, NULL, '8 Eagle Crest Plaza',
    '370', 'Austin', 'GA', '30458', NULL,
    '2015-06-30 13:11:46', '2020-01-07 06:19:04'
  ),
  (
    18, '26-380-9917', 'Currey', 'Schenfisch',
    'Currey Schenfisch', '1931-02-24 19:31:20',
    0, 0, 0, 0, 4, 1, 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum',
    '92 Mcbride Alley', '365', 'Fort Lauderdale',
    'GA', '30458', NULL, '2010-11-27 10:37:47',
    '2015-04-05 17:28:04'
  ),
  (
    19, '89-359-3085', 'Letitia', 'Clougher',
    'Letitia Clougher', '1936-06-04 00:02:54',
    1, 1, 0, 2, 1, 0, 'ac enim in tempor turpis nec euismod scelerisque quam',
    '9 John Wall Hill', '198', 'Augusta',
    'GA', '30458', NULL, '2016-07-02 21:04:34',
    '2017-10-09 22:01:30'
  ),
  (
    20, '32-955-0888', 'Murvyn', 'Romi',
    'Murvyn Romi', '1939-01-01 14:06:12',
    0, 0, 1, 7, 4, 8, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum',
    '139 Maple Trail', '1693', 'Ocala',
    'GA', '30458', NULL, '2020-03-09 09:25:06',
    '2017-09-30 05:37:55'
  ),
  (
    21, '08-394-9789', 'Reynard', 'Deegin',
    'Reynard Deegin', '1939-09-26 12:38:39',
    1, 0, 0, 3, 2, 4, 'magna at nunc commodo placerat praesent blandit nam nulla',
    '0822 Spenser Junction', '1468',
    'Houston', 'GA', '30458', NULL, '2013-03-06 07:01:47',
    '2011-09-26 20:39:34'
  ),
  (
    22, '64-452-1051', 'Maxim', 'Pamphilon',
    'Maxim Pamphilon', '1974-09-17 03:06:20',
    1, 1, 1, 9, 4, 6, 'justo in blandit ultrices',
    '113 Lunder Trail', '398', 'Albuquerque',
    'GA', '30458', NULL, '2019-11-06 21:40:49',
    '2018-10-22 22:17:31'
  ),
  (
    23, '75-636-7694', 'Ingaborg', 'Bauldrey',
    'Ingaborg Bauldrey', '1943-11-04 19:21:35',
    0, 1, 1, 3, 5, 4, 'ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at',
    '1079 Logan Terrace', '862', 'New York City',
    'GA', '30458', NULL, '2010-06-08 18:31:07',
    '2015-08-31 14:55:53'
  ),
  (
    24, '64-398-7439', 'Ardelis', 'Labern',
    'Ardelis Labern', '1981-06-03 13:43:55',
    1, 1, 0, 8, 3, 6, 'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus',
    '66 Fallview Pass', '159', 'Montgomery',
    'GA', '30458', NULL, '2016-10-28 21:40:27',
    '2018-07-21 11:40:48'
  ),
  (
    25, '68-853-6585', 'Jaquenette', 'Royall',
    'Jaquenette Royall', '1968-07-30 04:20:04',
    1, 0, 1, 10, 7, 6, NULL, '77810 Mariners Cove Crossing',
    '1125', 'Las Vegas', 'GA', '30458',
    NULL, '2016-06-21 01:41:49', '2010-09-08 13:12:50'
  ),
  (
    26, '48-356-0633', 'Dickie', 'Seekings',
    'Dickie Seekings', '2006-03-19 04:05:43',
    1, 0, 0, 2, 6, 1, 'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti',
    '4739 Blackbird Lane', '663', 'Salt Lake City',
    'GA', '30458', NULL, '2019-06-05 04:47:00',
    '2011-11-14 15:09:29'
  ),
  (
    27, '78-995-9700', 'Mycah', 'Schiefersten',
    'Mycah Schiefersten', '1925-05-05 21:44:24',
    0, 0, 0, 2, 5, 1, 'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet',
    '7 Armistice Hill', '846', 'Tampa',
    'GA', '30458', NULL, '2015-09-15 00:14:38',
    '2012-09-06 17:42:39'
  ),
  (
    28, '29-624-5675', 'Thatch', 'Gabrieli',
    'Thatch Gabrieli', '1960-12-04 13:32:34',
    0, 0, 0, 6, 6, 8, 'pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi',
    '5590 Knutson Alley', '924', 'Hartford',
    'GA', '30458', NULL, '2018-03-07 10:19:44',
    '2015-02-07 21:05:41'
  ),
  (
    29, '48-637-9974', 'Raye', 'Redman',
    'Raye Redman', '1936-03-11 21:14:49',
    1, 0, 0, 9, 6, 6, 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam',
    '44297 Schmedeman Court', '365',
    'Duluth', 'GA', '30458', NULL, '2017-10-14 22:01:24',
    '2014-06-08 14:34:32'
  ),
  (
    30, '64-242-6134', 'Arleen', 'Simoncelli',
    'Arleen Simoncelli', '1953-04-24 10:40:01',
    1, 0, 0, 2, 8, 8, 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in',
    '5817 Lake View Plaza', '1740',
    'Boston', 'GA', '30458', NULL, '2010-01-24 03:24:23',
    '2015-11-19 22:50:26'
  ),
  (
    31, '11-921-9288', 'Cesare', 'Pauwel',
    'Cesare Pauwel', '1965-11-11 19:19:13',
    0, 1, 0, 10, 6, 0, 'justo pellentesque viverra pede ac diam cras pellentesque volutpat',
    '670 Morningstar Parkway', '1756',
    'Cheyenne', 'GA', '30458', NULL, '2010-10-09 00:29:40',
    '2019-01-19 16:29:02'
  ),
  (
    32, '15-794-7083', 'Jamaal', 'Decruse',
    'Jamaal Decruse', '1948-07-13 23:08:50',
    0, 1, 0, 8, 3, 0, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet',
    '65 Sundown Circle', '850', 'New York City',
    'GA', '30458', NULL, '2015-07-02 15:45:21',
    '2020-03-28 15:13:46'
  ),
  (
    33, '13-509-6800', 'Stanwood', 'Goldin',
    'Stanwood Goldin', '1926-05-05 21:38:24',
    0, 1, 0, 2, 7, 0, NULL, '8646 Oneill Alley',
    '997', 'San Jose', 'GA', '30458',
    NULL, '2013-02-28 12:16:00', '2018-10-28 15:46:37'
  ),
  (
    34, '70-798-4990', 'Bordy', 'Duckham',
    'Bordy Duckham', '2014-02-20 04:54:47',
    0, 1, 0, 7, 3, 0, NULL, '500 Northwestern Crossing',
    '1491', 'Virginia Beach', 'GA', '30458',
    NULL, '2012-09-18 03:08:30', '2014-07-20 12:21:46'
  ),
  (
    35, '65-607-4928', 'Kirstyn', 'Sharland',
    'Kirstyn Sharland', '2014-07-27 11:43:33',
    0, 0, 0, 5, 6, 1, NULL, '7222 Becker Center',
    '831', 'Waterloo', 'GA', '30458',
    NULL, '2012-03-02 04:52:09', '2014-10-16 19:01:03'
  ),
  (
    36, '50-470-7151', 'Amata', 'Innis',
    'Amata Innis', '1939-11-19 01:48:53',
    1, 0, 1, 2, 1, 1, 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla',
    '30 Cascade Point', '279', 'Cedar Rapids',
    'GA', '30458', NULL, '2010-07-22 06:51:57',
    '2012-08-01 04:41:26'
  ),
  (
    37, '01-222-6879', 'Joannes', 'Cove',
    'Joannes Cove', '1937-12-19 18:49:13',
    0, 0, 0, 1, 1, 2, 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla',
    '9576 Carey Crossing', '1080', 'Oakland',
    'GA', '30458', NULL, '2012-05-13 12:30:16',
    '2017-12-21 05:56:04'
  ),
  (
    38, '57-189-0728', 'Shell', 'Olcot',
    'Shell Olcot', '1950-05-08 16:18:44',
    0, 0, 0, 4, 8, 9, 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus',
    '52 Sutherland Park', '309', 'Berkeley',
    'GA', '30458', NULL, '2017-09-14 07:39:33',
    '2011-12-28 07:00:49'
  ),
  (
    39, '53-246-9783', 'Obidiah', 'Cicero',
    'Obidiah Cicero', '1983-03-06 11:53:31',
    0, 0, 1, 6, 3, 3, 'cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate',
    '7 Ridge Oak Avenue', '934', 'New Orleans',
    'GA', '30458', NULL, '2010-04-27 05:58:12',
    '2011-09-18 14:59:15'
  ),
  (
    40, '57-681-5514', 'Marina', 'Platfoot',
    'Marina Platfoot', '1999-02-04 02:40:27',
    1, 0, 1, 4, 9, 6, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio',
    '2198 Meadow Valley Drive', '552',
    'Dallas', 'GA', '30458', NULL, '2015-01-28 05:06:25',
    '2014-04-04 19:51:19'
  ),
  (
    41, '73-440-8569', 'Marty', 'Desborough',
    'Marty Desborough', '1963-12-05 00:01:08',
    0, 1, 0, 10, 6, 1, NULL, '5 Leroy Crossing',
    '1987', 'Loretto', 'GA', '30458',
    NULL, '2012-04-08 14:10:03', '2014-05-21 18:26:40'
  ),
  (
    42, '87-778-2511', 'Mamie', 'Hark',
    'Mamie Hark', '1923-04-29 21:32:55',
    1, 1, 1, 0, 1, 2, 'sem duis aliquam convallis nunc',
    '4 Hansons Circle', '1114', 'Saint Louis',
    'GA', '30458', NULL, '2012-11-10 00:59:11',
    '2013-06-22 06:24:07'
  ),
  (
    43, '05-916-7986', 'Parrnell', 'MacNeill',
    'Parrnell MacNeill', '2016-12-18 22:27:57',
    1, 1, 0, 9, 3, 9, 'urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo',
    '5 Sunnyside Road', '1721', 'Florence',
    'GA', '30458', NULL, '2011-09-22 18:29:27',
    '2016-02-22 15:45:01'
  ),
  (
    44, '58-419-3759', 'Isidro', 'Glitherow',
    'Isidro Glitherow', '1923-02-14 15:57:27',
    1, 1, 0, 2, 7, 9, 'nulla integer pede justo lacinia eget tincidunt',
    '45 David Crossing', '955', 'Davenport',
    'GA', '30458', NULL, '2015-04-03 01:55:59',
    '2015-02-11 22:12:18'
  ),
  (
    45, '29-657-4452', 'Sabra', 'Eyers',
    'Sabra Eyers', '1949-06-07 05:00:07',
    1, 0, 0, 5, 8, 9, 'phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget',
    '82 Mccormick Drive', '419', 'Mount Vernon',
    'GA', '30458', NULL, '2014-11-28 12:48:35',
    '2019-07-14 06:34:05'
  ),
  (
    46, '00-828-5598', 'Mora', 'Branca',
    'Mora Branca', '1956-11-09 01:56:54',
    1, 0, 0, 10, 10, 6, 'ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique',
    '0 Stuart Lane', '998', 'Saint Louis',
    'GA', '30458', NULL, '2014-07-07 22:46:17',
    '2013-04-25 04:19:06'
  ),
  (
    47, '05-255-2990', 'Boris', 'Arends',
    'Boris Arends', '1949-04-10 01:13:24',
    0, 0, 0, 4, 3, 7, NULL, '7623 Mallory Point',
    '744', 'Palmdale', 'GA', '30458',
    NULL, '2019-08-16 14:23:24', '2013-06-16 12:52:08'
  ),
  (
    48, '86-177-5344', 'Marcile', 'Brockbank',
    'Marcile Brockbank', '1934-09-17 21:36:00',
    0, 0, 0, 6, 1, 5, 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi',
    '20316 Holmberg Hill', '978', 'Tucson',
    'GA', '30458', NULL, '2012-02-28 05:37:45',
    '2010-05-09 12:15:15'
  ),
  (
    49, '54-299-0113', 'Tamar', 'Gregoriou',
    'Tamar Gregoriou', '1980-02-08 22:14:32',
    0, 0, 0, 3, 7, 2, 'mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus',
    '925 Weeping Birch Avenue', '1373',
    'Huntsville', 'GA', '30458', NULL,
    '2017-05-29 10:28:59', '2019-09-04 05:47:20'
  ),
  (
    50, '48-373-5878', 'Godfrey', 'Barbery',
    'Godfrey Barbery', '1931-10-18 16:04:23',
    0, 0, 0, 0, 10, 8, 'praesent', '159 Susan Alley',
    '1598', 'Akron', 'GA', '30458', NULL,
    '2018-09-04 08:52:38', '2019-04-09 15:43:06'
  ),
  (
    51, '11-755-9953', 'Tiffy', 'Tippell',
    'Tiffy Tippell', '1975-11-13 21:13:11',
    1, 1, 0, 1, 1, 3, NULL, '23765 Hudson Junction',
    '542', 'Southfield', 'GA', '30458',
    NULL, '2011-07-31 08:39:54', '2019-11-03 00:34:32'
  ),
  (
    52, '66-114-9562', 'Silvana', 'Elson',
    'Silvana Elson', '1954-04-20 19:30:43',
    1, 1, 0, 1, 7, 3, 'lacinia sapien', '005 Thierer Parkway',
    '1611', 'Los Angeles', 'GA', '30458',
    NULL, '2017-08-02 04:00:40', '2017-08-14 03:27:07'
  ),
  (
    53, '34-325-8030', 'Fanchon', 'Arminger',
    'Fanchon Arminger', '1983-09-23 06:38:23',
    0, 1, 1, 2, 1, 5, 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris',
    '12346 Clemons Center', '1650',
    'Birmingham', 'GA', '30458', NULL,
    '2012-03-27 02:18:52', '2014-10-29 15:37:39'
  ),
  (
    54, '56-115-6038', 'Birch', 'Glendza',
    'Birch Glendza', '1992-08-21 00:48:34',
    0, 1, 0, 2, 1, 5, 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et',
    '69081 Rowland Avenue', '1151',
    'Duluth', 'GA', '30458', NULL, '2019-03-22 02:44:12',
    '2015-04-04 20:18:24'
  ),
  (
    55, '52-146-9831', 'Daisy', 'Cogle',
    'Daisy Cogle', '2015-01-19 23:52:38',
    0, 0, 1, 9, 6, 4, 'curabitur in libero ut massa volutpat convallis',
    '8 Esch Avenue', '680', 'Chicago',
    'GA', '30458', NULL, '2010-10-27 22:25:28',
    '2016-06-27 03:59:41'
  ),
  (
    56, '34-924-7284', 'Noam', 'Joesbury',
    'Noam Joesbury', '1966-12-04 16:16:15',
    1, 1, 1, 2, 1, 10, 'pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc',
    '311 Havey Court', '1557', 'Memphis',
    'GA', '30458', NULL, '2017-05-02 00:11:02',
    '2013-10-01 08:52:23'
  ),
  (
    57, '56-464-9651', 'Morly', 'Bentham3',
    'Morly Bentham3', '1969-08-05 19:08:17',
    1, 1, 1, 10, 4, 8, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus',
    '1326 Comanche Drive', '1368', 'Denver',
    'GA', '30458', NULL, '2015-05-25 05:32:23',
    '2012-03-18 10:26:57'
  ),
  (
    58, '43-612-4725', 'Fredrick', 'Jouandet',
    'Fredrick Jouandet', '1966-03-02 02:12:25',
    0, 0, 1, 6, 9, 7, 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula',
    '3542 Morningstar Parkway', '1840',
    'Kingsport', 'GA', '30458', NULL,
    '2011-05-08 10:05:44', '2017-04-11 12:33:34'
  ),
  (
    59, '22-663-4023', 'Hermie', 'Belham',
    'Hermie Belham', '1992-02-11 17:49:01',
    0, 0, 0, 0, 4, 6, NULL, '59814 Hanover Place',
    '584', 'Sandy', 'GA', '30458', NULL,
    '2012-09-04 20:08:57', '2017-11-27 15:39:34'
  ),
  (
    60, '92-698-6671', 'Lisha', 'Mcimmie',
    'Lisha Mcimmie', '1958-06-21 13:41:10',
    0, 0, 0, 2, 4, 10, 'fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi',
    '4509 Forest Run Trail', '646',
    'Houston', 'GA', '30458', NULL, '2011-03-13 05:03:07',
    '2014-06-04 13:20:52'
  ),
  (
    61, '50-060-2291', 'Maegan', 'Dreye',
    'Maegan Dreye', '1964-04-08 13:42:28',
    1, 0, 0, 9, 5, 9, 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit',
    '70852 Redwing Park', '592', 'Lexington',
    'GA', '30458', NULL, '2016-09-04 13:21:22',
    '2015-12-19 05:41:25'
  ),
  (
    62, '44-335-8362', 'Adriaens', 'Yelding',
    'Adriaens Yelding', '1975-12-08 13:07:29',
    1, 1, 1, 5, 6, 0, 'nunc vestibulum ante ipsum',
    '9 Steensland Place', '1093', 'Brooklyn',
    'GA', '30458', NULL, '2017-10-20 06:04:45',
    '2017-11-18 07:58:26'
  ),
  (
    63, '68-634-3950', 'Bethanne', 'Cartwight',
    'Bethanne Cartwight', '1975-03-30 22:50:35',
    0, 0, 1, 9, 0, 5, NULL, '1 Stoughton Street',
    '1852', 'Saint Cloud', 'GA', '30458',
    NULL, '2010-08-24 10:43:02', '2014-03-25 11:32:35'
  ),
  (
    64, '58-542-9856', 'Radcliffe', 'Happer',
    'Radcliffe Happer', '1954-07-17 15:35:38',
    0, 0, 1, 3, 10, 5, NULL, '32831 Browning Drive',
    '1240', 'San Antonio', 'GA', '30458',
    NULL, '2013-07-21 04:42:13', '2014-09-03 00:57:31'
  ),
  (
    65, '76-195-3287', 'Arny', 'Hobson',
    'Arny Hobson', '1946-02-15 23:37:02',
    1, 1, 0, 10, 9, 4, 'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla',
    '79625 Superior Crossing', '1200',
    'Mobile', 'GA', '30458', NULL, '2015-09-24 11:16:38',
    '2018-05-03 00:18:55'
  ),
  (
    66, '91-221-4761', 'Rudy', 'Crosse',
    'Rudy Crosse', '1984-03-17 19:31:52',
    1, 1, 0, 3, 9, 10, 'sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus',
    '7101 Warrior Avenue', '1647', 'Seattle',
    'GA', '30458', NULL, '2018-12-31 15:56:46',
    '2017-06-17 22:56:46'
  ),
  (
    67, '53-871-7869', 'Mirna', 'Keene',
    'Mirna Keene', '1945-06-25 03:06:04',
    0, 0, 1, 1, 10, 4, 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis',
    '1387 Comanche Avenue', '1620',
    'Charleston', 'GA', '30458', NULL,
    '2019-06-01 22:50:40', '2017-02-26 22:14:11'
  ),
  (
    68, '90-159-6933', 'Kingston', 'Ferby',
    'Kingston Ferby', '1973-12-23 06:52:11',
    1, 1, 1, 8, 2, 8, 'sagittis dui', '931 Sunnyside Place',
    '1798', 'Washington', 'GA', '30458',
    NULL, '2017-10-25 21:47:56', '2019-01-24 14:14:38'
  ),
  (
    69, '17-897-6712', 'Roxanne', 'Danzig',
    'Roxanne Danzig', '1948-06-23 05:21:48',
    1, 1, 0, 7, 0, 4, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean',
    '57 Knutson Parkway', '743', 'Waco',
    'GA', '30458', NULL, '2015-07-21 18:27:57',
    '2016-06-13 07:13:53'
  ),
  (
    70, '98-114-7966', 'Kelley', 'Gianni',
    'Kelley Gianni', '1951-10-09 22:37:54',
    0, 0, 0, 3, 5, 3, 'eget rutrum', '327 Arrowood Park',
    '1614', 'Chicago', 'GA', '30458',
    NULL, '2013-11-13 04:21:59', '2011-08-28 09:04:03'
  ),
  (
    71, '14-965-5116', 'Dell', 'Lightwing',
    'Dell Lightwing', '1961-09-13 09:23:04',
    1, 0, 1, 8, 0, 6, 'lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu pede',
    '397 Porter Lane', '102', 'Van Nuys',
    'GA', '30458', NULL, '2013-07-05 21:05:12',
    '2017-02-27 15:05:38'
  ),
  (
    72, '70-473-1597', 'Claire', 'Witherbed',
    'Claire Witherbed', '1939-08-02 03:29:10',
    1, 0, 0, 3, 4, 6, 'eros viverra', '808 Laurel Way',
    '804', 'Portsmouth', 'GA', '30458',
    NULL, '2013-12-20 06:24:54', '2015-10-07 07:10:42'
  ),
  (
    73, '58-620-2819', 'Corenda', 'Bridgeland',
    'Corenda Bridgeland', '1932-07-25 16:39:55',
    1, 0, 1, 9, 4, 3, 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper',
    '4148 Columbus Trail', '189', 'Charleston',
    'GA', '30458', NULL, '2018-05-28 17:24:58',
    '2016-11-15 18:45:41'
  ),
  (
    74, '31-783-2662', 'Georgeta', 'Trowle',
    'Georgeta Trowle', '2016-06-19 06:21:31',
    1, 1, 1, 3, 8, 1, 'volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis',
    '5 Macpherson Court', '1345', 'Des Moines',
    'GA', '30458', NULL, '2016-03-24 17:08:51',
    '2015-01-20 23:49:36'
  ),
  (
    75, '76-783-9341', 'Eudora', 'Domenichini',
    'Eudora Domenichini', '1928-05-17 00:56:37',
    0, 0, 1, 8, 2, 5, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis',
    '0 Valley Edge Pass', '567', 'Cincinnati',
    'GA', '30458', NULL, '2013-06-03 01:17:51',
    '2016-04-09 03:50:30'
  ),
  (
    76, '96-074-6993', 'Pietro', 'Ubsdell',
    'Pietro Ubsdell', '1935-01-06 23:23:33',
    1, 1, 1, 2, 8, 5, NULL, '81546 Blaine Junction',
    '234', 'Houston', 'GA', '30458', NULL,
    '2020-02-23 17:55:31', '2017-05-31 22:48:47'
  ),
  (
    77, '09-876-9058', 'Nan', 'Summerscales',
    'Nan Summerscales', '1965-01-11 20:04:07',
    0, 0, 1, 3, 9, 9, 'ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede',
    '4 Dwight Parkway', '1231', 'Minneapolis',
    'GA', '30458', NULL, '2015-05-22 03:03:37',
    '2016-01-14 20:38:24'
  ),
  (
    78, '75-885-1014', 'Christabel', 'Kimbly',
    'Christabel Kimbly', '2001-03-29 23:27:40',
    0, 1, 1, 8, 4, 2, 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget',
    '9 Hoffman Center', '469', 'Akron',
    'GA', '30458', NULL, '2012-09-05 10:32:54',
    '2019-12-12 08:38:36'
  ),
  (
    79, '21-117-1725', 'Nadine', 'Northover',
    'Nadine Northover', '2017-03-29 20:47:59',
    0, 0, 1, 1, 7, 1, 'diam vitae quam suspendisse potenti nullam porttitor',
    '4 Vahlen Hill', '972', 'New York City',
    'GA', '30458', NULL, '2010-01-26 01:38:36',
    '2015-10-02 21:18:01'
  ),
  (
    80, '50-936-4316', 'Humphrey', 'Rudd',
    'Humphrey Rudd', '1963-06-13 23:33:56',
    1, 0, 1, 5, 0, 4, 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec',
    '389 Thackeray Way', '905', 'Providence',
    'GA', '30458', NULL, '2013-09-21 00:20:12',
    '2014-12-10 05:11:03'
  ),
  (
    81, '18-035-0146', 'Marji', 'Gilhoolie',
    'Marji Gilhoolie', '2012-08-17 15:37:51',
    0, 0, 0, 8, 10, 7, NULL, '3015 Crescent Oaks Lane',
    '84', 'San Luis Obispo', 'GA', '30458',
    NULL, '2012-06-08 06:26:08', '2010-12-02 15:17:09'
  ),
  (
    82, '08-457-0057', 'Ezri', 'Glasbey',
    'Ezri Glasbey', '1939-12-08 14:16:14',
    0, 0, 1, 10, 4, 3, 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat',
    '1 Glacier Hill Place', '329', 'Wilmington',
    'GA', '30458', NULL, '2016-07-26 20:31:32',
    '2018-11-11 02:42:31'
  ),
  (
    83, '09-111-4421', 'Torrin', 'Rein',
    'Torrin Rein', '1929-11-06 08:15:07',
    0, 0, 1, 4, 10, 2, 'urna ut tellus',
    '6822 Farwell Street', '487', 'Trenton',
    'GA', '30458', NULL, '2017-09-28 03:36:03',
    '2014-06-10 07:14:58'
  ),
  (
    84, '53-584-8480', 'Garwood', 'Dunhill',
    'Garwood Dunhill', '1974-04-17 04:50:20',
    1, 1, 1, 2, 3, 7, 'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque',
    '07 Nobel Parkway', '1807', 'Denton',
    'GA', '30458', NULL, '2015-01-20 18:00:40',
    '2018-07-19 03:14:37'
  ),
  (
    85, '15-500-4531', 'Imogen', 'Sijmons',
    'Imogen Sijmons', '1929-03-04 21:40:37',
    0, 1, 1, 0, 6, 4, 'elementum nullam',
    '4 Tony Pass', '1254', 'Greensboro',
    'GA', '30458', NULL, '2012-10-06 23:12:00',
    '2018-01-14 08:47:42'
  ),
  (
    86, '25-421-6168', 'Bard', 'Bartolommeo',
    'Bard Bartolommeo', '1999-02-16 12:03:55',
    1, 0, 0, 8, 3, 3, 'orci luctus et ultrices posuere cubilia curae',
    '92467 Burrows Lane', '1542', 'Evansville',
    'GA', '30458', NULL, '2010-11-27 00:16:08',
    '2012-05-05 20:24:31'
  ),
  (
    87, '54-608-4023', 'Ernie', 'Bilbey',
    'Ernie Bilbey', '1974-07-13 13:56:53',
    1, 0, 0, 8, 4, 6, NULL, '6744 Glacier Hill Plaza',
    '371', 'Phoenix', 'GA', '30458', NULL,
    '2018-07-01 23:33:20', '2013-11-30 01:23:02'
  ),
  (
    88, '46-755-3633', 'Karel', 'Early',
    'Karel Early', '2008-04-19 01:07:09',
    0, 0, 1, 9, 10, 2, 'morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet',
    '189 Stoughton Street', '1555',
    'Saint Cloud', 'GA', '30458', NULL,
    '2013-01-05 00:45:00', '2016-11-12 06:17:28'
  ),
  (
    89, '26-250-6054', 'Timmy', 'Casarini',
    'Timmy Casarini', '1982-06-29 23:55:26',
    1, 0, 0, 10, 7, 1, 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac',
    '383 Havey Crossing', '34', 'Kansas City',
    'GA', '30458', NULL, '2018-03-22 15:54:31',
    '2010-06-01 09:54:22'
  ),
  (
    90, '59-763-2765', 'Felice', 'Mathissen',
    'Felice Mathissen', '1946-08-21 11:39:44',
    0, 0, 1, 10, 3, 4, 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in',
    '20 Shopko Terrace', '936', 'Tallahassee',
    'GA', '30458', NULL, '2017-08-06 02:00:17',
    '2012-12-26 02:45:59'
  ),
  (
    91, '96-861-9475', 'Elmira', 'Semmence',
    'Elmira Semmence', '1984-08-01 16:22:45',
    1, 0, 1, 5, 7, 8, 'mauris ullamcorper purus sit amet nulla quisque',
    '71 Morningstar Park', '332', 'Birmingham',
    'GA', '30458', NULL, '2011-04-12 12:25:30',
    '2013-11-02 03:53:14'
  ),
  (
    92, '44-024-1300', 'Matias', 'Snasdell',
    'Matias Snasdell', '1949-04-16 01:02:27',
    1, 1, 1, 2, 6, 3, 'id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo',
    '67 Jenifer Alley', '1198', 'Zephyrhills',
    'GA', '30458', NULL, '2014-09-29 13:02:32',
    '2018-07-14 21:19:13'
  ),
  (
    93, '54-101-2140', 'Micheal', 'Jeduch',
    'Micheal Jeduch', '1939-03-14 12:50:29',
    1, 0, 0, 8, 4, 3, NULL, '3 West Parkway',
    '1695', 'Pittsburgh', 'GA', '30458',
    NULL, '2013-06-03 02:23:53', '2018-06-29 10:08:28'
  ),
  (
    94, '12-234-2480', 'Tani', 'Walas',
    'Tani Walas', '1936-09-01 05:28:28',
    1, 1, 1, 1, 8, 3, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus',
    '6 Tony Park', '49', 'Gulfport',
    'GA', '30458', NULL, '2011-03-17 21:09:19',
    '2011-03-16 08:39:09'
  ),
  (
    95, '16-144-2064', 'Alta', 'Gogay',
    'Alta Gogay', '1988-09-19 21:47:14',
    1, 1, 1, 4, 6, 1, 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede',
    '34 Bluestem Court', '722', 'Battle Creek',
    'GA', '30458', NULL, '2018-06-01 08:54:49',
    '2016-12-19 04:02:10'
  ),
  (
    96, '39-325-4338', 'Cristal', 'Jewis',
    'Cristal Jewis', '1971-12-04 06:58:42',
    0, 1, 0, 7, 3, 4, 'orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel',
    '8138 Grayhawk Place', '1870', 'Phoenix',
    'GA', '30458', NULL, '2010-04-03 21:36:20',
    '2016-03-28 03:41:56'
  ),
  (
    97, '72-793-9531', 'Giselle', 'Thain',
    'Giselle Thain', '1981-03-19 14:42:08',
    0, 1, 0, 1, 0, 1, 'justo morbi ut odio cras mi pede',
    '7517 Corben Drive', '131', 'San Francisco',
    'GA', '30458', NULL, '2011-05-17 23:42:52',
    '2018-06-09 10:36:49'
  ),
  (
    98, '39-243-8849', 'Robinette', 'McCrow',
    'Robinette McCrow', '1963-09-09 03:58:15',
    0, 0, 0, 7, 8, 7, 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat',
    '3 Kipling Trail', '1884', 'Pasadena',
    'GA', '30458', NULL, '2010-11-25 07:14:12',
    '2015-05-16 16:16:11'
  ),
  (
    99, '00-235-2189', 'Claudie', 'Martinuzzi',
    'Claudie Martinuzzi', '1934-01-10 20:45:21',
    0, 0, 0, 0, 9, 10, 'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede',
    '4548 Oriole Junction', '1781',
    'Youngstown', 'GA', '30458', NULL,
    '2020-03-28 06:09:54', '2018-10-30 12:50:08'
  );
