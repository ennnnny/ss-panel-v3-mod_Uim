ALTER TABLE `user` ADD COLUMN `agent_id` int(11) NOT NULL DEFAULT 0 AFTER `node_connector`;

ALTER TABLE `user` ADD COLUMN `is_agent` int(11) NULL DEFAULT 0 AFTER `agent_id`;

ALTER TABLE `user` ADD COLUMN `creta` int(2) NULL DEFAULT 0 AFTER `is_agent`;

ALTER TABLE `user` ADD COLUMN `ssrlink` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `creta`;
