-- Copyright (C) 2015 Kevin Kragenbrink <kevin@writh.net>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
-- deal in the Software without restriction, including without limitation the
-- rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-- sell copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.
--
-- ############################################################################
--
-- This file contains instructions to create tables in a MySQL database for
-- use with Loki's Bulletin Boards (http://github.com/kkragenbrink/sqlbb/).

CREATE TABLE `loki_board` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `default_timeout` int(11) DEFAULT '2592000',
  `lock_read` text,
  `lock_write` text,
  `last_message_id` int(11) unsigned DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `anonymous` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `order_group` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `order_group` (`order_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `loki_board_member` (
  `member` varchar(255) NOT NULL,
  `board_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`member`,`board_id`),
  KEY `idx_member` (`member`(3))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `loki_board_notify` (
  `member` varchar(255) NOT NULL,
  `board_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`member`,`board_id`),
  KEY `idx_member` (`member`(3))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
