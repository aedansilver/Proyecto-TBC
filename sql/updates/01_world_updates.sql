UPDATE `gameobject_template` SET `data2`='2' WHERE `entry` IN ('2561', '164876', '164877', '186669', '164639', '185946', '183957', '186670');

UPDATE `spell_affect` SET `SpellFamilyMask`=`SpellFamilyMask` & ~0x200000000 WHERE `Entry` IN ('15257', '15331', '15332', '15333', '15334');
UPDATE `spell_proc_event` SET `SpellFamilyMask`=`SpellFamilyMask` & ~0x200000000 WHERE `SpellFamilyMask` & 0x200000000 AND `SpellFamilyName`='6';

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -24926;
INSERT INTO `spell_linked_spell`(`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(-24926,-44743,0,'Candy Remove Kostum on Remove'),
(-24926,-44742,0,'Candy Remove Kostum on Remove');
DELETE FROM spell_target_position WHERE `id` IN (22563, 22564);
INSERT INTO spell_target_position () VALUES (22563, 30, -1347.04, -291.15, 90.8, 1.82);
INSERT INTO spell_target_position () VALUES (22564, 30, 656.197, -30.75, 49.1, 0.24);
UPDATE `creature_template` SET `ScriptName` = 'pyrewood_ambush' WHERE `entry` = '2058';

UPDATE `creature_template` SET `Scriptname` = 'npc_innkeeper' WHERE `npcflag`& 65536 AND ScriptName = ''


DELETE FROM `gameobject_template` where `entry` IN (123329, 124371);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `castBarCaption`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(123329, 3, 1, 'Baelog''s Chest', '', 0, 0, 1, 93, 5066, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(124371, 0, 1369, 'Keystone', '', 0, 32, 1, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_keystone_chamber');

DELETE FROM `gameobject_loot_template` where `entry` = 5066;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(5066, 7740, 100, 0, 1, 1, 0, 0, 0);

DELETE FROM `areatrigger_teleport` where `id` = 288;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `access_id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(288, 'Uldaman Instance Start', 0, 0, -6066.73, -2955.63, 209.776, 3);

DELETE FROM `areatrigger_scripts` where `entry` = 822;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (822, 'at_map_chamber');

DELETE FROM `waypoint_data` WHERE `id` IN (2090, 2091, 2092, 2093, 2094);

INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(2090,1,-10090.72,-4047.45,6.21,500,1),
(2090,2,-10117.05,-4055.85,5.42,1000,0),
(2090,3,-10117.52,-4080.50,3.88,90000,0);

INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(2091,1,-10090.72,-4047.45,6.21,0,1),
(2091,2,-10117.05,-4055.85,5.42,1000,0),
(2091,3,-10119.52,-4080.50,3.88,90000,0);

INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(2092,1,-10090.72,-4045.45,6.21,0,1),
(2092,2,-10119.70,-4050.45,5.33,1500,0),
(2092,3,-10151.39,-4046.32,3.22,90000,0);

INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(2093,1,-10090.72,-4045.45,6.21,0,1),
(2093,2,-10119.70,-4050.45,5.33,1500,0),
(2093,3,-10151.39,-4048.32,3.22,90000,0);

INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`) VALUES
(2094,1,-10090.72,-4045.45,6.21,500,1),
(2094,2,-10119.70,-4050.45,5.33,1500,0),
(2094,3,-10151.39,-4050.32,3.22,90000,0);

DELETE FROM `gameobject` WHERE `id` = 142189;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(17498, 142189, 1, 1, -10119.7, -4052.46, 5.33005, -0.366519, 0, 0, 0.182236, -0.983255, 900, 100, 1);

UPDATE `gameobject_template` SET `ScriptName` = 'go_landmark_treasure' WHERE `entry` =  142189;

RENAME TABLE `eventai_scripts` to `creature_ai_scripts`;
RENAME TABLE `eventai_summons` to `creature_ai_summons`;
RENAME TABLE `eventai_texts`   to `creature_ai_texts`;


ALTER TABLE `spell_linked_spell` ADD UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`);
INSERT INTO `spell_linked_spell` VALUES ('9712', '21029', '0', 'Thaumaturgy Channel - Fill Vessel');


-- Blackfathom Deeps Instance
UPDATE `instance_template` SET `script`='instance_blackfathom_deeps' WHERE  `map`=48;
UPDATE `gameobject_template` SET `ScriptName`='go_fire_akumai' WHERE `entry` in (21118, 21119, 21120, 21121);

-- ACID INFINITE SUMMONS FIXED (AGAIN)
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=481102;
UPDATE `creature_ai_scripts` SET `event_flags`=2 WHERE `id`=1165702;


CREATE TABLE `game_event_battleground_holiday` (
 `event` int(10) unsigned NOT NULL,
 `bgflag` int(10) unsigned NOT NULL default '0',
 PRIMARY KEY  (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*sql for zulaman*/
UPDATE `creature_template` SET `ScriptName` = 'boss_nalorakk' WHERE `entry` = 23576;
UPDATE `creature_template` SET `flags_extra` = 33 WHERE `entry` = 23576; /*no crush*/

UPDATE `creature_template` set `ScriptName` = 'boss_akilzon' where entry = 23574;
UPDATE `creature_template` set `ScriptName` = 'mob_akilzon_eagle' where `entry`=24858; /*default is event ai*/

UPDATE `creature_template` SET `ScriptName` = 'boss_halazzi' WHERE `entry` = '23577';
UPDATE `creature_template` SET `ScriptName` = 'mob_halazzi_lynx' WHERE `entry` = '24143';
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = '24224'; /*totem default `spell1` = '43301' should be in DB*/

UPDATE `creature_template` SET `ScriptName` = 'boss_janalai' WHERE `entry` = '23578';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatcher' WHERE `entry` = '23818';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatchling' WHERE `entry` = '23598';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_egg' WHERE `entry` = '23817';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_firebomb' WHERE `entry` = '23920';

UPDATE `creature_template` SET `ScriptName` = 'boss_hexlord_malacrass' WHERE `entry` =24239;
UPDATE `creature_template` SET `ScriptName` = 'boss_alyson_antille' WHERE `entry` =24240;
UPDATE `creature_template` SET `ScriptName` = 'boss_thurg' WHERE `entry` =24241;
UPDATE `creature_template` SET `ScriptName` = 'boss_slither' WHERE `entry` =24242;
UPDATE `creature_template` SET `ScriptName` = 'boss_lord_raadan' WHERE `entry` =24243;
UPDATE `creature_template` SET `ScriptName` = 'boss_gazakroth' WHERE `entry` =24244;
UPDATE `creature_template` SET `ScriptName` = 'boss_fenstalker' WHERE `entry` =24245;
UPDATE `creature_template` SET `ScriptName` = 'boss_darkheart' WHERE `entry` =24246;
UPDATE `creature_template` SET `ScriptName` = 'boss_koragg' WHERE `entry` =24247;
UPDATE `creature` SET `position_x` = '117.8827',`position_y` = '921.2795',`position_z` = '33.8883',`orientation` = '1.5696' WHERE `id` = '24239' LIMIT 1;
UPDATE `creature_template` SET `faction_A` = '1890', `faction_H` = '1890' WHERE `entry` in ('24240', '24241', '24242', '24243', '24244', '24245', '24246', '24247');

UPDATE `creature_template` SET `ScriptName` = 'boss_zuljin' WHERE `entry` =23863;
UPDATE `creature_template` SET `ScriptName` = 'do_nothing' WHERE `entry` = '24187';
UPDATE `creature_template` SET `ScriptName` = 'mob_zuljin_vortex' WHERE `entry` = '24136';
UPDATE `creature_template` SET `minlevel` = '73', `maxlevel` = '73' WHERE `entry` IN (24187, 24136);
DELETE FROM `spell_proc_event` WHERE `entry` = 43983;
INSERT INTO `spell_proc_event` VALUES ('43983', '0', '0', '0', '0', '0', '16384', '0', '0');
DELETE FROM `spell_script_target` WHERE `entry` = 42577;
INSERT INTO `spell_script_target` VALUES ('42577', '1', '24136');

UPDATE `creature_template` SET `ScriptName` = 'npc_zulaman_hostage' WHERE `entry` IN (23790, 23999, 24024, 24001);

update instance_template set script = 'instance_sunwell_plateau' where map = 580;
UPDATE creature_template SET ScriptName = 'boss_brutallus' WHERE entry = 24882;
UPDATE `creature_template` SET `ScriptName` = 'boss_felmyst' WHERE `entry` = 25038;
UPDATE `creature_template` SET `ScriptName` = 'mob_felmyst_vapor' WHERE `entry` = 25265;
UPDATE `creature_template` SET `ScriptName` = 'mob_felmyst_trail' WHERE `entry` = 25267;
update creature_template set scriptname = 'boss_sacrolash' where entry = 25165;
update creature_template set scriptname = 'boss_alythess' where entry = 25166;
update creature_template set scriptname = 'mob_shadow_image' where entry = 25214;
REPLACE INTO `gameobject_template` VALUES (187366, 6, 4251, 'Blaze', '', 14, 0, 1, 0, 73, 2, 45246, 0, 1, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET faction_H = 14, faction_A = 14, minlevel = 73, maxlevel = 73,rank = 3, flags = 33554434, flag1 = 0 WHERE entry = 25214;
UPDATE `creature_template` SET `minlevel` = '70', `maxlevel` = '70',`faction_A` = '14', `faction_H` = '14' WHERE `entry` in (25265,25267,25268);
UPDATE `creature_template` SET `mindmg` = '1500', `maxdmg` = '2500', `minhealth` = '40000', `maxhealth` = '40000', `baseattacktime` = '2000' WHERE `entry` = 25268;
DELETE FROM `spell_script_target` WHERE `entry` in (44885,45388,45389,46350,45714);
INSERT INTO `spell_script_target` VALUES ('45388', '1', '25038');
INSERT INTO `spell_script_target` VALUES ('45389', '1', '25265');
INSERT INTO `spell_script_target` VALUES ('44885', '1', '25160');
INSERT INTO `spell_script_target` VALUES ('46350', '1', '25160');
INSERT INTO `spell_script_target` VALUES ('45714', '1', '25038');

-- add lang strings
DELETE FROM trinity_string WHERE entry BETWEEN 1000 AND 1006;
INSERT INTO trinity_string VALUES
(1000,'You froze player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1001,'It might be amusing but no... you cant freeze yourself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1002,'Invalid input check the name of target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1003,'You unfroze player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1004,'There are no frozen players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1005,'Following players are frozen on the server:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1006,'- %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- add commands
DELETE FROM `command` WHERE `name` = 'freeze' or `name` = 'unfreeze' or name = 'listfreeze';
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('freeze','2','Syntax: .freeze (#player)\r\n\"Freezes\" #player and disables his chat. When using this without #name it will freeze your target.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('unfreeze','2','Syntax: .unfreeze (#player)\r\n\"Unfreezes\" #player and enables his chat again. When using this without #name it will unfreeze your target.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('listfreeze','1','Syntax: .listfreeze\r\n\r\nSearch and output all frozen players.');

UPDATE `creature_template` SET
`minlevel` = '60',
`maxlevel` = '60',
`minhealth` = '6900',
`maxhealth` = '7200',
`minmana` = '9476',
`maxmana` = '9736',
`armor` = '4000',
`speed` = '1.7',
`rank` = '1',
`mindmg` = '600',
`maxdmg` = '1500',
`attackpower` = '1200',
`family` = '16',
`minrangedmg` = '0',
`maxrangedmg` = '0',
`rangedattackpower` = '0',
`resistance1` = '15',
`resistance2` = '15',
`resistance3` = '15',
`resistance4` = '15',
`resistance5` = '15',
`resistance6` = '15',
`ScriptName` = 'npc_kservant' WHERE `entry` = '19685';

DELETE FROM `quest_start_scripts` WHERE `id`='10211';
UPDATE `quest_template` SET `StartScript`='0' WHERE entry=10211;

DELETE FROM spell_affect WHERE entry IN (30017,30280,44373) AND effectId = 0;
INSERT INTO spell_affect (entry, effectId, SpellFamilyMask) VALUES
(30017,0,0x0000000000000000),
(30280,0,0x0000000000000000),
(44373,0,0x0000000000000000);

DELETE FROM spell_affect WHERE entry IN (34520,37508) AND effectId = 1;
INSERT INTO spell_affect (entry, effectId, SpellFamilyMask) VALUES
(34520,1,0x0000000000000000),
(37508,1,0x0000000000000000);

DELETE FROM spell_proc_event WHERE entry IN (34139,42368,43726,46092);
INSERT INTO spell_proc_event (entry, SchoolMask, Category, SkillID, SpellFamilyName, SpellFamilyMask, procFlags, ppmRate, cooldown) VALUES
(34139,0,0,0,10,0x0000000040000000,0x08000000,0,0),
(42368,0,0,0,10,0x0000000040000000,0x08000000,0,0),
(43726,0,0,0,10,0x0000000040000000,0x08000000,0,0),
(46092,0,0,0,10,0x0000000040000000,0x08000000,0,0);

DELETE FROM spell_proc_event where entry IN (34598, 34584, 36488);
INSERT INTO spell_proc_event (entry, SchoolMask, Category, SkillID, SpellFamilyName, SpellFamilyMask, procFlags, ppmRate, cooldown) VALUES
(34598,0,0,0,0,0x0000000000000000,0x00020000,0,45),
(36488,0,0,0,0,0x0000000000000000,0x08000000,0,0),
(34584,0,0,0,0,0x0000000000000000,0x00004000,0,30);

DELETE FROM spell_proc_event where entry = 42083;
INSERT INTO spell_proc_event (entry, SchoolMask, Category, SkillID, SpellFamilyName, SpellFamilyMask, procFlags, ppmRate, cooldown) VALUES
(42083,0,0,0,0,0x0000000000000000,0x00401000,0,45);

UPDATE `creature_template` SET `ScriptName` = 'npc_twiggy_flathead' WHERE `entry` =6248;

DELETE FROM command WHERE name = 'reload all_locales';
INSERT INTO `command` VALUES
('reload all_locales',3,'Syntax: .reload all_locales\r\n\r\nReload all `locales_*` tables with reload support added and that can be _safe_ reloaded.');

update `creature_template` set `ScriptName`='boss_alar' where `entry`='19514';
update `creature_template` set `ScriptName`='mob_ember_of_alar' where `entry`='19551';
update `creature_template` set `ScriptName`='mob_flame_patch_alar' where `entry`='20602';

update gameobject_template set scriptname = "go_manticron_cube" where entry = 181713;
update creature_template set scriptname = "mob_abyssal" where entry = 17454;

DROP TABLE IF EXISTS `spell_disabled`;
CREATE TABLE `spell_disabled` (
  `entry` int(11) unsigned NOT NULL default '0' COMMENT 'Spell entry',
  `disable_mask` int(8) unsigned NOT NULL default '0',
  `comment` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';

DROP TABLE IF EXISTS `waypoint_data`;

CREATE TABLE `waypoint_data` (
  `id` int(10) unsigned NOT NULL default '0' COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `move_flag` tinyint(1) NOT NULL default '0',
  `action` int(11) NOT NULL default '0',
  `action_chance` smallint(3) NOT NULL default '100',
  `wpguid` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `waypoint_scripts`;

CREATE TABLE `waypoint_scripts` (
  `id` int(11) unsigned NOT NULL default '0',
  `delay` int(11) unsigned NOT NULL default '0',
  `command` int(11) unsigned NOT NULL default '0',
  `datalong` int(11) unsigned NOT NULL default '0',
  `datalong2` int(11) unsigned NOT NULL default '0',
  `dataint` int(11) unsigned NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0',
  `guid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `creature_addon`
    ADD `path_id` int(11) unsigned NOT NULL default '0' AFTER `guid`;
ALTER TABLE `creature_template_addon`
    ADD `path_id` int(11) unsigned NOT NULL default '0' AFTER `entry`;

-- link gift of the wild to mark of the wild

DELETE FROM `spell_chain` WHERE `spell_id` = 21849;
DELETE FROM `spell_chain` WHERE `spell_id` = 21850;
DELETE FROM `spell_chain` WHERE `spell_id` = 26991;

INSERT INTO `spell_chain` (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (21849,0,1126,1,0);
INSERT INTO `spell_chain` (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (21850,21849,1126,2,0);
INSERT INTO `spell_chain` (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (26991,21850,1126,3,0);

-- demon fire
UPDATE `creature_template` SET spell1 = 40029, flags_extra = 128, ScriptName = '' WHERE entry = 23069;
-- pillar of fire
UPDATE `creature_template` SET spell1 = 43218, flags_extra = 128, ScriptName = '' WHERE entry = 24187;
-- Broggok Poison Cloud
UPDATE `creature_template` SET spell1 = 30914, flags_extra = 128, ScriptName = '' WHERE entry = 17662;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (43468, 43648, 43658, 43658, 43658, 43658, 43658);
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43648, 44007, 1, 'Storm Eye Safe Zone');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43658, 43653, 0, 'Electrical Arc Visual');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43658, 43654, 0, 'Electrical Arc Visual');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43658, 43655, 0, 'Electrical Arc Visual');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43658, 43656, 0, 'Electrical Arc Visual');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43658, 43659, 0, 'Electrical Arc Visual');

UPDATE `gameobject_template` SET `faction`=1375 WHERE `entry` IN (184203, 184204, 184205);
UPDATE `gameobject_template` SET `Scriptname`='go_bridge_console' WHERE entry=184568;

UPDATE `creature_template` SET `ScriptName`='npc_winter_reveler' WHERE `entry`=15760;
UPDATE `creature_template` SET `ScriptName`='npc_brewfest_reveler' WHERE `entry`=24484;

UPDATE `creature_template` SET `ScriptName`='npc_defias_traitor' WHERE `entry`=467;
UPDATE `creature_template` SET `ScriptName`='npc_torek' WHERE `entry`=12858;
UPDATE `creature_template` SET `ScriptName`='npc_magwin' WHERE `entry`=17312;
UPDATE `creature_template` SET `ScriptName`='npc_wounded_blood_elf' WHERE `entry`=16993;
UPDATE `creature_template` SET `ScriptName`='mob_abyssal' WHERE `entry`=17454;
UPDATE `creature_template` SET `ScriptName`='mob_scarlet_trainee' WHERE `entry`=6575;
UPDATE `instance_template` SET `script`='instance_scarlet_monastery' WHERE `map`=189;
UPDATE `creature_template` SET `ScriptName`='mob_phoenix_tk' WHERE `entry`=21362;
UPDATE `creature_template` SET `ScriptName`='mob_phoenix_egg_tk' WHERE `entry`=21364;
UPDATE `creature_template` SET `ScriptName`='npc_highlord_demitrian' WHERE `entry`=14347;
UPDATE `gameobject_template` SET `ScriptName`='go_gauntlet_gate' WHERE `entry`=175357;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=11197;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=10399;
UPDATE `gameobject_template` SET `ScriptName`='go_barrel_old_hillsbrad' WHERE `entry`=182589;
UPDATE `instance_template` SET `script`='instance_deadmines' WHERE `map`=36;
UPDATE `gameobject_template` SET `ScriptName`='go_defias_cannon' WHERE `entry`=16398;
UPDATE `gameobject_template` SET `ScriptName`='go_door_lever_dm' WHERE `entry`=101833;
UPDATE `gameobject_template` SET `ScriptName`='go_main_chambers_access_panel' WHERE `entry` IN (184125,184126);
UPDATE `creature_template` SET `ScriptName`='npc_twiggy_flathead' WHERE `entry`=6248;
DELETE FROM `areatrigger_scripts` WHERE `entry`=522;
INSERT INTO `areatrigger_scripts` VALUES (522,'at_twiggy_flathead');DELETE FROM `script_texts` WHERE `entry` BETWEEN -1565019 AND -1565000;

-- text
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1565000,'Gronn are the real power in outland.',11367,1,0,'maulgar SAY_AGGRO'),
(-1565001,'You will not defeat the hand of Gruul!',11368,1,0,'maulgar SAY_ENRAGE'),
(-1565002,'You won\'t kill next one so easy!',11369,1,0,'maulgar SAY_OGRE_DEATH1'),
(-1565003,'Pah! Does not prove anything!',11370,1,0,'maulgar SAY_OGRE_DEATH2'),
(-1565004,'I\'m not afraid of you.',11371,1,0,'maulgar SAY_OGRE_DEATH3'),
(-1565005,'Good, now you fight me!',11372,1,0,'maulgar SAY_OGRE_DEATH4'),
(-1565006,'You not so tough afterall!',11373,1,0,'maulgar SAY_SLAY1'),
(-1565007,'Aha-ha ha ha!',11374,1,0,'maulgar SAY_SLAY2'),
(-1565008,'Mulgar is king!',11375,1,0,'maulgar SAY_SLAY3'),
(-1565009,'Gruul... will crush you...',11376,1,0,'maulgar SAY_DEATH'),
(-1565010,'Come... and die.',11355,1,0,'gruul SAY_AGGRO'),
(-1565011,'Scurry',11356,1,0,'gruul SAY_SLAM1'),
(-1565012,'No escape',11357,1,0,'gruul SAY_SLAM2'),
(-1565013,'Stay',11358,1,0,'gruul SAY_SHATTER1'),
(-1565014,'Beg... for life',11359,1,0,'gruul SAY_SHATTER2'),
(-1565015,'No more',11360,1,0,'gruul SAY_SLAY1'),
(-1565016,'Unworthy',11361,1,0,'gruul SAY_SLAY2'),
(-1565017,'Die',11362,1,0,'gruul SAY_SLAY3'),
(-1565018,'Aaargh...',11363,1,0,'gruul SAY_DEATH'),
(-1565019,'grows in size!',0,2,0,'gruul EMOTE_GROW');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1532102 AND -1532000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1532000,'Well done Midnight!',9173,1,0,'attumen SAY_MIDNIGHT_KILL'),
(-1532001,'Cowards! Wretches!',9167,1,0,'attumen SAY_APPEAR1'),
(-1532002,'Who dares attack the steed of the Huntsman?',9298,1,0,'attumen SAY_APPEAR2'),
(-1532003,'Perhaps you would rather test yourselves against a more formidable opponent?!',9299,1,0,'attumen SAY_APPEAR3'),
(-1532004,'Come, Midnight, let\'s disperse this petty rabble!',9168,1,0,'attumen SAY_MOUNT'),
(-1532005,'It was... inevitable.',9169,1,0,'attumen SAY_KILL1'),
(-1532006,'Another trophy to add to my collection!',9300,1,0,'attumen SAY_KILL2'),
(-1532007,'Weapons are merely a convenience for a warrior of my skill!',9166,1,0,'attumen SAY_DISARMED'),
(-1532008,'I always knew... someday I would become... the hunted.',9165,1,0,'attumen SAY_DEATH'),
(-1532009,'Such easy sport.',9170,1,0,'attumen SAY_RANDOM1'),
(-1532010,'Amateurs! Do not think you can best me! I kill for a living.',9304,1,0,'attumen SAY_RANDOM2'),
(-1532011,'Hmm, unannounced visitors? Preparations must be made.',9211,1,0,'moroes SAY_AGGRO'),
(-1532012,'Now, where was I? Oh yes...',9215,1,0,'moroes SAY_SPECIAL_1'),
(-1532013,'You rang?',9316,1,0,'moroes SAY_SPECIAL_2'),
(-1532014,'One more for dinner this evening.',9214,1,0,'moroes SAY_KILL_1'),
(-1532015,'Time... Never enough time.',9314,1,0,'moroes SAY_KILL_2'),
(-1532016,'I\'ve gone and made a mess.',9315,1,0,'moroes SAY_KILL_3'),
(-1532017,'How terribly clumsy of me...',9213,1,0,'moroes SAY_DEATH'),
(-1532018,'Your behavior will not be tolerated!',9204,1,0,'maiden SAY_AGGRO'),
(-1532019,'Ah ah ah...',9207,1,0,'maiden SAY_SLAY1'),
(-1532020,'This is for the best.',9312,1,0,'maiden SAY_SLAY2'),
(-1532021,'Impure thoughts lead to profane actions.',9311,1,0,'maiden SAY_SLAY3'),
(-1532022,'Cast out your corrupt thoughts.',9313,1,0,'maiden SAY_REPENTANCE1'),
(-1532023,'Your impurity must be cleansed.',9208,1,0,'maiden SAY_REPENTANCE2'),
(-1532024,'Death comes. Will your conscience be clear?',9206,1,0,'maiden SAY_DEATH'),
(-1532025,'Oh at last, at last. I can go home.',9190,1,0,'dorothee SAY_DOROTHEE_DEATH'),
(-1532026,'Don\'t let them hurt us, Tito! Oh, you won\'t, will you?',9191,1,0,'dorothee SAY_DOROTHEE_SUMMON'),
(-1532027,'Tito, oh Tito, no!',9192,1,0,'dorothee SAY_DOROTHEE_TITO_DEATH'),
(-1532028,'Oh dear, we simply must find a way home! The old wizard could be our only hope! Strawman, Roar, Tinhead, will you... wait! Oh golly, look! We have visitors!',9195,1,0,'dorothee SAY_DOROTHEE_AGGRO'),
(-1532029,'Wanna fight? Huh? Do ya? C\'mon, I\'ll fight you with both claws behind my back!',9227,1,0,'roar SAY_ROAR_AGGRO'),
(-1532030,'You didn\'t have to go and do that.',9229,1,0,'roar SAY_ROAR_DEATH'),
(-1532031,'I think I\'m going to go take fourty winks.',9230,1,0,'roar SAY_ROAR_SLAY'),
(-1532032,'Now what should I do with you? I simply can\'t make up my mind.',9254,1,0,'strawman SAY_STRAWMAN_AGGRO'),
(-1532033,'Don\'t let them make a mattress... out of me.',9256,1,0,'strawman SAY_STRAWMAN_DEATH'),
(-1532034,'I guess I\'m not a failure after all.',9257,1,0,'strawman SAY_STRAWMAN_SLAY'),
(-1532035,'I could really use a heart. Say, can I have yours?',9268,1,0,'tinhead SAY_TINHEAD_AGGRO'),
(-1532036,'Back to being an old rustbucket.',9270,1,0,'tinhead SAY_TINHEAD_DEATH'),
(-1532037,'Guess I\'m not so rusty, after all.',9271,1,0,'tinhead SAY_TINHEAD_SLAY'),
(-1532038,'begins to rust.',0,2,0,'tinhead EMOTE_RUST'),
(-1532039,'Woe to each and every one of you my pretties! <cackles>',9179,1,0,'crone SAY_CRONE_AGGRO'),
(-1532040,'It will all be over soon! <cackles>',9307,1,0,'crone SAY_CRONE_AGGRO2'),
(-1532041,'How could you? What a cruel, cruel world!',9178,1,0,'crone SAY_CRONE_DEATH'),
(-1532042,'Fixed you, didn\'t I? <cackles>',9180,1,0,'crone SAY_CRONE_SLAY'),
(-1532043,'All the better to own you with!',9276,1,0,'wolf SAY_WOLF_AGGRO'),
(-1532044,'Mmmm... delicious.',9277,1,0,'wolf SAY_WOLF_SLAY'),
(-1532045,'Run away little girl, run away!',9278,1,0,'wolf SAY_WOLF_HOOD'),
(-1532046,'What devil art thou, that dost torment me thus?',9196,1,0,'julianne SAY_JULIANNE_AGGRO'),
(-1532047,'Where is my lord? Where is my Romulo?',9199,1,0,'julianne SAY_JULIANNE_ENTER'),
(-1532048,'Romulo, I come! Oh... this do I drink to thee!',9198,1,0,'julianne SAY_JULIANNE_DEATH01'),
(-1532049,'Where is my Lord? Where is my Romulo? Ohh, happy dagger! This is thy sheath! There rust, and let me die!',9310,1,0,'julianne SAY_JULIANNE_DEATH02'),
(-1532050,'Come, gentle night; and give me back my Romulo!',9200,1,0,'julianne SAY_JULIANNE_RESURRECT'),
(-1532051,'Parting is such sweet sorrow.',9201,1,0,'julianne SAY_JULIANNE_SLAY'),
(-1532052,'Wilt thou provoke me? Then have at thee, boy!',9233,1,0,'romulo SAY_ROMULO_AGGRO'),
(-1532053,'Thou smilest... upon the stroke that... murders me.',9235,1,0,'romulo SAY_ROMULO_DEATH'),
(-1532054,'This day\'s black fate on more days doth depend. This but begins the woe. Others must end.',9236,1,0,'romulo SAY_ROMULO_ENTER'),
(-1532055,'Thou detestable maw, thou womb of death; I enforce thy rotten jaws to open!',9237,1,0,'romulo SAY_ROMULO_RESURRECT'),
(-1532056,'How well my comfort is revived by this!',9238,1,0,'romulo SAY_ROMULO_SLAY'),
(-1532057,'The Menagerie is for guests only.',9183,1,0,'curator SAY_AGGRO'),
(-1532058,'Gallery rules will be strictly enforced.',9188,1,0,'curator SAY_SUMMON1'),
(-1532059,'This curator is equipped for gallery protection.',9309,1,0,'curator SAY_SUMMON2'),
(-1532060,'Your request cannot be processed.',9186,1,0,'curator SAY_EVOCATE'),
(-1532061,'Failure to comply will result in offensive action.',9185,1,0,'curator SAY_ENRAGE'),
(-1532062,'Do not touch the displays.',9187,1,0,'curator SAY_KILL1'),
(-1532063,'You are not a guest.',9308,1,0,'curator SAY_KILL2'),
(-1532064,'This Curator is no longer op... er... ation... al.',9184,1,0,'curator SAY_DEATH'),
(-1532065,'Your blood will anoint my circle.',9264,1,0,'terestian SAY_SLAY1'),
(-1532066,'The great one will be pleased.',9329,1,0,'terestian SAY_SLAY2'),
(-1532067,'My life, is yours. Oh great one.',9262,1,0,'terestian SAY_DEATH'),
(-1532068,'Ah, you\'re just in time. The rituals are about to begin.',9260,1,0,'terestian SAY_AGGRO'),
(-1532069,'Please, accept this humble offering, oh great one.',9263,1,0,'terestian SAY_SACRIFICE1'),
(-1532070,'Let the sacrifice serve his testament to my fealty.',9330,1,0,'terestian SAY_SACRIFICE2'),
(-1532071,'Come, you dwellers in the dark. Rally to my call!',9265,1,0,'terestian SAY_SUMMON1'),
(-1532072,'Gather, my pets. There is plenty for all.',9331,1,0,'terestian SAY_SUMMON2'),
(-1532073,'Please, no more. My son... he\'s gone mad!',9241,1,0,'aran SAY_AGGRO1'),
(-1532074,'I\'ll not be tortured again!',9323,1,0,'aran SAY_AGGRO2'),
(-1532075,'Who are you? What do you want? Stay away from me!',9324,1,0,'aran SAY_AGGRO3'),
(-1532076,'I\'ll show you this beaten dog still has some teeth!',9245,1,0,'aran SAY_FLAMEWREATH1'),
(-1532077,'Burn you hellish fiends!',9326,1,0,'aran SAY_FLAMEWREATH2'),
(-1532078,'I\'ll freeze you all!',9246,1,0,'aran SAY_BLIZZARD1'),
(-1532079,'Back to the cold dark with you!',9327,1,0,'aran SAY_BLIZZARD2'),
(-1532080,'Yes, yes, my son is quite powerful... but I have powers of my own!',9242,1,0,'aran SAY_EXPLOSION1'),
(-1532081,'I am not some simple jester! I am Nielas Aran!',9325,1,0,'aran SAY_EXPLOSION2'),
(-1532082,'Surely you would not deny an old man a replenishing drink? No, no I thought not.',9248,1,0,'aran SAY_DRINK'),
(-1532083,'I\'m not finished yet! No, I have a few more tricks up me sleeve.',9251,1,0,'aran SAY_ELEMENTALS'),
(-1532084,'I want this nightmare to be over!',9250,1,0,'aran SAY_KILL1'),
(-1532085,'Torment me no more!',9328,1,0,'aran SAY_KILL2'),
(-1532086,'You\'ve wasted enough of my time. Let these games be finished!',9247,1,0,'aran SAY_TIMEOVER'),
(-1532087,'At last... The nightmare is.. over...',9244,1,0,'aran SAY_DEATH'),
(-1532088,'Where did you get that?! Did HE send you?!',9249,1,0,'aran SAY_ATIESH'),
(-1532089,'cries out in withdrawal, opening gates to the warp.',0,2,0,'netherspite EMOTE_PHASE_PORTAL'),
(-1532090,'goes into a nether-fed rage!',0,2,0,'netherspite EMOTE_PHASE_BANISH'),
(-1532091,'Madness has brought you here to me. I shall be your undoing!',9218,1,0,'malchezaar SAY_AGGRO'),
(-1532092,'Simple fools! Time is the fire in which you\'ll burn!',9220,1,0,'malchezaar SAY_AXE_TOSS1'),
(-1532093,'I see the subtlety of conception is beyond primitives such as you.',9317,1,0,'malchezaar SAY_AXE_TOSS2'),
(-1532094,'Who knows what secrets hide in the dark.',9223,1,0,'malchezaar SAY_SPECIAL1'),
(-1532095,'The cerestial forces are mine to manipulate.',9320,1,0,'malchezaar SAY_SPECIAL2'),
(-1532096,'How can you hope to withstand against such overwhelming power?',9321,1,0,'malchezaar SAY_SPECIAL3'),
(-1532097,'Surely you did not think you could win.',9222,1,0,'malchezaar SAY_SLAY1'),
(-1532098,'Your greed, your foolishness has brought you to this end.',9318,1,0,'malchezaar SAY_SLAY2'),
(-1532099,'You are, but a plaything, unfit even to amuse.',9319,1,0,'malchezaar SAY_SLAY3'),
(-1532100,'All realities, all dimensions are open to me!',9224,1,0,'malchezaar SAY_SUMMON1'),
(-1532101,'You face not Malchezaar alone, but the legions I command!',9322,1,0,'malchezaar SAY_SUMMON2'),
(-1532102,'I refuse to concede defeat. I am a prince of the Eredar! I am...',9221,1,0,'malchezaar SAY_DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1550043 AND -1550000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1550000,'Alert, you are marked for extermination!',11213,1,0,'voidreaver SAY_AGGRO'),
(-1550001,'Extermination, successful.',11215,1,0,'voidreaver SAY_SLAY1'),
(-1550002,'Imbecile life form, no longer functional.',11216,1,0,'voidreaver SAY_SLAY2'),
(-1550003,'Threat neutralized.',11217,1,0,'voidreaver SAY_SLAY3'),
(-1550004,'Systems... shutting... down...',11214,1,0,'voidreaver SAY_DEATH'),
(-1550005,'Alternative measure commencing...',11218,1,0,'voidreaver SAY_POUNDING1'),
(-1550006,'Calculating force parameters...',11219,1,0,'voidreaver SAY_POUNDING2'),
(-1550007,'Tal anu\'men no Sin\'dorei!',11134,1,0,'solarian SAY_AGGRO'),
(-1550008,'Ha ha ha! You are hopelessly outmatched!',11139,1,0,'solarian SAY_SUMMON1'),
(-1550009,'I will crush your delusions of grandeur!',11140,1,0,'solarian SAY_SUMMON2'),
(-1550010,'Your soul belongs to the Abyss!',11136,1,0,'solarian SAY_KILL1'),
(-1550011,'By the blood of the Highborne!',11137,1,0,'solarian SAY_KILL2'),
(-1550012,'For the Sunwell!',11138,1,0,'solarian SAY_KILL3'),
(-1550013,'The warmth of the sun... awaits.',11135,1,0,'solarian SAY_DEATH'),
(-1550014,'Enough of this! Now I call upon the fury of the cosmos itself.',0,1,0,'solarian SAY_VOIDA'),
(-1550015,'I become ONE... with the VOID!',0,1,0,'solarian SAY_VOIDB'),
(-1550016,'Energy. Power. My people are addicted to it... a dependence made manifest after the Sunwell was destroyed. Welcome... to the future. A pity you are too late to stop it. No one can stop me now! Selama ashal\'anore!',11256,1,0,'kaelthas SAY_INTRO'),
(-1550017,'Capernian will see to it that your stay here is a short one.',11257,1,0,'kaelthas SAY_INTRO_CAPERNIAN'),
(-1550018,'Well done, you have proven worthy to test your skills against my master engineer, Telonicus.',11258,1,0,'kaelthas SAY_INTRO_TELONICUS'),
(-1550019,'Let us see how your nerves hold up against the Darkener, Thaladred.',11259,1,0,'kaelthas SAY_INTRO_THALADRED'),
(-1550020,'You have persevered against some of my best advisors... but none can withstand the might of the Blood Hammer. Behold, Lord Sanguinar!',11260,1,0,'kaelthas SAY_INTRO_SANGUINAR'),
(-1550021,'As you see, I have many weapons in my arsenal...',11261,1,0,'kaelthas SAY_PHASE2_WEAPON'),
(-1550022,'Perhaps I underestimated you. It would be unfair to make you fight all four advisors at once, but... fair treatment was never shown to my people. I\'m just returning the favor.',11262,1,0,'kaelthas SAY_PHASE3_ADVANCE'),
(-1550023,'Alas, sometimes one must take matters into one\'s own hands. Balamore shanal!',11263,1,0,'kaelthas SAY_PHASE4_INTRO2'),
(-1550024,'I have not come this far to be stopped! The future I have planned will not be jeopardized! Now you will taste true power!!',11273,1,0,'kaelthas SAY_PHASE5_NUTS'),
(-1550025,'You will not prevail.',11270,1,0,'kaelthas SAY_SLAY1'),
(-1550026,'You gambled...and lost.',11271,1,0,'kaelthas SAY_SLAY2'),
(-1550027,'This was Child\'s play.',11272,1,0,'kaelthas SAY_SLAY3'),
(-1550028,'Obey me.',11268,1,0,'kaelthas SAY_MINDCONTROL1'),
(-1550029,'Bow to my will.',11269,1,0,'kaelthas SAY_MINDCONTROL2'),
(-1550030,'Let us see how you fare when your world is turned upside down.',11264,1,0,'kaelthas SAY_GRAVITYLAPSE1'),
(-1550031,'Having trouble staying grounded?',11265,1,0,'kaelthas SAY_GRAVITYLAPSE2'),
(-1550032,'Anara\'nel belore!',11267,1,0,'kaelthas SAY_SUMMON_PHOENIX1'),
(-1550033,'By the power of the sun!',11266,1,0,'kaelthas SAY_SUMMON_PHOENIX2'),
(-1550034,'For...Quel...thalas!',11274,1,0,'kaelthas SAY_DEATH'),
(-1550035,'Prepare yourselves!',11203,1,0,'thaladred SAY_THALADRED_AGGRO'),
(-1550036,'Forgive me, my prince! I have... failed.',11204,1,0,'thaladred SAY_THALADRED_DEATH'),
(-1550037,'sets his gaze on $N!',0,2,0,'thaladred EMOTE_THALADRED_GAZE'),
(-1550038,'Blood for blood!',11152,1,0,'sanguinar SAY_SANGUINAR_AGGRO'),
(-1550039,'NO! I ...will... not...',11153,1,0,'sanguinar SAY_SANGUINAR_DEATH'),
(-1550040,'The sin\'dore reign supreme!',11117,1,0,'capernian SAY_CAPERNIAN_AGGRO'),
(-1550041,'This is not over!',11118,1,0,'capernian SAY_CAPERNIAN_DEATH'),
(-1550042,'Anar\'alah belore!',11157,1,0,'telonicus SAY_TELONICUS_AGGRO'),
(-1550043,'More perils... await',11158,1,0,'telonicus SAY_TELONICUS_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1553012 AND -1553000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1553000,'What are you doing? These specimens are very delicate!',11144,1,0,'freywinn SAY_AGGRO'),
(-1553001,'Your life cycle is now concluded!',11145,1,0,'freywinn SAY_KILL_1'),
(-1553002,'You will feed the worms.',11146,1,0,'freywinn SAY_KILL_2'),
(-1553003,'Endorel aluminor!',11147,1,0,'freywinn SAY_TREE_1'),
(-1553004,'Nature bends to my will!',11148,1,0,'freywinn SAY_TREE_2'),
(-1553005,'The specimens...must be preserved.',11149,1,0,'freywinn SAY_DEATH'),
(-1553006,'emits a strange noise.',0,2,0,'laj EMOTE_SUMMON'),
(-1553007,'Who disturbs this sanctuary?',11230,1,0,'warp SAY_AGGRO'),
(-1553008,'You must die! But wait: this does not--No, no... you must die!',11231,1,0,'warp SAY_SLAY_1'),
(-1553009,'What am I doing? Why do I...',11232,1,0,'warp SAY_SLAY_2'),
(-1553010,'Children, come to me!',11233,1,0,'warp SAY_SUMMON_1'),
(-1553011,'Maybe this is not--No, we fight! Come to my aid.',11234,1,0,'warp SAY_SUMMON_2'),
(-1553012,'So... confused. Do not... belong here!',11235,1,0,'warp SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1554027 AND -1554000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1554000,'I predict a painful death.',11101,1,0,'gyro SAY_AGGRO'),
(-1554001,'Measure twice; cut once!',11104,1,0,'gyro SAY_SAW_ATTACK1'),
(-1554002,'If my division is correct, you should be quite dead.',11105,1,0,'gyro SAY_SAW_ATTACK2'),
(-1554003,'Your strategy was flawed!',11102,1,0,'gyro SAY_SLAY1'),
(-1554004,'Yes, the only logical outcome.',11103,1,0,'gyro SAY_SLAY2'),
(-1554005,'An unforseen... contingency',11106,1,0,'gyro SAY_DEATH'),
(-1554006,'You have approximately five seconds to live.',11109,1,0,'ironhand SAY_AGGRO_1'),
(-1554007,'With the precise angle and velocity...',11112,1,0,'ironhand SAY_HAMMER_1'),
(-1554008,'Low tech yet quiet effective!',11113,1,0,'ironhand SAY_HAMMER_2'),
(-1554009,'A foregone conclusion.',11110,1,0,'ironhand SAY_SLAY_1'),
(-1554010,'The processing will continue a schedule!',11111,1,0,'ironhand SAY_SLAY_2'),
(-1554011,'My calculations did not...',11114,1,0,'ironhand SAY_DEATH_1'),
(-1554012,'raises his hammer menacingly...',0,3,0,'ironhand EMOTE_HAMMER'),
(-1554013,'Don\'t value your life very much, do you?',11186,1,0,'sepethrea SAY_AGGRO'),
(-1554014,'I am not alone.',11191,1,0,'sepethrea SAY_SUMMON'),
(-1554015,'Think you can take the heat?',11189,1,0,'sepethrea SAY_DRAGONS_BREATH_1'),
(-1554016,'Anar\'endal dracon!',11190,1,0,'sepethrea SAY_DRAGONS_BREATH_2'),
(-1554017,'And don\'t come back!',11187,1,0,'sepethrea SAY_SLAY1'),
(-1554018,'En\'dala finel el\'dal',11188,1,0,'sepethrea SAY_SLAY2'),
(-1554019,'Anu... bala belore...alon.',11192,1,0,'sepethrea SAY_DEATH'),
(-1554020,'We are on a strict timetable. You will not interfere!',11193,1,0,'pathaleon SAY_AGGRO'),
(-1554021,'I\'m looking for a team player...',11197,1,0,'pathaleon SAY_DOMINATION_1'),
(-1554022,'You work for me now!',11198,1,0,'pathaleon SAY_DOMINATION_2'),
(-1554023,'Time to supplement my work force.',11196,1,0,'pathaleon SAY_SUMMON'),
(-1554024,'I prefeer to be hands-on...',11199,1,0,'pathaleon SAY_ENRAGE'),
(-1554025,'A minor inconvenience.',11194,1,0,'pathaleon SAY_SLAY_1'),
(-1554026,'Looks like you lose.',11195,1,0,'pathaleon SAY_SLAY_2'),
(-1554027,'The project will... continue.',11200,1,0,'pathaleon SAY_DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1585029 AND -1585000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1585000,'You only waste my time!',12378,1,0,'selin SAY_AGGRO'),
(-1585001,'My hunger knows no bounds!',12381,1,0,'selin SAY_ENERGY'),
(-1585002,'Yes! I am a god!',12382,1,0,'selin SAY_EMPOWERED'),
(-1585003,'Enough distractions!',12388,1,0,'selin SAY_KILL_1'),
(-1585004,'I am invincible!',12385,1,0,'selin SAY_KILL_2'),
(-1585005,'No! More... I must have more!',12383,1,0,'selin SAY_DEATH'),
(-1585006,'begins to channel from the nearby Fel Crystal...',0,3,0,'selin EMOTE_CRYSTAL'),
(-1585007,'Drain...life!',12389,1,0,'vexallus SAY_AGGRO'),
(-1585008,'Un...con...tainable.',12392,1,0,'vexallus SAY_ENERGY'),
(-1585009,'Un...leash...',12390,1,0,'vexallus SAY_OVERLOAD'),
(-1585010,'Con...sume.',12393,1,0,'vexallus SAY_KILL'),
(-1585011,'discharges pure energy!',0,3,0,'vexallus EMOTE_DISCHARGE_ENERGY'),
(-1585012,'Annihilate them!',12395,1,0,'delrissa SAY_AGGRO'),
(-1585013,'Oh, the horror.',12398,1,0,'delrissa LackeyDeath1'),
(-1585014,'Well, aren\'t you lucky?',12400,1,0,'delrissa LackeyDeath2'),
(-1585015,'Now I\'m getting annoyed.',12401,1,0,'delrissa LackeyDeath3'),
(-1585016,'Lackies be damned! I\'ll finish you myself!',12403,1,0,'delrissa LackeyDeath4'),
(-1585017,'I call that a good start.',12405,1,0,'delrissa PlayerDeath1'),
(-1585018,'I could have sworn there were more of you.',12407,1,0,'delrissa PlayerDeath2'),
(-1585019,'Not really much of a group, anymore, is it?',12409,1,0,'delrissa PlayerDeath3'),
(-1585020,'One is such a lonely number.',12410,1,0,'delrissa PlayerDeath4'),
(-1585021,'It\'s been a kick, really.',12411,1,0,'delrissa PlayerDeath5'),
(-1585022,'Not what I had... planned...',12397,1,0,'delrissa SAY_DEATH'),
(-1585023,'Don\'t look so smug! I know what you\'re thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Oh no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this, and this time, you will not interfere!',12413,1,0,'kaelthas MT SAY_AGGRO'),
(-1585024,'Vengeance burns!',12415,1,0,'kaelthas MT SAY_PHOENIX'),
(-1585025,'Felomin ashal!',12417,1,0,'kaelthas MT SAY_FLAMESTRIKE'),
(-1585026,'I\'ll turn your world... upside... down...',12418,1,0,'kaelthas MT SAY_GRAVITY_LAPSE'),
(-1585027,'Master... grant me strength.',12419,1,0,'kaelthas MT SAY_TIRED'),
(-1585028,'Do not... get too comfortable.',12420,1,0,'kaelthas MT SAY_RECAST_GRAVITY'),
(-1585029,'My demise accomplishes nothing! The Master will have you! You will drown in your own blood! This world shall burn! Aaaghh!',12421,1,0,'kaelthas MT SAY_DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1580035 AND -1580000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1580000,'Aggh! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!',12422,1,0,'kalecgos SAY_EVIL_AGGRO'),
(-1580001,'I will purge you!',12423,1,0,'kalecgos SAY_EVIL_SPELL1'),
(-1580002,'Your pain has only begun!',12424,1,0,'kalecgos SAY_EVIL_SPELL2'),
(-1580003,'In the name of Kil\'jaeden!',12425,1,0,'kalecgos SAY_EVIL_SLAY1'),
(-1580004,'You were warned!',12426,1,0,'kalecgos SAY_EVIL_SLAY2'),
(-1580005,'My awakening is complete! You shall all perish!',12427,1,0,'kalecgos SAY_EVIL_ENRAGE'),
(-1580006,'I need... your help... Cannot... resist him... much longer...',12428,1,0,'kalecgos humanoid SAY_GOOD_AGGRO'),
(-1580007,'Aaahhh! Help me, before I lose my mind!',12429,1,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH'),
(-1580008,'Hurry! There is not much of me left!',12430,1,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH2'),
(-1580009,'I am forever in your debt. Once we have triumphed over Kil\'jaeden, this entire world will be in your debt as well.',12431,1,0,'kalecgos humanoid SAY_GOOD_PLRWIN'),
(-1580010,'There will be no reprieve. My work here is nearly finished.',12451,1,0,'sathrovarr SAY_SATH_AGGRO'),
(-1580011,'I\'m... never on... the losing... side...',12452,1,0,'sathrovarr SAY_SATH_DEATH'),
(-1580012,'Your misery is my delight!',12453,1,0,'sathrovarr SAY_SATH_SPELL1'),
(-1580013,'I will watch you bleed!',12454,1,0,'sathrovarr SAY_SATH_SPELL2'),
(-1580014,'Pitious mortal!',12455,1,0,'sathrovarr SAY_SATH_SLAY1'),
(-1580015,'Haven\'t you heard? I always win!',12456,1,0,'sathrovarr SAY_SATH_SLAY2'),
(-1580016,'I have toyed with you long enough!',12457,1,0,'sathrovarr SAY_SATH_ENRAGE'),
(-1580017,'Puny lizard! Death is the only answer you\'ll find here!',12458,1,0,'brutallus YELL_INTRO'),
(-1580018,'Grah! Your magic is weak!',12459,1,0,'brutallus YELL_INTRO_BREAK_ICE'),
(-1580019,'I will crush you!',12460,1,0,'brutallus YELL_INTRO_CHARGE'),
(-1580020,'That was fun.',12461,1,0,'brutallus YELL_INTRO_KILL_MADRIGOSA'),
(-1580021,'Come, try your luck!',12462,1,0,'brutallus YELL_INTRO_TAUNT'),
(-1580022,'Ahh! More lambs to the slaughter!',12463,1,0,'brutallus YELL_AGGRO'),
(-1580023,'Perish, insect!',12464,1,0,'brutallus YELL_KILL1'),
(-1580024,'You are meat!',12465,1,0,'brutallus YELL_KILL2'),
(-1580025,'Too easy!',12466,1,0,'brutallus YELL_KILL3'),
(-1580026,'Bring the fight to me!',12467,1,0,'brutallus YELL_LOVE1'),
(-1580027,'Another day, another glorious battle!',12468,1,0,'brutallus YELL_LOVE2'),
(-1580028,'I live for this!',12469,1,0,'brutallus YELL_LOVE3'),
(-1580029,'So much for a real challenge... Die!',12470,1,0,'brutallus YELL_BERSERK'),
(-1580030,'Gah! Well done... Now... this gets... interesting...',12471,1,0,'brutallus YELL_DEATH'),
(-1580031,'Hold, friends! There is information to be had before this devil meets his fate!',12472,1,0,'madrigosa YELL_MADR_ICE_BARRIER'),
(-1580032,'Where is Anveena, demon? What has become of Kalec?',12473,1,0,'madrigosa YELL_MADR_INTRO'),
(-1580033,'You will tell me where they are!',12474,1,0,'madrigosa YELL_MADR_ICE_BLOCK'),
(-1580034,'Speak, I grow weary of asking!',12475,1,0,'madrigosa YELL_MADR_TRAP'),
(-1580035,'Malygos, my lord! I did my best!',12476,1,0,'madrigosa YELL_MADR_DEATH');
DELETE FROM `script_texts` WHERE `entry`=-1033000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1033000,'Thanks for freeing me, I\'ll open this door for you, then I will get out of here.',0,0,0,'shadowfang_prisoner SAY_FREE');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1309023 AND -1309000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1309000,'Let the coils of hate unfurl!',8421,1,0,'venoxis SAY_TRANSFORM'),
(-1309001,'Ssserenity..at lassst!',0,1,0,'venoxis SAY_DEATH'),
(-1309002,'Lord Hir\'eek, grant me wings of vengance!',8417,1,0,'jeklik SAY_AGGRO'),
(-1309003,'I command you to rain fire down upon these invaders!',0,1,0,'jeklik SAY_RAIN_FIRE'),
(-1309004,'Finally ...death. Curse you Hakkar! Curse you!',8422,1,0,'jeklik SAY_DEATH'),
(-1309005,'Draw me to your web mistress Shadra. Unleash your venom!',8418,1,0,'marli SAY_AGGRO'),
(-1309006,'Shadra, make of me your avatar!',0,1,0,'marli SAY_TRANSFORM'),
(-1309007,'Aid me my brood!',0,1,0,'marli SAY_SPIDER_SPAWN'),
(-1309008,'Bless you mortal for this release. Hakkar controls me no longer...',8423,1,0,'marli SAY_DEATH'),
(-1309009,'Shirvallah, fill me with your RAGE!',8419,1,0,'thekal SAY_AGGRO'),
(-1309010,'Hakkar binds me no more! Peace at last!',8424,1,0,'thekal SAY_DEATH'),
(-1309011,'Bethekk, your priestess calls upon your might!',8416,1,0,'arlokk SAY_AGGRO'),
(-1309012,'Feast on $n, my pretties!',0,1,0,'arlokk SAY_FEAST_PANTHER'),
(-1309013,'At last, I am free of the Soulflayer!',8412,1,0,'arlokk SAY_DEATH'),
(-1309014,'Welcome to da great show friends! Step right up to die!',8425,1,0,'jindo SAY_AGGRO'),
(-1309015,'I\'ll feed your souls to Hakkar himself!',8413,1,0,'mandokir SAY_AGGRO'),
(-1309016,'DING!',0,1,0,'mandokir SAY_DING_KILL'),
(-1309017,'GRATS!',0,1,0,'mandokir SAY_GRATS_JINDO'),
(-1309018,'I\'m keeping my eye on you, $N!',0,1,0,'mandokir SAY_WATCH'),
(-1309019,'Don\'t make me angry. You won\'t like it when I\'m angry.',0,1,0,'mandokir SAY_WATCH_WHISPER'),
(-1309020,'PRIDE HERALDS THE END OF YOUR WORLD. COME, MORTALS! FACE THE WRATH OF THE SOULFLAYER!',8414,1,0,'hakkar SAY_AGGRO'),
(-1309021,'Fleeing will do you no good, mortals!',0,1,0,'hakkar SAY_FLEEING'),
(-1309022,'You dare set foot upon Hakkari holy ground? Minions of Hakkar, destroy the infidels!',0,1,0,'hakkar SAY_MINION_DESTROY'),
(-1309023,'Minions of Hakkar, hear your God. The sanctity of this temple has been compromised. Invaders encroach upon holy ground! The Altar of Blood must be protected. Kill them all!',0,1,0,'hakkar SAY_PROTECT_ALTAR');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1568023 AND -1568000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1568000,'Spirits of da wind be your doom!',12031,1,0,'janalai SAY_AGGRO'),
(-1568001,'I burn ya now!',12032,1,0,'janalai SAY_FIRE_BOMBS'),
(-1568002,'Where ma hatcha? Get to work on dem eggs!',12033,1,0,'janalai SAY_SUMMON_HATCHER'),
(-1568003,'I show you strength... in numbers.',12034,1,0,'janalai SAY_ALL_EGGS'),
(-1568004,'You done run outta time!',12035,1,0,'janalai SAY_BERSERK'),
(-1568005,'It all be over now, mon!',12036,1,0,'janalai SAY_SLAY_1'),
(-1568006,'Tazaga-choo!',12037,1,0,'janalai SAY_SLAY_2'),
(-1568007,'Zul\'jin... got a surprise for you...',12038,1,0,'janalai SAY_DEATH'),
(-1568008,'Come, strangers. The spirit of the dragonhawk hot be hungry for worthy souls.',12039,1,0,'janalai SAY_EVENT_STRANGERS'),
(-1568009,'Come, friends. Your bodies gonna feed ma hatchlings, and your souls are going to feed me with power!',12040,1,0,'janalai SAY_EVENT_FRIENDS'),
(-1568010,'Get da move on, guards! It be killin\' time!',12066,1,0,'nalorakk SAY_WAVE1_AGGRO'),
(-1568011,'Guards, go already! Who you more afraid of, dem... or me?',12067,1,0,'nalorakk SAY_WAVE2_STAIR1'),
(-1568012,'Ride now! Ride out dere and bring me back some heads!',12068,1,0,'nalorakk SAY_WAVE3_STAIR2'),
(-1568013,'I be losin\' me patience! Go on: make dem wish dey was never born!',12069,1,0,'nalorakk SAY_WAVE4_PLATFORM'),
(-1568014,'What could be better than servin\' da bear spirit for eternity? Come closer now. Bring your souls to me!',12078,1,0,'nalorakk SAY_EVENT1_SACRIFICE'),
(-1568015,'Don\'t be delayin\' your fate. Come to me now. I make your sacrifice quick.',12079,1,0,'nalorakk SAY_EVENT2_SACRIFICE'),
(-1568016,'You be dead soon enough!',12070,1,0,'nalorakk SAY_AGGRO'),
(-1568017,'I bring da pain!',12071,1,0,'nalorakk SAY_SURGE'),
(-1568018,'You call on da beast, you gonna get more dan you bargain for!',12072,1,0,'nalorakk SAY_TOBEAR'),
(-1568019,'Make way for Nalorakk!',12073,1,0,'nalorakk SAY_TOTROLL'),
(-1568020,'You had your chance, now it be too late!',12074,1,0,'nalorakk SAY_BERSERK'),
(-1568021,'Mua-ha-ha! Now whatchoo got to say?',12075,1,0,'nalorakk SAY_SLAY1'),
(-1568022,'Da Amani gonna rule again!',12076,1,0,'nalorakk SAY_SLAY2'),
(-1568023,'I... be waitin\' on da udda side....',12077,1,0,'nalorakk SAY_DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1509027 AND -1509000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1509000,'senses your fear.',0,2,0,'moam EMOTE_AGGRO'),
(-1509001,'bristles with energy!',0,2,0,'moan EMOTE_MANA_FULL'),
(-1509002,'sets eyes on $N!',0,2,0,'buru EMOTE_TARGET'),
(-1509003,'They come now. Try not to get yourself killed, young blood.',0,1,0,'andorov SAY_ANDOROV_INTRO'),
(-1509004,'Remember, Rajaxx, when I said I\'d kill you last? I lied...',0,1,0,'andorov SAY_ANDOROV_ATTACK'),
(-1509005,'The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!',8612,1,0,'rajaxx SAY_WAVE3'),
(-1509006,'No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!',8610,1,0,'rajaxx SAY_WAVE4'),
(-1509007,'Fear is for the enemy! Fear and death!',8608,1,0,'rajaxx SAY_WAVE5'),
(-1509008,'Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!',8611,1,0,'rajaxx SAY_WAVE6'),
(-1509009,'Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!',8607,1,0,'rajaxx SAY_WAVE7'),
(-1509010,'Impudent fool! I will kill you myself!',8609,1,0,'rajaxx SAY_INTRO'),
(-1509011,'Attack and make them pay dearly!',8603,1,0,'rajaxx SAY_UNK1'),
(-1509012,'Crush them! Drive them out!',8605,1,0,'rajaxx SAY_UNK2'),
(-1509013,'Do not hesitate! Destroy them!',8606,1,0,'rajaxx SAY_UNK3'),
(-1509014,'Warriors! Captains! Continue the fight!',8613,1,0,'rajaxx SAY_UNK4'),
(-1509015,'You are not worth my time $N!',8614,1,0,'rajaxx SAY_DEAGGRO'),
(-1509016,'Breath your last!',8604,1,0,'rajaxx SAY_KILLS_ANDOROV'),
(-1509017,'Soon you will know the price of your meddling, mortals... The master is nearly whole... And when he rises, your world will be cease!',0,1,0,'rajaxx SAY_COMPLETE_QUEST'),
(-1509018,'I am rejuvinated!',8593,1,0,'ossirian SAY_SURPREME1'),
(-1509019,'My powers are renewed!',8595,1,0,'ossirian SAY_SURPREME2'),
(-1509020,'My powers return!',8596,1,0,'ossirian SAY_SURPREME3'),
(-1509021,'Protect the city at all costs!',8597,1,0,'ossirian SAY_RAND_INTRO1'),
(-1509022,'The walls have been breached!',8599,1,0,'ossirian SAY_RAND_INTRO2'),
(-1509023,'To your posts. Defend the city.',8600,1,0,'ossirian SAY_RAND_INTRO3'),
(-1509024,'Tresspassers will be terminated.',8601,1,0,'ossirian SAY_RAND_INTRO4'),
(-1509025,'Sands of the desert rise and block out the sun!',8598,1,0,'ossirian SAY_AGGRO'),
(-1509026,'You are terminated.',8602,1,0,'ossirian SAY_SLAY'),
(-1509027,'I...have...failed.',8594,1,0,'ossirian SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1531011 AND -1531000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1531000,'Are you so eager to die? I would be happy to accomodate you.',8615,1,0,'skeram SAY_AGGRO1'),
(-1531001,'Cower mortals! The age of darkness is at hand.',8616,1,0,'skeram SAY_AGGRO2'),
(-1531002,'Tremble! The end is upon you.',8621,1,0,'skeram SAY_AGGRO3'),
(-1531003,'Let your death serve as an example!',8617,1,0,'skeram SAY_SLAY1'),
(-1531004,'Spineless wretches! You will drown in rivers of blood!',8619,1,0,'skeram SAY_SLAY2'),
(-1531005,'The screams of the dying will fill the air. A symphony of terror is about to begin!',8620,1,0,'skeram SAY_SLAY3'),
(-1531006,'Prepare for the return of the ancient ones!',8618,1,0,'skeram SAY_SPLIT'),
(-1531007,'You only delay... the inevetable.',8622,1,0,'skeram SAY_DEATH'),
(-1531008,'You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!',8646,1,0,'sartura SAY_AGGRO'),
(-1531009,'I sentence you to death!',8647,1,0,'sartura SAY_SLAY'),
(-1531010,'I serve to the last!',8648,1,0,'sartura SAY_DEATH'),
(-1531011,'is weakened!',0,2,0,'cthun EMOTE_WEAKENED');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1509027 AND -1509018;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1509018,'I am rejuvinated!',8593,1,0,'ossirian SAY_SURPREME1'),
(-1509019,'My powers are renewed!',8595,1,0,'ossirian SAY_SURPREME2'),
(-1509020,'My powers return!',8596,1,0,'ossirian SAY_SURPREME3'),
(-1509021,'Protect the city at all costs!',8597,1,0,'ossirian SAY_RAND_INTRO1'),
(-1509022,'The walls have been breached!',8599,1,0,'ossirian SAY_RAND_INTRO2'),
(-1509023,'To your posts. Defend the city.',8600,1,0,'ossirian SAY_RAND_INTRO3'),
(-1509024,'Tresspassers will be terminated.',8601,1,0,'ossirian SAY_RAND_INTRO4'),
(-1509025,'Sands of the desert rise and block out the sun!',8598,1,0,'ossirian SAY_AGGRO'),
(-1509026,'You are terminated.',8602,1,0,'ossirian SAY_SLAY'),
(-1509027,'I...have...failed.',8594,1,0,'ossirian SAY_DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1564096 AND -1564000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1564000,'You will die in the name of Lady Vashj!',11450,1,0,'SAY_AGGRO'),
(-1564001,'Stick around!',11451,1,0,'SAY_NEEDLE1'),
(-1564002,'I\'ll deal with you later!',11452,1,0,'SAY_NEEDLE2'),
(-1564003,'Your success was short lived!',11455,1,0,'SAY_SLAY1'),
(-1564004,'Time for you to go!',11456,1,0,'SAY_SLAY2'),
(-1564005,'Bel\'anen dal\'lorei!',11453,1,0,'SAY_SPECIAL1'),
(-1564006,'Blood will flow!',11454,1,0,'SAY_SPECIAL2'),
(-1564007,'Bal\'amer ch\'itah!',11457,1,0,'SAY_ENRAGE1'),
(-1564008,'My patience has ran out! Die, DIE!',11458,1,0,'SAY_ENRAGE2'),
(-1564009,'Lord Illidan will... crush you.',11459,1,0,'SAY_DEATH'),
(-1564010,'%s acquires a new target!',0,3,0,'supremus EMOTE_NEW_TARGET'),
(-1564011,'%s punches the ground in anger!',0,3,0,'supremus EMOTE_PUNCH_GROUND'),
(-1564012,'The ground begins to crack open!',0,3,0,'supremus EMOTE_GROUND_CRACK'),
(-1564013,'No! Not yet...',11385,1,0,'akama shade SAY_LOW_HEALTH'),
(-1564014,'I will not last much longer...',11386,1,0,'akama shade SAY_DEATH'),
(-1564015,'Come out from the shadows! I\'ve returned to lead you against our true enemy! Shed your chains and raise your weapons against your Illidari masters!',0,1,0,'akama shade SAY_FREE'),
(-1564016,'Hail our leader! Hail Akama!',0,1,0,'akama shade broken SAY_BROKEN_FREE_01'),
(-1564017,'Hail Akama!',0,1,0,'akama shade broken SAY_BROKEN_FREE_02'),
(-1564018,'You play, you pay.',11501,1,0,'shahraz SAY_TAUNT1'),
(-1564019,'I\'m not impressed.',11502,1,0,'shahraz SAY_TAUNT2'),
(-1564020,'Enjoying yourselves?',11503,1,0,'shahraz SAY_TAUNT3'),
(-1564021,'So... business or pleasure?',11504,1,0,'shahraz SAY_AGGRO'),
(-1564022,'You seem a little tense.',11505,1,0,'shahraz SAY_SPELL1'),
(-1564023,'Don\'t be shy.',11506,1,0,'shahraz SAY_SPELL2'),
(-1564024,'I\'m all... yours.',11507,1,0,'shahraz SAY_SPELL3'),
(-1564025,'Easy come, easy go.',11508,1,0,'shahraz SAY_SLAY1'),
(-1564026,'So much for a happy ending.',11509,1,0,'shahraz SAY_SLAY2'),
(-1564027,'Stop toying with my emotions!',11510,1,0,'shahraz SAY_ENRAGE'),
(-1564028,'I wasn\'t... finished.',11511,1,0,'shahraz SAY_DEATH'),
(-1564029,'Horde will... crush you.',11432,1,0,'bloodboil SOUND_AGGRO'),
(-1564030,'Time to feast!',11433,1,0,'bloodboil SAY_SLAY1'),
(-1564031,'More! I want more!',11434,1,0,'bloodboil SAY_SLAY2'),
(-1564032,'Drink your blood! Eat your flesh!',11435,1,0,'bloodboil SAY_SPECIAL1'),
(-1564033,'I hunger!',11436,1,0,'bloodboil SAY_SPECIAL2'),
(-1564034,'<babbling>',11437,1,0,'bloodboil SAY_ENRAGE1'),
(-1564035,'I\'ll rip the meat from your bones!',11438,1,0,'bloodboil SAY_ENRAGE2'),
(-1564036,'Aaaahrg...',11439,1,0,'bloodboil SAY_DEATH'),
(-1564037,'I was the first, you know. For me, the wheel of death has spun many times. <laughs> So much time has passed. I have a lot of catching up to do...',11512,1,0,'teron SAY_INTRO'),
(-1564038,'Vengeance is mine!',11513,1,0,'teron SAY_AGGRO'),
(-1564039,'I have use for you!',11514,1,0,'teron SAY_SLAY1'),
(-1564040,'It gets worse...',11515,1,0,'teron SAY_SLAY2'),
(-1564041,'What are you afraid of?',11517,1,0,'teron SAY_SPELL1'),
(-1564042,'Death... really isn\'t so bad.',11516,1,0,'teron SAY_SPELL2'),
(-1564043,'Give in!',11518,1,0,'teron SAY_SPECIAL1'),
(-1564044,'I have something for you...',11519,1,0,'teron SAY_SPECIAL2'),
(-1564045,'YOU WILL SHOW THE PROPER RESPECT!',11520,1,0,'teron SAY_ENRAGE'),
(-1564046,'The wheel...spins...again....',11521,1,0,'teron SAY_DEATH'),
(-1564047,'Pain and suffering are all that await you!',11415,1,0,'essence SUFF_SAY_FREED'),
(-1564048,'Don\'t leave me alone!',11416,1,0,'essence SUFF_SAY_AGGRO'),
(-1564049,'Look at what you make me do!',11417,1,0,'essence SUFF_SAY_SLAY1'),
(-1564050,'I didn\'t ask for this!',11418,1,0,'essence SUFF_SAY_SLAY2'),
(-1564051,'The pain is only beginning!',11419,1,0,'essence SUFF_SAY_SLAY3'),
(-1564052,'I don\'t want to go back!',11420,1,0,'essence SUFF_SAY_RECAP'),
(-1564053,'Now what do I do?',11421,1,0,'essence SUFF_SAY_AFTER'),
(-1564054,'%s becomes enraged!',0,3,0,'essence SUFF_EMOTE_ENRAGE'),
(-1564055,'You can have anything you desire... for a price.',11408,1,0,'essence DESI_SAY_FREED'),
(-1564056,'Fulfilment is at hand!',11409,1,0,'essence DESI_SAY_SLAY1'),
(-1564057,'Yes... you\'ll stay with us now...',11410,1,0,'essence DESI_SAY_SLAY2'),
(-1564058,'Your reach exceeds your grasp.',11412,1,0,'essence DESI_SAY_SLAY3'),
(-1564059,'Be careful what you wish for...',11411,1,0,'essence DESI_SAY_SPEC'),
(-1564060,'I\'ll be waiting...',11413,1,0,'essence DESI_SAY_RECAP'),
(-1564061,'I won\'t be far...',11414,1,0,'essence DESI_SAY_AFTER'),
(-1564062,'Beware: I live!',11399,1,0,'essence ANGER_SAY_FREED'),
(-1564063,'So... foolish.',11400,1,0,'essence ANGER_SAY_FREED2'),
(-1564064,'<maniacal cackle>',11401,1,0,'essence ANGER_SAY_SLAY1'),
(-1564065,'Enough. No more.',11402,1,0,'essence ANGER_SAY_SLAY2'),
(-1564066,'On your knees!',11403,1,0,'essence ANGER_SAY_SPEC'),
(-1564067,'Beware, coward.',11405,1,0,'essence ANGER_SAY_BEFORE'),
(-1564068,'I won\'t... be... ignored.',11404,1,0,'essence ANGER_SAY_DEATH'),
(-1564069,'You wish to test me?',11524,1,0,'council vera AGGRO'),
(-1564070,'I have better things to do...',11422,1,0,'council gath AGGRO'),
(-1564071,'Flee or die!',11482,1,0,'council mala AGGRO'),
(-1564072,'Common... such a crude language. Bandal!',11440,1,0,'council zere AGGRO'),
(-1564073,'Enough games!',11428,1,0,'council gath ENRAGE'),
(-1564074,'You wish to kill me? Hahaha, you first!',11530,1,0,'council vera ENRAGE'),
(-1564075,'For Quel\'Thalas! For the Sunwell!',11488,1,0,'council mala ENRAGE'),
(-1564076,'Sha\'amoor sine menoor!',11446,1,0,'council zere ENRAGE'),
(-1564077,'Enjoy your final moments!',11426,1,0,'council gath SPECIAL1'),
(-1564078,'You\'re not caught up for this!',11528,1,0,'council vera SPECIAL1'),
(-1564079,'No second chances!',11486,1,0,'council mala SPECIAL1'),
(-1564080,'Diel fin\'al',11444,1,0,'council zere SPECIAL1'),
(-1564081,'You are mine!',11427,1,0,'council gath SPECIAL2'),
(-1564082,'Anar\'alah belore!',11529,1,0,'council vera SPECIAL2'),
(-1564083,'I\'m full of surprises!',11487,1,0,'council mala SPECIAL2'),
(-1564084,'Sha\'amoor ara mashal?',11445,1,0,'council zere SPECIAL2'),
(-1564085,'Selama am\'oronor!',11423,1,0,'council gath SLAY'),
(-1564086,'Valiant effort!',11525,1,0,'council vera SLAY'),
(-1564087,'My work is done.',11483,1,0,'council mala SLAY'),
(-1564088,'Shorel\'aran.',11441,1,0,'council zere SLAY'),
(-1564089,'Well done!',11424,1,0,'council gath SLAY_COMT'),
(-1564090,'A glorious kill!',11526,1,0,'council vera SLAY_COMT'),
(-1564091,'As it should be!',11484,1,0,'council mala SLAY_COMT'),
(-1564092,'Belesa menoor!',11442,1,0,'council zere SLAY_COMT'),
(-1564093,'Lord Illidan... I...',11425,1,0,'council gath DEATH'),
(-1564094,'You got lucky!',11527,1,0,'council vera DEATH'),
(-1564095,'Destiny... awaits.',11485,1,0,'council mala DEATH'),
(-1564096,'Diel ma\'ahn... oreindel\'o',11443,1,0,'council zere DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1409018 AND -1409000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1409000,'performs one last service for Ragnaros.',0,2,0,'geddon EMOTE_SERVICE'),
(-1409001,'goes into a killing frenzy!',0,2,0,'magmadar EMOTE_FRENZY'),
(-1409002,'refuses to die while its master is in trouble.',0,2,0,'core rager EMOTE_AEGIS'),
(-1409003,'Reckless mortals, none may challenge the sons of the living flame!',8035,1,0,'majordomo SAY_AGGRO'),
(-1409004,'The runes of warding have been destroyed! Hunt down the infedels my bretheren.',8039,1,0,'majordomo SAY_SPAWN'),
(-1409005,'Ashes to Ashes!',8037,1,0,'majordomo SAY_SLAY'),
(-1409006,'Burn mortals! Burn for this transgression!',8036,1,0,'majordomo SAY_SPECIAL'),
(-1409007,'Impossible! Stay your attack mortals! I submitt! I submitt! Brashly you have come to rest the secrets of the living flame. You will soon regret the recklessness of your quest. I go now to summon the lord whos house this is. Should you seek an audiance with him your paltry lives will surly be forfit. Nevertheless seek out his lair if you dare!',8038,1,0,'majordomo SAY_DEFEAT'),
(-1409008,'Behold Ragnaros, the Firelord! He who was ancient when this world was young! Bow before him, mortals! Bow before your ending!',8040,1,0,'ragnaros SAY_SUMMON_MAJ'),
(-1409009,'TOO SOON! YOU HAVE AWAKENED ME TOO SOON, EXECUTUS! WHAT IS THE MEANING OF THIS INTRUSION?',8043,1,0,'ragnaros SAY_ARRIVAL1_RAG'),
(-1409010,'These mortal infidels, my lord! They have invaded your sanctum, and seek to steal your secrets!',8041,1,0,'ragnaros SAY_ARRIVAL2_MAJ'),
(-1409011,'FOOL! YOU ALLOWED THESE INSECTS TO RUN RAMPANT THROUGH THE HALLOWED CORE, AND NOW YOU LEAD THEM TO MY VERY LAIR? YOU HAVE FAILED ME, EXECUTUS! JUSTICE SHALL BE MET, INDEED!',8044,1,0,'ragnaros SAY_ARRIVAL3_RAG'),
(-1409012,'NOW FOR YOU, INSECTS. BOLDLY YOU SAUGHT THE POWER OF RAGNAROS NOW YOU SHALL SEE IT FIRST HAND.',8045,1,0,'ragnaros SAY_ARRIVAL5_RAG'),
(-1409013,'COME FORTH, MY SERVANTS! DEFEND YOUR MASTER!',8049,1,0,'ragnaros SAY_REINFORCEMENTS1'),
(-1409014,'YOU CANNOT DEFEAT THE LIVING FLAME! COME YOU MINIONS OF FIRE! COME FORTH YOU CREATURES OF HATE! YOUR MASTER CALLS!',8050,1,0,'ragnaros SAY_REINFORCEMENTS2'),
(-1409015,'BY FIRE BE PURGED!',8046,1,0,'ragnaros SAY_HAND'),
(-1409016,'TASTE THE FLAMES OF SULFURON!',8047,1,0,'ragnaros SAY_WRATH'),
(-1409017,'DIE INSECT!',8051,1,0,'ragnaros SAY_KILL'),
(-1409018,'MY PATIENCE IS DWINDILING! COME NATS TO YOUR DEATH!',8048,1,0,'ragnaros SAY_MAGMABURST');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1552030 AND -1552000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1552000,'It is a small matter to control the mind of the weak... for I bear allegiance to powers untouched by time, unmoved by fate. No force on this world or beyond harbors the strength to bend our knee... not even the mighty Legion!',11122,1,0,'skyriss SAY_INTRO'),
(-1552001,'Bear witness to the agent of your demise!',11123,1,0,'skyriss SAY_AGGRO'),
(-1552002,'Your fate is written!',11124,1,0,'skyriss SAY_KILL_1'),
(-1552003,'The chaos I have sown here is but a taste...',11125,1,0,'skyriss SAY_KILL_2'),
(-1552004,'You will do my bidding, weakling.',11127,1,0,'skyriss SAY_MIND_1'),
(-1552005,'Your will is no longer your own.',11128,1,0,'skyriss SAY_MIND_2'),
(-1552006,'Flee in terror!',11129,1,0,'skyriss SAY_FEAR_1'),
(-1552007,'I will show you horrors undreamed of!',11130,1,0,'skyriss SAY_FEAR_2'),
(-1552008,'We span the universe, as countless as the stars!',11131,1,0,'skyriss SAY_IMAGE'),
(-1552009,'I am merely one of... infinite multitudes.',11126,1,0,'skyriss SAY_DEATH'),
(-1552010,'Where in Bonzo\'s brass buttons am I? And who are-- yaaghh, that\'s one mother of a headache!',11171,1,0,'millhouse SAY_INTRO_1'),
(-1552011,'\"Lowly\"? I don\'t care who you are friend, no one refers to the mighty Millhouse Manastorm as \"Lowly\"! I have no idea what goes on here, but I will gladly join your fight against this impudent imbecile! Prepare to defend yourself, cretin!',11172,1,0,'millhouse SAY_INTRO_2'),
(-1552012,'I just need to get some things ready first. You guys go ahead and get started. I need to summon up some water...',11173,1,0,'millhouse SAY_WATER'),
(-1552013,'Fantastic! Next, some protective spells. Yes! Now we\'re cookin\'',11174,1,0,'millhouse SAY_BUFFS'),
(-1552014,'And of course i\'ll need some mana. You guys are gonna love this, just wait.',11175,1,0,'millhouse SAY_DRINK'),
(-1552015,'Aaalllriiiight!! Who ordered up an extra large can of whoop-ass?',11176,1,0,'millhouse SAY_READY'),
(-1552016,'I didn\'t even break a sweat on that one.',11177,1,0,'millhouse SAY_KILL_1'),
(-1552017,'You guys, feel free to jump in anytime.',11178,1,0,'millhouse SAY_KILL_2'),
(-1552018,'I\'m gonna light you up, sweet cheeks!',11179,1,0,'millhouse SAY_PYRO'),
(-1552019,'Ice, ice, baby!',11180,1,0,'millhouse SAY_ICEBLOCK'),
(-1552020,'Heal me! Oh, for the love of all that is holy, HEAL me! I\'m dying!',11181,1,0,'millhouse SAY_LOWHP'),
(-1552021,'You\'ll be hearing from my lawyer...',11182,1,0,'millhouse SAY_DEATH'),
(-1552022,'Who\'s bad? Who\'s bad? That\'s right: we bad!',11183,1,0,'millhouse SAY_COMPLETE'),
(-1552023,'I knew the prince would be angry but, I... I have not been myself. I had to let them out! The great one speaks to me, you see. Wait--outsiders. Kael\'thas did not send you! Good... I\'ll just tell the prince you released the prisoners!',11222,1,0,'mellichar YELL_INTRO1'),
(-1552024,'The naaru kept some of the most dangerous beings in existence here in these cells. Let me introduce you to another...',11223,1,0,'mellichar YELL_INTRO2'),
(-1552025,'Yes, yes... another! Your will is mine!',11224,1,0,'mellichar YELL_RELEASE1'),
(-1552026,'Behold another terrifying creature of incomprehensible power!',11225,1,0,'mellichar YELL_RELEASE2A'),
(-1552027,'What is this? A lowly gnome? I will do better, O\'great one.',11226,1,0,'mellichar YELL_RELEASE2B'),
(-1552028,'Anarchy! Bedlam! Oh, you are so wise! Yes, I see it now, of course!',11227,1,0,'mellichar YELL_RELEASE3'),
(-1552029,'One final cell remains. Yes, O\'great one, right away!',11228,1,0,'mellichar YELL_RELEASE4'),
(-1552030,'Welcome, O\'great one. I am your humble servant.',11229,1,0,'mellichar YELL_WELCOME');

DELETE FROM `script_texts` WHERE `entry`=-1000100;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000100,'Come, little ones. Face me!',0,1,0,'azuregos SAY_TELEPORT');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1249004 AND -1249000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1249000,'How fortuitous. Usually, I must leave my lair to feed.',0,1,0,'onyxia SAY_AGGRO'),
(-1249001,'Learn your place mortal!',0,1,0,'onyxia SAY_KILL'),
(-1249002,'This meaningless exertion bores me. I\'ll incinerate you all from above!',0,1,0,'onyxia SAY_PHASE_2_TRANS'),
(-1249003,'It seems you\'ll need another lesson, mortals!',0,1,0,'onyxia SAY_PHASE_3_TRANS'),
(-1249004,'takes in a deep breath...',0,1,0,'onyxia EMOTE_BREATH');

DELETE FROM `script_texts` WHERE `entry`=-1469031;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1469031,'goes into a frenzy!',0,2,0,'flamegor EMOTE_FRENZY');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000105 AND -1000101;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000101,'Follow me, $N. I\'ll take you to the Defias hideout. But you better protect me or I am as good as dead',0,0,7,'defias traitor SAY_START'),
(-1000102,'The entrance is hidden here in Moonbrook. Keep your eyes peeled for thieves. They want me dead.',0,0,7,'defias traitor SAY_PROGRESS'),
(-1000103,'You can go tell Stoutmantle this is where the Defias Gang is holed up, $N.',0,0,7,'defias traitor SAY_END'),
(-1000104,'%s coming in fast! Prepare to fight!',0,0,7,'defias traitor SAY_AGGRO_1'),
(-1000105,'Help!',0,0,7,'defias traitor SAY_AGGRO_2');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000110 AND -1000106;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000106,'Everyone ready?',0,0,1,'torek SAY_READY'),
(-1000107,'Ok, Lets move out!',0,0,1,'torek SAY_MOVE'),
(-1000108,'Prepare yourselves. Silverwing is just around the bend.',0,0,1,'torek SAY_PREPARE'),
(-1000109,'Silverwing is ours!',0,0,1,'torek SAY_WIN'),
(-1000110,'Go report that the outpost is taken. We will remain here.',0,0,1,'torek SAY_END');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000116 AND -1000111;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000111, 'Our house is this way, through the thicket.', 0, 0, 7, 'magwin SAY_START'),
(-1000112, 'Help me!', 0, 0, 7, 'magwin SAY_AGGRO'),
(-1000113, 'My poor family. Everything has been destroyed.', 0, 0, 7, 'magwin SAY_PROGRESS'),
(-1000114, 'Father! Father! You\'re alive!', 0, 0, 7, 'magwin SAY_END1'),
(-1000115, 'You can thank $N for getting me back here safely, father.', 0, 0, 7, 'magwin SAY_END2'),
(-1000116, 'hugs her father.', 0, 2, 7, 'magwin EMOTE_HUG');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1560048 AND -1560023;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1560023,'Very well then. Let\'s go!',10465,1,0,'thrall hillsbrad SAY_TH_START_EVENT_PART1'),
(-1560024,'As long as we\'re going with a new plan, I may aswell pick up a weapon and some armor.',0,0,0,'thrall hillsbrad SAY_TH_ARMORY'),
(-1560025,'A rider approaches!',10466,0,0,'thrall hillsbrad SAY_TH_SKARLOC_MEET'),
(-1560026,'I\'ll never be chained again!',10467,1,0,'thrall hillsbrad SAY_TH_SKARLOC_TAUNT'),
(-1560027,'Very well. Tarren Mill lies just west of here. Since time is of the essence...',10468,1,0,'thrall hillsbrad SAY_TH_START_EVENT_PART2'),
(-1560028,'Let\'s ride!',10469,0,0,'thrall hillsbrad SAY_TH_MOUNTS_UP'),
(-1560029,'Taretha must be in the inn. Let\'s go.',0,0,0,'thrall hillsbrad SAY_TH_CHURCH_END'),
(-1560030,'Taretha! What foul magic is this?',0,0,0,'thrall hillsbrad SAY_TH_MEET_TARETHA'),
(-1560031,'Who or what was that?',10470,1,0,'thrall hillsbrad SAY_TH_EPOCH_WONDER'),
(-1560032,'No!',10471,1,0,'thrall hillsbrad SAY_TH_EPOCH_KILL_TARETHA'),
(-1560033,'Goodbye, Taretha. I will never forget your kindness.',10472,1,0,'thrall hillsbrad SAY_TH_EVENT_COMPLETE'),
(-1560034,'Things are looking grim...',10458,1,0,'thrall hillsbrad SAY_TH_RANDOM_LOW_HP1'),
(-1560035,'I will fight to the last!',10459,1,0,'thrall hillsbrad SAY_TH_RANDOM_LOW_HP2'),
(-1560036,'Taretha...',10460,1,0,'thrall hillsbrad SAY_TH_RANDOM_DIE1'),
(-1560037,'A good day...to die...',10461,1,0,'thrall hillsbrad SAY_TH_RANDOM_DIE2'),
(-1560038,'I have earned my freedom!',10448,1,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO1'),
(-1560039,'This day is long overdue. Out of my way!',10449,1,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO2'),
(-1560040,'I am a slave no longer!',10450,1,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO3'),
(-1560041,'Blackmoore has much to answer for!',10451,1,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO4'),
(-1560042,'You have forced my hand!',10452,1,0,'thrall hillsbrad SAY_TH_RANDOM_KILL1'),
(-1560043,'It should not have come to this!',10453,1,0,'thrall hillsbrad SAY_TH_RANDOM_KILL2'),
(-1560044,'I did not ask for this!',10454,1,0,'thrall hillsbrad SAY_TH_RANDOM_KILL3'),
(-1560045,'I am truly in your debt, strangers.',10455,1,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT1'),
(-1560046,'Thank you, strangers. You have given me hope.',10456,1,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT2'),
(-1560047,'I will not waste this chance. I will seek out my destiny.',10457,1,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT3'),
(-1560048,'I\'m free! Thank you all!',0,0,0,'taretha SAY_TA_FREE');
DELETE FROM `script_texts` WHERE `entry`=-1560049;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1560049,'Thrall, you escaped!',0,0,0,'taretha SAY_TA_ESCAPED');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1534017 AND -1534000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1534000,'I\'m in jeopardy, help me if you can!',11007,1,0,'jaina hyjal ATTACKED 1'),
(-1534001,'They\'ve broken through!',11049,1,0,'jaina hyjal ATTACKED 2'),
(-1534002,'Stay alert! Another wave approaches.',11008,1,0,'jaina hyjal INCOMING'),
(-1534003,'Don\'t give up! We must prevail!',11006,1,0,'jaina hyjal BEGIN'),
(-1534004,'Hold them back as long as possible.',11050,1,0,'jaina hyjal RALLY 1'),
(-1534005,'We must hold strong!',11051,1,0,'jaina hyjal RALLY 2'),
(-1534006,'We are lost. Fall back!',11009,1,0,'jaina hyjal FAILURE'),
(-1534007,'We have won valuable time. Now we must pull back!',11011,1,0,'jaina hyjal SUCCESS'),
(-1534008,'I did... my best.',11010,1,0,'jaina hyjal DEATH'),
(-1534009,'I will lie down for no one!',11031,1,0,'thrall hyjal ATTACKED 1'),
(-1534010,'Bring the fight to me and pay with your lives!',11061,1,0,'thrall hyjal ATTACKED 2'),
(-1534011,'Make ready for another wave! LOK-TAR OGAR!',11032,1,0,'thrall hyjal INCOMING'),
(-1534012,'Hold them back! Do not falter!',11030,1,0,'thrall hyjal BEGIN'),
(-1534013,'Victory or death!',11059,1,0,'thrall hyjal RALLY 1'),
(-1534014,'Do not give an inch of ground!',11060,1,0,'thrall hyjal RALLY 2'),
(-1534015,'It is over. Withdraw! We have failed.',11033,1,0,'thrall hyjal FAILURE'),
(-1534016,'We have played our part and done well. It is up to the others now.',11035,1,0,'thrall hyjal SUCCESS'),
(-1534017,'Uraaa...',11034,1,0,'thrall hyjal DEATH');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1534030 AND -1534018;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1534018,'All of your efforts have been in vain, for the draining of the World Tree has already begun. Soon the heart of your world will beat no more.',10986,1,0,'archimonde SAY_PRE_EVENTS_COMPLETE'),
(-1534019,'Your resistance is insignificant.',10987,1,0,'archimonde SAY_AGGRO'),
(-1534020,'This world will burn!',10990,1,0,'archimonde SAY_DOOMFIRE1'),
(-1534021,'Manach sheek-thrish!',11041,1,0,'archimonde SAY_DOOMFIRE2'),
(-1534022,'A-kreesh!',10989,1,0,'archimonde SAY_AIR_BURST1'),
(-1534023,'Away vermin!',11043,1,0,'archimonde SAY_AIR_BURST2'),
(-1534024,'All creation will be devoured!',11044,1,0,'archimonde SAY_SLAY1'),
(-1534025,'Your soul will languish for eternity.',10991,1,0,'archimonde SAY_SLAY2'),
(-1534026,'I am the coming of the end!',11045,1,0,'archimonde SAY_SLAY3'),
(-1534027,'At last it is here. Mourn and lament the passing of all you have ever known and all that would have been! Akmin-kurai!',10993,1,0,'archimonde SAY_ENRAGE'),
(-1534028,'No, it cannot be! Nooo!',10992,1,0,'archimonde SAY_DEATH'),
(-1534029,'You are mine now.',10988,1,0,'archimonde SAY_SOUL_CHARGE1'),
(-1534030,'Bow to my will.',11042,1,0,'archimonde SAY_SOUL_CHARGE2');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000117 AND -1000122;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000117, 'Thank you for agreeing to help. Now, let\'s get out of here $N.', 0, 0, 1, 'wounded elf SAY_ELF_START'),
(-1000118, 'Over there! They\'re following us!', 0, 0, 1, 'wounded elf SAY_ELF_SUMMON1'),
(-1000119, 'Allow me a moment to rest. The journey taxes what little strength I have.', 0, 0, 1, 'wounded elf SAY_ELF_RESTING'),
(-1000120, 'Did you hear something?', 0, 0, 1, 'wounded elf SAY_ELF_SUMMON2'),
(-1000121, 'Falcon Watch, at last! Now, where\'s my... Oh no! My pack, it\'s missing! Where has -', 0, 0, 1, 'wounded elf SAY_ELF_COMPLETE'),
(-1000122, 'You won\'t keep me from getting to Falcon Watch!', 0, 0, 1, 'wounded elf SAY_ELF_AGGRO');
DELETE FROM `script_texts` WHERE `entry`=-1544015;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1544015,'breaks free!',0,2,0,'magtheridon EMOTE_FREED');

UPDATE `script_texts` SET `type`=3 WHERE `entry`=-1544013;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1189004 AND -1189000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1189000,'Ah, I have been waiting for a real challenge!',5830,1,0,'herod SAY_AGGRO'),
(-1189001,'Blades of Light!',5832,1,0,'herod SAY_WHIRLWIND'),
(-1189002,'Light, give me strength!',5833,1,0,'herod SAY_ENRAGE'),
(-1189003,'Hah, is that all?',5831,1,0,'herod SAY_KILL'),
(-1189004,'becomes enraged!',0,2,0,'herod EMOTE_ENRAGE');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1189010 AND -1189005;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1189005,'Infidels! They must be purified!',5835,1,0,'mograine SAY_MO_AGGRO'),
(-1189006,'Unworthy!',5836,1,0,'mograine SAY_MO_KILL'),
(-1189007,'At your side, milady!',5837,1,0,'mograine SAY_MO_RESSURECTED'),
(-1189008,'What, Mograine has fallen? You shall pay for this treachery!',5838,1,0,'whitemane SAY_WH_INTRO'),
(-1189009,'The Light has spoken!',5839,1,0,'whitemane SAY_WH_KILL'),
(-1189010,'Arise, my champion!',5840,1,0,'whitemane SAY_WH_RESSURECT');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1532114 AND -1532103;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1532103,'Welcome Ladies and Gentlemen, to this evening\'s presentation!',9174,1,0,'barnes OZ1'),
(-1532104,'Tonight we plumb the depths of the human soul as we join a lost, lonely girl trying desperately -- with the help of her loyal companions -- to find her way home!',9338,1,0,'barnes OZ2'),
(-1532105,'But she is pursued... by a wicked malevolent crone!',9339,1,0,'barnes OZ3'),
(-1532106,'Will she survive? Will she prevail? Only time will tell. And now ... on with the show!',9340,1,0,'barnes OZ4'),
(-1532107,'Good evening, Ladies and Gentlemen! Welcome to this evening\'s presentation!',9175,1,0,'barnes HOOD1'),
(-1532108,'Tonight, things are not what they seem. For tonight, your eyes may not be trusted',9335,1,0,'barnes HOOD2'),
(-1532109,'Take for instance, this quiet, elderly woman, waiting for a visit from her granddaughter. Surely there is nothing to fear from this sweet, grey-haired, old lady.',9336,1,0,'barnes HOOD3'),
(-1532110,'But don\'t let me pull the wool over your eyes. See for yourself what lies beneath those covers! And now... on with the show!',9337,1,0,'barnes HOOD4'),
(-1532111,'Welcome, Ladies and Gentlemen, to this evening\'s presentation!',9176,1,0,'barnes RAJ1'),
(-1532112,'Tonight, we explore a tale of forbidden love!',9341,1,0,'barnes RAJ2'),
(-1532113,'But beware, for not all love stories end happily, as you may find out. Sometimes, love pricks like a thorn.',9342,1,0,'barnes RAJ3'),
(-1532114,'But don\'t take it from me, see for yourself what tragedy lies ahead when the paths of star-crossed lovers meet. And now...on with the show!',9343,1,0,'barnes RAJ4');
DELETE FROM `script_texts` WHERE `entry` IN (-1036000,-1036001);
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1036000,'You there, check out that noise!',5775,1,7,'smite INST_SAY_ALARM1'),
(-1036001,'We\'re under attack! A vast, ye swabs! Repel the invaders!',5777,1,7,'smite INST_SAY_ALARM2');
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000127 AND -1000123;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000123, 'Ready when you are, $c.', 0, 0, 0, 'big will SAY_BIG_WILL_READY'),
(-1000124, 'The Affray has begun. $n, get ready to fight!', 0, 0, 0, 'twiggy SAY_TWIGGY_BEGIN'),
(-1000125, 'You! Enter the fray!', 0, 0, 0, 'twiggy SAY_TWIGGY_FRAY'),
(-1000126, 'Challenger is down!', 0, 0, 0, 'twiggy SAY_TWIGGY_DOWN'),
(-1000127, 'The Affray is over.', 0, 0, 0, 'twiggy SAY_TWIGGY_OVER');

UPDATE `creature_template` SET `minhealth`=2655000, `maxhealth`=2655000, `ScriptName` = 'boss_the_lurker_below', `InhabitType` = '3' WHERE `entry` = '21217';

UPDATE `creature_template` SET `ScriptName` = 'mob_coilfang_ambusher' WHERE `entry` = '21865';
UPDATE `creature_template` SET `ScriptName` = 'mob_coilfang_guardian' WHERE `entry` = '21873';

UPDATE `creature_model_info` SET `bounding_radius` = '13', `combat_reach` = '20' WHERE `modelid` = '20216';

DROP TABLE IF EXISTS `creature_formations`;

CREATE TABLE `creature_formations` (
  `leader` int(11) unsigned NOT NULL,
  `follower` int(11) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`follower`));

-- added missing entry for 3rd rank of gift of the wild

DELETE FROM spell_chain WHERE spell_id = 21849;
DELETE FROM spell_chain WHERE spell_id = 21850;
DELETE FROM spell_chain WHERE spell_id = 26991;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (21849,0,21849,1,0);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (21850,21849,21849,2,0);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (26991,21850,21849,3,0);

-- weaponsmith and armorsmith as blacksmith req spells

DELETE FROM spell_chain WHERE spell_id = 9787;
DELETE FROM spell_chain WHERE spell_id = 9788;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (9787,0,9787,1,9785);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (9788,0,9788,1,9785);

-- axe/sword/hammer smith req weaponsmith

DELETE FROM spell_chain WHERE spell_id = 17039;
DELETE FROM spell_chain WHERE spell_id = 17040;
DELETE FROM spell_chain WHERE spell_id = 17041;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (17039,0,17039,1,9787);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (17040,0,17040,1,9787);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (17041,0,17041,1,9787);

-- letherworking specs req spells

DELETE FROM spell_chain WHERE spell_id = 10660;
DELETE FROM spell_chain WHERE spell_id = 10658;
DELETE FROM spell_chain WHERE spell_id = 10656;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (10660,0,10660,1,10662);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (10658,0,10658,1,10662);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (10656,0,10656,1,10662);

-- alchemy specs req spells

DELETE FROM spell_chain WHERE spell_id = 28672;
DELETE FROM spell_chain WHERE spell_id = 28675;
DELETE FROM spell_chain WHERE spell_id = 28677;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (28672,0,28672,1,28596);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (28675,0,28675,1,28596);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (28677,0,28677,1,28596);

-- tailoring specs req spells

DELETE FROM spell_chain WHERE spell_id = 26801;
DELETE FROM spell_chain WHERE spell_id = 26798;
DELETE FROM spell_chain WHERE spell_id = 26797;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (26801,0,26801,1,26790);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (26798,0,26798,1,26790);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (26797,0,26797,1,26790);

-- engineering specs req spells

DELETE FROM spell_chain WHERE spell_id = 20222;
DELETE FROM spell_chain WHERE spell_id = 20219;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (20222,0,20222,1,12656);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (20219,0,20219,1,12656);

-- divine spirit req spells

DELETE FROM spell_chain WHERE spell_id = 27681;
DELETE FROM spell_chain WHERE spell_id = 32999;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (27681,0,27681,1,14752);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (32999,27681,27681,2,0);

-- judgement of justice req seal of justice(dunno what is this for)

DELETE FROM spell_chain WHERE spell_id = 20184;
DELETE FROM spell_chain WHERE spell_id = 31896;

INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (20184,0,20184,1,20164);
INSERT INTO spell_chain (spell_id,prev_spell,first_spell,rank,req_spell) VALUES (31896,20184,20184,2,0);

ALTER TABLE spell_chain DROP COLUMN prev_spell;

UPDATE `instance_template` SET `script`='instance_dark_portal' WHERE `map`=269;
UPDATE `creature_template` SET `ScriptName`='npc_medivh_bm' WHERE `entry`=15608;
UPDATE `creature_template` SET `ScriptName`='npc_time_rift' WHERE `entry`=17838;
UPDATE `creature_template` SET `ScriptName`='npc_saat' WHERE `entry`=20201;


DELETE FROM `script_texts` WHERE `entry` BETWEEN -1269028 AND -1269018;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1269018,'goes into a frenzy!',0,2,0,'aeonus EMOTE_FRENZY'),
(-1269019,'Stop! Do not go further, mortals. You are ill-prepared to face the forces of the Infinite Dragonflight. Come, let me help you.',0,0,0,'saat SAY_SAAT_WELCOME'),
(-1269020,'The time has come! Gul\'dan, order your warlocks to double their efforts! Moments from now the gateway will open, and your Horde will be released upon this ripe, unsuspecting world!',10435,1,0,'medivh SAY_ENTER'),
(-1269021,'What is this? Champions, coming to my aid? I sense the hand of the dark one in this. Truly this sacred event bears his blessing?',10436,1,0,'medivh SAY_INTRO'),
(-1269022,'Champions, my shield grows weak!',10437,1,0,'medivh SAY_WEAK75'),
(-1269023,'My powers must be concentrated on the portal! I do not have time to hold the shield!',10438,1,0,'medivh SAY_WEAK50'),
(-1269024,'The shield is nearly gone! All that I have worked for is in danger!',10439,1,0,'medivh SAY_WEAK25'),
(-1269025,'No... damn this feeble mortal coil...',10441,1,0,'medivh SAY_DEATH'),
(-1269026,'I am grateful for your aid, champions. Now, Gul\'dan\'s Horde will sweep across this world, like a locust swarm, and all my designs, all my carefully laid plans will at last fall into place.',10440,1,0,'medivh SAY_WIN'),
(-1269027,'Orcs of the Horde! This portalis the gateway to your new destiny! Azeroth lies before you, ripe for the taking!',0,1,0,'medivh SAY_ORCS_ENTER'),
(-1269028,'Gul\'dan speaks the truth! We should return at once to tell our brothers of the news! Retreat back trought the portal!',0,1,0,'medivh SAY_ORCS_ANSWER');

ALTER TABLE `creature_formations` CHANGE `leader` `leaderGUID` int(11) unsigned NOT NULL default '0';
ALTER TABLE `creature_formations` CHANGE `follower` `memberGUID` int(11) unsigned NOT NULL default '0';

-- Removing the now unused creature_movement table
DROP TABLE IF EXISTS `creature_movement`;

DELETE FROM `command` WHERE `name` = "flusharenapoints";
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('flusharenapoints','3','Syntax: .flusharenapoints\r\n\r\nUse it to distribute arena points based on arena team ratings, and start a new week.');

DELETE FROM trinity_string WHERE entry BETWEEN 1122 AND 1138;

INSERT INTO trinity_string (entry, content_default) VALUES
    (1122,'Your group is too large for this battleground. Please regroup to join.'),
    (1123,'Your group is too large for this arena. Please regroup to join.'),
    (1124,'Your group has members not in your arena team. Please regroup to join.'),
    (1125,'Your group does not have enough players to join this match.'),
    (1126,'The Gold Team wins!'),
    (1127,'The Green Team wins!'),
    (1128, 'There aren\'t enough players in this battleground. It will end soon unless some more players join to balance the fight.'),
    (1129, 'Your group has an offline member. Please remove him before joining.'),
    (1130, 'Your group has players from the opposing faction. You can\'t join the battleground as a group.'),
    (1131, 'Your group has players from different battleground brakets. You can\'t join as group.'),
    (1132, 'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.'),
    (1133, 'Someone in your party is Deserter. You can\'t join as group.'),
    (1134, 'Someone in your party is already in three battleground queues. You cannot join as group.'),
    (1135, 'You cannot teleport to a battleground or arena map.'),
    (1136, 'You cannot summon players to a battleground or arena map.'),
    (1137, 'You must be in GM mode to teleport to a player in a battleground.'),
    (1138, 'You cannot teleport to a battleground from another battleground. Please leave the current battleground first.');

DELETE FROM trinity_string WHERE entry = 714 OR entry = 716;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '36574';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES ('36574', '36650', '0', 'Apply Phase Slip Vulnerability');

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=21807;
DELETE FROM `areatrigger_scripts` WHERE `entry`=4560;
INSERT INTO `areatrigger_scripts` VALUES (4560,'at_legion_teleporter');
UPDATE `creature_template` SET `ScriptName`='npc_commander_dawnforge' WHERE `entry`=19831;
DELETE FROM `areatrigger_scripts` WHERE `entry`=4497;
INSERT INTO `areatrigger_scripts` VALUES (4497,'at_commander_dawnforge');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000137 AND -1000128;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000128, 'We need you to send reinforcements to Manaforge Duro, Ardonis. This is not a request, it\'s an order.', 0, 0, 0, 'dawnforge SAY_COMMANDER_DAWNFORGE_1'),
(-1000129, 'You cannot be serious! We are severely understaffed and can barely keep this manaforge functional!', 0, 0, 0, 'dawnforge SAY_ARCANIST_ARDONIS_1'),
(-1000130, 'You will do as ordered. Manaforge Duro has come under heavy attack by mana creatures and the situation is out of control. Failure to comply will not be tolerated!', 0, 0, 0, 'dawnforge SAY_COMMANDER_DAWNFORGE_2'),
(-1000131, 'Indeed, it is not a request.', 0, 0, 0, 'dawnforge SAY_PATHALEON_CULATOR_IMAGE_1'),
(-1000132, 'My lord!', 0, 0, 0, 'dawnforge SAY_COMMANDER_DAWNFORGE_3'),
(-1000133, 'Duro will be reinforced! Ultris was a complete disaster. I will NOT have that mistake repeated!', 0, 0, 0, 'dawnforge PATHALEON_CULATOR_IMAGE_2'),
(-1000134, 'We\'ve had too many setbacks along the way: Hellfire Citadel, Fallen Sky Ridge, Firewing Point... Prince Kael\'thas will tolerate no further delays. I will tolerate nothing other than complete success!', 0, 0, 0, 'dawnforge PATHALEON_CULATOR_IMAGE_2_1'),
(-1000135, 'I am returning to Tempest Keep. See to it that I do not have reason to return!', 0, 0, 0, 'dawnforge PATHALEON_CULATOR_IMAGE_2_2' ),
(-1000136, 'Yes, my lord.', 0, 0, 0, 'dawnforge COMMANDER_DAWNFORGE_4 SAY_ARCANIST_ARDONIS_2'),
(-1000137, 'See to it, Ardonis!', 0, 0, 0, 'dawnforge COMMANDER_DAWNFORGE_5');

INSERT INTO spell_script_target VALUES 
(8913,1,1200),
(9095,1,6492),
(33655,0,183351),
(33655,0,183350),
(34526,1,19723),
(34526,1,19724),
(36904,0,21511),
(38738,0,185193),
(38738,0,185195),
(38738,0,185196),
(38738,0,185197),
(38738,0,185198),
(39844,0,185549),
(42391,0,300152),
(12613,1,5843),
(34019,2,16873),
(34019,2,16871),
(34019,2,19422),
(34019,2,16907),
(38015,1,21216),
(39011,1,20885),
(40106,1,22883),
(40105,1,22883);

ALTER TABLE spell_chain DROP COLUMN first_spell;
ALTER TABLE spell_chain DROP COLUMN rank;
ALTER TABLE spell_chain RENAME TO spell_required;
DELETE FROM spell_required WHERE req_spell=0;


UPDATE `creature_template` SET `ScriptName`='npc_aeranas' WHERE `entry`=17085;
UPDATE `gameobject_template` SET `ScriptName`='go_haaleshi_altar' WHERE `entry`=181606;

DELETE FROM `script_texts` WHERE `entry` IN (-1000138,-1000139);
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000138, 'Avruu\'s magic... it still controls me. You must fight me, mortal. It\'s the only way to break the spell!', 0, 0, 0, 'aeranas SAY_SUMMON'),
(-1000139, 'Avruu\'s magic is broken! I\'m free once again!', 0, 0, 0, 'aeranas SAY_FREE');

UPDATE `item_template` SET `ScriptName` = "item_only_for_flight" WHERE `entry` IN (34475, 34489, 24538);

UPDATE creature_template SET Scriptname='npc_ranger_lilatha' WHERE entry=16295;

UPDATE `gameobject_template` SET `ScriptName` = 'go_mausoleum_trigger' WHERE `entry` = 104593;
UPDATE `gameobject_template` SET `ScriptName` = 'go_mausoleum_door' WHERE `entry` = 176594;

DELETE FROM `trinity_string`WHERE `entry` in ('6613', '6614', '6615');
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES ('6613','|cfff00000[GM Announcement]: %s|r');
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES ('6614','Notification to GM\'s - ');
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES ('6615','|cffffff00[|c1f40af20GM Announce by|r |cffff0000%s|cffffff00]:|r %s|r');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('gmnotify', 2, 'Syntax: .gmnotify $notification\r\nDisplays a notification on the screen of all online GM\'s.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('gmnameannounce', 2, 'Syntax: .gmnameannounce $announcement.\r\nSend an announcement to all online GM\'s, displaying the name of the sender.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('gmannounce', 4, 'Syntax: .gmannounce $announcement\r\nSend an announcement to online Gamemasters.');

INSERT INTO `spell_script_target` VALUES 
(3730,1,15263),
(6955,1,4946),
(7022,1,4945),
(7277,1,5409),
(9457,1,3701),
(11893,1,8156),
(12134,2,5270),
(12134,2,5271),
(12134,2,5273),
(12134,2,8313),
(12134,2,5256),
(12134,2,5259),
(13489,1,9178),
(15658,1,8929), -- It's up to script to implement SpellHit() for Moira Bronze beard
(16032,1,6557), -- Dummy effect should be implemented in core i think
(16337,1,10339),
(16337,1,10429), -- per spells description, it buffs two npc's.
(16637,1,10447),
(17748,1,10556),
(18969,1,12126),
(19749,1,12352), -- used by creature script to check if all troopers are presents, NYI
(19773,1,12018), -- used by Ragnaros to kill Majordomo
(21556,1,13378), -- no longer in game, but still could be used for some FUN-so why not fix it ? ;)
(21566,1,13416), 
(22710,1,14349),
(23168,1,14020),
(24062,1,15010),
(24217,1,15069),
(24323,1,14834),
(24804,1,14888),
(25896,1,15299),
(28096,1,15929),
(28111,1,15930),
(28353,2,16390),
(28392,1,16420),
(28697,1,3976),
(28861,1,16592),
(29172,0,181605),
(29456,1,17060),
(29457,1,17060),
(29459,1,17060), -- Those are spells Arch Mage Xintor casts at training dummies near him.
(29531,0,181605),
(29831,0,181288),
(30221,1,620),
(30232,1,15691),
(30460,1,17404),
(30951,1,17533), 
(31326,1,15608),
(31611,1,17979),
(31727,1,17536),
(32301,1,18371),
(32396,1,18358),
(32890,1,18764),
(33111,1,17400),
(33111,1,18894),
(33644,1,19279),
(33644,1,19328),
(33644,1,19278),
(33644,1,19329),
(33644,1,19326),
(33644,1,19277),
(33644,1,19276), -- All legion antennas.
(33742,1,17400),
(33742,1,18894),
(33742,1,19279),
(33742,1,19328),
(33742,1,19278),
(33742,1,19329),
(33742,1,19326),
(33742,1,19277),
(33742,1,19276), -- All legion antennas, another spell.
(33783,1,18732),
(34254,1,19554),
(34350,1,19554),
(34662,1,17827),
(35596,1,20794),
(36174,1,20885),
(37465,1,17469),
(37465,1,21747),
(37465,1,21750),
(37465,1,21748),
(37469,1,21664),
(37469,1,21682),
(37469,1,21683),
(37469,1,17211),
(37626,1,15689), -- Netherspite's beam
(37853,1,15608),
(37868,1,21909),
(37893,1,21909),
(37895,1,21909),
(38003,1,21949),
(38044,1,21212),
(38121,1,21949),
(38123,1,21949),
(38126,1,21949),
(38128,1,21949),
(38130,1,21949),
(38250,0,185125),
(38508,1,17270),
(38508,1,16873),
(38508,1,17269),
(38508,1,16871),
(38508,1,19422),
(38508,1,16907),
(38508,1,17478),
(38508,1,19424),
(38629,0,185214),
(38722,1,21506),
(38966,1,22293),
(38968,1,38968),
(39124,0,184738),
(39126,1,19557),
(39221,1,23116),
(39364,1,19732),
(39601,1,22916),
(39974,0,300127),
(39978,1,21851),
(39993,1,23382),
(40359,1,23382),
(40454,1,22181),
(40547,1,22911),
(40828,1,23327),
(40828,1,23322),
(41128,1,23164),
(41362,1,22956),
(41362,1,22964),
(41975,1,23191),
(42317,1,22844),
(42317,1,23319),
(42317,1,23421),
(42317,1,23216),
(42317,1,23523),
(42317,1,22849),
(42317,1,22845),
(42317,1,22847),
(42317,1,23318),
(42317,1,23215),
(42317,1,23524),
(42317,1,23374),
(42317,1,22846),
(42318,1,22844),
(42318,1,23319),
(42318,1,23421),
(42318,1,23216),
(42318,1,23523),
(42318,1,22849),
(42318,1,22845),
(42318,1,22847),
(42318,1,23318),
(42318,1,23215),
(42318,1,23524),
(42318,1,23374),
(42318,1,22846),
(42405,1,23775),
(42410,1,23775),
(42517,1,23864),
(42734,1,4974),
(44864,1,24955),
(45201,1,24882),
(46809,1,26239), -- Make Ahune's Ghost Burst
(46818,1,25840),
(46852,0,181605), -- Ribbon Pole Music
(46896,0,181605),
(47104,1,26401),
(49058,1,24968); -- Rocket Bot Attack

-- Wyvern Sting rank 5 and 6 not avail. till wotlk
DELETE FROM spell_linked_spell WHERE `spell_trigger` IN (-49011, -49012);

-- typo
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (43468, 43648);
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (43648, 44007, 1, 'Storm Eye Safe Zone');


-- event script for Medivh's Journal
delete from event_scripts where id = 10951;
insert into event_scripts values
(10951,0,10,17651, 300000, 0,-11159,-1907.22,91.48,0);

-- remove every Image from Medivh (should not be spawned by db)
delete from creature where id = 17651;
-- add script
update creature_template set scriptname = 'npc_image_of_medivh' where entry = 17651;

DELETE FROM `spell_script_target` WHERE entry IN (33655, 33633, 44374);
INSERT INTO `spell_script_target` VALUES
(33655,0,183350),
(33633,0,183351),
(44374,1,24722);

delete from creature where id=17318;
update creature_template set scriptname='npc_geezle' where entry=17318;
delete from event_scripts where id=10675;
insert into event_scripts () VALUES (10675, 0, 10, 17318, 120000, 0, -5134.3, -11250.3, 5.29568, 6.23554), 
(10675, 72, 7, 9531, 0, 0, 0, 0, 0, 0);

update creature_template set scriptname='npc_professor_dabiri' where entry=20907;

UPDATE `trinity_string` SET `content_default`='Player |cffff0000%s|r kicked by |cffff0000%s|r. Reason: |cffff0000%s|r.' WHERE (`entry`='282');  
UPDATE `command` SET `help`='Syntax: .kick [$charactername] [$reason]\r\n\r\nKick the given character name from the world with or without reason. If no character name is provided then the selected player (except for yourself) will be kicked. If no reason is provided, default is \"No Reason\".' WHERE (`name`='kick');

update creature_template set scriptname='npc_deathstalker_erland' where entry=1978;

update quest_template set specialflags=2 where entry=665;
update creature_template set scriptname='npc_professor_phizzlethorpe' where entry=2768;

UPDATE `creature_template` SET `Scriptname`='npc_willix' WHERE entry=4508;

DELETE FROM script_texts WHERE entry BETWEEN -1047000 and -1047010;
INSERT INTO script_texts (entry, content_default, sound, type, language, comment) VALUES
(-1047000, 'Phew! Finally,out here. However, it will not become easy. Detain your eyes after annoyance.', 0, 0, 0, 'Willix'),
(-1047001, 'There on top resides Charlga Razorflank. The damned old Crone.', 0, 0, 0, 'Willix'),
(-1047002, 'Help! Get this Raging Agam\'ar from me!', 0, 0, 0, 'Willix'),
(-1047003, 'In this ditch there are Blueleaf Tuber! As if the gold waited only to be dug out, I say it you!', 0, 0, 0, 'Willix'),
(-1047004, 'Danger is behind every corner.', 0, 0, 0, 'Willix'),
(-1047005, 'I do not understand how these disgusting animals can live at such a place.... puh as this stinks!', 0, 0, 0, 'Willix'),
(-1047006, 'I think, I see a way how we come out of this damned thorn tangle.', 0, 0, 0, 'Willix'),
(-1047007, 'I am glad that we are out again from this damned ditch. However, up here it is not much better!', 0, 0, 0, 'Willix'),
(-1047008, 'Finally! I am glad that I come, finally out here.', 0, 0, 0, 'Willix'),
(-1047009, 'I will rather rest a moment and come again to breath, before I return to Ratchet.', 0, 0, 0, 'Willix'),
(-1047010, 'Many thanks for your help.', 0, 0, 0, 'Willix');

update creature_template set scriptname='npc_earthmender_wilda' where entry=21027;

DELETE FROM `spell_proc_event` WHERE `entry` IN ('14144','14148');
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
('14144','0','0','0','2','0','0','0','0'),
('14148','0','0','0','2','0','0','0','0');
DELETE FROM `spell_proc_event` WHERE entry = 38164;
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
 (38164,0,0,0,0,1,0,0,60);

UPDATE `creature_template` SET `ScriptName` = 'boss_shirrak_the_dead_watcher' WHERE `entry` = '18371';
UPDATE `creature_template` SET `ScriptName` = 'mob_focus_fire', `unit_flags` = '33554434' WHERE `entry` = '18374';

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000146 AND -1000140;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000140,'Let\'s go.',0,0,1,'lilatha SAY_START'),
(-1000141,'$N, let\'s use the antechamber to the right.',0,0,1,'lilatha SAY_PROGRESS1'),
(-1000142,'I can see the light at the end of the tunnel!',0,0,1,'lilatha SAY_PROGRESS2'),
(-1000143,'There\'s Farstrider Enclave now, $C. Not far to go... Look out! Troll ambush!!',0,0,1,'lilatha SAY_PROGRESS3'),
(-1000144,'Thank you for saving my life and bringing me back to safety, $N',0,0,1,'lilatha SAY_END1'),
(-1000145,'Captain Helios, I\'ve been rescued from the Amani Catacombs. Reporting for duty, sir!',0,0,1,'lilatha SAY_END2'),
(-1000146,'Liatha, get someone to look at those injuries. Thank you for bringing her back safely.',0,0,1,'lilatha CAPTAIN_ANSWER');

ALTER TABLE custom_texts ADD COLUMN emote tinyint(3) UNSIGNED DEFAULT '0' NOT NULL AFTER language;
ALTER TABLE eventai_texts ADD COLUMN emote tinyint(3) UNSIGNED DEFAULT '0' NOT NULL AFTER language;
ALTER TABLE script_texts ADD COLUMN emote tinyint(3) UNSIGNED DEFAULT '0' NOT NULL AFTER language;

DELETE FROM `trinity_string` WHERE (`entry`='290');  
DELETE FROM `trinity_string` WHERE (`entry`='296'); 
DELETE FROM `trinity_string` WHERE (`entry`='289');
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000, '|cff00ff00New ticket from|r|cffff00ff %s.|r |cff00ff00Ticket entry:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2001, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00edited his/her ticket:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2002, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00abandoned ticket entry:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2003, '|cffff00ff %s|r |cff00ff00closed ticket|r |cffff00ff %d.|r', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2004, 'Ticket %d permanently deleted by %s.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2005, 'Ticket not found.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2007, 'Please close ticket before deleting it permanently.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2008, 'Ticket %d is already assigned to GM %s.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2009, '%u Tickets succesfully reloaded from the database.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2010, 'Showing list of open tickets.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2011, 'Showing list of open tickets whose creator is online.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2012, 'Invalid name specified. Name should be that of an online Gamemaster.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2013, 'This ticket is already assigned to yourself. To unassign use .ticket unassign %d and then reassign.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2014, 'Ticket %d is not assigned, you cannot unassign it.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2015, 'You cannot unassign tickets from staffmembers with a higher security level than yourself.', '', '', '', '', '', '', '', ''); 
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2016, 'Cannot close ticket %d, it is assigned to another GM.', '', '', '', '', '', '', '', ''); 
DELETE FROM `command` WHERE (`name` LIKE '%ticket%');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket list','1','Displays a list of open GM tickets.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket onlinelist','1','Displays a list of open GM tickets whose owner is online.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket viewname','1','Usage: .ticket viewname $creatorname. \r\nReturns details about specified ticket. Ticket must be open and not deleted.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket viewid','1','Usage: .ticket viewid $ticketid.\r\nReturns details about specified ticket. Ticket must be open and not deleted.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket close','2','Usage: .ticket close $ticketid.\r\nCloses the specified ticket. Does not delete permanently.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket delete','3','Usage: .ticket delete $ticketid.\r\nDeletes the specified ticket permanently. Ticket must be closed first.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket assign','3','Usage: .ticket assign $ticketid $gmname.\r\nAssigns the specified ticket to the specified Game Master.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket unassign','3','Usage: .ticket unassign $ticketid.\r\nUnassigns the specified ticket from the current assigned Game Master.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket comment','2','Usage: .ticket comment $ticketid $comment.\r\nAllows the adding or modifying of a comment to the specified ticket.');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.reload tickets','4','Usage: .reload tickets.\r\nReloads GM Tickets from the database and re-caches them into memory.');

update creature_template set scriptname='npc_apprentice_mirveda' where entry=15402;

REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket list','1','Displays a list of open GM tickets.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket onlinelist','1','Displays a list of open GM tickets whose owner is online.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket viewname','1','Usage: .ticket viewname $creatorname. \r\nReturns details about specified ticket. Ticket must be open and not deleted.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket viewid','1','Usage: .ticket viewid $ticketid.\r\nReturns details about specified ticket. Ticket must be open and not deleted.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket close','2','Usage: .ticket close $ticketid.\r\nCloses the specified ticket. Does not delete permanently.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket delete','3','Usage: .ticket delete $ticketid.\r\nDeletes the specified ticket permanently. Ticket must be closed first.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket assign','3','Usage: .ticket assign $ticketid $gmname.\r\nAssigns the specified ticket to the specified Game Master.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket unassign','3','Usage: .ticket unassign $ticketid.\r\nUnassigns the specified ticket from the current assigned Game Master.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('ticket comment','2','Usage: .ticket comment $ticketid $comment.\r\nAllows the adding or modifying of a comment to the specified ticket.');
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('reload tickets','4','Usage: .reload tickets.\r\nReloads GM Tickets from the database and re-caches them into memory.');

UPDATE `trinity_string` SET `content_default`='Ticket %d is already assigned.' WHERE (`entry`='2008');

update creature_template set scriptname='npc_infused_crystal', flags_extra=0 where entry=16364;
delete from creature where id=17086;

delete from creature_template_addon where entry = 17225;
update creature_template set scriptname = 'boss_nightbane', unit_flags=0 where entry = 17225;
delete from event_scripts where id = 10951;
insert into event_scripts values
(10951,0,10,17651,180000,0,-11159,-1907.22,91.48,0);

DROP TABLE IF EXISTS `transport_events`;
CREATE TABLE `transport_events` (
 	`entry` int(11) unsigned NOT NULL default '0',
	`waypoint_id` int(11) unsigned NOT NULL default '0',	
  	`event_id` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1533039 AND -1533000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1533000,'Ahh... welcome to my parlor.',8788,1,0,'anubrekhan SAY_GREET'),
   (-1533001,'Just a little taste...',8785,1,0,'anubrekhan SAY_AGGRO1'),
     (-1533002,'There is no way out.',8786,1,0,'anubrekhan SAY_AGGRO2'),
     (-1533003,'Yes, Run! It makes the blood pump faster!',8787,1,0,'anubrekhan SAY_AGGRO3'),
     (-1533004,'I hear little hearts beating. Yesss... beating faster now. Soon the beating will stop.',8790,1,0,'anubrekhan SAY_TAUNT1'),
     (-1533005,'Where to go? What to do? So many choices that all end in pain, end in death.',8791,1,0,'anubrekhan SAY_TAUNT2'),
     (-1533006,'Which one shall I eat first? So difficult to choose... the all smell so delicious.',8792,1,0,'anubrekhan SAY_TAUNT3'),
    (-1533007,'Closer now... tasty morsels. I\'ve been too long without food. Without blood to drink.',8793,1,0,'anubrekhan SAY_TAUNT4'),
    (-1533008,'Shh... it will all be over soon.',8789,1,0,'anubrekhan SAY_SLAY'),
    (-1533009,'Your old lives, your mortal desires, mean nothing. You are acolytes of the master now, and you will serve the cause without question! The greatest glory is to die in the master\'s service!',8799,1,0,'faerlina SAY_GREET'),
    (-1533010,'Slay them in the master\'s name!',8794,1,0,'faerlina SAY_AGGRO1'),
    (-1533011,'You cannot hide from me!',8795,1,0,'faerlina SAY_AGGRO2'),
    (-1533012,'Kneel before me, worm!',8796,1,0,'faerlina SAY_AGGRO3'),
    (-1533013,'Run while you still can!',8797,1,0,'faerlina SAY_AGGRO4'),
    (-1533014,'You have failed!',8800,1,0,'faerlina SAY_SLAY1'),
    (-1533015,'Pathetic wretch!',8801,1,0,'faerlina SAY_SLAY2'),
    (-1533016,'The master... will avenge me!',8798,1,0,'faerlina SAY_DEATH'),
    (-1533017,'Patchwerk want to play!',8909,1,0,'patchwerk SAY_AGGRO1'),
    (-1533018,'Kel\'Thuzad make Patchwerk his Avatar of War!',8910,1,0,'patchwerk SAY_AGGRO2'),
    (-1533019,'No more play?',8912,1,0,'patchwerk SAY_SLAY'),
    (-1533020,'What happened to... Patch...',8911,1,0,'patchwerk SAY_DEATH'),
    (-1533021,'goes into a berserker rage!',0,2,0,'patchwerk EMOTE_BERSERK'),
   (-1533022,'becomes enraged!',0,2,0,'patchwerk EMOTE_ENRAGE'),
    (-1533023,'Stalagg crush you!',8864,1,0,'stalagg SAY_STAL_AGGRO'),
    (-1533024,'Stalagg kill!',8866,1,0,'stalagg SAY_STAL_SLAY'),
    (-1533025,'Master save me...',8865,1,0,'stalagg SAY_STAL_DEATH'),
    (-1533026,'Feed you to master!',8802,1,0,'feugen SAY_FEUG_AGGRO'),
    (-1533027,'Feugen make master happy!',8804,1,0,'feugen SAY_FEUG_SLAY'),
    (-1533028,'No... more... Feugen...',8803,1,0,'feugen SAY_FEUG_DEATH'),
    (-1533029,'You are too late... I... must... OBEY!',8872,1,0,'thaddius SAY_GREET'),
    (-1533030,'KILL!',8867,1,0,'thaddius SAY_AGGRO1'),
    (-1533031,'EAT YOUR BONES!',8868,1,0,'thaddius SAY_AGGRO2'),
    (-1533032,'BREAK YOU!',8869,1,0,'thaddius SAY_AGGRO3'),
    (-1533033,'You die now!',8877,1,0,'thaddius SAY_SLAY'),
    (-1533034,'Now YOU feel pain!',8871,1,0,'thaddius SAY_ELECT'),
    (-1533035,'Thank... you...',8870,1,0,'thaddius SAY_DEATH'),
    (-1533036,'Pleeease!',8873,1,0,'thaddius SAY_SCREAM1'),
    (-1533037,'Stop, make it stop!',8874,1,0,'thaddius SAY_SCREAM2'),
    (-1533038,'Help me! Save me!',8875,1,0,'thaddius SAY_SCREAM3'),
    (-1533039,'Please, nooo!',8876,1,0,'thaddius SAY_SCREAM4');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1533074 AND -1533040;
     INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
     (-1533040,'Foolishly you have sought your own demise. Brazenly you have disregarded powers beyond your understanding. You have fought hard to invade the realm of the harvester. Now there is only one way out - to walk the lonely path of the damned.',8807,1,0,'gothik SAY_SPEECH'),
     (-1533041,'Death is the only escape.',8806,1,0,'gothik SAY_KILL'),
     (-1533042,'I... am... undone!',8805,1,0,'gothik SAY_DEATH'),
     (-1533043,'I have waited long enough! Now, you face the harvester of souls!',8808,1,0,'gothik SAY_TELEPORT'),
     (-1533044,'Defend youself!',8892,1,0,'blaumeux SAY_BLAU_AGGRO'),
     (-1533045,'Come, Zeliek, do not drive them out. Not before we\'ve had our fun.',8896,1,0,'blaumeux SAY_BLAU_TAUNT1'),
     (-1533046,'I do hope they stay alive long enough for me to... introduce myself.',8897,1,0,'blaumeux SAY_BLAU_TAUNT2'),
    (-1533047,'The first kill goes to me! Anyone care to wager?',8898,1,0,'blaumeux SAY_BLAU_TAUNT3'),
    (-1533048,'Your life is mine!',8895,1,0,'blaumeux SAY_BLAU_SPECIAL'),
    (-1533049,'Who\'s next?',8894,1,0,'blaumeux SAY_BLAU_SLAY'),
    (-1533050,'Tou... che!',8893,1,0,'blaumeux SAY_BLAU_DEATH'),
    (-1533051,'Come out and fight, ye wee ninny!',8899,1,0,'korthazz SAY_KORT_AGGRO'),
    (-1533052,'To arms, ye roustabouts! We\'ve got company!',8903,1,0,'korthazz SAY_KORT_TAUNT1'),
    (-1533053,'I heard about enough of yer sniveling. Shut yer fly trap \'afore I shut it for ye!',8904,1,0,'korthazz SAY_KORT_TAUNT2'),
    (-1533054,'I\'m gonna enjoy killin\' these slack-jawed daffodils!',8905,1,0,'korthazz SAY_KORT_TAUNT3'),
    (-1533055,'I like my meat extra crispy!',8901,1,0,'korthazz SAY_KORT_SPECIAl'),
    (-1533056,'Next time, bring more friends!',8902,1,0,'korthazz SAY_KORT_SLAY'),
    (-1533057,'What a bloody waste this is!',8900,1,0,'korthazz SAY_KORT_DEATH'),
    (-1533058,'Flee, before it\'s too late!',8913,1,0,'zeliek SAY_ZELI_AGGRO'),
    (-1533059,'Invaders, cease this foolish venture at once! Turn away while you still can!',8917,1,0,'zeliek SAY_ZELI_TAUNT1'),
    (-1533060,'Perhaps they will come to their senses, and run away as fast as they can!',8918,1,0,'zeliek SAY_ZELI_TAUNT2'),
    (-1533061,'Do not continue! Turn back while there\'s still time!',8919,1,0,'zeliek SAY_ZELI_TAUNT3'),
    (-1533062,'I- I have no choice but to obey!',8916,1,0,'zeliek SAY_ZELI_SPECIAL'),
    (-1533063,'Forgive me!',8915,1,0,'zeliek SAY_ZELI_SLAY'),
    (-1533064,'It is... as it should be.',8914,1,0,'zeliek SAY_ZELI_DEATH'),
    (-1533065,'You seek death?',14571,1,0,'rivendare_naxx SAY_RIVE_AGGRO1'),
    (-1533066,'None shall pass!',14572,1,0,'rivendare_naxx SAY_RIVE_AGGRO2'),
    (-1533067,'Be still!',14573,1,0,'rivendare_naxx SAY_RIVE_AGGRO3'),
    (-1533068,'You will find no peace in death.',14574,1,0,'rivendare_naxx SAY_RIVE_SLAY1'),
    (-1533069,'The master\'s will is done.',14575,1,0,'rivendare_naxx SAY_RIVE_SLAY2'),
    (-1533070,'Bow to the might of the scourge!',14576,1,0,'rivendare_naxx SAY_RIVE_SPECIAL'),
    (-1533071,'Enough prattling. Let them come! We shall grind their bones to dust.',14577,1,0,'rivendare_naxx SAY_RIVE_TAUNT1'),
    (-1533072,'Conserve your anger! Harness your rage! You will all have outlets for your frustration soon enough.',14578,1,0,'rivendare_naxx SAY_RIVE_TAUNT2'),
    (-1533073,'Life is meaningless. It is in death that we are truly tested.',14579,1,0,'rivendare_naxx SAY_RIVE_TAUNT3'),
    (-1533074,'Death... will not stop me...',14580,1,0,'rivendare_naxx SAY_RIVE_DEATH');

UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=16062;
UPDATE `creature_template` SET `ScriptName`='boss_rivendare_naxx' WHERE `entry`=30549;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1533108 AND -1533075;
     INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
     (-1533075,'Glory to the master!',8845,1,0,'noth SAY_AGGRO1'),
     (-1533076,'Your life is forfeit!',8846,1,0,'noth SAY_AGGRO2'),
     (-1533077,'Die, trespasser!',8847,1,0,'noth SAY_AGGRO3'),
     (-1533078,'Rise, my soldiers! Rise and fight once more!',8851,1,0,'noth SAY_SUMMON'),
     (-1533079,'My task is done!',8849,1,0,'noth SAY_SLAY1'),
     (-1533080,'Breathe no more!',8850,1,0,'noth SAY_SLAY2'),
     (-1533081,'I will serve the master... in... death!',8848,1,0,'noth SAY_DEATH'),
    (-1533082,'takes in a deep breath...',0,2,0,'sapphiron EMOTE_BREATH'),
    (-1533083,'enrages!',0,2,0,'sapphiron EMOTE_ENRAGE'),
    (-1533084,'Our preparations continue as planned, master.',14467,1,0,'kelthuzad SAY_SAPP_DIALOG1'),
    (-1533085,'It is good that you serve me so faithfully. Soon, all will serve the Lich King and in the end, you shall be rewarded...so long as you do not falter.',8881,1,0,'kelthuzad SAY_SAPP_DIALOG2_LICH'),
    (-1533086,'I see no complications... Wait... What is this?',14468,1,0,'kelthuzad SAY_SAPP_DIALOG3'),
    (-1533087,'Your security measures have failed! See to this interruption immediately!',8882,1,0,'kelthuzad SAY_SAPP_DIALOG4_LICH'),
    (-1533088,'Yes, master!',14469,1,0,'kelthuzad SAY_SAPP_DIALOG5'),
    (-1533089,'No!!! A curse upon you, interlopers! The armies of the Lich King will hunt you down. You will not escape your fate...',14484,1,0,'kelthuzad SAY_CAT_DIED'),
    (-1533090,'Who dares violate the sanctity of my domain? Be warned, all who trespass here are doomed.',14463,1,0,'kelthuzad SAY_TAUNT1'),
    (-1533091,'Fools, you think yourselves triumphant? You have only taken one step closer to the abyss! ',14464,1,0,'kelthuzad SAY_TAUNT2'),
    (-1533092,'I grow tired of these games. Proceed, and I will banish your souls to oblivion!',14465,1,0,'kelthuzad SAY_TAUNT3'),
    (-1533093,'You have no idea what horrors lie ahead. You have seen nothing! The frozen heart of Naxxramas awaits you!',14466,1,0,'kelthuzad SAY_TAUNT4'),
    (-1533094,'Pray for mercy!',14475,1,0,'kelthuzad SAY_AGGRO1'),
    (-1533095,'Scream your dying breath!',14476,1,0,'kelthuzad SAY_AGGRO2'),
    (-1533096,'The end is upon you!',14477,1,0,'kelthuzad SAY_AGGRO3'),
    (-1533097,'The dark void awaits you!',14478,1,0,'kelthuzad SAY_SLAY1'),
    (-1533098,'<Kel\'Thuzad cackles maniacally!>',14479,1,0,'kelthuzad SAY_SLAY2'),
    (-1533099,'AAAAGHHH!... Do not rejoice... your victory is a hollow one... for I shall return with powers beyond your imagining!',14480,1,0,'kelthuzad SAY_DEATH'),
    (-1533100,'Your soul, is bound to me now!',14472,1,0,'kelthuzad SAY_CHAIN1'),
    (-1533101,'There will be no escape!',14473,1,0,'kelthuzad SAY_CHAIN2'),
    (-1533102,'I will freeze the blood in your veins!',14474,1,0,'kelthuzad SAY_FROST_BLAST'),
    (-1533103,'Master! I require aid! ',14470,1,0,'kelthuzad SAY_REQUEST_AID'),
    (-1533104,'Very well... warriors of the frozen wastes, rise up! I command you to fight, kill, and die for your master. Let none survive...',0,1,0,'kelthuzad SAY_ANSWER_REQUEST'),
    (-1533105,'Minions, servants, soldiers of the cold dark, obey the call of Kel\'Thuzad!',14471,1,0,'kelthuzad SAY_SUMMON_MINIONS'),
    (-1533106,'Your petty magics are no challenge to the might of the Scourge! ',14481,1,0,'kelthuzad SAY_SPECIAL1_MANA_DET'),
    (-1533107,'Enough! I grow tired of these distractions! ',14483,1,0,'kelthuzad SAY_SPECIAL3_MANA_DET'),
    (-1533108,'Fools, you have spread your powers too thin. Be free, my minions!',14482,1,0,'kelthuzad SAY_SPECIAL2_DISPELL');
	
	UPDATE `script_texts` SET `sound`=8902 WHERE `entry`=-1533055;
    UPDATE `script_texts` SET `sound`=8901 WHERE `entry`=-1533056;

UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 20129;

-- Insert English and French dialogs in database
DELETE FROM `script_texts` WHERE entry BETWEEN -1000150 and -1000163;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc2`, `type`, `language`, `comment`) VALUES
(-1000150, 'Greetings, $N. I will guide you through the cavern. Please try and keep up.', 'Salutations, $N. Je vais vous guider � travers cette grotte. Veuillez me suivre.', 4, 0, 'WHISPER_CUSTODIAN_1'),
(-1000151, 'We do not know if the Caverns of Time have always been accessible to mortals. Truly, it is impossible to tell as the Timeless One is in perpetual motion, changing our timeways as he sees fit. What you see now may very well not exist tomorrow. You may wake up and have no memory of this place.', 'Nous ne savons pas si les Grottes du Temps ont toujours �t� accessibles aux mortels. Vraiment, c\'est impossible � dire �tant donn� que l\'Intemporel est en mouvement perp�tuel, changeant nos spirales temporelles comme bon lui semble. Ce que vous voyez aujourd\'hui peut tr�s bien ne plus exister demain. Vous pourriez vous r�veiller sans aucun souvenir de cet endroit.', 4, 0, 'WHISPER_CUSTODIAN_2'),
(-1000152, 'It is strange, I know... Most mortals cannot actually comprehend what they see here, as often, what they see is not anchored within their own perception of reality.', 'C\'est �trange, je sais... La plupart des mortels ne peuvent pas r�ellement comprendre ce qu\ils voient ici, comme souvent, ce qu\'ils voient n\'est pas ancr� dans leur propre perception de la r�alit�.', 4, 0, 'WHISPER_CUSTODIAN_3'),
(-1000153, 'Follow me, please.', 'Veuillez me suivre.', 4, 0, 'WHISPER_CUSTODIAN_4'),
(-1000154, 'There are only two truths to be found here: First, that time is chaotic, always in flux, and completely malleable and second, perception does not dictate reality.', 'Il n\'y a que deux v�rit�s qui peuvent �tre trouv�es ici : premi�rement, ce temps est chaotique, toujours en mouvement, et compl�tement mall�able, et ensuite, la perception ne d�termine pas la r�alit�.', 4, 0, 'WHISPER_CUSTODIAN_5'),
(-1000155, 'As custodians of time, we watch over and care for Nozdormu\'s realm. The master is away at the moment, which means that attempts are being made to dramatically alter time. The master never meddles in the affairs of mortals but instead corrects the alterations made to time by others. He is reactionary in this regard.', 'En tant que protecteurs du temps, nous observons et veillons sur le royaume de Nozdormu. Le ma�tre est absent en ce moment, ce qui signifie que des tentatives sont faites pour alt�rer fortement le temps. Le ma�tre ne se m�le jamais des affaires des mortels mais il corrige les alt�rations faites au temps par d\'autres. Il est r�actionnaire � cet �gard.', 4, 0, 'WHISPER_CUSTODIAN_6'),
(-1000156, 'For normal maintenance of time, the Keepers of Time are sufficient caretakers. We are able to deal with most ordinary disturbances. I speak of little things, such as rogue mages changing something in the past to elevate their status or wealth in the present.', 'Pour le maintien normal du temps, les Gardiens du temps suffisent � la t�che. Nous sommes capables de g�rer les perturbations les plus ordinaires. Je parle de petites choses, comme des mages voleurs qui changent quelque chose dans le pass� pour �lever leur statut ou leur richesse dans le pr�sent.', 4, 0, 'WHISPER_CUSTODIAN_7'),
(-1000157, 'These tunnels that you see are called timeways. They are infinite in number. The ones that currently exist in your reality are what the master has deemed as \'trouble spots.\' These trouble spots may differ completely in theme but they always share a cause. That is, their existence is a result of the same temporal disturbance. Remember that should you venture inside one...', 'Ces tunnels que vous voyez sont appel�s Voies Temporelles. Leur nombre est infini. Ceux qui existent actuellement dans votre r�alit� sont ceux que le ma�tre a consid�r�s comme \'points sensibles\'. Ces points sensibles peuvent diff�rer compl�tement de part leur th�me, mais partagent toujours une cause. C\'est-�-dire, leur existence est le r�sultat des m�mes perturbations temporelles. Rappelez-vous en si vous osez vous aventurer dans l\'un d\'eux...', 4, 0, 'WHISPER_CUSTODIAN_8'),
(-1000158, 'This timeway is in great disarray! We have agents inside right now attempting to restore order. What information I have indicates that Thrall\'s freedom is in jeopardy. A malevolent organization known as the Infinite Dragonflight is trying to prevent his escape. I fear without outside assistance, all will be lost.', 'Cette voie temporelle est en grand d�sarroi ! Nous avons actuellement des agents � l\int�rieur qui tentent de restaurer l\'ordre. Les informations que j\'ai indiquent que la libert� de Thrall est en p�ril. Une organisation malveillante connue sous le nom de Vol du Dragon Infini essaye d\'emp�cher son �vasion. J\'ai peur que sans assistance ext�rieure, tout soit perdu.', 4, 0, 'WHISPER_CUSTODIAN_9'),
(-1000159, 'We have very little information on this timeway. Sa\'at has been dispatched and is currently inside. The data we have gathered from his correspondence is that the Infinite Dragonflight are once again attempting to alter time. Could it be that the opening of the Dark Portal is being targeted for sabotage? Let us hope not...', 'Nous avons tr�s peu d\'informations sur cette voie. Sa\'at a �t� envoy� et est actuellement sur place. Les donn�es que nous avons recueillies de sa correspondance est que le Vol du Dragon Infini tente une fois de plus d\'alt�rer le temps. Se pourrait-il que l\'ouverture de la Porte des T�n�bres soit la cible d\'un sabotage. Esp�rons que non...', 4, 0, 'WHISPER_CUSTODIAN_10'),
(-1000160, 'This timeway is currently collapsing. What that may hold for the past, present and future is currently unknown...', 'Cette voie est en train de s\'effondrer. Ce qu\'elle peut avoir contenu dans le pass�, le pr�sent et le futur nous est actuellement inconnu...', 4, 0, 'WHISPER_CUSTODIAN_11'),
(-1000161, 'The timeways are currently ranked in order from least catastrophic to most catastrophic. Note that they are all classified as catastrophic, meaning that any single one of these timeways collapsing would mean that your world would end. We only classify them in such a way so that the heroes and adventurers that are sent here know which timeway best suits their abilities.', 'Les voies sont pour le moment class�es de la moins catastrophique � la plus catastrophique, ce qui veut dire que la moindre de celles-ci qui s\'effondre signifierait la fin de votre monde. Nous les classons seulement de cette fa�on pour que les h�ros et aventuriers qui y sont envoy�s sachent quelle voie est la plus adapt�e � leurs comp�tences.', 4, 0, 'WHISPER_CUSTODIAN_12'),
(-1000162, 'All we know of this timeway is that it leads to Mount Hyjal. The Infinite Dragonflight have gone to great lengths to prevent our involvement. We know next to nothing, mortal. Soridormi is currently attempting to break through the timeway\'s defenses but has thus far been unsuccessful. You might be our only hope of breaking through and resolving the conflict.', 'Tout ce que nous savons sur cette voie temporelle est qu\'elle m�ne au Mont Hyjal. Le Vol du Dragon Infini s\'est donn� beaucoup de peine pour emp�cher notre participation. Soridormi est actuellement en train de tenter de briser les d�fenses de cette voie, mais ses efforts ont �t� vain jusqu\'ici. Vous pourriez �tre notre seul espoir de les briser et de r�soudre le conflit.', 4, 0, 'WHISPER_CUSTODIAN_13'),
(-1000163, 'Our time is at an end $N. I would wish you luck, if such a thing existed.', 'Notre entretien touche � sa fin, $N. Je vous souhaite bonne chance, si tant est qu\'une telle chose a jamais exist�.', 4, 0, 'WHISPER_CUSTODIAN_14');

Update quest_template set SpecialFlags=2 where entry=4770;
UPDATE `creature_template` SET `ScriptName` = 'npc_swiftmountain' WHERE `entry` = 10427;
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000149 AND -1000147;
INSERT INTO script_texts
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `comment`)
VALUES
  (-1000147, 'Lets go $N. I am ready to start to Whitereach Post.', NULL, NULL, 'Gehen wir $N.Ich bin bereit,mich zum Weissgipfelposten aufzumachen.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
  (-1000148, 'This seems to me trusted. If we move to the east, we are  probably... Aah!  Wyvern attack !', NULL, NULL, 'Das kommt mir vertraut vor.Wenn wir nach Osten ziehen,k�nnen wir wahrscheinlich...Aah!Fl�geldrachen im Angriff!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
  (-1000149, 'Thanks so much... From here I find the way back to the Whitereach Post. Speak with Motega Firemane, maybe you can persuade him to send me home.', NULL, NULL, 'Tausend Dank...Von hier aus finde ich den R�ckweg zum Weissgipfelposten.Sprecht unbedingt mit Motega Feuerm�hne,vielleicht k�nnt ihr ihn �berreden,mich nach Hause zu schicken.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL);

DELETE FROM trinity_string where entry IN (10056, 10057);
INSERT INTO trinity_string (entry, content_default) VALUES
(10056, 'You must be a member of the Horde to enter the Hall of Legends.'),
(10057, 'You must be a member of the Alliance to enter the Champion\'s Hall.');

delete from command where name in ('gobject addtemp', 'npc addtemp');
insert into command (name, security, help) values
('gobject addtemp','2','Adds a temporary gameobject that is not saved to DB.'),
('npc addtemp','2','Adds temporary NPC, not saved to database.');

ALTER TABLE eventai_texts DROP COLUMN emote;

update creature_template set scriptname='npc_isla_starmane' where entry=18760;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000205 AND -1000200;
INSERT INTO script_texts
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
   (-1000200, 'A-Me good.Good A-me.Follow...A-ME follow.Home.A-ME go home.', NULL, NULL, 'A-ME gut.Gut A-Me.Folgen...Heim.A-ME geht heim.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1000201, 'Bad Un�Goro Stomper.Stomper evil.', NULL, NULL, 'B�ser Stampfer von Un�Goro. Stampfer von Un�Goro b�se.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1000202, 'Good..good,A-ME. Home. Search way.', NULL, NULL, 'Gut...gut.A-ME.A-ME gut.Heim.Heim suchen.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1000203, 'A-Me home.A-ME go home!Tar Lord dont disturb A-ME.', NULL, NULL, 'A-ME daheim.A-ME geht heim!Teerf�rst A-ME nicht aufhalten.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1000204, 'Tar Lord A-ME no hurt.A-ME good.', NULL, NULL, 'Teerf�rst A-ME nicht wehtun.A-ME gut.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1000205, 'A-ME at home!A-ME good!Good A-ME.At home.Home.Home', NULL, NULL, 'A-ME daheim!A-ME gut!Gute A-ME.Daheim.Daheim.Daheim', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL);
UPDATE `quest_template` SET `QuestFlags` = 2, `SpecialFlags` = 2 WHERE `entry` = 4245;

UPDATE `creature_template` SET `ScriptName` = 'npc_ame' WHERE `entry` = 9623;

update creature_template set scriptname='npc_kayra_longmane' where entry=17969;
delete from creature_template_addon where entry=17969;
update quest_template set specialflags=2 where entry=9752;

UPDATE `creature_template` SET `ScriptName` = 'npc_ruul_snowhoof' WHERE `entry` = 12818;

update creature_template set scriptname='npc_dirty_larry', unit_flags=0, flags_extra=0 where entry=19720;
update creature_template set unit_flags=0, flags_extra=0 where entry in (19726, 19725);

UPDATE `creature_template` SET `ScriptName`='npc_ishanah' WHERE `entry`=18538;

update creature_template set scriptname='npc_khadgar' where entry=18166;

delete from spell_script_target where entry=42222;
insert into `spell_script_target` values
('42222','1','23616');
update `creature_template` set `scriptname`='npc_kyle_frenzied' where `entry`='23616';

update creature_template set scriptname='npc_wizzlecrank_shredder' where entry=3439;

UPDATE `creature_template` SET `spell1` = 0, `flags_extra` = 0, `ScriptName` = 'npc_volcano' WHERE `entry` = 23085;

update creature_template set scriptname='npc_greengill_slave' where entry=25084;

ALTER TABLE `areatrigger_teleport`
ADD `heroic_required_quest_done` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 AFTER `heroic_key2`,
ADD `heroic_required_failed_quest_text` TEXT NULL DEFAULT NULL AFTER `heroic_required_quest_done`;

UPDATE `areatrigger_teleport` SET `heroic_required_quest_done` = 11492, `heroic_required_failed_quest_text` = 'Heroic Difficulty requires completion of the "Hard to Kill" quest.' WHERE `id` = 4887;

UPDATE creature_template SET ScriptName = 'npc_bessy' WHERE entry = 20415;

update creature_template set scriptname='mob_nestlewood_owlkin' where entry=16518;
update item_template set scriptname='item_inoculating_crystal' where entry=22962;

update creature_template set scriptname='npc_kaya_flathoof' where entry=11856;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1060005 AND -1060000;
INSERT INTO script_texts
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
   (-1060000, 'Emergency power activated! Initializing ambulatory motor! CLUCK!', NULL, NULL, 'Notfallenergie aktiviert! Ambulatorenantrieb wird gestartet! GLUCK!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1060001, 'Physical threat detected! Evasive action! CLUCK!', NULL, NULL, 'K�rperliche Bedrohung entdeckt! Ausweichman�ver! GLUCK!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1060002, 'Threat analyzed! Activating combat plan beta! CLUCK!', NULL, NULL, 'Bedrohung analysiert! Gefechtsplan Beta wird aktiviert! GLUCK!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1060003, 'CLUCK! Sensors detect spatial anomaly -- danger imminent! CLUCK', NULL, NULL, 'GLUCK! Sensoren haben r�umliche Anomalie entdeckt - Gefahr im Verzug! GLUCK!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1060004, 'No one challenges the wastevander nomads -- not even robotic chickens! ATTACK!', NULL, NULL, 'Niemand fordert die W�senl�ufernomaden heraus - auch keine Roboth�hner! ANGRIFF!', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL),
   (-1060005, 'Cloaking systems online! CLUCK! Engaging cloak for transport to Booty Bay!', NULL, NULL, 'Tarnsysteme online! GLUCK! Tarnung f�r Transport nach Beutebucht wird aktiviert.', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL);

UPDATE `creature_template` SET `ScriptName` = 'npc_OOX17' WHERE `entry` = 7784;

DELETE FROM `trinity_string` WHERE `entry` BETWEEN '288' AND '295';
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '2000' AND '2029';
INSERT INTO trinity_string (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(2000, '|cff00ff00New ticket from|r|cffff00ff %s.|r |cff00ff00Ticket entry:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''),
(2001, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00edited his/her ticket:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''),
(2002, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00abandoned ticket entry:|r|cffff00ff %d.|r', '', '', '', '', '', '', '', ''),
(2003, '|cff00ff00Closed by|r:|cff00ccff %s|r ', '', '', '', '', '', '', '', ''),
(2004, '|cff00ff00Deleted by|r:|cff00ccff %s|r ', '', '', '', '', '', '', '', ''),
(2005, 'Ticket not found.', '', '', '', '', '', '', '', ''),
(2006, 'Please close ticket before deleting it permanently.', '', '', '', '', '', '', '', ''),
(2007, 'Ticket %d is already assigned.', '', '', '', '', '', '', '', ''),
(2008, '%u Tickets succesfully reloaded from the database.', '', '', '', '', '', '', '', ''),
(2009, 'Showing list of open tickets.', '', '', '', '', '', '', '', ''),
(2010, 'Showing list of open tickets whose creator is online.', '', '', '', '', '', '', '', ''),
(2011, 'Showing list of closed tickets.', '', '', '', '', '', '', '', ''),
(2012, 'Invalid name specified. Name should be that of an online Gamemaster.', '', '', '', '', '', '', '', ''),
(2013, 'This ticket is already assigned to yourself. To unassign use .ticket unassign %d and then reassign.', '', '', '', '', '', '', '', ''),
(2014, 'Ticket %d is not assigned, you cannot unassign it.', '', '', '', '', '', '', '', ''),
(2015, 'You cannot unassign tickets from staffmembers with a higher security level than yourself.', '', '', '', '', '', '', '', ''),
(2016, 'Cannot close ticket %d, it is assigned to another GM.', '', '', '', '', '', '', '', ''),
(2017, '|cff00ff00Ticket|r:|cff00ccff %d.|r ', '', '', '', '', '', '', '', ''),
(2018, '|cff00ff00Created by|r:|cff00ccff %s|r ', '', '', '', '', '', '', '', ''),
(2019, '|cff00ff00Last change|r:|cff00ccff %s ago|r ', '', '', '', '', '', '', '', ''),
(2020, '|cff00ff00Assigned to|r:|cff00ccff %s|r ', '', '', '', '', '', '', '', ''),
(2021, '|cff00ff00Unassigned by|r:|cff00ccff %s|r ', '', '', '', '', '', '', '', ''),
(2022, '\n|cff00ff00Message|r: \"%s\"|r ', '', '', '', '', '', '', '', ''),
(2023, '\n|cff00ff00Comment|r: \"%s\"|r ', '', '', '', '', '', '', '', ''),
(2024, '\n|cff00ccff%s|r |cff00ff00Added comment|r: \"%s\"|r ', '', '', '', '', '', '', '', '');

DELETE FROM `command` WHERE (`name` LIKE '%ticket closedlist%');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('.ticket closedlist','1','Displays a list of closed GM tickets.');

delete from command where name in ('gobject tempadd','npc tempadd');
insert into command (name, security, help) values
('gobject addtemp','2','Adds a temporary gameobject that is not saved to DB.'),
('npc addtemp','2','Adds temporary NPC, not saved to database.');

UPDATE `creature_template` SET `ScriptName`='npc_grimstone' WHERE `entry`=10096;
UPDATE `creature_template` SET `ScriptName`='mob_phalanx' WHERE `entry`=9502;
UPDATE `creature_template` SET `ScriptName`='npc_rocknot' WHERE `entry`=9503;
 
DELETE FROM `areatrigger_scripts` WHERE `entry`=1526;
INSERT INTO `areatrigger_scripts` VALUES (1526,'at_ring_of_law');

DELETE FROM `script_texts` WHERE `entry`=-1230000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1230000,'Ah, hits the spot!',0,0,0,'rocknot SAY_GOT_BEER');

CREATE TABLE `version` (
    `core_version` varchar(120) default NULL COMMENT 'Core revision dumped at startup.',
    `db_version` varchar(120) default NULL COMMENT 'Version of world DB.',
    `script_version` varchar(120) default NULL COMMENT 'Version of scripts DB.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Version Notes';
INSERT INTO version (core_version, db_version, script_version) VALUES ("",(SELECT version FROM db_version),(SELECT version FROM script_db_version));
DROP TABLE IF EXISTS db_version;
DROP TABLE IF EXISTS script_db_version;

ALTER TABLE version
   ADD `core_revision` varchar(120) AFTER `core_version`;

update creature_template set scriptname='npc_snake_trap_serpents' where entry in (19921, 19833);

DELETE FROM `creature` WHERE `id` = '17653';

UPDATE `gameobject_template` SET `flags` = '4' WHERE `entry` IN ('181766','181823');
UPDATE `gameobject` SET `SpawnMask` = '3',`state` = '1' WHERE `id` IN ('181766','181823');

UPDATE `instance_template` SET `script` = 'instance_blood_furnace' WHERE `map` = '542';

ALTER TABLE custom_texts CHANGE COLUMN emote emote smallint(5) unsigned NOT NULL DEFAULT '0';
ALTER TABLE script_texts CHANGE COLUMN emote emote smallint(5) unsigned NOT NULL DEFAULT '0';

update creature_template set scriptname='' where entry=22083;
update creature_template set scriptname='npc_overlord_morghor' where entry=23139;
update creature_template set scriptname='' where entry=23141;
DELETE FROM script_texts WHERE entry BETWEEN -1000221 and -1000206;
INSERT INTO script_texts (entry, content_default, type, emote, comment) VALUES
(-1000206, 'Come, $N. Lord Stormrage awaits.', 0, 1, 'OVERLORD_SAY_1'),
(-1000207, 'Lord Illidan will be here shortly.', 0, 1, 'OVERLORD_SAY_2'),
(-1000208, 'Lord Illidan, this is the Dragonmaw that I, and others, have told you about. He will lead us to victory!', 0, 1, 'OVERLORD_SAY_3'),
(-1000209, 'But... My lord, I do not understand. $N... He is the orc that has...', 0, 1, 'OVERLORD_SAY_4'),
(-1000210, 'It will be done, my lord.', 0, 1, 'OVERLORD_SAY_5'),
(-1000211, 'So you thought to make a fool of Mor\'ghor, eh? Before you are delivered to Lord Illidan, you will feel pain that you could not know to exist. I will take pleasure in exacting my own vengeance.', 0, 25, 'OVERLORD_SAY_6'),
(-1000212, 'Warriors of Dragonmaw, gather \'round! One among you has attained the rank of highlord! Bow your heads in reverence! Show your respect and allegiance to Highlord $N!', 1, 22, 'OVERLORD_YELL_1'),
(-1000213, 'All hail Lord Illidan!', 1, 66, 'OVERLORD_YELL_2'),
(-1000214, 'What is the meaning of this, Mor\'ghor?', 0, 1, 'LORD_ILLIDAN_SAY_1'),
(-1000215, 'SILENCE!', 0, 22, 'LORD_ILLIDAN_SAY_2'),
(-1000216, 'Blathering idiot. You incomprehensibly incompetent buffoon...', 0, 1, 'LORD_ILLIDAN_SAY_3'),
(-1000217, 'THIS is your hero?', 0, 6, 'LORD_ILLIDAN_SAY_4'),
(-1000218, 'You have been deceived, imbecile.', 0, 1, 'LORD_ILLIDAN_SAY_5'),
(-1000219, 'This... whole... operation... HAS BEEN COMPROMISED!', 0, 22, 'LORD_ILLIDAN_SAY_6'),
(-1000220, 'I expect to see this insect\'s carcass in pieces in my lair within the hour. Fail and you will suffer a fate so much worse than death.', 0, 1, 'LORD_ILLIDAN_SAY_7'),
(-1000221, 'You will not harm the boy, Mor\'ghor! Quickly, $N, climb on my back!', 0, 22, 'YARZILL_THE_MERC_SAY');

DELETE FROM script_texts WHERE entry='-1000222';
INSERT INTO script_texts (entry, content_default, type, language, emote, comment) VALUES
(-1000222, 'Thank you, mortal.', 0, 11, 1, 'SAY_JUST_EATEN');

DELETE FROM script_texts WHERE entry BETWEEN -1000234 and -1000223;
INSERT INTO script_texts (entry, content_default, emote, comment) VALUES
(-1000223, 'I sense the tortured spirits, $N. They are this way, come quickly!', 1, 'SAY_START'),
(-1000224, 'Watch out!', 0, 'SAY_AGGRO1'),
(-1000225, 'Naga attackers! Defend yourself!', 0, 'SAY_AGGRO2'),
(-1000226, 'Kill them all!', 0, 'ASSASSIN_SAY_AGGRO1'),
(-1000227, 'You will never essscape Coilssskarrr...', 0, 'ASSASSIN_SAY_AGGRO2'),
(-1000228, 'Grant me protection $N, i must break trough their foul magic!', 0, 'SAY_PROGRESS1'),
(-1000229, 'The naga of Coilskar are exceptionally cruel to their prisoners. It is a miracle that I survived inside that watery prison for as long as I did. Earthmother be praised.', 0, 'SAY_PROGRESS2'),
(-1000230, 'Now we must find the exit.', 0, 'SAY_PROGRESS3'),
(-1000231, 'Lady Vashj must answer for these atrocities. She must be brought to justice!', 0, 'SAY_PROGRESS4'),
(-1000232, 'The tumultuous nature of the great waterways of Azeroth and Draenor are a direct result of tormented water spirits.', 0, 'SAY_PROGRESS5'),
(-1000233, 'It shouldn\'t be much further, $N. The exit is just up ahead.', 0, 'SAY_PROGRESS6'),
(-1000234, 'Thank you, $N. Please return to my brethren at the Altar of Damnation, near the Hand of Gul\'dan, and tell them that Wilda is safe. May the Earthmother watch over you...', 0, 'SAY_END');


DELETE FROM script_texts WHERE entry BETWEEN -1000244 and -1000235;
INSERT INTO script_texts (entry, content_default, type, emote, comment) VALUES
(-1000235, 'Ok, $N. Follow me to the cave where I\'ll attempt to harness the power of the rune stone into these goggles.', 0, 1, 'phizzlethorpe - SAY_PROGRESS_1'),
(-1000236, 'I discovered this cave on our first day here. I believe the energy in the stone can be used to our advantage.', 0, 1, 'phizzlethorpe - SAY_PROGRESS_2'),
(-1000237, 'I\'ll begin drawing energy from the stone. Your job, $N, is to defend me. This place is cursed... trust me.', 0, 1, 'phizzlethorpe - SAY_PROGRESS_3'),
(-1000238, 'begins tinkering with the goggles before the stone.', 2, 0, 'phizzlethorpe - EMOTE_PROGRESS_4'),
(-1000239, 'Help!!! Get these things off me so I can get my work done!', 0, 0, 'SAY_AGGRO'),
(-1000240, 'Almost done! Just a little longer!', 0, 1, 'phizzlethorpe - SAY_PROGRESS_5'),
(-1000241, 'I\'ve done it! I have harnessed the power of the stone into the goggles! Let\'s get out of here!', 0, 1, 'phizzlethorpe - SAY_PROGRESS_6'),
(-1000242, 'Phew! Glad to be back from that creepy cave.', 0, 1, 'phizzlethorpe - SAY_PROGRESS_7'),
(-1000243, 'hands one glowing goggles over to Doctor Draxlegauge.', 2, 0, 'phizzlethorpe - EMOTE_PROGRESS_8'),
(-1000244, 'Doctor Draxlegauge will give you further instructions, $N. Many thanks for your help!', 0, 1, 'phizzlethorpe - SAY_PROGRESS_9');

DELETE FROM script_texts WHERE entry BETWEEN -1000247 and -1000245;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000245, 'You, there! Hand over that moonstone and nobody gets hurt!', 1, 'SAY_RIZZLE_START'),
(-1000246, 'Just chill!', 4, 'SAY_RIZZLE_GRENADE'),
(-1000247, 'All right, you win! I surrender! Just don\'t hurt me!', 1, 'SAY_RIZZLE_FINAL');

DELETE FROM script_texts WHERE entry BETWEEN -1000266 and -1000248;
INSERT INTO script_texts (entry, content_default, type, emote, comment) VALUES
(-1000248, 'The last thing I remember is the ship falling and us getting into the pods. I\'ll go see how I can help. Thank you!', 0, 0, 'draenei survivor - HEAL1'),
(-1000249, '$C, Where am I? Who are you? Oh no! What happened to the ship?.', 0, 0, 'draenei survivor - HEAL2'),
(-1000250, '$C You saved me! I owe you a debt that I can never repay. I\'ll go see if I can help the others.', 0, 0, 'draenei survivor - HEAL3'),
(-1000251, 'Ugh... what is this place? Is that all that\'s left of the ship over there?', 0, 0, 'draenei survivor - HEAL4'),
(-1000252, 'Oh, the pain...', 0, 0, 'draenei survivor - HELP1'),
(-1000253, 'Everything hurts, Please make it stop...', 0, 0, 'draenei survivor - HELP2'),
(-1000254, 'Ughhh... I hurt. Can you help me?', 0, 0, 'draenei survivor - HELP3'),
(-1000255, 'I don\'t know if I can make it, please help me...', 0, 0, 'draenei survivor - HELP4'),

(-1000256, 'Yes Master, all goes along as planned.', 0, 1, 'overgrind - SAY_TEXT'),
(-1000257, 'puts the shell to his ear.', 2, 0, 'overgrind - SAY_EMOTE'),
(-1000258, 'Now I cut you!', 1, 0, 'overgrind - YELL_ATTACK'),

(-1000259, 'What\'s the big idea, Spark?', 0, 0, 'geezle - GEEZLE_SAY_1'),
(-1000260, 'What\'s the big idea? You nearly blew my cover, idiot! I told you to put the compass and navigation maps somewhere safe - not out in the open for any fool to discover.', 0, 0, 'geezle - SPARK_SAY_2'),
(-1000261, 'The Master has gone to great lengths to secure information about the whereabouts of the Exodar. You could have blown the entire operation, including the cover of our spy on the inside.', 0, 0, 'geezle - SPARK_SAY_3'),
(-1000262, 'Relax, Spark! I have it all under control. We\'ll strip mine the Exodar right out from under \'em - making both you and I very, very rich in the process.', 0, 0, 'geezle - GEEZLE_SAY_4'),
(-1000263, 'Relax? Do you know what Kael\'thas does to those that fail him, Geezle? Eternal suffering and pain... Do NOT screw this up, fool.', 0, 0, 'geezle - SPARK_SAY_5'),
(-1000264, 'Our Bloodmyst scouts have located our contact. The fool, Velen, will soon leave himself open and defenseless -- long enough for us to strike! Now get out of my sight before I vaporize you...', 0, 0, 'geezle - SPARK_SAY_6'),
(-1000265, 'Yes, sir. It won\'t happen again...', 0, 0, 'geezle - GEEZLE_SAY_7'),
(-1000266, 'picks up the naga flag.', 2, 0, 'geezle - EMOTE_SPARK');

DELETE FROM script_texts WHERE entry BETWEEN -1000279 and -1000267;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000267, 'Ready when you are, warrior.', 1, 'flathead - SAY_BIG_WILL_READY'),
(-1000268, 'The Affray has begun, get ready to fight!', 1, 'flathead - SAY_TWIGGY_FLATHEAD_BEGIN'),
(-1000269, 'You! Enter the fray!', 1, 'flathead - SAY_TWIGGY_FLATHEAD_FRAY'),
(-1000270, 'Challenger is down!', 1, 'flathead - SAY_TWIGGY_FLATHEAD_DOWN'),
(-1000271, 'The Affray is over.', 1, 'flathead - SAY_TWIGGY_FLATHEAD_OVER'),

(-1000272, 'Alright, alright I think I can figure out how to operate this thing...', 0, 'shredder - SAY_PROGRESS_1'),
(-1000273, 'Arrrgh! This isn\'t right!', 0, 'shredder - SAY_PROGRESS_2'),
(-1000274, 'Okay, I think I\'ve got it, now. Follow me, $N!', 0, 'shredder - SAY_PROGRESS_3'),
(-1000275, 'There\'s the stolen shredder! Stop it or Lugwizzle will have our hides!', 1, 'shredder - SAY_MERCENARY_4'),
(-1000276, 'Looks like we\'re out of woods, eh? Wonder what this does...', 0, 'shredder - SAY_PROGRESS_5'),
(-1000277, 'Come on, don\'t break down on me now!', 0, 'shredder - SAY_PROGRESS_6'),
(-1000278, 'That was a close one! Well, let\'s get going, it\'s still a ways to Ratchet!', 0, 'shredder - SAY_PROGRESS_7'),
(-1000279, 'Hmm... I don\'t think this blinking red light is a good thing...', 0, 'shredder - SAY_PROGRESS_8');

DELETE FROM script_texts where entry BETWEEN -1000285 and -1000280;
INSERT INTO script_texts (entry, content_default, type, language, comment) VALUES
(-1000280, 'Thank you, dear Paladin, you just saved my life.', 0, 7, 'faulk - SAY_HEAL'),

(-1000281, 'Very well. Let\'s see what you have to show me, $N.', 0, 0, 'anvilvard - SAY_PR_1'),
(-1000282, 'What manner of trick is this, $R? If you seek to ambush me, I warn you I will not go down quietly!', 0, 0, 'anvilvard - SAY_PR_2'),
(-1000283, 'releases the last of its energies into the nerarby runestone, succesfully reactivating it.', 2, 0, 'crystal - EMOTE'),

(-1000284, 'Deployment sucessful. Trespassers will be neutralized.', 0, 0, 'sentry - SAY_CONVERTED_1'),
(-1000285, 'Objective acquired. Initiating security routines.', 0, 0, 'sentry - SAY_CONVERTED_1');

DELETE FROM script_texts where entry BETWEEN -1000292 and -1000286;
INSERT INTO script_texts (entry, content_default, type, emote, comment) VALUES
(-1000286, 'A shadowy, sinister presence has invader the Emerald Dream. Its power is poised to spill over into our world, $N. We must oppose it! That\'s why I cannot accompany you in person.', 0, 0, 'clintar_spirit'),
(-1000287, 'The Emerald Dream will never be yours!', 0, 0, 'clintar_spirit'),
(-1000288, 'Begone from this place!', 0, 0, 'clintar_spirit'),
(-1000289, 'That\'s the first relic, but there are still two more. Follow me, $N.', 0, 0, 'clintar_spirit'),
(-1000290, 'I\'ve recovered the second relic. Take a moment to rest, and then we\'ll continue to the last reliquary.', 0, 0, 'clintar_spirit'),
(-1000291, 'We have all three of the relics, but my energy is rapidly fading. We must make our way back to Dreamwarden Lurosa! He will let you know what to do next.', 0, 0, 'clintar_spirit'),
(-1000292, 'Lurosa, I am entrusting the Relics of Aviana to $N, who will take them to Morthis Whisperwing. I must return completely to the Emerald Dream now. Do not let $N fail!', 0, 0, 'clintar_spirit');

DELETE FROM script_texts WHERE entry BETWEEN -1000305 and -1000293;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000293, 'In Nagrand, food hunt ogre!', 0, 'LUMP_SAY0'),
(-1000294, 'You taste good with maybe a little salt and pepper.', 0, 'LUMP_SAY1'),
(-1000295, 'OK, OK! Lump give up!', 0, 'LUMP_DEFEAT'),

(-1000296, 'Warning! Emergency shutdown process initiated by $N. Shutdown will complete in two minutes.', 2, 'npc_manaforge_control_console - EMOTE_START'),
(-1000297, 'Emergency shutdown will complete in one minute.', 2, 'npc_manaforge_control_console - EMOTE_60'),
(-1000298, 'Emergency shutdown will complete in thirty seconds.', 2, 'npc_manaforge_control_console - EMOTE_30'),
(-1000299, 'Emergency shutdown will complete in ten seconds.', 2, 'npc_manaforge_control_console - EMOTE_10'),
(-1000300, 'Emergency shutdown complete.', 2, 'npc_manaforge_control_console - EMOTE_COMPLETE'),
(-1000301, 'Emergency shutdown aborted.', 2, 'npc_manaforge_control_console - EMOTE_ABORT'),

(-1000302, 'Saeed is currently engaged or awaiting orders to engage. You may check directly east of me and see if Saeed is ready for you. If he is not present then he is off fighting another battle. I recommend that you wait for him to return before attacking Dimensius.', 4, 'npc_professor_dabiri - WHISPER_DABIRI'),

(-1000303, 'is very weak', 2, 'mob_phase_hunter - EMOTE_WEAK'),

(-1000304, 'Bessy, is that you?', 0, 'npc_bessy- SAY_THADELL_1'),
(-1000305, 'Thank you for bringing back my Bessy, $N. I couldn\'t live without her!', 0, 'npc_bessy- SAY_THADELL_2');

DELETE FROM script_texts WHERE entry BETWEEN -1000333 and -1000306;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000306, 'Follow me, stranger. This won\'t take long.', 0, 'npc_kservant - SAY1'),
(-1000307, 'Shattrath was once the draenei capital of this world. Its name means \"dwelling of light.\"', 4, 'npc_kservant - WHISP1'),
(-1000308, 'When the Burning Legion turned the orcs against the draenei, the fiercest battle was fought here. The draenei fought tooth and nail, but in the end the city fell.', 4, 'npc_kservant - WHISP2'),
(-1000309, 'The city was left in ruins and darkness... until the Sha\'tar arrived.', 4, 'npc_kservant - WHISP3'),
(-1000310, 'Let us go into the Lower City. I will warn you that as one of the only safe havens in Outland, Shattrath has attracted droves of refugees from all wars, current and past.', 4, 'npc_kservant - WHISP4'),
(-1000311, 'The Sha\'tar, or \"born from light\" are the naaru that came to Outland to fight the demons of the Burning Legion.', 4, 'npc_kservant - WHISP5'),
(-1000312, 'They were drawn to the ruins of Shattrath City where a small remnant of the draenei priesthood conducted its rites inside a ruined temple on this very spot.', 4, 'npc_kservant - WHISP6'),
(-1000313, 'The priesthood, known as the Aldor, quickly regained its strength as word spread that the naaru had returned and reconstruction soon began. The ruined temple is now used as an infirmary for injured refugees.', 4, 'npc_kservant - WHISP7'),
(-1000314, 'It wouldn\'t be long, however, before the city came under attack once again. This time, the attack came from Illidan\'s armies. A large regiment of blood elves had been sent by Illidan\'s ally, Kael\'thas Sunstrider, to lay waste to the city.', 4, 'npc_kservant - WHISP8'),
(-1000315, 'As the regiment of blood elves crossed this very bridge, the Aldor\'s exarchs and vindicators lined up to defend the Terrace of Light. But then the unexpected happened.', 4, 'npc_kservant - WHISP9'),
(-1000316, 'The blood elves laid down their weapons in front of the city\'s defenders; their leader, a blood elf elder known as Voren\'thal, stormed into the Terrace of Light and demanded to speak to A\'dal.', 4, 'npc_kservant - WHISP10'),
(-1000317, 'As the naaru approached him, Voren\'thal kneeled before him and uttered the following words: \"I\'ve seen you in a vision, naaru. My race\'s only hope for survival lies with you. My followers and I are here to serve you.\"', 4, 'npc_kservant - WHISP11'),
(-1000318, 'The defection of Voren\'thal and his followers was the largest loss ever incurred by Kael\'s forces. And these weren\'t just any blood elves. Many of the best and brightest amongst Kael\'s scholars and magisters had been swayed by Voren\'thal\'s influence.', 4, 'npc_kservant - WHISP12'),
(-1000319, 'The naaru accepted the defectors, who would become known as the Scryers; their dwelling lies in the platform above. Only those initiated with the Scryers are allowed there.', 4, 'npc_kservant - WHISP13'),
(-1000320, 'The Aldor are followers of the Light and forgiveness and redemption are values they understand. However, they found hard to forget the deeds of the blood elves while under Kael\'s command.', 4, 'npc_kservant - WHISP14'),
(-1000321, 'Many of the priesthood had been slain by the same magisters who now vowed to serve the naaru. They were not happy to share the city with their former enemies.', 4, 'npc_kservant - WHISP15'),
(-1000322, 'The Aldor\'s most holy temple and its surrounding dwellings lie on the terrace above. As a holy site, only the initiated are welcome inside.', 4, 'npc_kservant - WHISP16'),
(-1000323, 'The attacks against Shattrath continued, but the city did not fall, as you can see. On the contrary, the naaru known as Xi\'ri led a successful incursion into Shadowmoon Valley - Illidan\'s doorstep.', 4, 'npc_kservant - WHISP17'),
(-1000324, 'There he continues to wage war on Illidan with the assistance of the Aldor and the Scryers. The two factions have not given up on their old feuds, though.', 4, 'npc_kservant - WHISP18'),
(-1000325, 'Such is their animosity that they vie for the honor of being sent to assist the naaru there. Each day, that decision is made here by A\'dal. The armies gather here to receive A\'dal\'s blessing before heading to Shadowmoon.', 4, 'npc_kservant - WHISP19'),
(-1000326, 'Khadgar should be ready to see you again. Just remember that to serve the Sha\'tar you will most likely have to ally with the Aldor or the Scryers. And seeking the favor of one group will cause the others\' dislike.', 4, 'npc_kservant - WHISP20'),
(-1000327, 'Good luck stranger, and welcome to Shattrath City.', 4, 'npc_kservant - WHISP21'),


(-1000328, 'Time to teach you a lesson in manners, little boy!', 0, ''),
(-1000329, 'Now I\'m gonna give you to the count of \'3\' to get out of here before I sick the dogs on you.', 0, ''),
(-1000330, '1...', 0, ''),
(-1000331, '2...', 0, ''),
(-1000332, 'Time to meet your maker!', 0, ''),
(-1000333, 'Alright, we give up! Don\'t hurt us!', 0, '');

DELETE FROM script_texts WHERE entry=-1000334;
INSERT INTO script_texts (entry, content_default, type, language, comment) VALUES
(-1000334, 'Thank you, dear Paladin, you just saved my life.', 0, 10, 'stillblade - SAY_HEAL');

DELETE FROM script_texts WHERE entry BETWEEN -1000349 and -1000335;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000335, 'Let\'s get to the others, and keep an eye open for those wolves cutside...', 0, 'npc_deathstalker_erland 
- SAY_QUESTACCEPT'),
(-1000336, 'Be careful, $N. Those wolves like to hide among the trees.', 0, 'npc_deathstalker_erland - SAY_START'),
(-1000337, 'A $C attacks!', 0, 'npc_deathstalker_erland - SAY_AGGRO_1'),
(-1000338, 'Beware! I am under attack!', 0, 'npc_deathstalker_erland - SAY_AGGRO_2'),
(-1000339, 'We\'re almost there!', 0, 'npc_deathstalker_erland - SAY_LAST'),
(-1000340, 'We made it! Thanks, $N. I couldn\'t have gotten without you.', 0, 'npc_deathstalker_erland - 
SAY_THANKS'),
(-1000341, 'It\'s good to see you again, Erland. What is your report?', 0, 'npc_deathstalker_erland - SAY_RANE'),
(-1000342, 'Masses of wolves are to the east, and whoever lived at Malden\'s Orchard is gone.', 0, 
'npc_deathstalker_erland - SAY_ANSWER'),
(-1000343, 'If I am excused, then I\'d like to check on Quinn...', 0, 'npc_deathstalker_erland - SAY_MOVE_QUINN'),
(-1000344, 'Hello, Quinn. How are you faring?', 0, 'npc_deathstalker_erland - SAY_GREETINGS'),
(-1000345, 'I\'ve been better. Ivar the Foul got the better of me...', 0, 'npc_deathstalker_erland - SAY_QUINN'),
(-1000346, 'Try to take better care of yourself, Quinn. You were lucky this time.', 0, 'npc_deathstalker_erland - 
SAY_ON_BYE'),

(-1000347, 'Let\'s go before they find out I\'m free!', 0, 'npc_kaya_flathoof - SAY_START'),
(-1000348, 'Look out! We\'re under attack!', 0, 'npc_kaya_flathoof - SAY_AMBUSH'),
(-1000349, 'Thank you for helping me. I know my way back from here.', 0, 'npc_kaya_flathoof - SAY_END');

DELETE FROM script_texts WHERE entry BETWEEN -1000365 and -1000350;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000350, 'Who dares awaken Aquementas?', 1, 'mob_aquementas - AGGRO_YELL_AQUE'),

(-1000351, 'I give up! Please don\'t kill me!', 0, 'mob_unkor_the_ruthless - SAY_SUBMIT'),

(-1000352, 'I choose the third option: KILLING YOU!', 0, 'npc_floon - SAY_FLOON_ATTACK'),

(-1000353, 'Ok let\'s get out of here!', 0, 'npc_isla_starmane - SAY_PROGRESS_1'),
(-1000354, 'You sure you\'re ready? Take a moment.', 0, 'npc_isla_starmane - SAY_PROGRESS_2'),
(-1000355, 'Alright, let\'s do this!', 0, 'npc_isla_starmane - SAY_PROGRESS_3'),
(-1000356, 'Ok, I think I can make it on my own from here. Thank you so much for breaking me out of there!', 0, 

'npc_isla_starmane - SAY_PROGRESS_4'),

(-1000357, 'Belore...', 0, 'npc_lady_sylvanas_windrunner - SAY_LAMENT_END'),
(-1000358, 'kneels down and pick up the amulet.', 2, 'npc_lady_sylvanas_windrunner - EMOTE_LAMENT_END'),

(-1000359, 'You have my blessing', 0, 'npcs_ashyen_and_keleth - GOSSIP_REWARD_BLESS'),

(-1000360, 'Is the way clear? Let\'s get out while we can, $N.', 0, 'npc_kayra_longmane - SAY_PROGRESS_1'),
(-1000361, 'Looks like we won\'t get away so easy. Get ready!', 0, 'npc_kayra_longmane - SAY_PROGRESS_2'),
(-1000362, 'Let\'s keep moving. We\'re not safe here!', 0, 'npc_kayra_longmane - SAY_PROGRESS_3'),
(-1000363, 'Look out, $N! Enemies ahead!', 0, 'npc_kayra_longmane - SAY_PROGRESS_4'),
(-1000364, 'We\'re almost to the refuge! Let\'s go.', 0, 'npc_kayra_longmane - SAY_PROGRESS_5'),
(-1000365, 'I can see my fellow druids from here. Thank you, $N. I\'m sure Ysiel will reward you for your actions!', 0, 'npc_kayra_longmane - SAY_PROGRESS_6');

-- Liquid Fire
UPDATE `gameobject_template` SET `data2`='5',`data11`='1' WHERE `entry` IN ('180125','182533');

-- Scripts & Stats
UPDATE `creature_template` SET `ScriptName`='boss_vazruden_the_herald' WHERE `entry` = '17307';
UPDATE `creature_template` SET `ScriptName`='boss_vazruden',`heroic_entry`='18434' WHERE `entry` = '17537';
UPDATE `creature_template` SET `ScriptName`='boss_nazan' WHERE `entry` = '17536';
UPDATE `creature_template` SET `ScriptName`='mob_hellfire_sentry' WHERE `entry` = '17517';
UPDATE `creature_template` SET `equipment_id`='2183',`mechanic_immune_mask`='805306367' WHERE `entry` = '18434';

-- Reinforced Fel Iron Chest
DELETE FROM `gameobject` WHERE `id` IN ('185168','185169');

-- Script Texts
DELETE FROM `script_texts` WHERE `entry` BETWEEN '-1543025' AND '-1543017';
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
('-1543017','You have faced many challenges, pity they were all in vain. Soon your people will kneel to my lord!',10292,1,0,'vazruden SAY_INTRO'),
('-1543018','Is there no one left to test me?',10293,1,0,'vazruden SAY_WIPE'),
('-1543019','Your time is running out!',10294,1,0,'vazruden SAY_AGGRO_1'),
('-1543020','You are nothing, I answer a higher call!',10295,1,0,'vazruden SAY_AGGRO_2'),
('-1543021','The Dark Lord laughs at you!',10296,1,0,'vazruden SAY_AGGRO_3'),
('-1543022','It is over. Finished!',10297,1,0,'vazruden SAY_KILL_1'),
('-1543023','Your days are done!',10298,1,0,'vazruden SAY_KILL_2'),
('-1543024','My lord will be the end you all...',10299,1,0,'vazruden SAY_DIE'),
('-1543025','descends from the sky',0,3,0,'vazruden EMOTE');

-- Waypoint Movement
DELETE FROM `waypoint_data` WHERE `id` = '2081';
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
('2081','1','-1412.2','1784','112'),
('2081','2','-1447.9','1760.9','112'),
('2081','3','-1454.2','1729.3','112'),
('2081','4','-1430','1705','112'),
('2081','5','-1393.5','1705.5','112'),
('2081','6','-1369.8','1724.5','112'),
('2081','7','-1377','1760','112');

UPDATE creature_template set ScriptName='mob_illidari_spawn' WHERE entry IN (22075,22074,19797);
UPDATE `creature_template` SET `ScriptName`='mob_torloth_the_magnificent' WHERE `entry`='22076';
UPDATE creature_template SET ScriptName='npc_lord_illidan_stormrage' WHERE entry=22083;
delete from creature where id=22083;
INSERT INTO creature (id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType)
 VALUES (22083, 530, 1, 0, 0, -4635.75, 1386.32, 137.34, 5.72398, 25,0, 0, 9955, 6774, 0, 0);
update gameobject_template set scriptname='go_crystal_prison' where entry=185126;

DELETE FROM script_texts WHERE entry BETWEEN -1000374 and -1000366;
INSERT INTO script_texts (entry, content_default, type, comment) VALUES
(-1000366, 'So you have defeated the Crimson Sigil. You now seek to challenge my rule? Not even Arthas could defeat me, yet you dare to even harbor such thoughts? Then I say to you, come! Come $N! The Black Temple awaits...', 1, 'Quest: Battle of the crimson watch - END_TEXT'),

(-1000367, 'At your command, my liege...', 0, 'TorlothAnim - First'),
(-1000368, 'Destroy them, Torloth. Let lose their blood like a river upon this hallowed ground.', 0, 'Quest: Battle of the crimson watch TorlothAnim - Second'),
(-1000369, 'As you desire, Lord Illidan.', 0, 'Quest: Battle of the crimson watch TorlothAnim - Third'),
(-1000370, 'Yes, Lord Illidan, I would sacrifice to you this magnificent physique. On this day you will fall - another victim of Torloth...', 0, 'Quest: Battle of the crimson watch TorlothAnim - Fourth'),

(-1000371, 'What manner of fool dares stand before Illidan Stormrage? Soldiers, destroy these insects!', 1, 'Quest: Battle of the crimson watch WavesInfo - First'),
(-1000372, 'You are no challenge for the Crimson Sigil. Mind breakers, end this nonsense.', 1, 'Quest: Battle of the crimson watch WavesInfo - Second'),
(-1000373, 'Run while you still can. The highlords come soon...', 1, 'Quest: Battle of the crimson watch WavesInfo - Third'),
(-1000374, 'Torloth your master calls!', 1, 'Quest: Battle of the crimson watch WavesInfo - Fourth');

REPLACE INTO `spell_script_target` VALUES
(33655,0,183350),
(33655,0,183351),
(44374,1,24722),
(31538,1,17895),
(29967,1,16524),
(39887,1,23002),
(31617,1,17899),
(31624,1,17899),
(31625,1,17899),
(34019,1,19422),
(34946,1,20040),
(34946,1,20041),
(21934,1,21934),
(43144,1,23817),
(12613,1,5843),
(9095,1,1200);

DELETE FROM script_texts WHERE entry BETWEEN -1000395 AND -1000375;
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1000375 ,'I remember well the sting of defeat at the conclusion of the Third War. I have waited far too long for my revenge. Now the shadow of the Legion falls over this world. It is only a matter of time until all of your failed creation... is undone.',11332,1,0,0,'kazzak SAY_INTRO'),
(-1000376,'The Legion will conquer all!',11333,1,0,0,'kazzak SAY_AGGRO1'),
(-1000377,'All mortals will perish!',11334,1,0,0,'kazzak SAY_AGGRO2'),
(-1000378,'All life must be eradicated!',11335,1,0,0,'kazzak SAY_SURPREME1'),
(-1000379,'I\'ll rip the flesh from your bones!',11336,1,0,0,'kazzak SAY_SURPREME2'),
(-1000380,'Kirel Narak!',11337,1,0,0,'kazzak SAY_KILL1'),
(-1000381,'Contemptible wretch!',11338,1,0,0,'kazzak SAY_KILL2'),
(-1000382,'The universe will be remade.',11339,1,0,0,'kazzak SAY_KILL3'),
(-1000383,'The Legion... will never... fall.',11340,1,0,0,'kazzak SAY_DEATH'),
(-1000384,'%s goes into a frenzy!',0,2,0,0,'kazzak EMOTE_FRENZY'),
(-1000385,'Invaders, you dangle upon the precipice of oblivion! The Burning Legion comes and with it comes your end.',0,1,0,0,'kazzak SAY_RAND1'),
(-1000386,'Impudent whelps, you only delay the inevitable. Where one has fallen, ten shall rise. Such is the will of Kazzak...',0,1,0,0,'kazzak SAY_RAND2'),

(-1000387,'Do not proceed. You will be eliminated!',11344,1,0,0,'doomwalker SAY_AGGRO'),
(-1000388,'Tectonic disruption commencing.',11345,1,0,0,'doomwalker SAY_EARTHQUAKE_1'),
(-1000389,'Magnitude set. Release.',11346,1,0,0,'doomwalker SAY_EARTHQUAKE_2'),
(-1000390,'Trajectory locked.',11347,1,0,0,'doomwalker SAY_OVERRUN_1'),
(-1000391,'Engage maximum speed.',11348,1,0,0,'doomwalker SAY_OVERRUN_2'),
(-1000392,'Threat level zero.',11349,1,0,0,'doomwalker SAY_SLAY_1'),
(-1000393,'Directive accomplished.',11350,1,0,0,'doomwalker SAY_SLAY_2'),
(-1000394,'Target exterminated.',11351,1,0,0,'doomwalker SAY_SLAY_3'),
(-1000395,'System failure in five, f-o-u-r...',11352,1,0,0,'doomwalker SAY_DEATH');

DELETE FROM script_texts WHERE entry BETWEEN -1000401 AND -1000396;
INSERT INTO script_texts (entry, content_default, type, language, comment) VALUES
(-1000396, 'Muahahahaha! You fool! You\'ve released me from my banishment in the interstices between space and time!', 0, 0, 'mobs_nether_drake - SAY_NIHIL_1'),
(-1000397, 'All of Draenor shall quick beneath my feet! I will destroy this world and reshape it in my image!', 0, 0, 'mobs_nether_drake - SAY_NIHIL_2'),
(-1000398, 'Where shall I begin? I cannot bother myself with a worm such as yourself. There is a world to be conquered!', 0, 0, 'mobs_nether_Drake - SAY_NIHIL_3'),
(-1000399, 'No doubt the fools that banished me are long dead. I shall take wing survey my demense. Pray to whatever gods you hold dear that we do not meet again.', 0, 0, 'mobs_nether_drake - SAY_NIHIL_4'),
(-1000400, 'NOOOOooooooo!', 1, 0, 'mobs_nether_drake - SAY_NIHIL_INTERRUPT'),

(-1000401, 'Good $N, you are under the spell\'s influence. I must analyze it quickly, then we can talk.', 0, 7, 'npc_daranelle - SAY_DARANELLE');

update creature_template set scriptname = 'npc_enraged_spirit' where entry in (21050, 21061, 21060, 21059);

UPDATE `instance_template` SET `script` = 'instance_blackrock_depths' WHERE `map` = 230;
UPDATE `creature_template` SET `ScriptName` = 'mob_voidtraveler' WHERE `entry` = 19226;
UPDATE `creature_template` SET `ScriptName` = 'mob_shadowy_construct' WHERE `entry` = 23111;
UPDATE `creature_template` SET `ScriptName` = 'mob_phalanx' WHERE `entry` = 9502;
UPDATE `creature_template` SET `ScriptName` = 'npc_draenei_survivor' WHERE `entry` = 16483;
UPDATE `creature_template` SET `ScriptName` = 'mob_inner_demon' WHERE entry = 21857;
UPDATE `creature_template` SET `ScriptName` = 'mob_webwrap' WHERE `entry` = 16486;
UPDATE `creature_template` SET `ScriptName` = 'mob_dragonmaw_peon' WHERE `entry` = 22252;
UPDATE `creature_template` SET `ScriptName` = 'npc_karynaku' WHERE `entry` = 22112;
UPDATE `creature_template` SET `ScriptName` = 'mob_ohgan' WHERE `entry` = 14988;

UPDATE `creature_template` SET `ScriptName` = 'mob_fiendish_imp' WHERE `entry` = 17267;

DELETE FROM `spell_proc_event` WHERE `entry` = 42370;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(42370, 0x00, 11, 0x00000080, 0x00000000, 0x00000000, 0.000000, 0.000000, 0);

CREATE TABLE `spell_enchant_proc_data` (
  `entry` INT(10) UNSIGNED NOT NULL,
  `customChance` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `PPMChance` FLOAT UNSIGNED NOT NULL DEFAULT '0', 
  `procEx` FLOAT UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MYISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';

INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (2, 0, 8.8,0);
INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (12, 0, 8.8,0);
INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (524, 0, 8.8,0);
INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (1667, 0, 8.8,0);
INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (1668, 0, 8.8,0);
INSERT INTO spell_enchant_proc_data (`entry`, `customChance`, `PPMChance`,`procEx`) VALUES (2635, 0, 8.8,0);

UPDATE `gameobject_template` SET `ScriptName` = 'kalecgos_teleporter' WHERE `entry` = 187055;
UPDATE `creature_template` SET `ScriptName` = 'boss_kalecgos_kj' WHERE `entry` = 25319;

UPDATE `creature_template` SET `ScriptName` = 'mob_ethereal_apprentice' WHERE `entry` = 18430;

DELETE FROM `creature` WHERE `id` = 18431;

-- Razorfen Kraul
UPDATE `instance_template` SET `script` = 'instance_razorfen_kraul' WHERE `map` = '47' LIMIT 1;
UPDATE `creature_template` SET `ScriptName` = 'npc_deaths_head_ward_keeper' WHERE `entry` = '4625' LIMIT 1;

ALTER TABLE `quest_template`
    ADD `RewHonorableKills` mediumint(9) unsigned NOT NULL default '0' AFTER `RewRepValue5`;

UPDATE `item_template` SET `ScriptName`='item_arcane_charges' WHERE `entry`='34475';
UPDATE gameobject_template SET faction = 14 WHERE entry = 185134;

INSERT INTO `spell_script_target` VALUES ('30531', '1', '17256');
INSERT INTO `spell_script_target` VALUES ('41455', '1', '22949');
INSERT INTO `spell_script_target` VALUES ('41455', '1', '22950');
INSERT INTO `spell_script_target` VALUES ('41455', '1', '22951');
INSERT INTO `spell_script_target` VALUES ('41455', '1', '22952');
INSERT INTO `spell_script_target` VALUES ('42471', '1', '23817');
INSERT INTO `spell_script_target` VALUES ('43734', '1', '23817');
INSERT INTO `spell_script_target` VALUES ('42631', '1', '23920');

-- 
-- NOTE: If you have temporary stored data in table `eventai_localized_texts` make sure to make backup of this before running this update!
-- NOTE: If you have any texts in current eventai_texts and they are not using entries valid for *_texts table, you _will_ get error messages on startup.
-- NOTE: Do not run this update twice, it may create bad data if you choose to do so.
-- 

-- drop obsolete table
DROP TABLE eventai_localized_texts;

-- alter and add fields in table `eventai_texts`
ALTER TABLE eventai_texts CHANGE COLUMN `id` `entry` mediumint(8) NOT NULL;
ALTER TABLE eventai_texts CHANGE COLUMN `text` `content_default` text NOT NULL AFTER `entry`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc1` text AFTER `content_default`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc2` text AFTER `content_loc1`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc3` text AFTER `content_loc2`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc4` text AFTER `content_loc3`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc5` text AFTER `content_loc4`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc6` text AFTER `content_loc5`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc7` text AFTER `content_loc6`;
ALTER TABLE eventai_texts ADD COLUMN `content_loc8` text AFTER `content_loc7`;
ALTER TABLE eventai_texts ADD COLUMN `sound` mediumint(8) unsigned NOT NULL default '0' AFTER `content_loc8`;
ALTER TABLE eventai_texts ADD COLUMN `type` tinyint unsigned NOT NULL default '0' AFTER `sound`;
ALTER TABLE eventai_texts ADD COLUMN `language` tinyint unsigned NOT NULL default '0' AFTER `type`;
ALTER TABLE eventai_texts MODIFY COLUMN `comment` text;

-- get our current action type, and update text type = yell
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=1 WHERE eventai_scripts.action1_type IN (2,7) AND eventai_scripts.action1_param1=eventai_texts.entry;
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=1 WHERE eventai_scripts.action2_type IN (2,7) AND eventai_scripts.action2_param1=eventai_texts.entry;
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=1 WHERE eventai_scripts.action3_type IN (2,7) AND eventai_scripts.action3_param1=eventai_texts.entry;
-- get our current action type, and update text type = textemote
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=2 WHERE eventai_scripts.action1_type IN (3,8) AND eventai_scripts.action1_param1=eventai_texts.entry;
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=2 WHERE eventai_scripts.action2_type IN (3,8) AND eventai_scripts.action2_param1=eventai_texts.entry;
UPDATE eventai_texts,eventai_scripts SET eventai_texts.type=2 WHERE eventai_scripts.action3_type IN (3,8) AND eventai_scripts.action3_param1=eventai_texts.entry;

-- update our scripts, for all action type 2, 3, 6, 7 & 8 to become 1
UPDATE eventai_scripts SET action1_type=1 WHERE action1_type IN (2,3,6,7,8);
UPDATE eventai_scripts SET action2_type=1 WHERE action2_type IN (2,3,6,7,8);
UPDATE eventai_scripts SET action3_type=1 WHERE action3_type IN (2,3,6,7,8);

-- was OOC, so at least one could be -1, set this to 0 (dev note: below will be bad, if run twice)
UPDATE eventai_scripts SET action1_param2=0 WHERE action1_type=1 AND action1_param2=-1;
UPDATE eventai_scripts SET action1_param3=0 WHERE action1_type=1 AND action1_param3=-1;
UPDATE eventai_scripts SET action2_param2=0 WHERE action2_type=1 AND action2_param2=-1;
UPDATE eventai_scripts SET action2_param3=0 WHERE action2_type=1 AND action2_param3=-1;
UPDATE eventai_scripts SET action3_param2=0 WHERE action3_type=1 AND action3_param2=-1;
UPDATE eventai_scripts SET action3_param3=0 WHERE action3_type=1 AND action3_param3=-1;

-- expect all to be action type 1 now, continue convert to negative text entry
UPDATE eventai_scripts SET action1_param1=(`action1_param1`) *-1 WHERE action1_type=1 AND action1_param1>0;
UPDATE eventai_scripts SET action2_param1=(`action2_param1`) *-1 WHERE action2_type=1 AND action2_param1>0;
UPDATE eventai_scripts SET action3_param1=(`action3_param1`) *-1 WHERE action3_type=1 AND action3_param1>0;

UPDATE eventai_scripts SET action1_param2=(`action1_param2`) *-1 WHERE action1_type=1 AND action1_param2>0;
UPDATE eventai_scripts SET action2_param2=(`action2_param2`) *-1 WHERE action2_type=1 AND action2_param2>0;
UPDATE eventai_scripts SET action3_param2=(`action3_param2`) *-1 WHERE action3_type=1 AND action3_param2>0;

UPDATE eventai_scripts SET action1_param3=(`action1_param3`) *-1 WHERE action1_type=1 AND action1_param3>0;
UPDATE eventai_scripts SET action2_param3=(`action2_param3`) *-1 WHERE action2_type=1 AND action2_param3>0;
UPDATE eventai_scripts SET action3_param3=(`action3_param3`) *-1 WHERE action3_type=1 AND action3_param3>0;

-- now we have negative numbers in script, must make sure text entries have same entry as script
UPDATE eventai_texts SET entry=(`entry`) *-1 WHERE entry>0;

ALTER TABLE script_texts MODIFY COLUMN `sound` mediumint(8) unsigned NOT NULL default '0';

-- Add/Edit/Move lang strings
DELETE FROM `trinity_string` WHERE `entry` IN (25,52,54,55,56,171,401,413,438,593,594,595,596,597,598,599,614,615,636,637,638,809,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118);
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '667' AND '687';
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '711' AND '716';
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '730' AND '747';
DELETE FROM `trinity_string` WHERE `entry` BETWEEN '5000' AND '5006';
INSERT INTO trinity_string VALUES
('25','Password not changed (unknown error)!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('52', 'Invaid item count (%u) for item %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('54','The new passwords do not match',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('55','Your password can\'t be longer than 16 characters (client limit), password not changed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('56','Current Message of the day: \r\n%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(171,'You are being teleported by server console command.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(401,'You change security level of account %s to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(413,'Account not exist: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(438,'Found items %u: %u ( inventory %u mail %u auction %u guild %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(593,'Currently Banned Accounts:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(594,'|    Account    |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(595,'Currently Banned IPs:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(596,'|      IP       |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(597,'Current gamemasters:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(598,'|    Account    |  GM  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(599,'No gamemasters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('614', 'The Alliance flag has been respawned!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('615', 'The Horde flag has been respawned!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('636', 'The Battle for Eye of the Storm begins in 1 minute.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('637', 'The Battle for Eye of the Storm begins in 30 seconds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('638', 'The Battle for Eye of the Storm has begun!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('667', 'The Alliance has taken control of the Mage Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('668', 'The Horde has taken control of the Mage Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('669', 'The Alliance has taken control of the Draenei Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('670', 'The Horde has taken control of the Draenei Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('671', 'The Alliance has taken control of the Blood Elf Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('672', 'The Horde has taken control of the Blood Elf Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('673', 'The Alliance has taken control of the Fel Reaver Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('674', 'The Horde has taken control of the Fel Reaver Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('675', 'The Alliance has lost control of the Mage Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('676', 'The Horde has lost control of the Mage Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('677', 'The Alliance has lost control of the Draenei Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('678', 'The Horde has lost control of the Draenei Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('679', 'The Alliance has lost control of the Blood Elf Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('680', 'The Horde has lost control of the Blood Elf Tower!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('681', 'The Alliance has lost control of the Fel Reaver Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('682', 'The Horde has lost control of the Fel Reaver Ruins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('683', '$N has taken the flag!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('684', 'The Alliance has captured the flag!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('685', 'The Horde has captured the flag!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('686', 'The Flag has been dropped!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('687', 'The flag has been reset', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('711', 'Your group is too large for this battleground. Please regroup to join.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('712', 'Your group is too large for this arena. Please regroup to join.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('713', 'You must be level %u to join an arena team!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('714', '%s is not high enough level to join your team', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('715', 'You don\'t meet Battleground level requirements', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('716', 'Your arena team is full, %s cannot join it.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('730', 'Your group has members not in your arena team. Please regroup to join.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('731', 'Your group does not have enough players to join this match.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('732', 'The Gold Team wins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('733', 'The Green Team wins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('734', 'There aren\'t enough players in this battleground. It will end soon unless some more players join to balance the fight.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('735', 'Your group has an offline member. Please remove him before joining.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('736', 'Your group has players from the opposing faction. You can\'t join the battleground as a group.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('737', 'Your group has players from different battleground brakets. You can\'t join as group.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('738', 'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('739', 'Someone in your party is Deserter. You can\'t join as group.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('740', 'Someone in your party is already in three battleground queues. You cannot join as group.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('741', 'You cannot teleport to a battleground or arena map.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('742', 'You cannot summon players to a battleground or arena map.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('743', 'You must be in GM mode to teleport to a player in a battleground.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('744', 'You cannot teleport to a battleground from another battleground. Please leave the current battleground first.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('745', 'Arena testing turned %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('746','|cffff0000[Automatic]:|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('747','|cffffff00[|c1f40af20Announce by|r |cffff0000%s|cffffff00]:|r %s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('809','Account for character %s not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1000','Exiting daemon...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1001','Account deleted: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1002','Account %s NOT deleted (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1003','Account %s NOT deleted (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1004','Account created: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1005','Account name can\'t be longer than 16 characters (client limit), account not created!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1006,'Account with this name already exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1007,'Account %s NOT created (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1008,'Account %s NOT created (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1009,'Player %s (Guid: %u) Account %s (Id: %u) deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1010,'|    Account    |       Character      |       IP        | GM | TBC |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1011,'|<Error>        | %20s |<Error>          |<Er>|<Err>|',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1100,'Account %s (Id: %u) have up to %u expansion allowed now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1101,'Message of the day changed to:\r\n%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1102,'Message sent to %s: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1103,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1104,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1105,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1106,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1107,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1108,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1109,'%d - %s %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1110,'%d - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1111,'%d - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1112,'Failed to open file: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1113,'Account %s (%u) have max amount allowed characters (client limit)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1114,'Dump file has broken data!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1115,'Invalid character name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1116,'Invalid character guid!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1117,'Character guid %u in use!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1118,'%d - guild: %s (guid: %u) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5000,'You froze player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5001,'It might be amusing but no... you cant freeze yourself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5002,'Invalid input check the name of target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5003,'You unfroze player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5004,'There are no frozen players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5005,'Following players are frozen on the server:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5006,'- %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


-- cleanup command syntax
DELETE FROM command WHERE name IN (
  'gm ingame','gm online',
  'ban','ban account','ban character','ban ip',
  'baninfo','baninfo account','baninfo character','baninfo ip','pdump load',
  'banlist','banlist account','banlist character','banlist ip','help','transport',
  'unban','unban account','unban character','unban ip','list item','pdump write',
  'acct','account','account create','account delete','account onlinelist',
  'account set addon','account set gmlevel','account set password',
  'chardelete','gm list','gm online','sendmessage','server corpses','server exit','server motd',
  'server set loglevel','server set motd','security'

);

INSERT INTO command VALUES
('gm ingame',0,'Syntax: .gm ingame\r\n\r\nDisplay a list of available in game Game Masters.'),
('ban account',3,'Syntax is: ban account $Name $bantime $reason\r\nBan account kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('ban character',3,'Syntax is: ban character $Name $bantime $reason\r\nBan account and kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('ban ip',3,'Syntax is: ban ip $Ip $bantime $reason\r\nBan IP.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('baninfo account',3,'Syntax is: baninfo account\r\nWatch full information about a specific ban.'),
('baninfo character',3,'Syntax is: baninfo character\r\nWatch full information about a specific ban.'),
('baninfo ip',3,'Syntax is: baninfo ip\r\nWatch full information about a specific ban.'),
('banlist account',3,'Syntax is: banlist account [$Name]\r\nSearches the banlist for a account name pattern or show full list account bans.'),
('banlist character',3,'Syntax is: banlist character $Name\r\nSearches the banlist for a character name pattern. Pattern required.'),
('banlist ip',3,'Syntax is: banlist ip [$Ip]\r\nSearches the banlist for a IP pattern or show full list of IP bans.'),
('unban account',3,'Syntax is: unban account $Name\r\nUnban accounts for account name pattern.'),
('unban character',3,'Syntax is: unban character $Name\r\nUnban accounts for character name pattern.'),
('unban ip',3,'Syntax is: unban ip $Ip\r\nUnban accounts for IP pattern.'),
('pdump write',3,'Syntax is: pdump write $filename $playerNameOrGUID\r\nWrite character dump with name/guid $playerNameOrGUID to file $filename.'),
('pdump load',3,'Syntax is: pdump load $filename $account [$newname] [$newguid]\r\nLoad character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.'),
('list item',3,'Syntax: .list item #item_id [#max_count]\r\n\r\nOutput items with item id #item_id found in all character inventories, mails, auctions, and guild banks. Output item guids, item owner guid, owner account and owner name (guild name and guid in case guild bank). Will be output maximum #max_count items. If #max_count not provided use 10 as default value.'),
('help',0,'Syntax: .help [$command]\r\n\r\nDisplay usage instructions for the given $command. If no $command provided show list available commands.'),
('account',0,'Syntax: .account\r\n\r\nDisplay the access level of your account.'),
('account create',4,'Syntax: .account create $account $password\r\n\r\nCreate account and set password to it.'),
('account delete',4,'Syntax: .account delete $account\r\n\r\nDelete account with all characters.'),
('account onlinelist',4,'Syntax: .account onlinelist\r\n\r\nShow list of online accounts.'),
('account set addon',3,'Syntax: .account set addon [$account] #addon\r\n\r\nSet user (posible targeted) expansion addon level allowed. Addon values: 0 - normal, 1 - tbc, 2 - wotlk.'),
('account set gmlevel',4,'Syntax: .account set gmlevel [$account] #level\r\n\r\nSet the security level for targeted player (can''t be used at self) or for account $name to a level of #level.\r\n\r\n#level may range from 0 to 3.'),
('account set password',4,'Syntax: .account set password $account $password $password\r\n\r\nSet password for account.'),
('chardelete',4,'Syntax: .chardelete $charactername\r\n\r\nDelete character.'),
('gm list',3,'Syntax: .gm list\r\n\r\nDisplay a list of all Game Masters accounts and security levels.'),
('gm online',0,'Syntax: .gm online\r\n\r\nDisplay a list of available Game Masters.'),
('sendmessage',3,'Syntax: .sendmessage $playername $message\r\n\r\nSend screen message to player from ADMINISTRATOR.'),
('server corpses',2,'Syntax: .server corpses\r\n\r\nTriggering corpses expire check in world.'),
('server exit',4,'Syntax: .server exit\r\n\r\nTerminate Trinity NOW.'),
('server motd',0,'Syntax: .server motd\r\n\r\nShow server Message of the day.'),
('server set loglevel',4,'Syntax: .server set loglevel #level\r\n\r\nSet server log level (0 - errors only, 1 - basic, 2 - detail, 3 - debug).'),
('server set motd',3,'Syntax: .server set motd $MOTD\r\n\r\nSet server Message of the day.');

-- 
-- trinity_script_texts.sql Contains data for table `script_texts` mainly used in C++ parts.
-- valid entries for table are between -1000000 and -1999999
-- 

TRUNCATE `script_texts`;

-- 
-- -1 000 000 First 100 entries are reserved for special use, do not add regular text here.
-- 

INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000000,'<TrinityScript Text Entry Missing!>',0,0,0,'DEFAULT_TEXT');

-- 
-- Normal text entries. Say/Yell/Whisper/Emote for any regular world object.
-- 

-- -1 000 100 GENERAL MAPS (not typical instance maps)

-- -1 033 000 SHADOWFANG KEEP

-- -1 034 000 STOCKADES

-- -1 036 000 DEADMINES

-- -1 043 000 WAILING CAVERNS

-- -1 047 000 RAZORFEN KRAUL

-- -1 048 000 BLACKFATHOM DEEPS

-- -1 070 000 ULDAMAN

-- -1 090 000 GNOMEREGAN

-- -1 109 000 SUNKEN TEMPLE

-- -1 129 000 RAZORFEN DOWNS

-- -1 189 000 SCARLET MONASTERY

-- -1 209 000 ZUL'FARRAK

-- -1 229 000 BLACKROCK SPIRE

-- -1 230 000 BLACKROCK DEPTHS

-- -1 249 000 ONYXIA'S LAIR

-- -1 269 000 OPENING OF THE DARK PORTAL (BLACK MORASS)

-- -1 289 000 SCHOLOMANCE

-- -1 309 000 ZUL'GURUB

-- -1 329 000 STRATHOLME

-- -1 349 000 MARAUDON

-- -1 389 000 RAGEFIRE CHASM

-- -1 409 000 MOLTEN CORE

-- -1 429 000 DIRE MAUL

-- -1 469 000 BLACKWING LAIR

-- -1 509 000 RUINS OF AHN'QIRAJ

-- -1 531 000 TEMPLE OF AHN'QIRAJ

-- -1 532 000 KARAZHAN

-- -1 533 000 NAXXRAMAS

-- -1 534 000 THE BATTLE OF MT. HYJAL

-- -1 540 000 SHATTERED HALLS

-- -1 542 000 BLOOD FURNACE

-- -1 543 000 HELLFIRE RAMPARTS

-- -1 544 000 MAGTHERIDON'S LAIR

-- -1 545 000 THE STEAMVAULT

-- -1 546 000 THE UNDERBOG

-- -1 547 000 THE SLAVE PENS

-- -1 548 000 SERPENTSHRINE CAVERN

-- -1 550 000 THE EYE

-- -1 552 000 THE ARCATRAZ

-- -1 553 000 THE BOTANICA

-- -1 554 000 THE MECHANAR

-- -1 555 000 SHADOW LABYRINTH
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1555000,'Infidels have invaded the sanctuary! Sniveling pests...You have yet to learn the true meaning of agony!',10473,1,0,'hellmaw SAY_INTRO'),
(-1555001,'Pathetic mortals! You will pay dearly!',10475,1,0,'hellmaw SAY_AGGRO1'),
(-1555002,'I will break you!',10476,1,0,'hellmaw SAY_AGGRO2'),
(-1555003,'Finally! Something to relieve the tedium!',10477,1,0,'hellmaw SAY_AGGRO3'),
(-1555004,'Aid me, you fools, before it\'s too late!',10474,1,0,'hellmaw SAY_HELP'),
(-1555005,'Do you fear death?',10478,1,0,'hellmaw SAY_SLAY1'),
(-1555006,'This is the part I enjoy most.',10479,1,0,'hellmaw SAY_SLAY2'),
(-1555007,'Do not...grow...overconfident, mortal.',10480,1,0,'hellmaw SAY_DEATH'),

(-1555008,'All flesh must burn.',10482,1,0,'blackhearth SAY_INTRO1'),
(-1555009,'All creation must be unmade!',10483,1,0,'blackhearth SAY_INTRO2'),
(-1555010,'Power will be yours!',10484,1,0,'blackhearth SAY_INTRO3'),
(-1555011,'You\'ll be sorry!',10486,1,0,'blackhearth SAY_AGGRO1'),
(-1555012,'Time for fun!',10487,1,0,'blackhearth SAY_AGGRO2'),
(-1555013,'I see dead people!',10488,1,0,'blackhearth SAY_AGGRO3'),
(-1555014,'No comin\' back for you!',10489,1,0,'blackhearth SAY_SLAY1'),
(-1555015,'Nice try!',10490,1,0,'blackhearth SAY_SLAY2'),
(-1555016,'Help us, hurry!',10485,1,0,'blackhearth SAY_HELP'),
(-1555017,'This... no... good...',10491,1,0,'blackhearth SAY_DEATH'),

(-1555018,'Be ready for Dark One\'s return.',10492,1,0,'blackhearth SAY2_INTRO1'),
(-1555019,'So we have place in new universe.',10493,1,0,'blackhearth SAY2_INTRO2'),
(-1555020,'Dark one promise!',10494,1,0,'blackhearth SAY2_INTRO3'),
(-1555021,'You\'ll be sorry!',10496,1,0,'blackhearth SAY2_AGGRO1'),
(-1555022,'Time to kill!',10497,1,0,'blackhearth SAY2_AGGRO2'),
(-1555023,'You be dead people!',10498,1,0,'blackhearth SAY2_AGGRO3'),
(-1555024,'Now you gone for good.',10499,1,0,'blackhearth SAY2_SLAY1'),
(-1555025,'You failed, haha haha',10500,1,0,'blackhearth SAY2_SLAY2'),
(-1555026,'Help us, hurry!',10495,1,0,'blackhearth SAY2_HELP'),
(-1555027,'Arrgh, aah...ahhh',10501,1,0,'blackhearth SAY2_DEATH'),

(-1555028,'Keep your minds focused for the days of reckoning are close at hand. Soon, the destroyer of worlds will return to make good on his promise. Soon the destruction of all that is will begin!',10522,1,0,'vorpil SAY_INTRO'),
(-1555029,'I\'ll make an offering of your blood!',10524,1,0,'vorpil SAY_AGGRO1'),
(-1555030,'You\'ll be a fine example, for the others.',10525,1,0,'vorpil SAY_AGGRO2'),
(-1555031,'Good, a worthy sacrifice.',10526,1,0,'vorpil SAY_AGGRO3'),
(-1555032,'Come to my aid, heed your master now!',10523,1,0,'vorpil SAY_HELP'),
(-1555033,'I serve with pride.',10527,1,0,'vorpil SAY_SLAY1'),
(-1555034,'Your death is for the greater cause!',10528,1,0,'vorpil SAY_SLAY2'),
(-1555035,'I give my life... Gladly.',10529,1,0,'vorpil SAY_DEATH'),

(-1555036,'draws energy from the air.',0,2,0,'murmur EMOTE_SONIC_BOOM');

-- -1 556 000 SETHEKK HALLS
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1556000,'I have pets..<squawk>..of my own!',10502,1,0,'syth SAY_SUMMON'),
(-1556001,'Hrrmm.. Time to.. hrrm.. make my move.',10503,1,0,'syth SAY_AGGRO_1'),
(-1556002,'Nice pets..hrm.. Yes! <squawking>',10504,1,0,'syth SAY_AGGRO_2'),
(-1556003,'Nice pets have.. weapons. No so..<squawk>..nice.',10505,1,0,'syth SAY_AGGRO_3'),
(-1556004,'Death.. meeting life is.. <squawking>',10506,1,0,'syth SAY_SLAY_1'),
(-1556005,'Uhn.. Be free..<squawk>',10507,1,0,'syth SAY_SLAY_2'),
(-1556006,'No more life..hrm. No more pain. <squawks weakly>',10508,1,0,'syth SAY_DEATH'),

(-1556007,'<squawk>..Trinkets yes pretty Trinkets..<squawk>..power, great power.<squawk>..power in Trinkets..<squawk>',10557,1,0,'ikiss SAY_INTRO'),
(-1556008,'You make war on Ikiss?..<squawk>',10554,1,0,'ikiss SAY_AGGRO_1'),
(-1556009,'Ikiss cut you pretty..<squawk>..slice you. Yes!',10555,1,0,'ikiss SAY_AGGRO_2'),
(-1556010,'No escape for..<squawk>..for you',10556,1,0,'ikiss SAY_AGGRO_3'),
(-1556011,'You die..<squawk>..stay away from Trinkets',10558,1,0,'ikiss SAY_SLAY_1'),
(-1556012,'<squawk>',10559,1,0,'ikiss SAY_SLAY_2'),
(-1556013,'Ikiss will not..<squawk>..die',10560,1,0,'ikiss SAY_DEATH'),
(-1556015,'begins to channel arcane energy...',0,3,0,'ikiss EMOTE_ARCANE_EXP');

-- -1 557 000 MANA TOMBS
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1557000,'What is this? You must forgive me, but I was not expecting company. As you can see, we are somewhat preoccupied right now. But no matter. As I am a gracious host, I will tend to you... personally.',10539,1,0,'shaffar SAY_INTRO'),
(-1557001,'We have not yet been properly introduced.',10541,1,0,'shaffar SAY_AGGRO_1'),
(-1557002,'An epic battle. How exciting!',10542,1,0,'shaffar SAY_AGGRO_2'),
(-1557003,'I have longed for a good adventure.',10543,1,0,'shaffar SAY_AGGRO_3'),
(-1557004,'It has been... entertaining.',10544,1,0,'shaffar SAY_SLAY_1'),
(-1557005,'And now we part company.',10545,1,0,'shaffar SAY_SLAY_2'),
(-1557006,'I have such fascinating things to show you.',10540,1,0,'shaffar SAY_SUMMON'),
(-1557007,'I must bid you... farewell.',10546,1,0,'shaffar SAY_DEAD'),

(-1557008,'I will feed on your soul.',10561,1,0,'pandemonius SAY_AGGRO_1'),
(-1557009,'So... full of life!',10562,1,0,'pandemonius SAY_AGGRO_2'),
(-1557010,'Do not... resist.',10563,1,0,'pandemonius SAY_AGGRO_3'),
(-1557011,'Yes! I am... empowered!',10564,1,0,'pandemonius SAY_KILL_1'),
(-1557012,'More... I must have more!',10565,1,0,'pandemonius SAY_KILL_2'),
(-1557013,'To the void... once... more..',10566,1,0,'pandemonius SAY_DEATH'),
(-1557014,'shifts into the void...',0,3,0,'pandemonius EMOTE_DARK_SHELL');

-- -1 558 000 AUCHENAI CRYPTS
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1558000,'You have defiled the resting place of our ancestors. For this offense, there can be but one punishment. It is fitting that you have come to a place of the dead... for you will soon be joining them.',10509,1,0,'maladaar SAY_INTRO'),
(-1558001,'Rise my fallen brothers. Take form and fight!',10512,1,0,'maladaar SAY_SUMMON'),
(-1558002,'You will pay with your life!',10513,1,0,'maladaar SAY_AGGRO_1'),
(-1558003,'There\'s no turning back now!',10514,1,0,'maladaar SAY_AGGRO_2'),
(-1558004,'Serve your penitence!',10515,1,0,'maladaar SAY_AGGRO_3'),
(-1558005,'Let your mind be clouded.',10510,1,0,'maladaar SAY_ROAR'),
(-1558006,'Stare into the darkness of your soul.',10511,1,0,'maladaar SAY_SOUL_CLEAVE'),
(-1558007,'These walls will be your doom.',10516,1,0,'maladaar SAY_SLAY_1'),
(-1558008,'<laugh> Now, you\'ll stay for eternity!',10517,1,0,'maladaar SAY_SLAY_2'),
(-1558009,'This is... where.. I belong...',10518,1,0,'maladaar SAY_DEATH');

-- -1 560 000 ESCAPE FROM DURNHOLDE (OLD HILLSBRAD)

-- -1 564 000 BLACK TEMPLE

-- -1 565 000 GRUUL'S LAIR

-- -1 568 000 ZUL'AMAN

-- -1 580 000 SUNWELL PLATEAU

-- -1 585 000 MAGISTER'S TERRACE


-- 
-- Below just for beautiful view in table, run at own desire
-- 

-- ALTER TABLE `script_texts` ORDER BY `entry` desc;

update creature_template set speed='0.01', scriptname='mob_toxic_sporebat' WHERE entry=22140;
update creature_template SET scriptname='npc_overlord_morghor' WHERE entry=23139;
update creature_template SET scriptname='npc_lord_illidan_stormrage' WHERE entry=22083;
update creature_template SET scriptname='npc_yarzill_the_merc' WHERE entry=23141;
update quest_template SET StartScript=0 WHERE entry=11108;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1469030 AND -1469000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1469000,'None of your kind should be here! You\'ve doomed only yourselves!',8286,1,0,'broodlord SAY_AGGRO'),
(-1469001,'Clever Mortals but I am not so easily lured away from my sanctum!',8287,1,0,'broodlord SAY_LEASH'),
(-1469002,'goes into a killing frenzy!',0,2,0,'chromaggus EMOTE_FRENZY'),
(-1469003,'flinches as its skin shimmers.',0,2,0,'chromaggus EMOTE_SHIMMER'),
(-1469004,'In this world where time is your enemy, it is my greatest ally. This grand game of life that you think you play in fact plays you. To that I say...',0,0,0,'victor_nefarius SAY_GAMESBEGIN_1'),
(-1469005,'Let the games begin!',8280,1,0,'victor_nefarius SAY_GAMESBEGIN_2'),
(-1469006,'Ah, the heroes. You are persistent, aren\'t you. Your allied attempted to match his power against mine, and had to pay the price. Now he shall serve me, by slaughtering you. Get up little red wyrm and destroy them!',8279,1,0,'victor_nefarius SAY_VAEL_INTRO'),
(-1469007,'Well done, my minions. The mortals\' courage begins to wane! Now, let\'s see how they contend with the true Lord of Blackrock Spire!',8288,1,0,'nefarian SAY_AGGRO'),
(-1469008,'Enough! Now you vermin shall feel the force of my birthright, the fury of the earth itself.',8289,1,0,'nefarian SAY_XHEALTH'),
(-1469009,'Burn, you wretches! Burn!',8290,1,0,'nefarian SAY_SHADOWFLAME'),
(-1469010,'Impossible! Rise my minions! Serve your master once more!',8291,1,0,'nefarian SAY_RAISE_SKELETONS'),
(-1469011,'Worthless $N! Your friends will join you soon enough!',8293,1,0,'nefarian SAY_SLAY'),
(-1469012,'This cannot be! I am the Master here! You mortals are nothing to my kind! DO YOU HEAR? NOTHING!',8292,1,0,'nefarian SAY_DEATH'),
(-1469013,'Mages too? You should be more careful when you play with magic...',0,1,0,'nefarian SAY_MAGE'),
(-1469014,'Warriors, I know you can hit harder than that! Let\'s see it!',0,1,0,'nefarian SAY_WARRIOR'),
(-1469015,'Druids and your silly shapeshifting. Let\'s see it in action!',0,1,0,'nefarian SAY_DRUID'),
(-1469016,'Priests! If you\'re going to keep healing like that, we might as well make it a little more interesting!',0,1,0,'nefarian SAY_PRIEST'),
(-1469017,'Paladins, I\'ve heard you have many lives. Show me.',0,1,0,'nefarian SAY_PALADIN'),
(-1469018,'Shamans, show me what your totems can do!',0,1,0,'nefarian SAY_SHAMAN'),
(-1469019,'Warlocks, you shouldn\'t be playing with magic you don\'t understand. See what happens?',0,1,0,'nefarian SAY_WARLOCK'),
(-1469020,'Hunters and your annoying pea-shooters!',0,1,0,'nefarian SAY_HUNTER'),
(-1469021,'Rogues? Stop hiding and face me!',0,1,0,'nefarian SAY_ROGUE'),
(-1469022,'You\'ll pay for forcing me to do this.',8275,1,0,'razorgore SAY_EGGS_BROKEN1'),
(-1469023,'Fools! These eggs are more precious than you know.',8276,1,0,'razorgore SAY_EGGS_BROKEN2'),
(-1469024,'No! Not another one! I\'ll have your heads for this atrocity.',8277,1,0,'razorgore SAY_EGGS_BROKEN3'),
(-1469025,'If I fall into the abyss I\'ll take all of you mortals with me...',8278,1,0,'razorgore SAY_DEATH'),
(-1469026,'Too late...friends. Nefarius\' corruption has taken hold. I cannot...control myself.',8281,1,0,'vaelastrasz SAY_LINE1'),
(-1469027,'I beg you Mortals, flee! Flee before I lose all control. The Black Fire rages within my heart. I must release it!',8282,1,0,'vaelastrasz SAY_LINE2'),
(-1469028,'FLAME! DEATH! DESTRUCTION! COWER MORTALS BEFORE THE WRATH OF LORD....NO! I MUST FIGHT THIS!',8283,1,0,'vaelastrasz SAY_LINE3'),
(-1469029,'Nefarius\' hate has made me stronger than ever before. You should have fled, while you could, mortals! The fury of Blackrock courses through my veins!',8285,1,0,'vaelastrasz SAY_HALFLIFE'),
(-1469030,'Forgive me $N, your death only adds to my failure.',8284,1,0,'vaelastrasz SAY_KILLTARGET');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1269017 AND -1269000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1269000,'Why do you persist? Surely you can see the futility of it all. It is not too late! You may still leave with your lives ...',10442,1,0,'temporus SAY_ENTER'),
(-1269001,'So be it ... you have been warned.',10444,1,0,'temporus SAY_AGGRO'),
(-1269002,'Time... sands of time is run out for you.',10443,1,0,'temporus SAY_BANISH'),
(-1269003,'You should have left when you had the chance.',10445,1,0,'temporus SAY_SLAY1'),
(-1269004,'Your days are done.',10446,1,0,'temporus SAY_SLAY2'),
(-1269005,'My death means ... little.',10447,1,0,'temporus SAY_DEATH'),
(-1269006,'Why do you aid the Magus? Just think of how many lives could be saved if the portal is never opened, if the resulting wars could be erased ...',10412,1,0,'chrono_lord_deja SAY_ENTER'),
(-1269007,'If you will not cease this foolish quest, then you will die!',10414,1,0,'chrono_lord_deja SAY_AGGRO'),
(-1269008,'You have outstayed your welcome, Timekeeper. Begone!',10413,1,0,'chrono_lord_deja SAY_BANISH'),
(-1269009,'I told you it was a fool\'s quest!',10415,1,0,'chrono_lord_deja SAY_SLAY1'),
(-1269010,'Leaving so soon?',10416,1,0,'chrono_lord_deja SAY_SLAY2'),
(-1269011,'Time ... is on our side.',10417,1,0,'chrono_lord_deja SAY_DEATH'),
(-1269012,'The time has come to shatter this clockwork universe forever! Let us no longer be slaves of the hourglass! I warn you: those who do not embrace the greater path shall become victims of its passing!',10400,1,0,'aeonus SAY_ENTER'),
(-1269013,'Let us see what fate lays in store...',10402,1,0,'aeonus SAY_AGGRO'),
(-1269014,'Your time is up, slave of the past!',10401,1,0,'aeonus SAY_BANISH'),
(-1269015,'One less obstacle in our way!',10403,1,0,'aeonus SAY_SLAY1'),
(-1269016,'No one can stop us! No one!',10404,1,0,'aeonus SAY_SLAY2'),
(-1269017,'It is only a matter...of time.',10405,1,0,'aeonus SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1560022 AND -1560000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1560000,'Thrall! You didn\'t really think you would escape did you? You and your allies shall answer to Blackmoore - after I\'ve had my fun!',10406,1,0,'skarloc SAY_ENTER'),
(-1560001,'You\'re a slave. That\'s all you\'ll ever be.',10407,1,0,'skarloc SAY_TAUNT1'),
(-1560002,'I don\'t know what Blackmoore sees in you. For my money, you\'re just another ignorant savage!',10408,1,0,'skarloc SAY_TAUNT2'),
(-1560003,'Thrall will never be free!',10409,1,0,'skarloc SAY_SLAY1'),
(-1560004,'Did you really think you would leave here alive?',10410,1,0,'skarloc SAY_SLAY2'),
(-1560005,'Guards! Urgh..Guards..!',10411,1,0,'skarloc SAY_DEATH'),
(-1560006,'You there, fetch water quickly! Get these flames out before they spread to the rest of the keep! Hurry, damn you!',10428,1,0,'lieutenant_drake SAY_ENTER'),
(-1560007,'I know what you\'re up to, and I mean to put an end to it, permanently!',10429,1,0,'lieutenant_drake SAY_AGGRO'),
(-1560008,'No more middling for you.',10432,1,0,'lieutenant_drake SAY_SLAY1'),
(-1560009,'You will not interfere!',10433,1,0,'lieutenant_drake SAY_SLAY2'),
(-1560010,'Time to bleed!',10430,1,0,'lieutenant_drake SAY_MORTAL'),
(-1560011,'Run, you blasted cowards!',10431,1,0,'lieutenant_drake SAY_SHOUT'),
(-1560012,'Thrall... must not... go free.',10434,1,0,'lieutenant_drake SAY_DEATH'),
(-1560013,'Thrall! Come outside and face your fate!',10418,1,0,'epoch SAY_ENTER1'),
(-1560014,'Taretha\'s life hangs in the balance. Surely you care for her. Surely you wish to save her...',10419,1,0,'epoch SAY_ENTER2'),
(-1560015,'Ah, there you are. I had hoped to accomplish this with a bit of subtlety, but I suppose direct confrontation was inevitable. Your future, Thrall, must not come to pass and so...you and your troublesome friends must die!',10420,1,0,'epoch SAY_ENTER3'),
(-1560016,'Enough! I will erase your very existence!',10421,1,0,'epoch SAY_AGGRO1'),
(-1560017,'You cannot fight fate!',10422,1,0,'epoch SAY_AGGRO2'),
(-1560018,'You are...irrelevant.',10425,1,0,'epoch SAY_SLAY1'),
(-1560019,'Thrall will remain a slave. Taretha will die. You have failed.',10426,1,0,'epoch SAY_SLAY2'),
(-1560020,'Not so fast!',10423,1,0,'epoch SAY_BREATH1'),
(-1560021,'Struggle as much as you like!',10424,1,0,'epoch SAY_BREATH2'),
(-1560022,'No!...The master... will not... be pleased.',10427,1,0,'epoch SAY_DEATH');

DELETE FROM command WHERE name IN ('npc follow','npc unfollow','waterwalk','repairitems');

INSERT INTO command VALUES
('repairitems',2,'Syntax: .repairitems\r\n\r\nRepair all selected player''s items.'),
('npc follow',2,'Syntax: .npc follow\r\n\r\nSelected creature start follow you until death/fight/etc.'),
('npc unfollow',2,'Syntax: .npc unfollow\r\n\r\nSelected creature (non pet) stop follow you.'),
('waterwalk',2,'Syntax: .waterwalk on/off\r\n\r\nSet on/off waterwalk state for selected player or self if no player selected.');

DELETE FROM trinity_string WHERE entry IN (171,172,336,337,338,339,340,341,342,5007,5008);

INSERT INTO trinity_string VALUES
(172,'server console command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(336,'You repair all %s''s items.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(337,'All your items repaired by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(338,'You set waterwalk mode %s for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(339,'Your waterwalk mode set to %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(340,'%s is now following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(341,'%s is not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(342,'%s is now not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(810,'You must be in a raid group to enter the instance %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(811,'You cannot enter %s while in a ghost mode!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM gameobject_template WHERE `entry` IN (187578, 188173);
INSERT INTO gameobject_template () VALUES (187578, 10, 4891, 'Scrying Orb', '', 0, 0, 2.16851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_movie_orb');
INSERT INTO gameobject_template () VALUES (188173, 10, 7161, 'Escape to the Isle of Quel\'Danas', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_kael_orb');

DELETE FROM spell_script_target WHERE `entry` IN (44320, 44321);
INSERT INTO spell_script_target () VALUES (44320, 1, 24723);
INSERT INTO spell_script_target () VALUES (44321, 1, 24723);

UPDATE creature_template SET modelid_A = '17612' WHERE entry = '24745';
UPDATE creature_template SET modelid_H = '17612' WHERE entry = '24745';

UPDATE `creature_template` SET `minhealth` = '6900' WHERE `entry` = 24675;
UPDATE `creature_template` SET `maxhealth` = '6900' WHERE `entry` = 24675;

UPDATE `creature_template` SET `minlevel` = '70' WHERE `entry` = 24708;
UPDATE `creature_template` SET `maxlevel` = '70' WHERE `entry` = 24708;

UPDATE `creature_template` SET `minlevel` = '70' WHERE `entry` = 24666;
UPDATE `creature_template` SET `maxlevel` = '70' WHERE `entry` = 24666;

UPDATE `creature_template` SET `scale` = '0.5' WHERE `entry` = 24708;

UPDATE `gameobject_template` SET `ScriptName` = 'go_kael_orb' WHERE `entry` = 188173;
UPDATE `gameobject_template` SET `ScriptName` = 'go_movie_orb' WHERE `entry` = 187578;

update creature_template SET spell1=6474 WHERE entry=22487;
update creature_template SET spell1=3600 WHERE entry=22486;

DROP TABLE IF EXISTS `spell_linked_spell`;
CREATE TABLE `spell_linked_spell` (
  `spell_trigger` int(10) NOT NULL,
  `spell_effect` int(10) NOT NULL default '0',
  `type` smallint(3) unsigned NOT NULL default '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`spell_trigger`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (44008, 45265, 1, 'Static Disruption Visual');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (-30410, 44032, 0, 'Manticron Cube Mind Exhaustion');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45661, 45665, 1, 'Encapsulate\r\n');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (40604, 40616, 1, 'Fel Rage Aura');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (40616, 41625, 1, 'Fel Rage Aura');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (41292, 42017, 1, 'Aura of Suffering');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (-41292, -42017, 0, 'Aura of Suffering');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45347, -45348, 1, 'Remove Flame Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45348, -45347, 1, 'Remove Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45248, 45347, 1, 'Apply Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45329, 45347, 1, 'Apply Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45256, 45347, 1, 'Apply Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45270, 45347, 1, 'Apply Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45342, 45348, 1, 'Apply Flame Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (46771, 45348, 1, 'Apply Flame Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45271, 45347, 1, 'Apply Dark Touched');

INSERT INTO spell_linked_spell
   (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
   (45246, 45348, 1, 'Apply Flame Touched');

-- Magtheridon Earthquake
DELETE FROM spell_script_target WHERE `entry` IN (30657);
INSERT INTO spell_script_target VALUES ('30657', '1', '24136');

delete from `spell_linked_spell` where `spell_trigger` in ('15237','15430','15431','27799','27800','27801','25331');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('15237','23455','0','Holy Nova (rank1)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('15430','23458','0','Holy Nova (rank2)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('15431','23459','0','Holy Nova (rank3)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('27799','27803','0','Holy Nova (rank4)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('27800','27804','0','Holy Nova (rank5)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('27801','27805','0','Holy Nova (rank6)');
insert into `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) values('25331','25329','0','Holy Nova (rank7)');

update creature_template set flags_extra = 128 where entry = 12999;

DELETE FROM trinity_string WHERE entry IN (57,58,5009);

INSERT INTO trinity_string VALUES
(57,'Using World DB: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'Using script library: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5009,'Sound %u Played to server',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM `command` WHERE name IN ('pet create','pet learn','pet unlearn','pet tp','gobject activate','playall');
INSERT INTO `command` (name,security,help) VALUES
('pet create',2,'Syntax: .pet create\r\n\r\nCreates a pet of the selected creature.'),
('pet learn',2,'Syntax: .pet learn\r\n\r\nLearn #spellid to pet.'),
('pet unlearn',2,'Syntax: .pet unlean\r\n\r\nunLearn #spellid to pet.'),
('pet tp',2,'Syntax: .pet tp #\r\n\r\nChange pet\'s amount of training points.'),
('modify gender',2,'Syntax: .modify gender\r\n\r\n.modify gender #male/female - Turns selected player into a male or female'),
('gobject activate',2,'Syntax: .gobject activate #guid\r\n\r\nActivates an object like a door or a button.'),
('playall',2,'Syntax: .playall #soundid\r\n\r\nPlayer a sound to whole server.');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1548055 AND -1548000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1548000,'I cannot allow you to interfere!',11289,1,0,'hydross SAY_AGGRO'),
(-1548001,'Better, much better.',11290,1,0,'hydross SAY_SWITCH_TO_CLEAN'),
(-1548002,'They have forced me to this...',11291,1,0,'hydross SAY_CLEAN_SLAY1'),
(-1548003,'I have no choice.',11292,1,0,'hydross SAY_CLEAN_SLAY2'),
(-1548004,'I am... released...',11293,1,0,'hydross SAY_CLEAN_DEATH'),
(-1548005,'Aaghh, the poison...',11297,1,0,'hydross SAY_SWITCH_TO_CORRUPT'),
(-1548006,'I will purge you from this place.',11298,1,0,'hydross SAY_CORRUPT_SLAY1'),
(-1548007,'You are no better than they!',11299,1,0,'hydross SAY_CORRUPT_SLAY2'),
(-1548008,'You are the disease, not I',11300,1,0,'hydross SAY_CORRUPT_DEATH'),
(-1548009,'Finally my banishment ends!',11312,1,0,'leotheras SAY_AGGRO'),
(-1548010,'Be gone trifling elf. I\'m in control now.',11304,1,0,'leotheras SAY_SWITCH_TO_DEMON'),
(-1548011,'We all have our demons...',11305,1,0,'leotheras SAY_INNER_DEMONS'),
(-1548012,'I have no equal.',11306,1,0,'leotheras SAY_DEMON_SLAY1'),
(-1548013,'Perish, mortal.',11307,1,0,'leotheras SAY_DEMON_SLAY2'),
(-1548014,'Yes, YES! Ahahah!',11308,1,0,'leotheras SAY_DEMON_SLAY3'),
(-1548015,'Kill! KILL!',11314,1,0,'leotheras SAY_NIGHTELF_SLAY1'),
(-1548016,'That\'s right! Yes!',11315,1,0,'leotheras SAY_NIGHTELF_SLAY2'),
(-1548017,'Who\'s the master now?',11316,1,0,'leotheras SAY_NIGHTELF_SLAY3'),
(-1548018,'No! NO! What have you done?! I am the master, do you hear me? I... aaghh... Can\'t... contain him...',11313,1,0,'leotheras SAY_FINAL_FORM'),
(-1548019,'At last I am liberated. It has been too long since I have tasted true freedom!',11309,1,0,'leotheras SAY_FREE'),
(-1548020,'You cannot kill me! Fools, I\'ll be back! I\'ll... aarghh...',11317,1,0,'leotheras SAY_DEATH'),
(-1548021,'Guards, attention! We have visitors...',11277,1,0,'karathress SAY_AGGRO'),
(-1548022,'Your overconfidence will be your undoing! Guards, lend me your strength!',11278,1,0,'karathress SAY_GAIN_BLESSING'),
(-1548023,'Go on, kill them! I\'ll be the better for it!',11279,1,0,'karathress SAY_GAIN_ABILITY1'),
(-1548024,'I am more powerful than ever!',11280,1,0,'karathress SAY_GAIN_ABILITY2'),
(-1548025,'More knowledge, more power!',11281,1,0,'karathress SAY_GAIN_ABILITY3'),
(-1548026,'Land-dwelling scum!',11282,1,0,'karathress SAY_SLAY1'),
(-1548027,'Alana be\'lendor!',11283,1,0,'karathress SAY_SLAY2'),
(-1548028,'I am rid of you.',11284,1,0,'karathress SAY_SLAY3'),
(-1548029,'Her ... excellency ... awaits!',11285,1,0,'karathress SAY_DEATH'),
(-1548030,'Flood of the deep, take you!',11321,1,0,'morogrim SAY_AGGRO'),
(-1548031,'By the Tides, kill them at once!',11322,1,0,'morogrim SAY_SUMMON1'),
(-1548032,'Destroy them my subjects!',11323,1,0,'morogrim SAY_SUMMON2'),
(-1548033,'There is nowhere to hide!',11324,1,0,'morogrim SAY_SUMMON_BUBL1'),
(-1548034,'Soon it will be finished!',11325,1,0,'morogrim SAY_SUMMON_BUBL2'),
(-1548035,'It is done!',11326,1,0,'morogrim SAY_SLAY1'),
(-1548036,'Strugging only makes it worse.',11327,1,0,'morogrim SAY_SLAY2'),
(-1548037,'Only the strong survive.',11328,1,0,'morogrim SAY_SLAY3'),
(-1548038,'Great... currents of... Ageon.',11329,1,0,'morogrim SAY_DEATH'),
(-1548039,'sends his enemies to their watery graves!',0,2,0,'morogrim EMOTE_WATERY_GRAVE'),
(-1548040,'The violent earthquake has alerted nearby murlocs!',0,3,0,'morogrim EMOTE_EARTHQUAKE'),
(-1548041,'summons Watery Globules!',0,2,0,'morogrim EMOTE_WATERY_GLOBULES'),
(-1548042,'Water is life. It has become a rare commodity here in Outland. A commodity that we alone shall control. We are the Highborne, and the time has come at last for us to retake our rightful place in the world!',11531,1,0,'vashj SAY_INTRO'),
(-1548043,'I\'ll split you from stem to stern!',11532,1,0,'vashj SAY_AGGRO1'),
(-1548044,'Victory to Lord Illidan!',11533,1,0,'vashj SAY_AGGRO2'),
(-1548045,'I spit on you, surface filth!',11534,1,0,'vashj SAY_AGGRO3'),
(-1548046,'Death to the outsiders!',11535,1,0,'vashj SAY_AGGRO4'),
(-1548047,'I did not wish to lower myself by engaging your kind, but you leave me little choice!',11538,1,0,'vashj SAY_PHASE1'),
(-1548048,'The time is now! Leave none standing!',11539,1,0,'vashj SAY_PHASE2'),
(-1548049,'You may want to take cover.',11540,1,0,'vashj SAY_PHASE3'),
(-1548050,'Straight to the heart!',11536,1,0,'vashj SAY_BOWSHOT1'),
(-1548051,'Seek your mark!',11537,1,0,'vashj SAY_BOWSHOT2'),
(-1548052,'Your time ends now!',11541,1,0,'vashj SAY_SLAY1'),
(-1548053,'You have failed!',11542,1,0,'vashj SAY_SLAY2'),
(-1548054,'Be\'lamere an\'delay',11543,1,0,'vashj SAY_SLAY3'),
(-1548055,'Lord Illidan, I... I am... sorry.',11544,1,0,'vashj SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1545023 AND -1545000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1545000,'Surge forth my pets!',10360,1,0,'thespia SAY_SUMMON'),
(-1545001,'The depths will consume you!',10361,1,0,'thespia SAY_AGGRO_1'),
(-1545002,'Meet your doom, surface dwellers!',10362,1,0,'thespia SAY_AGGRO_2'),
(-1545003,'You will drown in blood!',10363,1,0,'thespia SAY_AGGRO_3'),
(-1545004,'To the depths of oblivion with you!',10364,1,0,'thespia SAY_SLAY_1'),
(-1545005,'For my lady and master!',10365,1,0,'thespia SAY_SLAY_2'),
(-1545006,'Our matron will be.. the end of.. you..',10366,1,0,'thespia SAY_DEAD'),
(-1545007,'I\'m bringin\' the pain!',10367,1,0,'mekgineer SAY_MECHANICS'),
(-1545008,'You\'re in for a world of hurt!',10368,1,0,'mekgineer SAY_AGGRO_1'),
(-1545009,'Eat hot metal, scumbag!',10369,1,0,'mekgineer SAY_AGGRO_2'),
(-1545010,'I\'ll come over there!',10370,1,0,'mekgineer SAY_AGGRO_3'),
(-1545011,'I\'m bringin\' the pain!',10371,1,0,'mekgineer SAY_AGGRO_4'),
(-1545012,'You just got served, punk!',10372,1,0,'mekgineer SOUND_SLAY_1'),
(-1545013,'I own you!',10373,1,0,'mekgineer SOUND_SLAY_2'),
(-1545014,'Have fun dyin\', cupcake!',10374,1,0,'mekgineer SOUND_SLAY_3'),
(-1545015,'Mommy!',10375,1,0,'mekgineer SAY_DEATH'),
(-1545016,'You deem yourselves worthy simply because you bested my guards? Our work here will not be compromised!',10390,1,0,'kalithresh SAY_INTRO'),
(-1545017,'This is not nearly over...',10391,1,0,'kalithresh SAY_REGEN'),
(-1545018,'Your head will roll!',10392,1,0,'kalithresh SAY_AGGRO1'),
(-1545019,'I despise all of your kind!',10393,1,0,'kalithresh SAY_AGGRO2'),
(-1545020,'Ba\'ahntha sol\'dorei!',10394,1,0,'kalithresh SAY_AGGRO3'),
(-1545021,'Scram, surface filth!',10395,1,0,'kalithresh SAY_SLAY1'),
(-1545022,'Ah ha ha ha ha ha ha!',10396,1,0,'kalithresh SAY_SLAY2'),
(-1545023,'For her Excellency... for... Vashj!',10397,1,0,'kalithresh SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1540041 AND -1540000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1540000,'You wish to fight us all at once? This should be amusing!',10262,1,0,'nethekurse SAY_INTRO'),
(-1540001,'You can have that one. I no longer need him.',10263,1,0,'nethekurse PEON_ATTACK_1'),
(-1540002,'Yes, beat him mercilessly. His skull is a thick as an ogres.',10264,1,0,'nethekurse PEON_ATTACK_2'),
(-1540003,'Don\'t waste your time on that one. He\'s weak!',10265,1,0,'nethekurse PEON_ATTACK_3'),
(-1540004,'You want him? Very well, take him!',10266,1,0,'nethekurse PEON_ATTACK_4'),
(-1540005,'One pitiful wretch down. Go on, take another one.',10267,1,0,'nethekurse PEON_DIE_1'),
(-1540006,'Ahh, what a waste... Next!',10268,1,0,'nethekurse PEON_DIE_2'),
(-1540007,'I was going to kill him anyway!',10269,1,0,'nethekurse PEON_DIE_3'),
(-1540008,'Thank you for saving me the trouble! Now it\'s my turn to have some fun...',10270,1,0,'nethekurse PEON_DIE_4'),
(-1540009,'Beg for your pittyfull life!',10259,1,0,'nethekurse SAY_TAUNT_1'),
(-1540010,'Run covad, ruun!',10260,1,0,'nethekurse SAY_TAUNT_2'),
(-1540011,'Your pain amuses me.',10261,1,0,'nethekurse SAY_TAUNT_3'),
(-1540012,'I\'m already bored.',10271,1,0,'nethekurse SAY_AGGRO_1'),
(-1540013,'Come on! ... Show me a real fight.',10272,1,0,'nethekurse SAY_AGGRO_2'),
(-1540014,'I had more fun torturing the peons.',10273,1,0,'nethekurse SAY_AGGRO_3'),
(-1540015,'You Loose.',10274,1,0,'nethekurse SAY_SLAY_1'),
(-1540016,'Ohh! Just die.',10275,1,0,'nethekurse SAY_SLAY_2'),
(-1540017,'What a ... a shame.',10276,1,0,'nethekurse SAY_DIE'),
(-1540018,'Smash!',10306,1,0,'omrogg GoCombat_1'),
(-1540019,'If you nice me let you live.',10308,1,0,'omrogg GoCombat_2'),
(-1540020,'Me hungry!',10309,1,0,'omrogg GoCombat_3'),
(-1540021,'Why don\'t you let me do the talking?',10317,1,0,'omrogg GoCombatDelay_1'),
(-1540022,'No, we will NOT let you live!',10318,1,0,'omrogg GoCombatDelay_2'),
(-1540023,'You always hungry. That why we so fat!',10319,1,0,'omrogg GoCombatDelay_3'),
(-1540024,'You stay here. Me go kill someone else!',10303,1,0,'omrogg Threat_1'),
(-1540025,'What are you doing!',10315,1,0,'omrogg Threat_2'),
(-1540026,'Me kill someone else...',10302,1,0,'omrogg Threat_3'),
(-1540027,'Me not like this one...',10300,1,0,'omrogg Threat_4'),
(-1540028,'That\'s not funny!',10314,1,0,'omrogg ThreatDelay1_1'),
(-1540029,'Me get bored...',10305,1,0,'omrogg ThreatDelay1_2'),
(-1540030,'I\'m not done yet, idiot!',10313,1,0,'omrogg ThreatDelay1_3'),
(-1540031,'Hey you numbskull!',10312,1,0,'omrogg ThreatDelay1_4'),
(-1540032,'Ha ha ha.',10304,1,0,'omrogg ThreatDelay2_1'),
(-1540033,'Whhy! He almost dead!',10316,1,0,'omrogg ThreatDelay2_2'),
(-1540034,'H\'ey...',10307,1,0,'omrogg ThreatDelay2_3'),
(-1540035,'We kill his friend!',10301,1,0,'omrogg ThreatDelay2_4'),
(-1540036,'This one die easy!',10310,1,0,'omrogg Killing_1'),
(-1540037,'I\'m tired. You kill next one!',10320,1,0,'omrogg Killing_2'),
(-1540038,'That\'s because I do all the hard work!',10321,1,0,'omrogg KillingDelay_1'),
(-1540039,'This all...your fault!',10311,1,0,'omrogg YELL_DIE_L'),
(-1540040,'I...hate...you...',10322,1,0,'omrogg YELL_DIE_R'),
(-1540041,'enrages',0,2,0,'omrogg EMOTE_ENRAGE');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1542014 AND -1542000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1542000,'Who dares interrupt... What is this? What have you done? You ruin everything!',10164,1,0,'kelidan SAY_WAKE'),
(-1542001,'You mustn\'t let him loose!',10166,1,0,'kelidan SAY_ADD_AGGRO_1'),
(-1542002,'Ignorant whelps!',10167,1,0,'kelidan SAY_ADD_AGGRO_2'),
(-1542003,'You fools! He\'ll kill us all!',10168,1,0,'kelidan SAY_ADD_AGGRO_3'),
(-1542004,'Just as you deserve!',10169,1,0,'kelidan SAY_KILL_1'),
(-1542005,'Your friends will soon be joining you.',10170,1,0,'kelidan SAY_KILL_2'),
(-1542006,'Closer... Come closer.. and burn!',10165,1,0,'kelidan SAY_NOVA'),
(-1542007,'Good luck... you\'ll need it..',10171,1,0,'kelidan SAY_DIE'),
(-1542008,'Come intruders....',0,1,0,'broggok SAY_AGGRO'),
(-1542009,'My work must not be interrupted.',10286,1,0,'the_maker SAY_AGGRO_1'),
(-1542010,'Perhaps I can find a use for you.',10287,1,0,'the_maker SAY_AGGRO_2'),
(-1542011,'Anger... Hate... These are tools I can use.',10288,1,0,'the_maker SAY_AGGRO_3'),
(-1542012,'Let\'s see what I can make of you.',10289,1,0,'the_maker SAY_KILL_1'),
(-1542013,'It is pointless to resist.',10290,1,0,'the_maker SAY_KILL_2'),
(-1542014,'Stay away from... me.',10291,1,0,'the_maker SAY_DIE');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1543016 AND -1543000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1543000,'Do you smell that? Fresh meat has somehow breached our citadel. Be wary of any intruders.',0,1,0,'gargolmar SAY_TAUNT'),
(-1543001,'Heal me! QUICKLY!',10329,1,0,'gargolmar SAY_HEAL'),
(-1543002,'Back off, pup!',10330,1,0,'gargolmar SAY_SURGE'),
(-1543003,'What have we here...?',10331,1,0,'gargolmar SAY_AGGRO_1'),
(-1543004,'Heh... this may hurt a little.',10332,1,0,'gargolmar SAY_AGGRO_2'),
(-1543005,'I\'m gonna enjoy this.',10333,1,0,'gargolmar SAY_AGGRO_3'),
(-1543006,'Say farewell!',10334,1,0,'gargolmar SAY_KILL_1'),
(-1543007,'Much too easy...',10335,1,0,'gargolmar SAY_KILL_2'),
(-1543008,'Hahah.. <cough> ..argh!',10336,1,0,'gargolmar SAY_DIE'),
(-1543009,'You dare stand against me?!',10280,1,0,'omor SAY_AGGRO_1'),
(-1543010,'I will not be defeated!',10279,1,0,'omor SAY_AGGRO_2'),
(-1543011,'Your insolence will be your death.',10281,1,0,'omor SAY_AGGRO_3'),
(-1543012,'Achor-she-ki! Feast my pet! Eat your fill!',10277,1,0,'omor SAY_SUMMON'),
(-1543013,'A-Kreesh!',10278,1,0,'omor SAY_CURSE'),
(-1543014,'Die, weakling!',10282,1,0,'omor SAY_KILL_1'),
(-1543015,'It is... not over.',10284,1,0,'omor SAY_DIE'),
(-1543016,'I am victorious!',10283,1,0,'omor SAY_WIPE');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1544014 AND -1544000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1544000,'Wretched, meddling insects. Release me and perhaps i will grant you a merciful death!',10247,1,0,'magtheridon SAY_TAUNT1'),
(-1544001,'Vermin! Leeches! Take my blood and choke on it!',10248,1,0,'magtheridon SAY_TAUNT2'),
(-1544002,'Illidan is an arrogant fool. I will crush him and reclaim Outland as my own.',10249,1,0,'magtheridon SAY_TAUNT3'),
(-1544003,'Away, you mindless parasites. My blood is my own!',10250,1,0,'magtheridon SAY_TAUNT4'),
(-1544004,'How long do you believe your pathetic sorcery can hold me?',10251,1,0,'magtheridon SAY_TAUNT5'),
(-1544005,'My blood will be the end of you!',10252,1,0,'magtheridon SAY_TAUNT6'),
(-1544006,'I...am...UNLEASHED!!!',10253,1,0,'magtheridon SAY_FREED'),
(-1544007,'Thank you for releasing me. Now...die!',10254,1,0,'magtheridon SAY_AGGRO'),
(-1544008,'Not again...NOT AGAIN!',10256,1,0,'magtheridon SAY_BANISH'),
(-1544009,'I will not be taken so easily. Let the walls of this prison tremble...and FALL!!!',10257,1,0,'magtheridon SAY_CHAMBER_DESTROY'),
(-1544010,'Did you think me weak? Soft? Who is the weak one now?!',10255,1,0,'magtheridon SAY_PLAYER_KILLED'),
(-1544011,'The Legion...will consume you...all...',10258,1,0,'magtheridon SAY_DEATH'),
(-1544012,'becomes enraged!',0,2,0,'magtheridon EMOTE_BERSERK'),
(-1544013,'begins to cast Blast Nova!',0,2,0,'magtheridon EMOTE_BLASTNOVA'),
(-1544014,'bonds begin to weaken!',0,2,0,'magtheridon EMOTE_BEGIN');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1565019 AND -1565000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1565000,'Gronn are the real power in outland.',11367,1,0,'maulgar SAY_AGGRO'),
(-1565001,'You will not defeat the hand of Gruul!',11368,1,0,'maulgar SAY_ENRAGE'),
(-1565002,'You won\'t kill next one so easy!',11369,1,0,'maulgar SAY_OGRE_DEATH1'),
(-1565003,'Pah! Does not prove anything!',11370,1,0,'maulgar SAY_OGRE_DEATH2'),
(-1565004,'I\'m not afraid of you.',11371,1,0,'maulgar SAY_OGRE_DEATH3'),
(-1565005,'Good, now you fight me!',11372,1,0,'maulgar SAY_OGRE_DEATH4'),
(-1565006,'You not so tough afterall!',11373,1,0,'maulgar SAY_SLAY1'),
(-1565007,'Aha-ha ha ha!',11374,1,0,'maulgar SAY_SLAY2'),
(-1565008,'Mulgar is king!',11375,1,0,'maulgar SAY_SLAY3'),
(-1565009,'Gruul... will crush you...',11376,1,0,'maulgar SAY_DEATH'),
(-1565010,'Come... and die.',11355,1,0,'gruul SAY_AGGRO'),
(-1565011,'Scurry',11356,1,0,'gruul SAY_SLAM1'),
(-1565012,'No escape',11357,1,0,'gruul SAY_SLAM2'),
(-1565013,'Stay',11358,1,0,'gruul SAY_SHATTER1'),
(-1565014,'Beg... for life',11359,1,0,'gruul SAY_SHATTER2'),
(-1565015,'No more',11360,1,0,'gruul SAY_SLAY1'),
(-1565016,'Unworthy',11361,1,0,'gruul SAY_SLAY2'),
(-1565017,'Die',11362,1,0,'gruul SAY_SLAY3'),
(-1565018,'Aaargh...',11363,1,0,'gruul SAY_DEATH'),
(-1565019,'grows in size!',0,2,0,'gruul EMOTE_GROW');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1532102 AND -1532000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1532000,'Well done Midnight!',9173,1,0,'attumen SAY_MIDNIGHT_KILL'),
(-1532001,'Cowards! Wretches!',9167,1,0,'attumen SAY_APPEAR1'),
(-1532002,'Who dares attack the steed of the Huntsman?',9298,1,0,'attumen SAY_APPEAR2'),
(-1532003,'Perhaps you would rather test yourselves against a more formidable opponent?!',9299,1,0,'attumen SAY_APPEAR3'),
(-1532004,'Come, Midnight, let\'s disperse this petty rabble!',9168,1,0,'attumen SAY_MOUNT'),
(-1532005,'It was... inevitable.',9169,1,0,'attumen SAY_KILL1'),
(-1532006,'Another trophy to add to my collection!',9300,1,0,'attumen SAY_KILL2'),
(-1532007,'Weapons are merely a convenience for a warrior of my skill!',9166,1,0,'attumen SAY_DISARMED'),
(-1532008,'I always knew... someday I would become... the hunted.',9165,1,0,'attumen SAY_DEATH'),
(-1532009,'Such easy sport.',9170,1,0,'attumen SAY_RANDOM1'),
(-1532010,'Amateurs! Do not think you can best me! I kill for a living.',9304,1,0,'attumen SAY_RANDOM2'),
(-1532011,'Hmm, unannounced visitors? Preparations must be made.',9211,1,0,'moroes SAY_AGGRO'),
(-1532012,'Now, where was I? Oh yes...',9215,1,0,'moroes SAY_SPECIAL_1'),
(-1532013,'You rang?',9316,1,0,'moroes SAY_SPECIAL_2'),
(-1532014,'One more for dinner this evening.',9214,1,0,'moroes SAY_KILL_1'),
(-1532015,'Time... Never enough time.',9314,1,0,'moroes SAY_KILL_2'),
(-1532016,'I\'ve gone and made a mess.',9315,1,0,'moroes SAY_KILL_3'),
(-1532017,'How terribly clumsy of me...',9213,1,0,'moroes SAY_DEATH'),
(-1532018,'Your behavior will not be tolerated!',9204,1,0,'maiden SAY_AGGRO'),
(-1532019,'Ah ah ah...',9207,1,0,'maiden SAY_SLAY1'),
(-1532020,'This is for the best.',9312,1,0,'maiden SAY_SLAY2'),
(-1532021,'Impure thoughts lead to profane actions.',9311,1,0,'maiden SAY_SLAY3'),
(-1532022,'Cast out your corrupt thoughts.',9313,1,0,'maiden SAY_REPENTANCE1'),
(-1532023,'Your impurity must be cleansed.',9208,1,0,'maiden SAY_REPENTANCE2'),
(-1532024,'Death comes. Will your conscience be clear?',9206,1,0,'maiden SAY_DEATH'),
(-1532025,'Oh at last, at last. I can go home.',9190,1,0,'dorothee SAY_DOROTHEE_DEATH'),
(-1532026,'Don\'t let them hurt us, Tito! Oh, you won\'t, will you?',9191,1,0,'dorothee SAY_DOROTHEE_SUMMON'),
(-1532027,'Tito, oh Tito, no!',9192,1,0,'dorothee SAY_DOROTHEE_TITO_DEATH'),
(-1532028,'Oh dear, we simply must find a way home! The old wizard could be our only hope! Strawman, Roar, Tinhead, will you... wait! Oh golly, look! We have visitors!',9195,1,0,'dorothee SAY_DOROTHEE_AGGRO'),
(-1532029,'Wanna fight? Huh? Do ya? C\'mon, I\'ll fight you with both claws behind my back!',9227,1,0,'roar SAY_ROAR_AGGRO'),
(-1532030,'You didn\'t have to go and do that.',9229,1,0,'roar SAY_ROAR_DEATH'),
(-1532031,'I think I\'m going to go take fourty winks.',9230,1,0,'roar SAY_ROAR_SLAY'),
(-1532032,'Now what should I do with you? I simply can\'t make up my mind.',9254,1,0,'strawman SAY_STRAWMAN_AGGRO'),
(-1532033,'Don\'t let them make a mattress... out of me.',9256,1,0,'strawman SAY_STRAWMAN_DEATH'),
(-1532034,'I guess I\'m not a failure after all.',9257,1,0,'strawman SAY_STRAWMAN_SLAY'),
(-1532035,'I could really use a heart. Say, can I have yours?',9268,1,0,'tinhead SAY_TINHEAD_AGGRO'),
(-1532036,'Back to being an old rustbucket.',9270,1,0,'tinhead SAY_TINHEAD_DEATH'),
(-1532037,'Guess I\'m not so rusty, after all.',9271,1,0,'tinhead SAY_TINHEAD_SLAY'),
(-1532038,'begins to rust.',0,2,0,'tinhead EMOTE_RUST'),
(-1532039,'Woe to each and every one of you my pretties! <cackles>',9179,1,0,'crone SAY_CRONE_AGGRO'),
(-1532040,'It will all be over soon! <cackles>',9307,1,0,'crone SAY_CRONE_AGGRO2'),
(-1532041,'How could you? What a cruel, cruel world!',9178,1,0,'crone SAY_CRONE_DEATH'),
(-1532042,'Fixed you, didn\'t I? <cackles>',9180,1,0,'crone SAY_CRONE_SLAY'),
(-1532043,'All the better to own you with!',9276,1,0,'wolf SAY_WOLF_AGGRO'),
(-1532044,'Mmmm... delicious.',9277,1,0,'wolf SAY_WOLF_SLAY'),
(-1532045,'Run away little girl, run away!',9278,1,0,'wolf SAY_WOLF_HOOD'),
(-1532046,'What devil art thou, that dost torment me thus?',9196,1,0,'julianne SAY_JULIANNE_AGGRO'),
(-1532047,'Where is my lord? Where is my Romulo?',9199,1,0,'julianne SAY_JULIANNE_ENTER'),
(-1532048,'Romulo, I come! Oh... this do I drink to thee!',9198,1,0,'julianne SAY_JULIANNE_DEATH01'),
(-1532049,'Where is my Lord? Where is my Romulo? Ohh, happy dagger! This is thy sheath! There rust, and let me die!',9310,1,0,'julianne SAY_JULIANNE_DEATH02'),
(-1532050,'Come, gentle night; and give me back my Romulo!',9200,1,0,'julianne SAY_JULIANNE_RESURRECT'),
(-1532051,'Parting is such sweet sorrow.',9201,1,0,'julianne SAY_JULIANNE_SLAY'),
(-1532052,'Wilt thou provoke me? Then have at thee, boy!',9233,1,0,'romulo SAY_ROMULO_AGGRO'),
(-1532053,'Thou smilest... upon the stroke that... murders me.',9235,1,0,'romulo SAY_ROMULO_DEATH'),
(-1532054,'This day\'s black fate on more days doth depend. This but begins the woe. Others must end.',9236,1,0,'romulo SAY_ROMULO_ENTER'),
(-1532055,'Thou detestable maw, thou womb of death; I enforce thy rotten jaws to open!',9237,1,0,'romulo SAY_ROMULO_RESURRECT'),
(-1532056,'How well my comfort is revived by this!',9238,1,0,'romulo SAY_ROMULO_SLAY'),
(-1532057,'The Menagerie is for guests only.',9183,1,0,'curator SAY_AGGRO'),
(-1532058,'Gallery rules will be strictly enforced.',9188,1,0,'curator SAY_SUMMON1'),
(-1532059,'This curator is equipped for gallery protection.',9309,1,0,'curator SAY_SUMMON2'),
(-1532060,'Your request cannot be processed.',9186,1,0,'curator SAY_EVOCATE'),
(-1532061,'Failure to comply will result in offensive action.',9185,1,0,'curator SAY_ENRAGE'),
(-1532062,'Do not touch the displays.',9187,1,0,'curator SAY_KILL1'),
(-1532063,'You are not a guest.',9308,1,0,'curator SAY_KILL2'),
(-1532064,'This Curator is no longer op... er... ation... al.',9184,1,0,'curator SAY_DEATH'),
(-1532065,'Your blood will anoint my circle.',9264,1,0,'terestian SAY_SLAY1'),
(-1532066,'The great one will be pleased.',9329,1,0,'terestian SAY_SLAY2'),
(-1532067,'My life, is yours. Oh great one.',9262,1,0,'terestian SAY_DEATH'),
(-1532068,'Ah, you\'re just in time. The rituals are about to begin.',9260,1,0,'terestian SAY_AGGRO'),
(-1532069,'Please, accept this humble offering, oh great one.',9263,1,0,'terestian SAY_SACRIFICE1'),
(-1532070,'Let the sacrifice serve his testament to my fealty.',9330,1,0,'terestian SAY_SACRIFICE2'),
(-1532071,'Come, you dwellers in the dark. Rally to my call!',9265,1,0,'terestian SAY_SUMMON1'),
(-1532072,'Gather, my pets. There is plenty for all.',9331,1,0,'terestian SAY_SUMMON2'),
(-1532073,'Please, no more. My son... he\'s gone mad!',9241,1,0,'aran SAY_AGGRO1'),
(-1532074,'I\'ll not be tortured again!',9323,1,0,'aran SAY_AGGRO2'),
(-1532075,'Who are you? What do you want? Stay away from me!',9324,1,0,'aran SAY_AGGRO3'),
(-1532076,'I\'ll show you this beaten dog still has some teeth!',9245,1,0,'aran SAY_FLAMEWREATH1'),
(-1532077,'Burn you hellish fiends!',9326,1,0,'aran SAY_FLAMEWREATH2'),
(-1532078,'I\'ll freeze you all!',9246,1,0,'aran SAY_BLIZZARD1'),
(-1532079,'Back to the cold dark with you!',9327,1,0,'aran SAY_BLIZZARD2'),
(-1532080,'Yes, yes, my son is quite powerful... but I have powers of my own!',9242,1,0,'aran SAY_EXPLOSION1'),
(-1532081,'I am not some simple jester! I am Nielas Aran!',9325,1,0,'aran SAY_EXPLOSION2'),
(-1532082,'Surely you would not deny an old man a replenishing drink? No, no I thought not.',9248,1,0,'aran SAY_DRINK'),
(-1532083,'I\'m not finished yet! No, I have a few more tricks up me sleeve.',9251,1,0,'aran SAY_ELEMENTALS'),
(-1532084,'I want this nightmare to be over!',9250,1,0,'aran SAY_KILL1'),
(-1532085,'Torment me no more!',9328,1,0,'aran SAY_KILL2'),
(-1532086,'You\'ve wasted enough of my time. Let these games be finished!',9247,1,0,'aran SAY_TIMEOVER'),
(-1532087,'At last... The nightmare is.. over...',9244,1,0,'aran SAY_DEATH'),
(-1532088,'Where did you get that?! Did HE send you?!',9249,1,0,'aran SAY_ATIESH'),
(-1532089,'cries out in withdrawal, opening gates to the warp.',0,2,0,'netherspite EMOTE_PHASE_PORTAL'),
(-1532090,'goes into a nether-fed rage!',0,2,0,'netherspite EMOTE_PHASE_BANISH'),
(-1532091,'Madness has brought you here to me. I shall be your undoing!',9218,1,0,'malchezaar SAY_AGGRO'),
(-1532092,'Simple fools! Time is the fire in which you\'ll burn!',9220,1,0,'malchezaar SAY_AXE_TOSS1'),
(-1532093,'I see the subtlety of conception is beyond primitives such as you.',9317,1,0,'malchezaar SAY_AXE_TOSS2'),
(-1532094,'Who knows what secrets hide in the dark.',9223,1,0,'malchezaar SAY_SPECIAL1'),
(-1532095,'The cerestial forces are mine to manipulate.',9320,1,0,'malchezaar SAY_SPECIAL2'),
(-1532096,'How can you hope to withstand against such overwhelming power?',9321,1,0,'malchezaar SAY_SPECIAL3'),
(-1532097,'Surely you did not think you could win.',9222,1,0,'malchezaar SAY_SLAY1'),
(-1532098,'Your greed, your foolishness has brought you to this end.',9318,1,0,'malchezaar SAY_SLAY2'),
(-1532099,'You are, but a plaything, unfit even to amuse.',9319,1,0,'malchezaar SAY_SLAY3'),
(-1532100,'All realities, all dimensions are open to me!',9224,1,0,'malchezaar SAY_SUMMON1'),
(-1532101,'You face not Malchezaar alone, but the legions I command!',9322,1,0,'malchezaar SAY_SUMMON2'),
(-1532102,'I refuse to concede defeat. I am a prince of the Eredar! I am...',9221,1,0,'malchezaar SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1550043 AND -1550000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1550000,'Alert, you are marked for extermination!',11213,1,0,'voidreaver SAY_AGGRO'),
(-1550001,'Extermination, successful.',11215,1,0,'voidreaver SAY_SLAY1'),
(-1550002,'Imbecile life form, no longer functional.',11216,1,0,'voidreaver SAY_SLAY2'),
(-1550003,'Threat neutralized.',11217,1,0,'voidreaver SAY_SLAY3'),
(-1550004,'Systems... shutting... down...',11214,1,0,'voidreaver SAY_DEATH'),
(-1550005,'Alternative measure commencing...',11218,1,0,'voidreaver SAY_POUNDING1'),
(-1550006,'Calculating force parameters...',11219,1,0,'voidreaver SAY_POUNDING2'),
(-1550007,'Tal anu\'men no Sin\'dorei!',11134,1,0,'solarian SAY_AGGRO'),
(-1550008,'Ha ha ha! You are hopelessly outmatched!',11139,1,0,'solarian SAY_SUMMON1'),
(-1550009,'I will crush your delusions of grandeur!',11140,1,0,'solarian SAY_SUMMON2'),
(-1550010,'Your soul belongs to the Abyss!',11136,1,0,'solarian SAY_KILL1'),
(-1550011,'By the blood of the Highborne!',11137,1,0,'solarian SAY_KILL2'),
(-1550012,'For the Sunwell!',11138,1,0,'solarian SAY_KILL3'),
(-1550013,'The warmth of the sun... awaits.',11135,1,0,'solarian SAY_DEATH'),
(-1550014,'Enough of this! Now I call upon the fury of the cosmos itself.',0,1,0,'solarian SAY_VOIDA'),
(-1550015,'I become ONE... with the VOID!',0,1,0,'solarian SAY_VOIDB'),
(-1550016,'Energy. Power. My people are addicted to it... a dependence made manifest after the Sunwell was destroyed. Welcome... to the future. A pity you are too late to stop it. No one can stop me now! Selama ashal\'anore!',11256,1,0,'kaelthas SAY_INTRO'),
(-1550017,'Capernian will see to it that your stay here is a short one.',11257,1,0,'kaelthas SAY_INTRO_CAPERNIAN'),
(-1550018,'Well done, you have proven worthy to test your skills against my master engineer, Telonicus.',11258,1,0,'kaelthas SAY_INTRO_TELONICUS'),
(-1550019,'Let us see how your nerves hold up against the Darkener, Thaladred.',11259,1,0,'kaelthas SAY_INTRO_THALADRED'),
(-1550020,'You have persevered against some of my best advisors... but none can withstand the might of the Blood Hammer. Behold, Lord Sanguinar!',11260,1,0,'kaelthas SAY_INTRO_SANGUINAR'),
(-1550021,'As you see, I have many weapons in my arsenal...',11261,1,0,'kaelthas SAY_PHASE2_WEAPON'),
(-1550022,'Perhaps I underestimated you. It would be unfair to make you fight all four advisors at once, but... fair treatment was never shown to my people. I\'m just returning the favor.',11262,1,0,'kaelthas SAY_PHASE3_ADVANCE'),
(-1550023,'Alas, sometimes one must take matters into one\'s own hands. Balamore shanal!',11263,1,0,'kaelthas SAY_PHASE4_INTRO2'),
(-1550024,'I have not come this far to be stopped! The future I have planned will not be jeopardized! Now you will taste true power!!',11273,1,0,'kaelthas SAY_PHASE5_NUTS'),
(-1550025,'You will not prevail.',11270,1,0,'kaelthas SAY_SLAY1'),
(-1550026,'You gambled...and lost.',11271,1,0,'kaelthas SAY_SLAY2'),
(-1550027,'This was Child\'s play.',11272,1,0,'kaelthas SAY_SLAY3'),
(-1550028,'Obey me.',11268,1,0,'kaelthas SAY_MINDCONTROL1'),
(-1550029,'Bow to my will.',11269,1,0,'kaelthas SAY_MINDCONTROL2'),
(-1550030,'Let us see how you fare when your world is turned upside down.',11264,1,0,'kaelthas SAY_GRAVITYLAPSE1'),
(-1550031,'Having trouble staying grounded?',11265,1,0,'kaelthas SAY_GRAVITYLAPSE2'),
(-1550032,'Anara\'nel belore!',11267,1,0,'kaelthas SAY_SUMMON_PHOENIX1'),
(-1550033,'By the power of the sun!',11266,1,0,'kaelthas SAY_SUMMON_PHOENIX2'),
(-1550034,'For...Quel...thalas!',11274,1,0,'kaelthas SAY_DEATH'),
(-1550035,'Prepare yourselves!',11203,1,0,'thaladred SAY_THALADRED_AGGRO'),
(-1550036,'Forgive me, my prince! I have... failed.',11204,1,0,'thaladred SAY_THALADRED_DEATH'),
(-1550037,'sets his gaze on $N!',0,2,0,'thaladred EMOTE_THALADRED_GAZE'),
(-1550038,'Blood for blood!',11152,1,0,'sanguinar SAY_SANGUINAR_AGGRO'),
(-1550039,'NO! I ...will... not...',11153,1,0,'sanguinar SAY_SANGUINAR_DEATH'),
(-1550040,'The sin\'dore reign supreme!',11117,1,0,'capernian SAY_CAPERNIAN_AGGRO'),
(-1550041,'This is not over!',11118,1,0,'capernian SAY_CAPERNIAN_DEATH'),
(-1550042,'Anar\'alah belore!',11157,1,0,'telonicus SAY_TELONICUS_AGGRO'),
(-1550043,'More perils... await',11158,1,0,'telonicus SAY_TELONICUS_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1553012 AND -1553000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1553000,'What are you doing? These specimens are very delicate!',11144,1,0,'freywinn SAY_AGGRO'),
(-1553001,'Your life cycle is now concluded!',11145,1,0,'freywinn SAY_KILL_1'),
(-1553002,'You will feed the worms.',11146,1,0,'freywinn SAY_KILL_2'),
(-1553003,'Endorel aluminor!',11147,1,0,'freywinn SAY_TREE_1'),
(-1553004,'Nature bends to my will!',11148,1,0,'freywinn SAY_TREE_2'),
(-1553005,'The specimens...must be preserved.',11149,1,0,'freywinn SAY_DEATH'),
(-1553006,'emits a strange noise.',0,2,0,'laj EMOTE_SUMMON'),
(-1553007,'Who disturbs this sanctuary?',11230,1,0,'warp SAY_AGGRO'),
(-1553008,'You must die! But wait: this does not--No, no... you must die!',11231,1,0,'warp SAY_SLAY_1'),
(-1553009,'What am I doing? Why do I...',11232,1,0,'warp SAY_SLAY_2'),
(-1553010,'Children, come to me!',11233,1,0,'warp SAY_SUMMON_1'),
(-1553011,'Maybe this is not--No, we fight! Come to my aid.',11234,1,0,'warp SAY_SUMMON_2'),
(-1553012,'So... confused. Do not... belong here!',11235,1,0,'warp SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1554027 AND -1554000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1554000,'I predict a painful death.',11101,1,0,'gyro SAY_AGGRO'),
(-1554001,'Measure twice; cut once!',11104,1,0,'gyro SAY_SAW_ATTACK1'),
(-1554002,'If my division is correct, you should be quite dead.',11105,1,0,'gyro SAY_SAW_ATTACK2'),
(-1554003,'Your strategy was flawed!',11102,1,0,'gyro SAY_SLAY1'),
(-1554004,'Yes, the only logical outcome.',11103,1,0,'gyro SAY_SLAY2'),
(-1554005,'An unforseen... contingency',11106,1,0,'gyro SAY_DEATH'),
(-1554006,'You have approximately five seconds to live.',11109,1,0,'ironhand SAY_AGGRO_1'),
(-1554007,'With the precise angle and velocity...',11112,1,0,'ironhand SAY_HAMMER_1'),
(-1554008,'Low tech yet quiet effective!',11113,1,0,'ironhand SAY_HAMMER_2'),
(-1554009,'A foregone conclusion.',11110,1,0,'ironhand SAY_SLAY_1'),
(-1554010,'The processing will continue a schedule!',11111,1,0,'ironhand SAY_SLAY_2'),
(-1554011,'My calculations did not...',11114,1,0,'ironhand SAY_DEATH_1'),
(-1554012,'raises his hammer menacingly...',0,3,0,'ironhand EMOTE_HAMMER'),
(-1554013,'Don\'t value your life very much, do you?',11186,1,0,'sepethrea SAY_AGGRO'),
(-1554014,'I am not alone.',11191,1,0,'sepethrea SAY_SUMMON'),
(-1554015,'Think you can take the heat?',11189,1,0,'sepethrea SAY_DRAGONS_BREATH_1'),
(-1554016,'Anar\'endal dracon!',11190,1,0,'sepethrea SAY_DRAGONS_BREATH_2'),
(-1554017,'And don\'t come back!',11187,1,0,'sepethrea SAY_SLAY1'),
(-1554018,'En\'dala finel el\'dal',11188,1,0,'sepethrea SAY_SLAY2'),
(-1554019,'Anu... bala belore...alon.',11192,1,0,'sepethrea SAY_DEATH'),
(-1554020,'We are on a strict timetable. You will not interfere!',11193,1,0,'pathaleon SAY_AGGRO'),
(-1554021,'I\'m looking for a team player...',11197,1,0,'pathaleon SAY_DOMINATION_1'),
(-1554022,'You work for me now!',11198,1,0,'pathaleon SAY_DOMINATION_2'),
(-1554023,'Time to supplement my work force.',11196,1,0,'pathaleon SAY_SUMMON'),
(-1554024,'I prefeer to be hands-on...',11199,1,0,'pathaleon SAY_ENRAGE'),
(-1554025,'A minor inconvenience.',11194,1,0,'pathaleon SAY_SLAY_1'),
(-1554026,'Looks like you lose.',11195,1,0,'pathaleon SAY_SLAY_2'),
(-1554027,'The project will... continue.',11200,1,0,'pathaleon SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1585029 AND -1585000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1585000,'You only waste my time!',12378,1,0,'selin SAY_AGGRO'),
(-1585001,'My hunger knows no bounds!',12381,1,0,'selin SAY_ENERGY'),
(-1585002,'Yes! I am a god!',12382,1,0,'selin SAY_EMPOWERED'),
(-1585003,'Enough distractions!',12388,1,0,'selin SAY_KILL_1'),
(-1585004,'I am invincible!',12385,1,0,'selin SAY_KILL_2'),
(-1585005,'No! More... I must have more!',12383,1,0,'selin SAY_DEATH'),
(-1585006,'begins to channel from the nearby Fel Crystal...',0,3,0,'selin EMOTE_CRYSTAL'),
(-1585007,'Drain...life!',12389,1,0,'vexallus SAY_AGGRO'),
(-1585008,'Un...con...tainable.',12392,1,0,'vexallus SAY_ENERGY'),
(-1585009,'Un...leash...',12390,1,0,'vexallus SAY_OVERLOAD'),
(-1585010,'Con...sume.',12393,1,0,'vexallus SAY_KILL'),
(-1585011,'discharges pure energy!',0,3,0,'vexallus EMOTE_DISCHARGE_ENERGY'),
(-1585012,'Annihilate them!',12395,1,0,'delrissa SAY_AGGRO'),
(-1585013,'Oh, the horror.',12398,1,0,'delrissa LackeyDeath1'),
(-1585014,'Well, aren\'t you lucky?',12400,1,0,'delrissa LackeyDeath2'),
(-1585015,'Now I\'m getting annoyed.',12401,1,0,'delrissa LackeyDeath3'),
(-1585016,'Lackies be damned! I\'ll finish you myself!',12403,1,0,'delrissa LackeyDeath4'),
(-1585017,'I call that a good start.',12405,1,0,'delrissa PlayerDeath1'),
(-1585018,'I could have sworn there were more of you.',12407,1,0,'delrissa PlayerDeath2'),
(-1585019,'Not really much of a group, anymore, is it?',12409,1,0,'delrissa PlayerDeath3'),
(-1585020,'One is such a lonely number.',12410,1,0,'delrissa PlayerDeath4'),
(-1585021,'It\'s been a kick, really.',12411,1,0,'delrissa PlayerDeath5'),
(-1585022,'Not what I had... planned...',12397,1,0,'delrissa SAY_DEATH'),
(-1585023,'Don\'t look so smug! I know what you\'re thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Oh no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this, and this time, you will not interfere!',12413,1,0,'kaelthas MT SAY_AGGRO'),
(-1585024,'Vengeance burns!',12415,1,0,'kaelthas MT SAY_PHOENIX'),
(-1585025,'Felomin ashal!',12417,1,0,'kaelthas MT SAY_FLAMESTRIKE'),
(-1585026,'I\'ll turn your world... upside... down...',12418,1,0,'kaelthas MT SAY_GRAVITY_LAPSE'),
(-1585027,'Master... grant me strength.',12419,1,0,'kaelthas MT SAY_TIRED'),
(-1585028,'Do not... get too comfortable.',12420,1,0,'kaelthas MT SAY_RECAST_GRAVITY'),
(-1585029,'My demise accomplishes nothing! The Master will have you! You will drown in your own blood! This world shall burn! Aaaghh!',12421,1,0,'kaelthas MT SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1580035 AND -1580000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1580000,'Aggh! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!',12422,1,0,'kalecgos SAY_EVIL_AGGRO'),
(-1580001,'I will purge you!',12423,1,0,'kalecgos SAY_EVIL_SPELL1'),
(-1580002,'Your pain has only begun!',12424,1,0,'kalecgos SAY_EVIL_SPELL2'),
(-1580003,'In the name of Kil\'jaeden!',12425,1,0,'kalecgos SAY_EVIL_SLAY1'),
(-1580004,'You were warned!',12426,1,0,'kalecgos SAY_EVIL_SLAY2'),
(-1580005,'My awakening is complete! You shall all perish!',12427,1,0,'kalecgos SAY_EVIL_ENRAGE'),
(-1580006,'I need... your help... Cannot... resist him... much longer...',12428,1,0,'kalecgos humanoid SAY_GOOD_AGGRO'),
(-1580007,'Aaahhh! Help me, before I lose my mind!',12429,1,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH'),
(-1580008,'Hurry! There is not much of me left!',12430,1,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH2'),
(-1580009,'I am forever in your debt. Once we have triumphed over Kil\'jaeden, this entire world will be in your debt as well.',12431,1,0,'kalecgos humanoid SAY_GOOD_PLRWIN'),
(-1580010,'There will be no reprieve. My work here is nearly finished.',12451,1,0,'sathrovarr SAY_SATH_AGGRO'),
(-1580011,'I\'m... never on... the losing... side...',12452,1,0,'sathrovarr SAY_SATH_DEATH'),
(-1580012,'Your misery is my delight!',12453,1,0,'sathrovarr SAY_SATH_SPELL1'),
(-1580013,'I will watch you bleed!',12454,1,0,'sathrovarr SAY_SATH_SPELL2'),
(-1580014,'Pitious mortal!',12455,1,0,'sathrovarr SAY_SATH_SLAY1'),
(-1580015,'Haven\'t you heard? I always win!',12456,1,0,'sathrovarr SAY_SATH_SLAY2'),
(-1580016,'I have toyed with you long enough!',12457,1,0,'sathrovarr SAY_SATH_ENRAGE'),
(-1580017,'Puny lizard! Death is the only answer you\'ll find here!',12458,1,0,'brutallus YELL_INTRO'),
(-1580018,'Grah! Your magic is weak!',12459,1,0,'brutallus YELL_INTRO_BREAK_ICE'),
(-1580019,'I will crush you!',12460,1,0,'brutallus YELL_INTRO_CHARGE'),
(-1580020,'That was fun.',12461,1,0,'brutallus YELL_INTRO_KILL_MADRIGOSA'),
(-1580021,'Come, try your luck!',12462,1,0,'brutallus YELL_INTRO_TAUNT'),
(-1580022,'Ahh! More lambs to the slaughter!',12463,1,0,'brutallus YELL_AGGRO'),
(-1580023,'Perish, insect!',12464,1,0,'brutallus YELL_KILL1'),
(-1580024,'You are meat!',12465,1,0,'brutallus YELL_KILL2'),
(-1580025,'Too easy!',12466,1,0,'brutallus YELL_KILL3'),
(-1580026,'Bring the fight to me!',12467,1,0,'brutallus YELL_LOVE1'),
(-1580027,'Another day, another glorious battle!',12468,1,0,'brutallus YELL_LOVE2'),
(-1580028,'I live for this!',12469,1,0,'brutallus YELL_LOVE3'),
(-1580029,'So much for a real challenge... Die!',12470,1,0,'brutallus YELL_BERSERK'),
(-1580030,'Gah! Well done... Now... this gets... interesting...',12471,1,0,'brutallus YELL_DEATH'),
(-1580031,'Hold, friends! There is information to be had before this devil meets his fate!',12472,1,0,'madrigosa YELL_MADR_ICE_BARRIER'),
(-1580032,'Where is Anveena, demon? What has become of Kalec?',12473,1,0,'madrigosa YELL_MADR_INTRO'),
(-1580033,'You will tell me where they are!',12474,1,0,'madrigosa YELL_MADR_ICE_BLOCK'),
(-1580034,'Speak, I grow weary of asking!',12475,1,0,'madrigosa YELL_MADR_TRAP'),
(-1580035,'Malygos, my lord! I did my best!',12476,1,0,'madrigosa YELL_MADR_DEATH');

DELETE FROM `script_texts` WHERE `entry`=-1033000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1033000,'Thanks for freeing me, I\'ll open this door for you, then I will get out of here.',0,0,0,'shadowfang_prisoner SAY_FREE');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1309023 AND -1309000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1309000,'Let the coils of hate unfurl!',8421,1,0,'venoxis SAY_TRANSFORM'),
(-1309001,'Ssserenity..at lassst!',0,1,0,'venoxis SAY_DEATH'),
(-1309002,'Lord Hir\'eek, grant me wings of vengance!',8417,1,0,'jeklik SAY_AGGRO'),
(-1309003,'I command you to rain fire down upon these invaders!',0,1,0,'jeklik SAY_RAIN_FIRE'),
(-1309004,'Finally ...death. Curse you Hakkar! Curse you!',8422,1,0,'jeklik SAY_DEATH'),
(-1309005,'Draw me to your web mistress Shadra. Unleash your venom!',8418,1,0,'marli SAY_AGGRO'),
(-1309006,'Shadra, make of me your avatar!',0,1,0,'marli SAY_TRANSFORM'),
(-1309007,'Aid me my brood!',0,1,0,'marli SAY_SPIDER_SPAWN'),
(-1309008,'Bless you mortal for this release. Hakkar controls me no longer...',8423,1,0,'marli SAY_DEATH'),
(-1309009,'Shirvallah, fill me with your RAGE!',8419,1,0,'thekal SAY_AGGRO'),
(-1309010,'Hakkar binds me no more! Peace at last!',8424,1,0,'thekal SAY_DEATH'),
(-1309011,'Bethekk, your priestess calls upon your might!',8416,1,0,'arlokk SAY_AGGRO'),
(-1309012,'Feast on $n, my pretties!',0,1,0,'arlokk SAY_FEAST_PANTHER'),
(-1309013,'At last, I am free of the Soulflayer!',8412,1,0,'arlokk SAY_DEATH'),
(-1309014,'Welcome to da great show friends! Step right up to die!',8425,1,0,'jindo SAY_AGGRO'),
(-1309015,'I\'ll feed your souls to Hakkar himself!',8413,1,0,'mandokir SAY_AGGRO'),
(-1309016,'DING!',0,1,0,'mandokir SAY_DING_KILL'),
(-1309017,'GRATS!',0,1,0,'mandokir SAY_GRATS_JINDO'),
(-1309018,'I\'m keeping my eye on you, $N!',0,1,0,'mandokir SAY_WATCH'),
(-1309019,'Don\'t make me angry. You won\'t like it when I\'m angry.',0,1,0,'mandokir SAY_WATCH_WHISPER'),
(-1309020,'PRIDE HERALDS THE END OF YOUR WORLD. COME, MORTALS! FACE THE WRATH OF THE SOULFLAYER!',8414,1,0,'hakkar SAY_AGGRO'),
(-1309021,'Fleeing will do you no good, mortals!',0,1,0,'hakkar SAY_FLEEING'),
(-1309022,'You dare set foot upon Hakkari holy ground? Minions of Hakkar, destroy the infidels!',0,1,0,'hakkar SAY_MINION_DESTROY'),
(-1309023,'Minions of Hakkar, hear your God. The sanctity of this temple has been compromised. Invaders encroach upon holy ground! The Altar of Blood must be protected. Kill them all!',0,1,0,'hakkar SAY_PROTECT_ALTAR');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1568023 AND -1568000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1568000,'Spirits of da wind be your doom!',12031,1,0,'janalai SAY_AGGRO'),
(-1568001,'I burn ya now!',12032,1,0,'janalai SAY_FIRE_BOMBS'),
(-1568002,'Where ma hatcha? Get to work on dem eggs!',12033,1,0,'janalai SAY_SUMMON_HATCHER'),
(-1568003,'I show you strength... in numbers.',12034,1,0,'janalai SAY_ALL_EGGS'),
(-1568004,'You done run outta time!',12035,1,0,'janalai SAY_BERSERK'),
(-1568005,'It all be over now, mon!',12036,1,0,'janalai SAY_SLAY_1'),
(-1568006,'Tazaga-choo!',12037,1,0,'janalai SAY_SLAY_2'),
(-1568007,'Zul\'jin... got a surprise for you...',12038,1,0,'janalai SAY_DEATH'),
(-1568008,'Come, strangers. The spirit of the dragonhawk hot be hungry for worthy souls.',12039,1,0,'janalai SAY_EVENT_STRANGERS'),
(-1568009,'Come, friends. Your bodies gonna feed ma hatchlings, and your souls are going to feed me with power!',12040,1,0,'janalai SAY_EVENT_FRIENDS'),
(-1568010,'Get da move on, guards! It be killin\' time!',12066,1,0,'nalorakk SAY_WAVE1_AGGRO'),
(-1568011,'Guards, go already! Who you more afraid of, dem... or me?',12067,1,0,'nalorakk SAY_WAVE2_STAIR1'),
(-1568012,'Ride now! Ride out dere and bring me back some heads!',12068,1,0,'nalorakk SAY_WAVE3_STAIR2'),
(-1568013,'I be losin\' me patience! Go on: make dem wish dey was never born!',12069,1,0,'nalorakk SAY_WAVE4_PLATFORM'),
(-1568014,'What could be better than servin\' da bear spirit for eternity? Come closer now. Bring your souls to me!',12078,1,0,'nalorakk SAY_EVENT1_SACRIFICE'),
(-1568015,'Don\'t be delayin\' your fate. Come to me now. I make your sacrifice quick.',12079,1,0,'nalorakk SAY_EVENT2_SACRIFICE'),
(-1568016,'You be dead soon enough!',12070,1,0,'nalorakk SAY_AGGRO'),
(-1568017,'I bring da pain!',12071,1,0,'nalorakk SAY_SURGE'),
(-1568018,'You call on da beast, you gonna get more dan you bargain for!',12072,1,0,'nalorakk SAY_TOBEAR'),
(-1568019,'Make way for Nalorakk!',12073,1,0,'nalorakk SAY_TOTROLL'),
(-1568020,'You had your chance, now it be too late!',12074,1,0,'nalorakk SAY_BERSERK'),
(-1568021,'Mua-ha-ha! Now whatchoo got to say?',12075,1,0,'nalorakk SAY_SLAY1'),
(-1568022,'Da Amani gonna rule again!',12076,1,0,'nalorakk SAY_SLAY2'),
(-1568023,'I... be waitin\' on da udda side....',12077,1,0,'nalorakk SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1509027 AND -1509000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1509000,'senses your fear.',0,2,0,'moam EMOTE_AGGRO'),
(-1509001,'bristles with energy!',0,2,0,'moan EMOTE_MANA_FULL'),
(-1509002,'sets eyes on $N!',0,2,0,'buru EMOTE_TARGET'),
(-1509003,'They come now. Try not to get yourself killed, young blood.',0,1,0,'andorov SAY_ANDOROV_INTRO'),
(-1509004,'Remember, Rajaxx, when I said I\'d kill you last? I lied...',0,1,0,'andorov SAY_ANDOROV_ATTACK'),
(-1509005,'The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!',8612,1,0,'rajaxx SAY_WAVE3'),
(-1509006,'No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!',8610,1,0,'rajaxx SAY_WAVE4'),
(-1509007,'Fear is for the enemy! Fear and death!',8608,1,0,'rajaxx SAY_WAVE5'),
(-1509008,'Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!',8611,1,0,'rajaxx SAY_WAVE6'),
(-1509009,'Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!',8607,1,0,'rajaxx SAY_WAVE7'),
(-1509010,'Impudent fool! I will kill you myself!',8609,1,0,'rajaxx SAY_INTRO'),
(-1509011,'Attack and make them pay dearly!',8603,1,0,'rajaxx SAY_UNK1'),
(-1509012,'Crush them! Drive them out!',8605,1,0,'rajaxx SAY_UNK2'),
(-1509013,'Do not hesitate! Destroy them!',8606,1,0,'rajaxx SAY_UNK3'),
(-1509014,'Warriors! Captains! Continue the fight!',8613,1,0,'rajaxx SAY_UNK4'),
(-1509015,'You are not worth my time $N!',8614,1,0,'rajaxx SAY_DEAGGRO'),
(-1509016,'Breath your last!',8604,1,0,'rajaxx SAY_KILLS_ANDOROV'),
(-1509017,'Soon you will know the price of your meddling, mortals... The master is nearly whole... And when he rises, your world will be cease!',0,1,0,'rajaxx SAY_COMPLETE_QUEST'),
(-1509018,'I am rejuvinated!',8593,1,0,'ossirian SAY_SURPREME1'),
(-1509019,'My powers are renewed!',8595,1,0,'ossirian SAY_SURPREME2'),
(-1509020,'My powers return!',8596,1,0,'ossirian SAY_SURPREME3'),
(-1509021,'Protect the city at all costs!',8597,1,0,'ossirian SAY_RAND_INTRO1'),
(-1509022,'The walls have been breached!',8599,1,0,'ossirian SAY_RAND_INTRO2'),
(-1509023,'To your posts. Defend the city.',8600,1,0,'ossirian SAY_RAND_INTRO3'),
(-1509024,'Tresspassers will be terminated.',8601,1,0,'ossirian SAY_RAND_INTRO4'),
(-1509025,'Sands of the desert rise and block out the sun!',8598,1,0,'ossirian SAY_AGGRO'),
(-1509026,'You are terminated.',8602,1,0,'ossirian SAY_SLAY'),
(-1509027,'I...have...failed.',8594,1,0,'ossirian SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1531011 AND -1531000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1531000,'Are you so eager to die? I would be happy to accomodate you.',8615,1,0,'skeram SAY_AGGRO1'),
(-1531001,'Cower mortals! The age of darkness is at hand.',8616,1,0,'skeram SAY_AGGRO2'),
(-1531002,'Tremble! The end is upon you.',8621,1,0,'skeram SAY_AGGRO3'),
(-1531003,'Let your death serve as an example!',8617,1,0,'skeram SAY_SLAY1'),
(-1531004,'Spineless wretches! You will drown in rivers of blood!',8619,1,0,'skeram SAY_SLAY2'),
(-1531005,'The screams of the dying will fill the air. A symphony of terror is about to begin!',8620,1,0,'skeram SAY_SLAY3'),
(-1531006,'Prepare for the return of the ancient ones!',8618,1,0,'skeram SAY_SPLIT'),
(-1531007,'You only delay... the inevetable.',8622,1,0,'skeram SAY_DEATH'),
(-1531008,'You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!',8646,1,0,'sartura SAY_AGGRO'),
(-1531009,'I sentence you to death!',8647,1,0,'sartura SAY_SLAY'),
(-1531010,'I serve to the last!',8648,1,0,'sartura SAY_DEATH'),
(-1531011,'is weakened!',0,2,0,'cthun EMOTE_WEAKENED');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1509027 AND -1509018;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1509018,'I am rejuvinated!',8593,1,0,'ossirian SAY_SURPREME1'),
(-1509019,'My powers are renewed!',8595,1,0,'ossirian SAY_SURPREME2'),
(-1509020,'My powers return!',8596,1,0,'ossirian SAY_SURPREME3'),
(-1509021,'Protect the city at all costs!',8597,1,0,'ossirian SAY_RAND_INTRO1'),
(-1509022,'The walls have been breached!',8599,1,0,'ossirian SAY_RAND_INTRO2'),
(-1509023,'To your posts. Defend the city.',8600,1,0,'ossirian SAY_RAND_INTRO3'),
(-1509024,'Tresspassers will be terminated.',8601,1,0,'ossirian SAY_RAND_INTRO4'),
(-1509025,'Sands of the desert rise and block out the sun!',8598,1,0,'ossirian SAY_AGGRO'),
(-1509026,'You are terminated.',8602,1,0,'ossirian SAY_SLAY'),
(-1509027,'I...have...failed.',8594,1,0,'ossirian SAY_DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1564096 AND -1564000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1564000,'You will die in the name of Lady Vashj!',11450,1,0,'SAY_AGGRO'),
(-1564001,'Stick around!',11451,1,0,'SAY_NEEDLE1'),
(-1564002,'I\'ll deal with you later!',11452,1,0,'SAY_NEEDLE2'),
(-1564003,'Your success was short lived!',11455,1,0,'SAY_SLAY1'),
(-1564004,'Time for you to go!',11456,1,0,'SAY_SLAY2'),
(-1564005,'Bel\'anen dal\'lorei!',11453,1,0,'SAY_SPECIAL1'),
(-1564006,'Blood will flow!',11454,1,0,'SAY_SPECIAL2'),
(-1564007,'Bal\'amer ch\'itah!',11457,1,0,'SAY_ENRAGE1'),
(-1564008,'My patience has ran out! Die, DIE!',11458,1,0,'SAY_ENRAGE2'),
(-1564009,'Lord Illidan will... crush you.',11459,1,0,'SAY_DEATH'),
(-1564010,'%s acquires a new target!',0,3,0,'supremus EMOTE_NEW_TARGET'),
(-1564011,'%s punches the ground in anger!',0,3,0,'supremus EMOTE_PUNCH_GROUND'),
(-1564012,'The ground begins to crack open!',0,3,0,'supremus EMOTE_GROUND_CRACK'),
(-1564013,'No! Not yet...',11385,1,0,'akama shade SAY_LOW_HEALTH'),
(-1564014,'I will not last much longer...',11386,1,0,'akama shade SAY_DEATH'),
(-1564015,'Come out from the shadows! I\'ve returned to lead you against our true enemy! Shed your chains and raise your weapons against your Illidari masters!',0,1,0,'akama shade SAY_FREE'),
(-1564016,'Hail our leader! Hail Akama!',0,1,0,'akama shade broken SAY_BROKEN_FREE_01'),
(-1564017,'Hail Akama!',0,1,0,'akama shade broken SAY_BROKEN_FREE_02'),
(-1564018,'You play, you pay.',11501,1,0,'shahraz SAY_TAUNT1'),
(-1564019,'I\'m not impressed.',11502,1,0,'shahraz SAY_TAUNT2'),
(-1564020,'Enjoying yourselves?',11503,1,0,'shahraz SAY_TAUNT3'),
(-1564021,'So... business or pleasure?',11504,1,0,'shahraz SAY_AGGRO'),
(-1564022,'You seem a little tense.',11505,1,0,'shahraz SAY_SPELL1'),
(-1564023,'Don\'t be shy.',11506,1,0,'shahraz SAY_SPELL2'),
(-1564024,'I\'m all... yours.',11507,1,0,'shahraz SAY_SPELL3'),
(-1564025,'Easy come, easy go.',11508,1,0,'shahraz SAY_SLAY1'),
(-1564026,'So much for a happy ending.',11509,1,0,'shahraz SAY_SLAY2'),
(-1564027,'Stop toying with my emotions!',11510,1,0,'shahraz SAY_ENRAGE'),
(-1564028,'I wasn\'t... finished.',11511,1,0,'shahraz SAY_DEATH'),
(-1564029,'Horde will... crush you.',11432,1,0,'bloodboil SOUND_AGGRO'),
(-1564030,'Time to feast!',11433,1,0,'bloodboil SAY_SLAY1'),
(-1564031,'More! I want more!',11434,1,0,'bloodboil SAY_SLAY2'),
(-1564032,'Drink your blood! Eat your flesh!',11435,1,0,'bloodboil SAY_SPECIAL1'),
(-1564033,'I hunger!',11436,1,0,'bloodboil SAY_SPECIAL2'),
(-1564034,'<babbling>',11437,1,0,'bloodboil SAY_ENRAGE1'),
(-1564035,'I\'ll rip the meat from your bones!',11438,1,0,'bloodboil SAY_ENRAGE2'),
(-1564036,'Aaaahrg...',11439,1,0,'bloodboil SAY_DEATH'),
(-1564037,'I was the first, you know. For me, the wheel of death has spun many times. <laughs> So much time has passed. I have a lot of catching up to do...',11512,1,0,'teron SAY_INTRO'),
(-1564038,'Vengeance is mine!',11513,1,0,'teron SAY_AGGRO'),
(-1564039,'I have use for you!',11514,1,0,'teron SAY_SLAY1'),
(-1564040,'It gets worse...',11515,1,0,'teron SAY_SLAY2'),
(-1564041,'What are you afraid of?',11517,1,0,'teron SAY_SPELL1'),
(-1564042,'Death... really isn\'t so bad.',11516,1,0,'teron SAY_SPELL2'),
(-1564043,'Give in!',11518,1,0,'teron SAY_SPECIAL1'),
(-1564044,'I have something for you...',11519,1,0,'teron SAY_SPECIAL2'),
(-1564045,'YOU WILL SHOW THE PROPER RESPECT!',11520,1,0,'teron SAY_ENRAGE'),
(-1564046,'The wheel...spins...again....',11521,1,0,'teron SAY_DEATH'),
(-1564047,'Pain and suffering are all that await you!',11415,1,0,'essence SUFF_SAY_FREED'),
(-1564048,'Don\'t leave me alone!',11416,1,0,'essence SUFF_SAY_AGGRO'),
(-1564049,'Look at what you make me do!',11417,1,0,'essence SUFF_SAY_SLAY1'),
(-1564050,'I didn\'t ask for this!',11418,1,0,'essence SUFF_SAY_SLAY2'),
(-1564051,'The pain is only beginning!',11419,1,0,'essence SUFF_SAY_SLAY3'),
(-1564052,'I don\'t want to go back!',11420,1,0,'essence SUFF_SAY_RECAP'),
(-1564053,'Now what do I do?',11421,1,0,'essence SUFF_SAY_AFTER'),
(-1564054,'%s becomes enraged!',0,3,0,'essence SUFF_EMOTE_ENRAGE'),
(-1564055,'You can have anything you desire... for a price.',11408,1,0,'essence DESI_SAY_FREED'),
(-1564056,'Fulfilment is at hand!',11409,1,0,'essence DESI_SAY_SLAY1'),
(-1564057,'Yes... you\'ll stay with us now...',11410,1,0,'essence DESI_SAY_SLAY2'),
(-1564058,'Your reach exceeds your grasp.',11412,1,0,'essence DESI_SAY_SLAY3'),
(-1564059,'Be careful what you wish for...',11411,1,0,'essence DESI_SAY_SPEC'),
(-1564060,'I\'ll be waiting...',11413,1,0,'essence DESI_SAY_RECAP'),
(-1564061,'I won\'t be far...',11414,1,0,'essence DESI_SAY_AFTER'),
(-1564062,'Beware: I live!',11399,1,0,'essence ANGER_SAY_FREED'),
(-1564063,'So... foolish.',11400,1,0,'essence ANGER_SAY_FREED2'),
(-1564064,'<maniacal cackle>',11401,1,0,'essence ANGER_SAY_SLAY1'),
(-1564065,'Enough. No more.',11402,1,0,'essence ANGER_SAY_SLAY2'),
(-1564066,'On your knees!',11403,1,0,'essence ANGER_SAY_SPEC'),
(-1564067,'Beware, coward.',11405,1,0,'essence ANGER_SAY_BEFORE'),
(-1564068,'I won\'t... be... ignored.',11404,1,0,'essence ANGER_SAY_DEATH'),
(-1564069,'You wish to test me?',11524,1,0,'council vera AGGRO'),
(-1564070,'I have better things to do...',11422,1,0,'council gath AGGRO'),
(-1564071,'Flee or die!',11482,1,0,'council mala AGGRO'),
(-1564072,'Common... such a crude language. Bandal!',11440,1,0,'council zere AGGRO'),
(-1564073,'Enough games!',11428,1,0,'council gath ENRAGE'),
(-1564074,'You wish to kill me? Hahaha, you first!',11530,1,0,'council vera ENRAGE'),
(-1564075,'For Quel\'Thalas! For the Sunwell!',11488,1,0,'council mala ENRAGE'),
(-1564076,'Sha\'amoor sine menoor!',11446,1,0,'council zere ENRAGE'),
(-1564077,'Enjoy your final moments!',11426,1,0,'council gath SPECIAL1'),
(-1564078,'You\'re not caught up for this!',11528,1,0,'council vera SPECIAL1'),
(-1564079,'No second chances!',11486,1,0,'council mala SPECIAL1'),
(-1564080,'Diel fin\'al',11444,1,0,'council zere SPECIAL1'),
(-1564081,'You are mine!',11427,1,0,'council gath SPECIAL2'),
(-1564082,'Anar\'alah belore!',11529,1,0,'council vera SPECIAL2'),
(-1564083,'I\'m full of surprises!',11487,1,0,'council mala SPECIAL2'),
(-1564084,'Sha\'amoor ara mashal?',11445,1,0,'council zere SPECIAL2'),
(-1564085,'Selama am\'oronor!',11423,1,0,'council gath SLAY'),
(-1564086,'Valiant effort!',11525,1,0,'council vera SLAY'),
(-1564087,'My work is done.',11483,1,0,'council mala SLAY'),
(-1564088,'Shorel\'aran.',11441,1,0,'council zere SLAY'),
(-1564089,'Well done!',11424,1,0,'council gath SLAY_COMT'),
(-1564090,'A glorious kill!',11526,1,0,'council vera SLAY_COMT'),
(-1564091,'As it should be!',11484,1,0,'council mala SLAY_COMT'),
(-1564092,'Belesa menoor!',11442,1,0,'council zere SLAY_COMT'),
(-1564093,'Lord Illidan... I...',11425,1,0,'council gath DEATH'),
(-1564094,'You got lucky!',11527,1,0,'council vera DEATH'),
(-1564095,'Destiny... awaits.',11485,1,0,'council mala DEATH'),
(-1564096,'Diel ma\'ahn... oreindel\'o',11443,1,0,'council zere DEATH');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1409018 AND -1409000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1409000,'performs one last service for Ragnaros.',0,2,0,'geddon EMOTE_SERVICE'),
(-1409001,'goes into a killing frenzy!',0,2,0,'magmadar EMOTE_FRENZY'),
(-1409002,'refuses to die while its master is in trouble.',0,2,0,'core rager EMOTE_AEGIS'),
(-1409003,'Reckless mortals, none may challenge the sons of the living flame!',8035,1,0,'majordomo SAY_AGGRO'),
(-1409004,'The runes of warding have been destroyed! Hunt down the infedels my bretheren.',8039,1,0,'majordomo SAY_SPAWN'),
(-1409005,'Ashes to Ashes!',8037,1,0,'majordomo SAY_SLAY'),
(-1409006,'Burn mortals! Burn for this transgression!',8036,1,0,'majordomo SAY_SPECIAL'),
(-1409007,'Impossible! Stay your attack mortals! I submitt! I submitt! Brashly you have come to rest the secrets of the living flame. You will soon regret the recklessness of your quest. I go now to summon the lord whos house this is. Should you seek an audiance with him your paltry lives will surly be forfit. Nevertheless seek out his lair if you dare!',8038,1,0,'majordomo SAY_DEFEAT'),
(-1409008,'Behold Ragnaros, the Firelord! He who was ancient when this world was young! Bow before him, mortals! Bow before your ending!',8040,1,0,'ragnaros SAY_SUMMON_MAJ'),
(-1409009,'TOO SOON! YOU HAVE AWAKENED ME TOO SOON, EXECUTUS! WHAT IS THE MEANING OF THIS INTRUSION?',8043,1,0,'ragnaros SAY_ARRIVAL1_RAG'),
(-1409010,'These mortal infidels, my lord! They have invaded your sanctum, and seek to steal your secrets!',8041,1,0,'ragnaros SAY_ARRIVAL2_MAJ'),
(-1409011,'FOOL! YOU ALLOWED THESE INSECTS TO RUN RAMPANT THROUGH THE HALLOWED CORE, AND NOW YOU LEAD THEM TO MY VERY LAIR? YOU HAVE FAILED ME, EXECUTUS! JUSTICE SHALL BE MET, INDEED!',8044,1,0,'ragnaros SAY_ARRIVAL3_RAG'),
(-1409012,'NOW FOR YOU, INSECTS. BOLDLY YOU SAUGHT THE POWER OF RAGNAROS NOW YOU SHALL SEE IT FIRST HAND.',8045,1,0,'ragnaros SAY_ARRIVAL5_RAG'),
(-1409013,'COME FORTH, MY SERVANTS! DEFEND YOUR MASTER!',8049,1,0,'ragnaros SAY_REINFORCEMENTS1'),
(-1409014,'YOU CANNOT DEFEAT THE LIVING FLAME! COME YOU MINIONS OF FIRE! COME FORTH YOU CREATURES OF HATE! YOUR MASTER CALLS!',8050,1,0,'ragnaros SAY_REINFORCEMENTS2'),
(-1409015,'BY FIRE BE PURGED!',8046,1,0,'ragnaros SAY_HAND'),
(-1409016,'TASTE THE FLAMES OF SULFURON!',8047,1,0,'ragnaros SAY_WRATH'),
(-1409017,'DIE INSECT!',8051,1,0,'ragnaros SAY_KILL'),
(-1409018,'MY PATIENCE IS DWINDILING! COME NATS TO YOUR DEATH!',8048,1,0,'ragnaros SAY_MAGMABURST');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1552030 AND -1552000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1552000,'It is a small matter to control the mind of the weak... for I bear allegiance to powers untouched by time, unmoved by fate. No force on this world or beyond harbors the strength to bend our knee... not even the mighty Legion!',11122,1,0,'skyriss SAY_INTRO'),
(-1552001,'Bear witness to the agent of your demise!',11123,1,0,'skyriss SAY_AGGRO'),
(-1552002,'Your fate is written!',11124,1,0,'skyriss SAY_KILL_1'),
(-1552003,'The chaos I have sown here is but a taste...',11125,1,0,'skyriss SAY_KILL_2'),
(-1552004,'You will do my bidding, weakling.',11127,1,0,'skyriss SAY_MIND_1'),
(-1552005,'Your will is no longer your own.',11128,1,0,'skyriss SAY_MIND_2'),
(-1552006,'Flee in terror!',11129,1,0,'skyriss SAY_FEAR_1'),
(-1552007,'I will show you horrors undreamed of!',11130,1,0,'skyriss SAY_FEAR_2'),
(-1552008,'We span the universe, as countless as the stars!',11131,1,0,'skyriss SAY_IMAGE'),
(-1552009,'I am merely one of... infinite multitudes.',11126,1,0,'skyriss SAY_DEATH'),
(-1552010,'Where in Bonzo\'s brass buttons am I? And who are-- yaaghh, that\'s one mother of a headache!',11171,1,0,'millhouse SAY_INTRO_1'),
(-1552011,'\"Lowly\"? I don\'t care who you are friend, no one refers to the mighty Millhouse Manastorm as \"Lowly\"! I have no idea what goes on here, but I will gladly join your fight against this impudent imbecile! Prepare to defend yourself, cretin!',11172,1,0,'millhouse SAY_INTRO_2'),
(-1552012,'I just need to get some things ready first. You guys go ahead and get started. I need to summon up some water...',11173,1,0,'millhouse SAY_WATER'),
(-1552013,'Fantastic! Next, some protective spells. Yes! Now we\'re cookin\'',11174,1,0,'millhouse SAY_BUFFS'),
(-1552014,'And of course i\'ll need some mana. You guys are gonna love this, just wait.',11175,1,0,'millhouse SAY_DRINK'),
(-1552015,'Aaalllriiiight!! Who ordered up an extra large can of whoop-ass?',11176,1,0,'millhouse SAY_READY'),
(-1552016,'I didn\'t even break a sweat on that one.',11177,1,0,'millhouse SAY_KILL_1'),
(-1552017,'You guys, feel free to jump in anytime.',11178,1,0,'millhouse SAY_KILL_2'),
(-1552018,'I\'m gonna light you up, sweet cheeks!',11179,1,0,'millhouse SAY_PYRO'),
(-1552019,'Ice, ice, baby!',11180,1,0,'millhouse SAY_ICEBLOCK'),
(-1552020,'Heal me! Oh, for the love of all that is holy, HEAL me! I\'m dying!',11181,1,0,'millhouse SAY_LOWHP'),
(-1552021,'You\'ll be hearing from my lawyer...',11182,1,0,'millhouse SAY_DEATH'),
(-1552022,'Who\'s bad? Who\'s bad? That\'s right: we bad!',11183,1,0,'millhouse SAY_COMPLETE'),
(-1552023,'I knew the prince would be angry but, I... I have not been myself. I had to let them out! The great one speaks to me, you see. Wait--outsiders. Kael\'thas did not send you! Good... I\'ll just tell the prince you released the prisoners!',11222,1,0,'mellichar YELL_INTRO1'),
(-1552024,'The naaru kept some of the most dangerous beings in existence here in these cells. Let me introduce you to another...',11223,1,0,'mellichar YELL_INTRO2'),
(-1552025,'Yes, yes... another! Your will is mine!',11224,1,0,'mellichar YELL_RELEASE1'),
(-1552026,'Behold another terrifying creature of incomprehensible power!',11225,1,0,'mellichar YELL_RELEASE2A'),
(-1552027,'What is this? A lowly gnome? I will do better, O\'great one.',11226,1,0,'mellichar YELL_RELEASE2B'),
(-1552028,'Anarchy! Bedlam! Oh, you are so wise! Yes, I see it now, of course!',11227,1,0,'mellichar YELL_RELEASE3'),
(-1552029,'One final cell remains. Yes, O\'great one, right away!',11228,1,0,'mellichar YELL_RELEASE4'),
(-1552030,'Welcome, O\'great one. I am your humble servant.',11229,1,0,'mellichar YELL_WELCOME');

DELETE FROM `script_texts` WHERE `entry`=-1000100;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000100,'Come, little ones. Face me!',0,1,0,'azuregos SAY_TELEPORT');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1249004 AND -1249000;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1249000,'How fortuitous. Usually, I must leave my lair to feed.',0,1,0,'onyxia SAY_AGGRO'),
(-1249001,'Learn your place mortal!',0,1,0,'onyxia SAY_KILL'),
(-1249002,'This meaningless exertion bores me. I\'ll incinerate you all from above!',0,1,0,'onyxia SAY_PHASE_2_TRANS'),
(-1249003,'It seems you\'ll need another lesson, mortals!',0,1,0,'onyxia SAY_PHASE_3_TRANS'),
(-1249004,'takes in a deep breath...',0,1,0,'onyxia EMOTE_BREATH');

DELETE FROM `script_texts` WHERE `entry`=-1469031;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1469031,'goes into a frenzy!',0,2,0,'flamegor EMOTE_FRENZY');

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1000105 AND -1000101;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1000101,'Follow me, $N. I\'ll take you to the Defias hideout. But you better protect me or I am as good as dead',0,0,7,'defias traitor SAY_START'),
(-1000102,'The entrance is hidden here in Moonbrook. Keep your eyes peeled for thieves. They want me dead.',0,0,7,'defias traitor SAY_PROGRESS'),
(-1000103,'You can go tell Stoutmantle this is where the Defias Gang is holed up, $N.',0,0,7,'defias traitor SAY_END'),
(-1000104,'%s coming in fast! Prepare to fight!',0,0,7,'defias traitor SAY_AGGRO_1'),
(-1000105,'Help!',0,0,7,'defias traitor SAY_AGGRO_2');

UPDATE `creature_template` SET `ScriptName`='npc_defias_traitor' WHERE `entry`='467';

ALTER TABLE `npc_option`
  CHANGE COLUMN `id` `id` mediumint(8) unsigned NOT NULL default '0',
  CHANGE COLUMN `gossip_id` `gossip_id` mediumint(8) unsigned NOT NULL default '0',
  CHANGE COLUMN `action` `action` mediumint(8) unsigned NOT NULL default '0',
  ADD COLUMN `box_money` int(10) unsigned NOT NULL default '0' AFTER `action`,
  ADD COLUMN `coded` tinyint(3) unsigned NOT NULL default '0' AFTER `box_money`,
  ADD COLUMN `box_text` text AFTER `option_text`;

CREATE TABLE `locales_npc_option` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `creature_template`
  CHANGE COLUMN `flags` `unit_flags` int(10) unsigned NOT NULL default '0',
  CHANGE COLUMN `flag1` `type_flags` int(10) unsigned NOT NULL default '0';

DELETE FROM `command` WHERE name IN ('possess', 'unpossess');
INSERT INTO `command` (name,security,help) VALUES
('possess',3,'Syntax: .possess\r\n\r\nPossesses indefinitely the selected creature.'),
('unpossess',3,'Syntax: .unpossess\r\n\r\nIf you are possessed, unpossesses yourself; otherwise unpossesses current possessed target.');

UPDATE `creature_template` SET `ScriptName`='npc_clintar_dreamwalker' WHERE `entry`=22834;
UPDATE `creature_template` SET `ScriptName`='npc_clintar_spirit' WHERE `entry` = 22916;
UPDATE `creature_template` SET `ScriptName`='mob_sparrowhawk' WHERE `entry`=22979;
UPDATE `creature_template` SET `ScriptName`='mob_rizzle_sprysprocket' WHERE `entry`=23002;
UPDATE `creature_template` SET `ScriptName`='mob_depth_charge' WHERE `entry`=23025;

UPDATE `spell_proc_event` SET `procFlags` = '8396800' WHERE `entry` =14774;
UPDATE `spell_proc_event` SET `procFlags` = '8396800' WHERE `entry` =14531;

DELETE FROM spell_linked_spell WHERE `spell_trigger` IN (39992, 39835, 42052, -41914, -41917, 41126, -41376, 39908);
-- INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39992, 39835, 1, 'Needle Spine');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39835, 39968, 1, 'Needle Spine');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-41376, 41377, 0, 'Spite');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (41126, 41131, 1, 'Flame Crash');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-41914, 41915, 0, 'Summon Parasitic Shadowfiend');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-41917, 41915, 0, 'Summon Parasitic Shadowfiend');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39908, 40017, 1, 'Eye Blast');

-- spine
update gameobject_template set scriptname = 'go_najentus_spine' where entry = 185584;
-- molten_flame
UPDATE creature_template SET spell1 = 40980, flags_extra = 128, speed = 1.0, scriptname = 'molten_flame' WHERE entry = 23095;
-- volcano
UPDATE creature_template SET spell1 = 40117, flags_extra = 128, scriptname = '' WHERE entry = 23085;
-- flame crash
update creature_template set spell1 = 40836, flags_extra = 128, scriptname = '' where entry = 23336;
-- blaze
update creature_template set spell1 = 40610, flags_extra = 128, scriptname = '' where entry = 23259;
-- glaive
update creature_template set scriptname = 'mob_blade_of_azzinoth' where entry = 22996;
-- parasitic shadowfiend
update creature_template set scriptname = 'mob_parasitic_shadowfiend' where entry = 23498;
-- Maiev
update creature_template set minlevel = 73, maxlevel = 73, minhealth = 500000, maxhealth = 500000, mindmg = 3000, maxdmg = 4000 where entry = 23197;

update gameobject_template set scriptname = 'go_gilded_brazier' where entry = 181956;

UPDATE creature_template SET ScriptName = 'boss_leotheras_the_blind' WHERE entry = '21215';
UPDATE creature_template SET ScriptName = 'boss_leotheras_the_blind_demonform' WHERE entry = '21875';
UPDATE creature_template SET ScriptName = 'mob_greyheart_spellbinder' WHERE entry = '21806';
UPDATE creature_template SET ScriptName = 'mob_inner_demon' WHERE entry = '21857';

UPDATE creature_template SET ScriptName = 'mob_toxic_sporebat', speed = '1' WHERE entry = '22140';
UPDATE creature_template SET modelid_A = '11686', modelid_H = '11686', flags_extra = '128' WHERE entry = '22207';

-- lurker
UPDATE creature_model_info SET bounding_radius = '13', combat_reach = '20' WHERE modelid = '20216';
UPDATE creature_template SET InhabitType = '3', ScriptName = 'boss_the_lurker_below' WHERE entry = '21217';
UPDATE creature_template SET ScriptName = 'mob_coilfang_ambusher' WHERE entry = '21865';
UPDATE creature_template SET ScriptName = 'mob_coilfang_guardian' WHERE entry = '21873';

UPDATE `creature_template` SET `ScriptName`='boss_pathaleon_the_calculator' WHERE `entry`=19220;
UPDATE `creature_template` SET `ScriptName`='mob_nether_wraith' WHERE `entry`=21062;
UPDATE `instance_template` SET `script`='instance_mechanar' WHERE `map`=554;

UPDATE `spell_proc_event` SET `SchoolMask` = '1' WHERE `entry` = '41434';

DELETE FROM trinity_string WHERE entry IN (453);

delete from `command` where `name` IN ('senditems','sendmail');
insert into `command` (`name`, `security`, `help`) values
('senditems',3,'Syntax: .senditems #playername "#subject" "#text" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\r\n\r\nSend a mail to a player. Subject and mail text must be in "". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.'),
('sendmail',1,'Syntax: .sendmail #playername "#subject" "#text"\r\n\r\nSend a mail to a player. Subject and mail text must be in "".');
 

DELETE FROM `command` WHERE name IN ('bindsight', 'unbindsight');
INSERT INTO `command` (name,security,help) VALUES
('bindsight',3,'Syntax: .bindsight\r\n\r\nBinds vision to the selected unit indefinitely. Cannot be used while currently possessing a target.'),
('unbindsight',3,'Syntax: .unbindsight\r\n\r\nRemoves bound vision. Cannot be used while currently possessing a target.');

ALTER TABLE `spell_linked_spell` DROP PRIMARY KEY;

UPDATE creature_template SET scriptname = 'boss_kalecgos' WHERE entry = 24850;
UPDATE creature_template SET scriptname = 'boss_sathrovarr' WHERE entry = 24892;
UPDATE creature_template SET scriptname = 'boss_kalec' WHERE entry = 24891;
UPDATE creature_template SET minhealth = 2018275, maxhealth = minhealth = 2018275 WHERE entry = 24892;
UPDATE creature_template SET minlevel = 73, maxlevel = 73, minhealth = 828555, maxhealth = 828555, armor = 5000, mindmg = 1000, maxdmg = 2000 WHERE entry = 24891;
UPDATE gameobject_template SET scriptname = 'kalocegos_teleporter' WHERE entry = 187055;

INSERT INTO creature_template_addon (entry) SELECT 24891 FROM creature_template_addon WHERE NOT EXISTS(SELECT * FROM creature_template_addon WHERE entry = 24891) LIMIT 1; 
INSERT INTO creature_template_addon (entry) SELECT 24892 FROM creature_template_addon WHERE NOT EXISTS(SELECT * FROM creature_template_addon WHERE entry = 24892) LIMIT 1; 
UPDATE creature_template_addon SET auras = '45769 0 45769 1' WHERE entry = 24850;
UPDATE creature_template_addon SET auras = '45769 0 45769 1 44801 0 44801 1 44801 2' WHERE entry = 24891;
UPDATE creature_template_addon SET auras = '45769 0 45769 1 44801 0 44801 1 44801 2 44800 0' WHERE entry = 24892;

DELETE FROM spell_linked_spell WHERE `spell_trigger` IN (44869, 46648, 46019, 46021, -46021, 46020);
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (44869, 44866, 1, 'Spectral Blast Portal');
-- 46648 will cause severe lag if your video card is not good enough
-- INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (44869, 46648, 1, 'Spectral Blast Visual');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (44869, 46019, 1, 'Spectral Blast Teleport');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46019, 46021, 1, 'Spectral Realm Aura');
-- 44852 makes boss friendly to you, weird
-- INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46021, 44852, 1, 'Spectral Realm Aura');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-46021, 46020, 0, 'Teleport: Normal Realm');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46020, 44867, 1, 'Spectral Exhaustion');

DELETE FROM spell_target_position WHERE `id` IN (46019, 46020);
INSERT INTO spell_target_position () VALUES (46019, 580, 1704.34, 928.17, -74.558, 0);
INSERT INTO spell_target_position () VALUES (46020, 580, 1704.34, 928.17, 53.079, 0);

DELETE FROM trinity_string WHERE entry IN (1119,1120,1121);

INSERT INTO trinity_string VALUES
(1119,'You must use male or female as gender.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1120,'You change gender of %s to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1121,'Your gender changed to %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


DELETE FROM command WHERE name IN ('modify gender');

INSERT INTO command VALUES
('modify gender',2,'Syntax: .modify gender male/female\r\n\r\nChange gender of selected player.');


delete from `command` where `name` IN ('senditems','sendmail');
insert into `command` (`name`, `security`, `help`) values
('senditems',3,'Syntax: .senditems #playername "#subject" "#text" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\r\n\r\nSend a mail to a player. Subject and mail text must be in "". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.'),
('sendmail',1,'Syntax: .sendmail #playername "#subject" "#text"\r\n\r\nSend a mail to a player. Subject and mail text must be in "".');


delete from `command` where `name` = 'sendmoney';
insert into `command` (`name`, `security`, `help`) values
('sendmoney',3,'Syntax: .sendmoney #playername "#subject" "#text" #money\r\n\r\nSend mail with money to a player. Subject and mail text must be in "".');


DELETE FROM trinity_string WHERE entry IN (453);


DROP TABLE IF EXISTS `db_script_string`;
CREATE TABLE `db_script_string` (
  `entry` int(11) unsigned NOT NULL default '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DELETE FROM `command` WHERE `name` IN (
  'server exit',
  'server idleshutdown',
  'server idleshutdown cancel',
  'server idlerestart',
  'server idlerestart cancel',
  'server restart',
  'server restart cancel',
  'server shutdown',
  'server shutdown cancel'
);

INSERT INTO `command` (`name`, `security`, `help`) VALUES
('server exit',4,'Syntax: .server exit\r\n\r\nTerminate trinity-core NOW. Exit code 0.'),
('server idleshutdown',3,'Syntax: .server idleshutdown #delay [#exist_code]\r\n\r\nShut the server down after #delay seconds if no active connections are present (no players). Use #exist_code or 0 as program exist code.'),
('server idleshutdown cancel',3,'Syntax: .server idleshutdown cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server idlerestart',3,'Syntax: .server idlerestart #delay\r\n\r\nRestart the server after #delay seconds if no active connections are present (no players). Use #exist_code or 2 as program exist code.'),
('server idlerestart cancel',3,'Syntax: .server idlerestart cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server restart',3,'Syntax: .server restart #delay\r\n\r\nRestart the server after #delay seconds. Use #exist_code or 2 as program exist code.'),
('server restart cancel',3,'Syntax: .server restart cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server shutdown',3,'Syntax: .server shutdown #delay [#exist_code]\r\n\r\nShut the server down after #delay seconds. Use #exist_code or 0 as program exist code.'),
('server shutdown cancel',3,'Syntax: .server shutdown cancel\r\n\r\nCancel the restart/shutdown timer if any.');

DELETE FROM trinity_string WHERE entry IN (251);
INSERT INTO trinity_string VALUES
(251,'Text%d (ID: %i): %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
ALTER TABLE event_scripts
  DROP datatext,
  ADD COLUMN dataint int(11) NOT NULL default '0' AFTER datalong2; 

ALTER TABLE gameobject_scripts
  DROP datatext,
  ADD COLUMN dataint int(11) NOT NULL default '0' AFTER datalong2; 

ALTER TABLE quest_end_scripts
  DROP datatext,
  ADD COLUMN dataint int(11) NOT NULL default '0' AFTER datalong2; 

ALTER TABLE quest_start_scripts
  DROP datatext,
  ADD COLUMN dataint int(11) NOT NULL default '0' AFTER datalong2; 

ALTER TABLE spell_scripts
  DROP datatext,
  ADD COLUMN dataint int(11) NOT NULL default '0' AFTER datalong2; 

ALTER TABLE creature_movement
  DROP `text1`,
  DROP `text2`,
  DROP `text3`,
  DROP `text4`,
  DROP `text5`,
  ADD COLUMN textid1 int(11) NOT NULL default '0' AFTER waittime,
  ADD COLUMN textid2 int(11) NOT NULL default '0' AFTER textid1,
  ADD COLUMN textid3 int(11) NOT NULL default '0' AFTER textid2,
  ADD COLUMN textid4 int(11) NOT NULL default '0' AFTER textid3,
  ADD COLUMN textid5 int(11) NOT NULL default '0' AFTER textid4;

UPDATE `creature_template` SET `ScriptName`='npc_wounded_blood_elf' WHERE `entry`='16993';
UPDATE `creature_template` SET `ScriptName` = 'mob_phase_hunter' WHERE `entry` = '18879';


-- `trinity_string` Language.h entries

DELETE FROM `trinity_string` WHERE `entry` > 716 AND `entry` < 750;
INSERT INTO `trinity_string` VALUES
(717,'Alliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(718,'Horde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(719,'%s was destroyed by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(720,'The %s is under attack! If left unchecked, the %s will destroy it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(721,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(722,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(723,'The %s was taken by the %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(724,'The %s is under attack! If left unchecked, the %s will capture it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(725,'The %s has taken the %s! Its supplies will now be used for reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(726,'Irondeep Mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(727,'Coldtooth Mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(728,'Stormpike Aid Station',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(729,'Dun Baldar South Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(730,'Dun Baldar North Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(731,'Stormpike Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(732,'Icewing Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(733,'Stonehearth Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(734,'Stonehearth Bunker',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(735,'Snowfall Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(736,'Iceblood Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(737,'Iceblood Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(738,'Tower Point',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(739,'Frostwolf Graveyard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(740,'East Frostwolf Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(741,'West Frostwolf Tower',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(742,'Frostwolf Relief Hut',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(743,'The Battle for Alterac Valley begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(744,'The Battle for Alterac Valley begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(745,'The Battle for Alterac Valley has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(746,'The Alliance Team is running out of reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(747,'The Horde Team is running out of reinforcements!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(748,'The Frostwolf General is Dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(749,'The Stormpike General is Dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
;


UPDATE `creature_template` SET `ScriptName` = 'npc_steam_tonk' WHERE `entry` = '19405';
UPDATE `creature_template` SET `ScriptName` = 'npc_tonk_mine' WHERE `entry` = '15368';


DROP TABLE IF EXISTS `spell_proc_event`;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for spell_proc_event
-- ----------------------------
CREATE TABLE `spell_proc_event` (
  `entry` smallint(6) unsigned NOT NULL default '0',
  `SchoolMask` tinyint(4) NOT NULL default '0',
  `SpellFamilyName` smallint(6) unsigned NOT NULL default '0',
  `SpellFamilyMask` bigint(40) unsigned NOT NULL default '0',
  `procFlags` int(10) unsigned NOT NULL default '0',
  `procEx` int(10) unsigned NOT NULL default '0',
  `ppmRate` float NOT NULL default '0',
  `CustomChance` float NOT NULL default '0',
  `Cooldown` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `spell_proc_event` VALUES ('9452', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34917', '32', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34916', '32', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34914', '32', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29076', '20', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29075', '20', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29074', '20', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12704', '0', '0', '0', '0', '0', '1.6626', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12289', '0', '4', '2', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12311', '0', '4', '2048', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28849', '0', '11', '128', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28847', '0', '7', '32', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28823', '0', '11', '192', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28809', '0', '6', '4096', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28719', '0', '7', '32', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12668', '0', '4', '2', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12703', '0', '0', '0', '0', '0', '1.33008', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12702', '0', '0', '0', '0', '0', '0.99756', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12701', '0', '0', '0', '0', '0', '0.66504', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12284', '0', '0', '0', '0', '0', '0.33252', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12797', '0', '4', '1024', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12799', '0', '4', '1024', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12800', '0', '4', '1024', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28595', '16', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28594', '16', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28593', '16', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12958', '0', '4', '2048', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13754', '0', '8', '16', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13867', '0', '8', '16', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14186', '0', '8', '1082131720', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14190', '0', '8', '9672066312', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14193', '0', '8', '9672066312', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14194', '0', '8', '9672066312', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14195', '0', '8', '9672066312', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28592', '16', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23721', '0', '9', '2048', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15277', '0', '0', '0', '0', '0', '6', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23572', '0', '11', '192', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23551', '0', '11', '192', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20235', '0', '10', '32768', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20234', '0', '10', '32768', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19415', '0', '9', '512', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15346', '0', '0', '0', '0', '0', '6', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19414', '0', '9', '512', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19413', '0', '9', '512', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15600', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19412', '0', '9', '512', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16850', '0', '7', '4', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16864', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16923', '0', '7', '4', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16924', '0', '7', '4', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16952', '0', '7', '4398046744576', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16954', '0', '7', '4398046744576', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19407', '0', '9', '512', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18096', '0', '5', '549755813984', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18073', '0', '5', '549755813984', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17793', '0', '5', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17796', '0', '5', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17801', '0', '5', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18095', '0', '5', '10', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18094', '0', '5', '10', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17802', '0', '5', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18119', '0', '5', '18416819766245', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18120', '0', '5', '18416819766245', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18121', '0', '5', '18416819766245', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18122', '0', '5', '18416819766245', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18123', '0', '5', '18416819766245', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19228', '0', '0', '64', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19232', '0', '9', '64', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19233', '0', '9', '64', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17803', '0', '5', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16164', '0', '11', '2416967683', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15363', '0', '6', '17448312320', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15362', '0', '6', '17448312320', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15326', '0', '6', '8691163136', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20164', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20165', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20166', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20215', '0', '10', '3223322624', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20214', '0', '10', '3223322624', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20213', '0', '10', '3223322624', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20212', '0', '10', '3223322624', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20210', '0', '10', '3223322624', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15325', '0', '6', '8691163136', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15324', '0', '6', '8691163136', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20347', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20348', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20349', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20356', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20357', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20375', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20500', '0', '4', '268435456', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20501', '0', '4', '268435456', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20915', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20918', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20919', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20920', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('21890', '0', '4', '3763103747823', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15323', '0', '6', '8691163136', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15286', '32', '6', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23578', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23581', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23686', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23689', '0', '0', '0', '0', '0', '4', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23695', '0', '4', '2', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15268', '0', '6', '8691163136', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('25669', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26016', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26021', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26119', '0', '10', '2416967683', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26480', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27160', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27166', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27170', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27419', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27498', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27656', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27787', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14892', '0', '6', '17448312320', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12848', '4', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12847', '4', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12846', '4', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11255', '0', '3', '16384', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28789', '0', '10', '3221225472', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12360', '4', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28816', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12359', '4', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12358', '4', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12357', '4', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12598', '0', '3', '16384', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11180', '16', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11129', '0', '3', '274890489879', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29150', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29501', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29624', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29625', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29626', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29632', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29633', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29634', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29635', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29636', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29637', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30299', '36', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30675', '0', '11', '3', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30678', '0', '11', '3', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30679', '0', '11', '3', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30680', '0', '11', '3', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30681', '0', '11', '3', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31801', '0', '0', '0', '0', '0', '20', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31833', '0', '10', '2147483648', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31835', '0', '10', '2147483648', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31836', '0', '10', '2147483648', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30302', '36', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30301', '36', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32385', '0', '5', '73014445058', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32387', '0', '5', '73014445058', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32392', '0', '5', '73014445058', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32393', '0', '5', '73014445058', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32394', '0', '5', '73014445058', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11120', '4', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11119', '4', '3', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11103', '4', '3', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37195', '0', '10', '8388608', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37377', '32', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('39437', '4', '5', '824633725796', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33191', '0', '6', '4398054932480', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33192', '0', '6', '4398054932480', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33193', '0', '6', '4398054932480', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33194', '0', '6', '4398054932480', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33195', '0', '6', '4398054932480', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40475', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41434', '0', '0', '0', '0', '0', '2', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('37523', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30293', '0', '5', '824633721729', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30295', '0', '5', '824633721729', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30296', '0', '5', '824633721729', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40407', '0', '0', '0', '0', '0', '6', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31895', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37247', '8', '0', '0', '0', '65536', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('33510', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16624', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28752', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16176', '0', '11', '448', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16235', '0', '11', '448', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16240', '0', '11', '448', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23920', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27811', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27815', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27816', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33142', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33145', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33146', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16487', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16489', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16492', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26605', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16550', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('22648', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34320', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29977', '0', '3', '274890489879', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37443', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38350', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38347', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12834', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12849', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12867', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30160', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29179', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29180', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12317', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13045', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13046', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13047', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13048', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34500', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34502', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34503', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('9799', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('25988', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29062', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29064', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29065', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15088', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12319', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16256', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12971', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16281', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12972', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16282', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12973', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16283', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12974', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16284', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('42083', '0', '0', '0', '0', '2', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('34950', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34954', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28812', '0', '8', '33554438', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37227', '0', '11', '448', '0', '2', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('32885', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('21882', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34258', '0', '10', '34359739392', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37237', '0', '11', '1', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37657', '0', '0', '0', '0', '2', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('40482', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37213', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14531', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14774', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16880', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('35121', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20705', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16958', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16961', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33648', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37189', '0', '10', '3221225472', '0', '2', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('43338', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33150', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33154', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34497', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34498', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34499', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30802', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30808', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30809', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30810', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30811', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20049', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20056', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20057', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20058', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20059', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37519', '0', '0', '0', '0', '48', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26107', '0', '7', '549764202496', '0', '116', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23548', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37514', '0', '0', '0', '0', '32', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40444', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20911', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20912', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20913', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20914', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27168', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17495', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('22618', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('25899', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27169', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31904', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32777', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20925', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20927', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20928', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27179', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12298', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12724', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12725', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12726', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12727', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32642', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33089', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26128', '0', '0', '0', '0', '8', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29441', '0', '0', '0', '0', '8', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('29444', '0', '0', '0', '0', '8', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('29445', '0', '0', '0', '0', '8', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('29446', '0', '0', '0', '0', '8', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('29447', '0', '0', '0', '0', '8', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('34749', '0', '0', '0', '0', '8', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13983', '0', '0', '0', '0', '24', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14070', '0', '0', '0', '0', '24', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14071', '0', '0', '0', '0', '24', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41034', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32734', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('974', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('32593', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('32594', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('40899', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('324', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('325', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('905', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('945', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('8134', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('10431', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('10432', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('25469', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('25472', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('34355', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('39027', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('34827', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('24398', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('33736', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('41260', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('41262', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('34935', '0', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `spell_proc_event` VALUES ('34938', '0', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `spell_proc_event` VALUES ('34939', '0', '0', '0', '0', '0', '0', '0', '8');
INSERT INTO `spell_proc_event` VALUES ('33746', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('33759', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('16620', '0', '0', '0', '0', '0', '0', '0', '30');
INSERT INTO `spell_proc_event` VALUES ('21185', '0', '0', '0', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('29801', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30030', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30033', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30701', '28', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30705', '28', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43748', '0', '11', '2416967680', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43750', '0', '11', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('42370', '0', '11', '64', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30881', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `spell_proc_event` VALUES ('30883', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `spell_proc_event` VALUES ('30884', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `spell_proc_event` VALUES ('30885', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `spell_proc_event` VALUES ('30886', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `spell_proc_event` VALUES ('34138', '0', '11', '128', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43728', '0', '11', '128', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('26135', '0', '10', '8388608', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43745', '0', '10', '2199023255552', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34139', '0', '10', '1073741824', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43741', '0', '10', '2147483648', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('42368', '0', '10', '1073741824', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34262', '0', '10', '8388608', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41469', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33127', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29385', '0', '0', '0', '0', '0', '7', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43726', '0', '10', '1073741824', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('35100', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('35102', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('35103', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40485', '0', '9', '4294967296', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31124', '0', '8', '536870926', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31126', '0', '8', '536870926', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31233', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31239', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31240', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31241', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31242', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37168', '0', '8', '38658768896', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37170', '0', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37165', '0', '8', '2098176', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31244', '0', '8', '38658768896', '0', '4', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31245', '0', '8', '38658768896', '0', '4', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41393', '0', '0', '0', '0', '32', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14156', '0', '8', '4063232', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14160', '0', '8', '4063232', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14161', '0', '8', '4063232', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38326', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17106', '0', '7', '524288', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17107', '0', '7', '524288', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17108', '0', '7', '524288', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43739', '0', '7', '2', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43737', '0', '7', '4672924418048', '0', '0', '0', '0', '10');
INSERT INTO `spell_proc_event` VALUES ('39372', '48', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37568', '0', '6', '2048', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37594', '0', '6', '4096', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34753', '0', '6', '17179875328', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34859', '0', '6', '17179875328', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34860', '0', '6', '17179875328', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37603', '0', '6', '32768', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38394', '0', '5', '6', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37384', '0', '5', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40478', '0', '5', '2', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37528', '0', '4', '4', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37516', '0', '4', '1024', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40458', '0', '4', '6601398288384', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('22007', '0', '3', '2097185', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('3232', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17364', '8', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30937', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('15128', '4', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37193', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32776', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20132', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20131', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20128', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17794', '32', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31394', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('25050', '4', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('24353', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20134', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17797', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17798', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('24389', '0', '3', '274890489879', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('20133', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('36111', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29455', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34774', '0', '0', '0', '0', '0', '1.5', '0', '20');
INSERT INTO `spell_proc_event` VALUES ('9784', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31785', '0', '0', '0', '34816', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('9782', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('24932', '0', '0', '0', '0', '2', '0', '0', '6');
INSERT INTO `spell_proc_event` VALUES ('33776', '0', '0', '0', '34816', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34586', '0', '0', '0', '0', '0', '1.5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('2565', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12169', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32587', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38031', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34080', '0', '0', '0', '0', '8', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('42136', '0', '0', '0', '0', '0', '0', '0', '90');
INSERT INTO `spell_proc_event` VALUES ('42135', '0', '0', '0', '0', '0', '0', '0', '90');
INSERT INTO `spell_proc_event` VALUES ('23547', '0', '0', '0', '0', '32', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32837', '0', '0', '0', '0', '65536', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('17799', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('17800', '32', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37197', '0', '0', '0', '0', '65536', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('23688', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('34783', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27521', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27774', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28802', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37600', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19184', '0', '9', '35184372088852', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19387', '0', '9', '35184372088852', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19388', '0', '9', '35184372088852', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37655', '0', '0', '0', '0', '0', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('38334', '0', '0', '0', '0', '0', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('12966', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12967', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12968', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12969', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12970', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16257', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16277', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16278', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16279', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('16280', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('36096', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43443', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30003', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27181', '1', '0', '0', '0', '256', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41381', '0', '0', '0', '0', '256', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38026', '1', '0', '0', '0', '256', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31569', '0', '3', '65536', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31570', '0', '3', '65536', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('7383', '1', '0', '0', '0', '256', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('39530', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33299', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37214', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('31794', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('18820', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('37601', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('43819', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('6346', '0', '0', '0', '0', '256', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23552', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('46025', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40442', '0', '7', '4672924418068', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40470', '0', '10', '3229614080', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40438', '0', '6', '32832', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('40463', '0', '11', '68719476865', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12322', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12999', '0', '0', '0', '0', '0', '4', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13000', '0', '0', '0', '0', '0', '6', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13001', '0', '0', '0', '0', '0', '8', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13002', '0', '0', '0', '0', '0', '10', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14318', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('13165', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14319', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14320', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14321', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('14322', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('25296', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27044', '0', '9', '1', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('39443', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('39442', '0', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('35080', '0', '0', '0', '0', '0', '1', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('35077', '0', '0', '0', '0', '0', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('35086', '0', '0', '0', '0', '0', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('35083', '0', '0', '0', '0', '0', '0', '0', '60');
INSERT INTO `spell_proc_event` VALUES ('18137', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('19308', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('19309', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('19310', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('19311', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('19312', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('25477', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('38327', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33881', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33882', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33883', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33719', '0', '0', '0', '0', '2048', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29834', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('29838', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('39958', '0', '0', '0', '0', '0', '0.7', '0', '40');
INSERT INTO `spell_proc_event` VALUES ('1463', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('8494', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('8495', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('10191', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('10192', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('10193', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('27131', '0', '0', '0', '0', '1024', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('32844', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33076', '0', '0', '0', '656040', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('46662', '0', '0', '0', '0', '0', '0', '0', '20');
INSERT INTO `spell_proc_event` VALUES ('38857', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('8178', '0', '0', '0', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('41635', '0', '0', '0', '656040', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('30823', '0', '0', '0', '0', '0', '10.5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('24905', '0', '0', '0', '0', '0', '15', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('46098', '0', '11', '128', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('46092', '0', '10', '1073741824', '0', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('38290', '0', '0', '0', '0', '0', '1.6', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('45234', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('45243', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('45244', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('23602', '0', '0', '0', '0', '64', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('45483', '0', '0', '0', '0', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('45482', '0', '0', '0', '0', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('45484', '0', '0', '0', '16384', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('46569', '0', '0', '0', '0', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('45481', '0', '0', '0', '0', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('32748', '0', '8', '4294967296', '320', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('24658', '0', '0', '0', '82192', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('44835', '0', '7', '549755813888', '16', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('46832', '0', '7', '1', '0', '65536', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('45057', '0', '0', '0', '0', '0', '0', '0', '30');
INSERT INTO `spell_proc_event` VALUES ('37173', '0', '8', '1126031951256', '0', '0', '0', '0', '30');
INSERT INTO `spell_proc_event` VALUES ('45054', '0', '0', '0', '0', '0', '0', '0', '15');
INSERT INTO `spell_proc_event` VALUES ('45354', '0', '0', '0', '0', '0', '0', '0', '45');
INSERT INTO `spell_proc_event` VALUES ('41989', '0', '0', '0', '0', '0', '0.5', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('11185', '0', '3', '128', '327680', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12487', '0', '3', '128', '327680', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19572', '0', '9', '8388608', '16384', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28716', '0', '7', '16', '294912', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('28744', '0', '7', '64', '278528', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('12488', '0', '3', '128', '327680', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('19573', '0', '9', '8388608', '16384', '0', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33757', '0', '0', '0', '0', '0', '0', '0', '3');

DELETE FROM `spell_script_target` WHERE `entry` in (30659);
INSERT INTO `spell_script_target` VALUES (30659, 1, 17281);


DELETE FROM `spell_proc_event` WHERE `entry` IN (42083, 33727, 33754, 33755, 33756, 8516, 10608, 10610, 25583, 25584);
INSERT INTO `spell_proc_event` VALUES ('42083', '0', '0', '0', '0', '2', '0', '0', '0');
INSERT INTO `spell_proc_event` VALUES ('33727', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('33754', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('33755', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('33756', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('8516', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('10608', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('10610', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('25583', '0', '0', '0', '0', '0', '0', '0', '3');
INSERT INTO `spell_proc_event` VALUES ('25584', '0', '0', '0', '0', '0', '0', '0', '3');

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 770 AND 787;
INSERT INTO `trinity_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`) VALUES
(770,'Your group has members not in your arena team. Please regroup to join.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(771,'Your group does not have enough players to join this match.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(772,'The Gold Team wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(773,'The Green Team wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(774,'There aren\'t enough players in this battleground. It will end soon unless some more players join to balance the fight.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(775,'Your group has an offline member. Please remove him before joining.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(776,'Your group has players from the opposing faction. You can\'t join the battleground as a group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(777,'Your group has players from different battleground brakets. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(778,'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(779,'Someone in your party is Deserter. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(780,'Someone in your party is already in three battleground queues. You cannot join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(781,'You cannot teleport to a battleground or arena map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(782,'You cannot summon players to a battleground or arena map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(783,'You must be in GM mode to teleport to a player in a battleground.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(784,'You cannot teleport to a battleground from another battleground. Please leave the current battleground first.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(785,'Arena testing turned %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(786,'|cffff0000[Automatic]:|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(787,'|cffffff00[|c1f40af20Announce by|r |cffff0000%s|cffffff00]:|r %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

TRUNCATE  TABLE playercreateinfo_item;

DELETE FROM `spell_elixir` WHERE `entry` = 45373;
INSERT INTO `spell_elixir` VALUES (45373,0x1);

UPDATE `creature_template` SET `ScriptName`='boss_warchief_kargath_bladefist' WHERE `entry`=16808;
UPDATE `instance_template` SET `script`='instance_deadmines' WHERE `map`=36;
UPDATE `item_template` SET `ScriptName`='item_defias_gunpowder' WHERE `entry`=5397;

UPDATE `creature_template` SET `ScriptName`='npc_second_trial_paladin' WHERE `entry` IN (17809,17810,17811,17812);
UPDATE `creature_template` SET `ScriptName`='npc_second_trial_controller' WHERE `entry` IN (17807);
UPDATE `gameobject_template` SET `ScriptName`='go_second_trial' WHERE `entry` IN (182052);

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1645009 AND -1645006;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `comment`) VALUES
(-1645006,'Let the trial begin, Bloodwrath, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,'master_kelerun_bloodmourn YELL_PHASE'),
(-1645007,'Champion Lightrend, make me proud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,'master_kelerun_bloodmourn YELL_PHASE'),
(-1645008,'Show this upstart how a real Blood Knight fights, Swiftblade!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,'master_kelerun_bloodmourn YELL_PHASE'),
(-1645009,'Show $N the meaning of pain, Sunstriker!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,'master_kelerun_bloodmourn YELL_PHASE');

DELETE FROM spell_linked_spell WHERE `spell_trigger` IN (-19386, -24132, -24133, -27068, -49011, -49012);
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-19386, 24131, 0, 'Wyvern Sting');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-24132, 24134, 0, 'Wyvern Sting');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-24133, 24135, 0, 'Wyvern Sting');
INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-27068, 27069, 0, 'Wyvern Sting');
-- Rank 5 (not available till wotlk)
-- INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-49011, 49009, 0, 'Wyvern Sting');
-- Rank 6 (not available till wotlk)
-- INSERT INTO spell_linked_spell (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-49012, 49010, 0, 'Wyvern Sting');

DELETE FROM `spell_script_target` WHERE `entry` IN (34186, 42492, 33831, 5628, 45109, 45149);
INSERT INTO `spell_script_target` VALUES (34186, 1, 16938);
INSERT INTO `spell_script_target` VALUES (42492, 1, 0);
INSERT INTO `spell_script_target` VALUES (33831, 1, 0);
INSERT INTO `spell_script_target` VALUES (5628, 1, 2011);
INSERT INTO `spell_script_target` VALUES (5628, 1, 2012);
INSERT INTO `spell_script_target` VALUES (5628, 1, 2013);
INSERT INTO `spell_script_target` VALUES (5628, 1, 2014);
INSERT INTO `spell_script_target` VALUES (45109, 1, 25084);
INSERT INTO `spell_script_target` VALUES (45149, 0, 300154);

UPDATE `gameobject_template` SET `ScriptName`='go_altar_of_the_keepers' WHERE `entry`=130511;
UPDATE `gameobject_template` SET `ScriptName`='go_altar_of_archaedas' WHERE `entry`=133234;

UPDATE `instance_template` SET `script`='instance_uldaman' WHERE `map`=70;

-- Archaedas
UPDATE `creature_template` SET `ScriptName`='boss_archaedas' WHERE `entry`=2748;

-- Archaedas' minions
UPDATE `creature_template` SET `ScriptName`='mob_archaedas_minions' WHERE `entry` IN ('7309', '7077', '7076', '10120');

-- Stone keepers
UPDATE `creature_template` SET `ScriptName`='mob_stonekeepers' WHERE `entry`=4857;

UPDATE `instance_template` SET `script`='instance_scarlet_monastery' WHERE `map`='189';
UPDATE `gameobject_template` SET `ScriptName`='go_loosely_turned_soil' WHERE `entry`='186314';

UPDATE `creature_template` SET `ScriptName`='boss_headless_horseman',
`minlevel`=70, `maxlevel`=70, `minhealth`=67068, `maxhealth`=67068,
`minmana`=3155, `maxmana`=3155, `type`=6
 WHERE `entry` = 23682;

UPDATE `creature_template` SET `ScriptName`='mob_head',
 `minlevel`=70, `maxlevel`=70, `type`=6, `modelid_h`=21908,
`minhealth`=24300, `maxhealth`=24300,
`faction_A`=14, `faction_H`=14
WHERE `entry` = 23775;

UPDATE `creature_template` SET `ScriptName`='mob_pulsing_pumpkin',
`faction_A`=14, `faction_H`=14, `type`=6,
`minlevel`=70, `maxlevel`=70,
`minhealth`=9781, `maxhealth`=9781,
`minmana`=3155, `maxmana`=3155
WHERE `entry` = 23694;

-- helper
UPDATE `creature_template` SET `ScriptName`='mob_wisp_invis',
`faction_A`=35, `faction_H`=35,
`unit_flags`='33554434' WHERE `entry`='23686';

-- pumpkin fiend
UPDATE `creature_template` SET
 `minlevel`=70, `maxlevel`=70,
`faction_A`=14, `faction_H`=14,
`type`=6
WHERE `entry`='23545';

-- wisp
UPDATE `creature_template` SET `ScriptName`='mob_wisp_invis',
`modelid_a`=21342, `modelid_h`=21342,
`faction_A`=35, `faction_H`=35, `unit_flags`='33554434'
WHERE `entry`='24034';

UPDATE `creature_template` SET `equipment_id`=23682 WHERE `entry` = 23682;
replace into`creature_equip_template` (`entry`, `equipmodel1`, `equipmodel2`, `equipmodel3`, `equipinfo1`, `equipinfo2`, `equipinfo3`, `equipslot1`, `equipslot2`, `equipslot3`)
VALUES (23682, 50495, 0, 0, 33490690, 0, 0, 781, 0, 0);

REPLACE INTO `script_texts` VALUES
(-1189001, 'It is over, your search is done! Let fate choose now, the righteous one',0,0,0,0,0,0,0,0,11961,1,0,'Headless Horseman SAY_ENTRANCE'),

(-1189002, 'Here\'s my body, fit and pure! Now, your blackened souls I\'ll cure!',0,0,0,0,0,0,0,0,12567,1,0,'Headless Horseman SAY_REJOINED'),

(-1189003, 'Over here, you idiot!',0,0,0,0,0,0,0,0,12569,1,0,'Headless Horseman SAY_LOST_HEAD'),

(-1189004, 'Harken, cur! Tis you I spurn! Now, $N, feel the burn!',0,0,0,0,0,0,0,0,12573,1,0,'Headless Horseman SAY_CONFLAGRATION'),

(-1189005, 'Soldiers arise, stand and fight! Bring victory at last to this fallen knight!',0,0,0,0,0,0,0,0,11963,1,0,'Headless Horseman SAY_SPROUTING_PUMPKINS'),

(-1189006, 'Your body lies beaten, battered and broken. Let my curse be your own, fate has spoken',0,0,0,0,0,0,0,0,11962,0,0,'Headless Horseman SAY_PLAYER_DEATH'),

(-1189007, 'This end have I reached before. What new adventure lies in store?',0,0,0,0,0,0,0,0,11964,0,0,'Headless Horseman SAY_DEATH');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (31224,41292,44007,44867);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(31224,  -1543,  2, 'Cloak of Shadows - Flare'),
(41292,  42017,  2, 'Aura of Suffering'),
(44007,  -43657, 2, 'Storm Eye Safe Zone Immune'),
(44867,  -46019, 2, 'Spectral Exhaustion - Teleport: Spectral Realm');

DELETE FROM `spell_linked_spell` WHERE `spell_effect` IN ('33686', '31705');
INSERT INTO `spell_linked_spell`(`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
('-33711','33686','0','Murmur\'s Shockwave (Normal)'),
('-38794','33686','0','Murmur\'s Shockwave (Heroic)'),
('33686','31705','0','Murmur\'s Shockwave Jump');

UPDATE `creature_template` SET `ScriptName`='boss_the_black_stalker' WHERE `entry`='17882';

DELETE FROM `spell_script_target` WHERE `entry` IN ('44807', '32307', '32314');
INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES
('44807', '1', '24850'), 
('44807', '1', '24892'),
('32307', '2', '17146'),
('32307', '2', '17147'),
('32307', '2', '17148'),
('32307', '2', '18658'),
('32314', '2', '17138'),
('32314', '2', '18037'),
('32314', '2', '18064'),
('32314', '2', '18065');

update creature_template set scriptname = 'npc_plains_vision' where entry = 2983;

update creature_template set scriptname = 'npc_plucky' where entry in (6626);

INSERT INTO `spell_proc_event` VALUES (17619, 0x00, 13, 0x0000000000000000, 0x00008000, 0x00000000, 0.000000, 0.000000, 0);

DELETE from `spell_affect` where entry=16999 and effectId=0;
DELETE from `spell_affect` where entry=16999 and effectId=2;
INSERT INTO `spell_affect` VALUES (16999, 0, 0x1000001000);
INSERT INTO `spell_affect` VALUES (16999, 2, 0x1000001000);
DELETE from `spell_affect` where entry=16998 and effectId=0;
DELETE from `spell_affect` where entry=16998 and effectId=2;
INSERT INTO `spell_affect` VALUES (16998, 0, 0x1000001000);
INSERT INTO `spell_affect` VALUES (16998, 2, 0x1000001000);

DELETE from `spell_affect` where entry=16999;
DELETE from `spell_affect` where entry=16998;
INSERT INTO `spell_affect` VALUES (16998, 0, 0x40000001000);
INSERT INTO `spell_affect` VALUES (16998, 1, 0x40000001000);
INSERT INTO `spell_affect` VALUES (16998, 2, 0x40000001000);
INSERT INTO `spell_affect` VALUES (16999, 0, 0x40000001000);
INSERT INTO `spell_affect` VALUES (16999, 1, 0x40000001000);
INSERT INTO `spell_affect` VALUES (16999, 2, 0x40000001000);


DROP TABLE IF EXISTS `access_requirement`;
CREATE TABLE `access_requirement` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Identifier',
  `level_min` tinyint(3) unsigned NOT NULL default '0',
  `level_max` tinyint(3) unsigned NOT NULL default '0',
  `item` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `item2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `heroic_key` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `heroic_key2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_done` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `quest_failed_text` TEXT NULL DEFAULT NULL,
  `heroic_quest_done` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `heroic_quest_failed_text` TEXT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';


ALTER TABLE `instance_template`
 DROP COLUMN `levelMin`,
 DROP COLUMN `levelMax`,
 ADD COLUMN `access_id` bigint(20) unsigned NOT NULL DEFAULT '0' AFTER `reset_delay`;

ALTER TABLE `areatrigger_teleport`
 DROP COLUMN `required_level`,
 DROP COLUMN `required_item`,
 DROP COLUMN `required_item2`,
 DROP COLUMN `heroic_key`,
 DROP COLUMN `heroic_key2`,
 DROP COLUMN `heroic_required_quest_done`,
 DROP COLUMN `heroic_required_failed_quest_text`,
 DROP COLUMN `required_quest_done`,
 DROP COLUMN `required_failed_text`,
 ADD COLUMN `access_id` bigint(20) unsigned NOT NULL DEFAULT '0' AFTER `name`;

INSERT INTO `access_requirement` VALUES
('1','10','0','0','0','0','0','0',NULL,'0',NULL,'instance Shadowfang Keep (33)'),
('2','15','0','0','0','0','0','0',NULL,'0',NULL,'instance The Stockade (34)'),
('3','10','0','0','0','0','0','0',NULL,'0',NULL,'instance The Deadmines (36)'),
('4','10','0','0','0','0','0','0',NULL,'0',NULL,'instance Wailing Caverns (43)'),
('5','15','0','0','0','0','0','0',NULL,'0',NULL,'instance Razorfen Kraul (47)'),
('6','10','0','0','0','0','0','0',NULL,'0',NULL,'instance Blackfathom Deeps (48)'),
('7','30','0','0','0','0','0','0',NULL,'0',NULL,'instance Uldaman (70)'),
('8','15','0','0','0','0','0','0',NULL,'0',NULL,'instance Gnomeregan (90)'),
('9','35','0','0','0','0','0','0',NULL,'0',NULL,'instance Sunken Temple (109)'),
('10','25','0','0','0','0','0','0',NULL,'0',NULL,'instance Razorfen Downs (129)'),
('11','20','0','0','0','0','0','0',NULL,'0',NULL,'instance Scarlet Monastery (189)'),
('12','35','0','0','0','0','0','0',NULL,'0',NULL,'instance Zul\'Farrak (209)'),
('13','45','0','0','0','0','0','0',NULL,'0',NULL,'instance Blackrock Spire (229)'),
('14','40','0','0','0','0','0','0',NULL,'0',NULL,'instance Blackrock Depths (230)'),
('15','55','0','16309','0','0','0','0',NULL,'0',NULL,'instance Onyxia\'s Lair (249)'),
('16','66','0','0','0','30635','0','10285','You can\'t enter Black Morass until you rescue Thrall from Durnholde Keep.','0',NULL,'instance The Black Morass (269)'),
('17','45','0','13704','0','0','0','0',NULL,'0',NULL,'instance Scholomance (289)'),
('18','50','0','0','0','0','0','0',NULL,'0',NULL,'instance Zul\'Gurub (309)'),
('19','45','0','0','0','0','0','0',NULL,'0',NULL,'instance Stratholme (329)'),
('20','30','0','0','0','0','0','0',NULL,'0',NULL,'instance Maraudon (349)'),
('21','8','0','0','0','0','0','0',NULL,'0',NULL,'instance Ragefire Chasm (389)'),
('22','50','0','0','0','0','0','7487',NULL,'0',NULL,'instance Molten Core (409)'),
('23','45','0','0','0','0','0','0',NULL,'0',NULL,'instance Dire Maul (429)'),
('24','60','0','0','0','0','0','7761',NULL,'0',NULL,'instance Blackwing Lair (469)'),
('25','60','0','0','0','0','0','0',NULL,'0',NULL,'instance Ruins of Ahn\'Qiraj (509)'),
('26','60','0','0','0','0','0','0',NULL,'0',NULL,'instance Temple of Ahn\'Qiraj (531)'),
('27','68','0','0'/*'24490'*/,'0','0','0','0',NULL,'0',NULL,'instance Karazhan (532)'),
('28','60','0','0','0','0','0','0',NULL,'0',NULL,'instance Naxxramas (533)'),
('29','70','0','0','0','0','0','0',NULL,'0',NULL,'instance Hyjal Summit (534)'),
('30','55','0','0'/*'28395'*/,'0','30637','30622','0',NULL,'0',NULL,'instance The Shattered Halls (540)'),
('31','55','0','0','0','30637','30622','0',NULL,'0',NULL,'instance The Blood Furnace (542)'),
('32','55','0','0','0','30637','30622','0',NULL,'0',NULL,'instance Hellfire Ramparts (543)'),
('33','65','0','0','0','0','0','0',NULL,'0',NULL,'instance Magtheridon\'s Lair (544)'),
('34','55','0','0','0','30623','0','0',NULL,'0',NULL,'instance The Steamvault (545)'),
('35','55','0','0','0','30623','0','0',NULL,'0',NULL,'instance The Underbog (546)'),
('36','55','0','0','0','30623','0','0',NULL,'0',NULL,'instance The Slave Pens (547)'),
('37','70','0','0','0','0','0','0'/*'10901'*/,NULL,'0',NULL,'instance Serpentshrine Cavern (548)'),
('38','70','0','0'/*'31704'*/,'0','0','0','0',NULL,'0',NULL,'instance The Eye (550)'),
('39','68','0','0'/*'31084'*/,'0','30634','0','0',NULL,'0',NULL,'instance The Arcatraz (552)'),
('40','68','0','0','0','30634','0','0',NULL,'0',NULL,'instance The Botanica (553)'),
('41','68','0','0','0','30634','0','0',NULL,'0',NULL,'instance The Mechanar (554)'),
('42','65','0','27991','0','30633','0','0',NULL,'0',NULL,'instance Shadow Labyrinth (555)'),
('43','55','0','0','0','30633','0','0',NULL,'0',NULL,'instance Sethekk Halls (556)'),
('44','55','0','0','0','30633','0','0',NULL,'0',NULL,'instance Mana-Tombs (557)'),
('45','55','0','0','0','30633','0','0',NULL,'0',NULL,'instance Auchenai Crypts (558)'),
('46','66','0','0','0','30635','0','0',NULL,'0',NULL,'instance Old Hillsbrad Foothills (560)'),
('47','70','0','0','0','0','0','0',NULL,'0',NULL,'instance Black Temple (564)'),
('48','65','0','0','0','0','0','0',NULL,'0',NULL,'instance Gruul\'s Lair (565)'),
('49','70','0','0','0','0','0','0',NULL,'0',NULL,'instance Zul\'Aman (568)'),
('50','70','0','0','0','0','0','0',NULL,'0',NULL,'instance Sunwell Plateau (580)'),
('51','70','0','0','0','0','0','0',NULL,'11492','Heroic Difficulty requires completion of the "Hard to Kill" quest.','instance Magisters\' Terrace (585)'),
('52','58','0','0','0','0','0','0',NULL,'0',NULL,'Dark Portal');

UPDATE `instance_template` SET `access_id` = '1' WHERE `map` = '33';
UPDATE `instance_template` SET `access_id` = '2' WHERE `map` = '34';
UPDATE `instance_template` SET `access_id` = '3' WHERE `map` = '36';
UPDATE `instance_template` SET `access_id` = '4' WHERE `map` = '43';
UPDATE `instance_template` SET `access_id` = '5' WHERE `map` = '47';
UPDATE `instance_template` SET `access_id` = '6' WHERE `map` = '48';
UPDATE `instance_template` SET `access_id` = '7' WHERE `map` = '70';
UPDATE `instance_template` SET `access_id` = '8' WHERE `map` = '90';
UPDATE `instance_template` SET `access_id` = '9' WHERE `map` = '109';
UPDATE `instance_template` SET `access_id` = '10' WHERE `map` = '129';
UPDATE `instance_template` SET `access_id` = '11' WHERE `map` = '189';
UPDATE `instance_template` SET `access_id` = '12' WHERE `map` = '209';
UPDATE `instance_template` SET `access_id` = '13' WHERE `map` = '229';
UPDATE `instance_template` SET `access_id` = '14' WHERE `map` = '230';
UPDATE `instance_template` SET `access_id` = '15' WHERE `map` = '249';
UPDATE `instance_template` SET `access_id` = '16' WHERE `map` = '269';
UPDATE `instance_template` SET `access_id` = '17' WHERE `map` = '289';
UPDATE `instance_template` SET `access_id` = '18' WHERE `map` = '309';
UPDATE `instance_template` SET `access_id` = '19' WHERE `map` = '329';
UPDATE `instance_template` SET `access_id` = '20' WHERE `map` = '349';
UPDATE `instance_template` SET `access_id` = '21' WHERE `map` = '389';
UPDATE `instance_template` SET `access_id` = '22' WHERE `map` = '409';
UPDATE `instance_template` SET `access_id` = '23' WHERE `map` = '429';
UPDATE `instance_template` SET `access_id` = '24' WHERE `map` = '469';
UPDATE `instance_template` SET `access_id` = '25' WHERE `map` = '509';
UPDATE `instance_template` SET `access_id` = '26' WHERE `map` = '531';
UPDATE `instance_template` SET `access_id` = '27' WHERE `map` = '532';
UPDATE `instance_template` SET `access_id` = '28' WHERE `map` = '533';
UPDATE `instance_template` SET `access_id` = '29' WHERE `map` = '534';
UPDATE `instance_template` SET `access_id` = '30' WHERE `map` = '540';
UPDATE `instance_template` SET `access_id` = '31' WHERE `map` = '542';
UPDATE `instance_template` SET `access_id` = '32' WHERE `map` = '543';
UPDATE `instance_template` SET `access_id` = '33' WHERE `map` = '544';
UPDATE `instance_template` SET `access_id` = '34' WHERE `map` = '545';
UPDATE `instance_template` SET `access_id` = '35' WHERE `map` = '546';
UPDATE `instance_template` SET `access_id` = '36' WHERE `map` = '547';
UPDATE `instance_template` SET `access_id` = '37' WHERE `map` = '548';
UPDATE `instance_template` SET `access_id` = '38' WHERE `map` = '550';
UPDATE `instance_template` SET `access_id` = '39' WHERE `map` = '552';
UPDATE `instance_template` SET `access_id` = '40' WHERE `map` = '553';
UPDATE `instance_template` SET `access_id` = '41' WHERE `map` = '554';
UPDATE `instance_template` SET `access_id` = '42' WHERE `map` = '555';
UPDATE `instance_template` SET `access_id` = '43' WHERE `map` = '556';
UPDATE `instance_template` SET `access_id` = '44' WHERE `map` = '557';
UPDATE `instance_template` SET `access_id` = '45' WHERE `map` = '558';
UPDATE `instance_template` SET `access_id` = '46' WHERE `map` = '560';
UPDATE `instance_template` SET `access_id` = '47' WHERE `map` = '564';
UPDATE `instance_template` SET `access_id` = '48' WHERE `map` = '565';
UPDATE `instance_template` SET `access_id` = '49' WHERE `map` = '568';
UPDATE `instance_template` SET `access_id` = '50' WHERE `map` = '580';
UPDATE `instance_template` SET `access_id` = '51' WHERE `map` = '585';
UPDATE `areatrigger_teleport` SET `access_id` = '52' WHERE `id` IN ('4352','4354');

DELETE FROM spell_proc_event where entry IN (31124, 31126);
INSERT INTO spell_proc_event () VALUES
(31124, 0, 8, 553648142, 0, 0, 0, 0, 0),
(31126, 0, 8, 553648142, 0, 0, 0, 0, 0);

DELETE FROM `spell_affect` WHERE `entry`='14177' AND `effectId`='0';
INSERT INTO `spell_affect` VALUES ('14177', '0', '61741335326');
 
DELETE FROM `spell_affect` WHERE `entry`='13733' AND `effectId`='1';
DELETE FROM `spell_affect` WHERE `entry`='13865' AND `effectId`='1';
DELETE FROM `spell_affect` WHERE `entry`='13866' AND `effectId`='1';
INSERT INTO `spell_affect` VALUES ('13733', '1', '25769803776');
INSERT INTO `spell_affect` VALUES ('13865', '1', '25769803776');
INSERT INTO `spell_affect` VALUES ('13866', '1', '25769803776');
 
DELETE FROM `spell_affect` WHERE `entry`='31234' AND `effectId`='0';
DELETE FROM `spell_affect` WHERE `entry`='31235' AND `effectId`='0';
DELETE FROM `spell_affect` WHERE `entry`='31236' AND `effectId`='0';
DELETE FROM `spell_affect` WHERE `entry`='31237' AND `effectId`='0';
DELETE FROM `spell_affect` WHERE `entry`='31238' AND `effectId`='0';
INSERT INTO `spell_affect` VALUES ('31234', '0', '1125920146191');
INSERT INTO `spell_affect` VALUES ('31235', '0', '1125920146191');
INSERT INTO `spell_affect` VALUES ('31236', '0', '1125920146191');
INSERT INTO `spell_affect` VALUES ('31237', '0', '1125920146191');
INSERT INTO `spell_affect` VALUES ('31238', '0', '1125920146191');
 
DELETE FROM `spell_proc_event` WHERE `entry`='14186';
DELETE FROM `spell_proc_event` WHERE `entry`='14190';
DELETE FROM `spell_proc_event` WHERE `entry`='14193';
DELETE FROM `spell_proc_event` WHERE `entry`='14194';
DELETE FROM `spell_proc_event` WHERE `entry`='14195';
INSERT INTO `spell_proc_event` VALUES ('14186', '0', '8', '26851935496', '0', '2', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('14190', '0', '8', '26851935496', '0', '2', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('14193', '0', '8', '26851935496', '0', '2', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('14194', '0', '8', '26851935496', '0', '2', '0', '0', '1');
INSERT INTO `spell_proc_event` VALUES ('14195', '0', '8', '26851935496', '0', '2', '0', '0', '1');

DELETE FROM `spell_proc_event` WHERE `entry` = 36070;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(36070, 0x00, 0, 0x00000000, 0x00000008, 0x00000000, 0.000000, 0.000000, 0);

UPDATE `gameobject_template` SET `ScriptName` = 'go_jump_a_tron' WHERE `entry` = 183146;

UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184421;

UPDATE `gameobject_template` SET `scriptname` = 'go_sacred_fire_of_life' WHERE `entry` = 175944;

UPDATE `gameobject_template` SET `scriptname`='go_skull_pile' WHERE `entry`=185913;

DELETE FROM command WHERE name IN ('reload spell_linked_spell');
INSERT INTO command (name, security, help) VALUES
('reload spell_linked_spell','3','Usage: .reload spell_linked_spell\r\nReloads the spell_linked_spell DB table.');

UPDATE `creature_template` SET `ScriptName`='mob_giant_infernal' WHERE `entry`=17908;
UPDATE `creature_template` SET `ScriptName`='mob_abomination' WHERE `entry`=17898;
UPDATE `creature_template` SET `ScriptName`='mob_ghoul' WHERE `entry`=17895;
UPDATE `creature_template` SET `ScriptName`='mob_necromancer' WHERE `entry`=17899;
UPDATE `creature_template` SET `ScriptName`='mob_banshee' WHERE `entry`=17905;
UPDATE `creature_template` SET `ScriptName`='mob_crypt_fiend' WHERE `entry`=17897;
UPDATE `creature_template` SET `ScriptName`='mob_fel_stalker' WHERE `entry`=17916;
UPDATE `creature_template` SET `ScriptName`='mob_frost_wyrm' WHERE `entry`=17907;
UPDATE `creature_template` SET `ScriptName`='mob_gargoyle' WHERE `entry`=17906;
UPDATE `creature_template` SET `ScriptName`='alliance_rifleman' WHERE `entry`=17921;

UPDATE `creature_template` SET `ScriptName`='mob_towering_infernal' WHERE `entry`=17818;
UPDATE `creature_template` SET `ScriptName`='boss_anetheron' WHERE `entry`=17808;

UPDATE `creature_template` SET `ScriptName`='boss_azgalor' WHERE `entry`=17842;
UPDATE `creature_template` SET `ScriptName`='mob_lesser_doomguard' WHERE `entry`=17864;

UPDATE `creature_template` SET `ScriptName`='boss_kazrogal' WHERE `entry`=17888;

UPDATE `creature_template` SET `ScriptName`='boss_rage_winterchill' WHERE `entry`=17767;

UPDATE `creature_template` SET `scale`='0.5' WHERE `entry`=17968;

UPDATE `creature_template` SET `equipment_id`='17888' WHERE `entry`=17888;
UPDATE `creature_template` SET `equipment_id`='17921' WHERE `entry`=17921;

DELETE FROM creature_equip_template WHERE `entry` IN (17888, 17921);
INSERT INTO creature_equip_template () VALUES (17888, 45776, 0, 0, 33490946, 0, 0, 0, 0, 0);
INSERT INTO creature_equip_template () VALUES (17921, 20732, 0, 20732, 33489666, 0, 33489666, 26, 0, 26);




DELETE FROM `spell_affect` WHERE `entry`='12472' AND `effectId`='1';
INSERT INTO `spell_affect` VALUES ('12472', '1', "18446744073709551615");

UPDATE `creature_template` SET `mindmg`=700, `maxdmg`=1200, `attackpower`=1000, `flags_extra`=196641 WHERE `entry`=23418;

DELETE FROM `trinity_string` WHERE `entry`=2025;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2025','|cff00ff00Created|r:|cff00ccff %s ago|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS `creature_linked_respawn`;
CREATE TABLE `creature_linked_respawn` (
  `guid` int(10) unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) unsigned NOT NULL COMMENT 'master creature',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';

DELETE FROM `trinity_string` WHERE `entry` = '750';
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('750', 'linkGUID: %u, Entry: %u (%s)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

insert into `command` (`name`, `security`, `help`) values('go ticket','1','Syntax: .go ticket #ticketid\r\nTeleports the user to the location where $ticketid was created.');

-- Kil'jaeden --

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 45909;
DELETE FROM `spell_script_target` WHERE `entry` IN (46589, 45839);
INSERT INTO `spell_script_target` () VALUES (46589, 1, 30598);
INSERT INTO `spell_script_target` () VALUES (46589, 1, 30614);
INSERT INTO `spell_script_target` () VALUES (45839, 1, 25653);

DELETE FROM `creature_template` WHERE entry in (30598, 30614);
INSERT INTO `creature_template` () VALUES 
(30598, 0, 4449, 0, 4449, 0, 'Spike Target', '', '', 70, 70, 1, 1, 0, 0, 0, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 2600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 1, 0, 0, 128, ''),
(30614, 0, 4449, 0, 4449, 0, 'Spike Target 2', '', '', 70, 70, 1, 1, 0, 0, 0, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 2600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 0, 1, 0, 0, 128, '');

UPDATE `creature_template` SET `flags_extra` = 128  WHERE `entry` IN (30614, 30598, 25735);
UPDATE `creature_template` SET `minlevel` = 73, `maxlevel` = 73, unit_flags = 33554432, minhealth=5000000, maxhealth=5000000 WHERE entry IN (26046, 25319);
UPDATE `creature_template` SET `minlevel` = 70, `unit_flags` = 33554432 WHERE entry = 26046;
UPDATE `creature_template` SET `minlevel` =70, `maxlevel` = 70, `unit_flags` = 33554432, spell1 = 45848, spell2 = 45862, spell3 = 45860, spell4 = 45856, minhealth = 5000000, maxhealth=5000000 WHERE entry=25653;
UPDATE `creature_template` SET `minlevel` = 70, `maxlevel` = 70, `minhealth` = 20000, maxhealth = 20000 WHERE entry = 25502;
UPDATE `creature_template` SET `minhealth` = 12600000, maxhealth = 12600000, minmana = 2000000, maxmana = 2000000 WHERE entry = 25315;
UPDATE `creature_template` SET `minhealth` = 110000, maxhealth = 110000, minmana = 100000, maxmana = 100000 WHERE entry =25708;
UPDATE `creature_template` SET `minlevel` = 73, `maxlevel` = 73 WHERE entry = 25735;

DELETE FROM creature WHERE id IN (25319, 25588, 25608);
INSERT INTO creature (id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(25319, 580, 1, 0, 0, 1701.7, 635.515, 72.2884, 4.65461, 25, 0, 0, 1, 0, 0, 0),
(25608, 580, 1, 0, 0, 1698.9, 627.877, 27.6233, 0.034907, 604800, 0, 0, 1, 0, 0, 0);

DELETE FROM gameobject WHERE id=188415;
INSERT INTO gameobject (id, map, spawnMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(188415, 580, 1, 1653.12, 635.41, 28.0932, 0.0977725, 0, 0, 0.0488668, 0.998805, 25, 0, 1),
(188415, 580, 1, 1704.14, 583.591, 28.1696, 1.59003, 0, 0, 0.713874, 0.700274, 25, 0, 1),
(188415, 580, 1, 1745.68, 621.823, 28.0505, 2.93777, 0, 0, 0.994812, 0.101733, 25, 0, 1),
(188415, 580, 1, 1694.48, 674.29, 28.0502, 4.86985, 0, 0, 0.649302, -0.760531, 25, 0, 1);
UPDATE `gameobject_template` SET `type` = 1 WHERE `entry` = 188415;

-- M'uru --
UPDATE `creature_template` SET `modelid_A` = 23842 WHERE `entry` = 25744;
UPDATE `creature_template` SET `flags_extra` = 128 WHERE entry IN (25855, 25770);
UPDATE `creature_template` SET `spell1` = 46262, flags_extra = 128, scriptname = '' WHERE entry = 25879;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (46242, 46228, 46228, 46262);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46242, 46247, 0, 'Black Hole Visual (Birth)');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46228, 46235, 0, 'Black Hole Visual (Grown)');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46228, -46247, 0, 'Black Hole Visual (Grown)');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (46262, 46265, 0, 'Void Zone Visual');

DELETE FROM `spell_script_target` WHERE `entry` IN (45976, 46177);
INSERT INTO `spell_script_target` VALUES (45976, 1, 25770);
INSERT INTO `spell_script_target` VALUES (46177, 1, 25770);

-- EAI for Berserks FROM Megamage
DELETE FROM `eventai_scripts` WHERE `creature_id` = 25798;
INSERT INTO `eventai_scripts` (`id`, `creature_id`, `event_type`, `event_flags`,`event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`, `event_chance`, `event_inverse_phase_mask`) VALUES
(2579800, 25798, 11, 0, 0*1000, 0*1000, 0*1000, 0*1000, 11, 45769, 0, 0, 20, 1, 0, 0, 21, 1, 0, 0,"Shadowsword Berserker - Sunwell Radiance", 100, 0),
(2579801, 25798, 0, 1, 10*1000, 12*1000, 10*1000, 15*1000, 11, 46160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Berserker - Cast Flurry', 70, 0),
(2579802, 25798, 1, 0, 180*1000, 180*1000, 0*1000, 0*1000, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Berserker - 180s OOC => Evade', 100, 0);


-- Brutallus --
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 24882;

-- Felmyst --
UPDATE `creature_template` SET `modelid_H` = 22838 WHERE `entry` = 25038;

DELETE FROM `script_texts` WHERE `entry` BETWEEN '-1580109' and '-1580036';

INSERT INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `comment`) VALUES
(-1580036, 'Glory to Kil\'jaeden! Death to all who oppose!', 12477, 1, 'felmyst - YELL_BIRTH'),
(-1580037, 'I kill for the master!', 12480, 1, 'felmyst - YELL_KILL1'),
(-1580038, 'The end has come!', 12481, 1, 'felmyst - YELL_KILL2'),
(-1580039, 'Choke on your final breath!', 12478, 1, 'felmyst - YELL_BREATH'),
(-1580040, 'I am stronger than ever before!', 12479, 1, 'felmyst- YELL_TAKEOFF'),
(-1580041, 'No more hesitation! Your fates are written!', 12482, 1, 'felmyst - YELL_BERSERK'),
(-1580042, 'Kil\'jaeden... will... prevail...', 12483, 1, 'felmyst - YELL_DEATH'),
(-1580043, 'Madrigosa deserved a far better fate. You did what had to be done, but this battle is far from over.', 12439, 1, 'felmyst - YELL_KALECGOS'),

(-1580044, 'Fire to the aid of shadow!', 12489, 1, 'eredar - YELL_CANFLAGRATION'),
(-1580045, 'Sacrolash!', 12492, 1, 'eredar - YELL_SISTER_SACROLASH_DEAD'),
(-1580046, 'Fire consume.', 12490, 1, 'eredar - YELL_ALY_KILL_1'),
(-1580047, 'Ed-ir Halach!', 12491, 1, 'eredar - YELL_ALY_KILL_2'),
(-1580048, 'De-ek Anur!', 12494, 1, 'eredar - YELL_ALY_DEAD'),
(-1580049, 'Your luck has run its curse!', 12493, 1, 'eredar - YELL_BERSERK'),
(-1580050, 'Shadow to the aid of fire!', 12485, 1, 'eredar - YELL_SHADOW_NOVA'),
(-1580051, 'Alythess! Your fire burns within me!', 12488, 1, 'eredar - YELL_SISTER_ALYTHESS_DEAD'),
(-1580052, 'Shadow engulf.', 12486, 1, 'eredar - YELL_SAC_KILL_1'),
(-1580053, 'Ee-nok Kryul!', 12487, 1, 'eredar - YELL_SAC_KILL_2'),
(-1580054, 'I... fade.', 0, 1, 'eredar - YELL_SAC_DEAD'),
(-1580055, 'Time is a luxury you no longer possess!', 0, 1, 'eredar - YELL_ENRAGE'),

(-1580056, 'Misery...', 12484, 1, 'eredar - YELL_INTRO_SAC_1'),
(-1580057, 'Depravity...', 0, 1, 'eredar - YELL_INTRO_ALY_2'),
(-1580058, 'Confusion...', 0, 1, 'eredar - YELL_INTRO_SAC_3'),
(-1580059, 'Hatred...', 0, 1, 'eredar - YELL_INTRO_ALY_4'),
(-1580060, 'Mistrust...', 0, 1, 'eredar - YELL_INTRO_SAC_5'),
(-1580061, 'Chaos...', 0, 1, 'eredar - YELL_INTRO_ALY_6'),
(-1580062, 'These are the hallmarks...', 0, 1, 'eredar - YELL_INTRO_SAC_7'),
(-1580063, 'These are the pillars...', 0, 1, 'eredar - YELL_INTRO_ALY_8'),
(-1580064, 'directs Shadow Nova at $N', 0, 3, 'eredar - emote shadow nova'),
(-1580065, 'directs Conflagration at $N', 0, 3, 'eredar - emote conflagration'),

(-1580066, 'All my plans have led to this!', 12495, 1, 'KJ - SAY_KJ_OFFCOMBAT1'),
(-1580067, 'Stay on task! Do not waste tim!', 12496, 1, 'KJ - SAY_KJ_OFFCOMBAT2'),
(-1580068, 'I have waited long enough!', 12497, 1, 'KJ - SAY_KJ_OFFCOMBAT3'),
(-1580069, 'Fail me and suffer for eternity!', 12498, 1, 'KJ - SAY_KJ_OFFCOMBAT4'),
(-1580070, 'Drain the girl! Drain her power until there is nothing but a vacant shell!', 12499, 1, 'KJ - SAY_KJ_OFFCOMBAT5'),

(-1580071, 'The expendible have perished... So be it! Now I shall succeed where Sargeras could not! I will bleed this wretched world and secure my place as the true master of the Burning Legion. The end has come! Let the unraveling of this world commence!', 12500, 1, 'KJ - SAY_KJ_EMERGE'),
(-1580072, 'Another step towards destruction!', 12501, 1, 'KJ - SAY_KJ_SLAY1'),
(-1580073, 'Anak-ky\'ri!', 12502, 1, 'KJ - SAY_KJ_SLAY2'),
(-1580074, 'Who can you trust?', 12503, 1, 'KJ - SAY_KJ_REFLECTION1'),
(-1580075, 'The enemy is among you.', 12504, 1, 'KJ - SAY_KJ_REFLECTION2'),
(-1580076, 'Chaos!', 12505, 1, 'KJ - SAY_KJ_DARKNESS1'),
(-1580077, 'Destruction!', 12506, 1, 'KJ - SAY_KJ_DARKNESS2'),
(-1580078, 'Oblivion!', 12507, 1, 'KJ - SAY_KJ_DARKNESS3'),
(-1580079, 'I will not be denied! This world shall fall!', 12508, 1, 'KJ - SAY_KJ_PHASE3'),
(-1580080, 'Do not harbor false hope. You cannot win!', 12509, 1, 'KJ - SAY_KJ_PHASE4'),
(-1580081, 'Aggghh! The powers of the Sunwell... turned... against me! What have you done? WHAT HAVE YOU DONE?', 12510, 1, 'KJ - SAY_KJ_PHASE5'),

(-1580082, 'Anveena, you must awaken, this world needs you!', 12445, 1, 'KJ - SAY_KALECGOS_AWAKEN'),
(-1580083, 'I serve only the Master now.', 12511, 1, 'KJ - SAY_ANVEENA_IMPRISONED'),
(-1580084, 'You must let go! You must become what you were always meant to be! The time is now, Anveena!', 12446, 1, 'KJ - SAY_KALECGOS_LETGO'),
(-1580085, 'But I\'m... lost... I cannot find my way back!', 12512, 1, 'KJ - SAY_ANVEENA_LOST'),
(-1580086, 'Anveena, I love you! Focus on my voice, come back for me now! Only you can cleanse the Sunwell!', 12447, 1, 'KJ - SAY_KALECGOS_FOCUS'),
(-1580087, 'Kalec... Kalec?', 12513, 1, 'KJ - SAY_ANVEENA_KALEC'),
(-1580088, 'Yes, Anveena! Let fate embrace you now!', 12448, 1, 'KJ - SAY_KALECGOS_FATE'),
(-1580089, 'The nightmare is over, the spell is broken! Goodbye, Kalec, my love!', 12514, 1, 'KJ - SAY_ANVEENA_GOODBYE'),
(-1580090, 'Goodbye, Anveena, my love. Few will remember your name, yet this day you change the course of destiny. What was once corrupt is now pure. Heroes, do not let her sacrifice be in vain.', 12450, 1, 'KJ - SAY_KALECGOS_GOODBYE'),
(-1580091, 'Strike now, heroes, while he is weakened! Vanquish the Deceiver!', 12449, 1, 'KJ - SAY_KALECGOS_ENCOURAGE'),

(-1580092, 'You are not alone. The Blue Dragonflight shall help you vanquish the Deceiver.', 12438, 1, 'KJ - SAY_KALECGOS_JOIN'),
(-1580093, 'Nooooooooooooo!', 12527, 1, 'KJ - SAY_KJ_DEATH'),
(-1580094, 'begins to channel dark energy', 0, 3, 'KJ - EMOTE_KJ_DARKNESS'),

(-1580095, 'I will channel my power into the orbs, be ready!', 12440, 1, 'KJ - SAY_KALEC_ORB_READY1'),
(-1580096, 'I have empowered another orb! Use it quickly!', 12441, 1, 'KJ - SAY_KALEC_ORB_READY2'),
(-1580097, 'Another orb is ready! Make haste!', 12442, 1, 'KJ - SAY_KALEC_ORB_READY3'),
(-1580098, 'I have channeled all I can! The power is in your hands!', 12443, 1, 'KJ - SAY_KALEC_ORB_READY4'),

(-1580099, 'Mortal heroes, your victory here today was foretold long ago. My brother\'s anguished cry of defeat will echo across the universe, bringing renewed hope to all those who still stand against the Burning Crusade.', 12515, 0, 'prophet velen - SAY1'),
(-1580100, 'As the Legion\'s final defeat draws ever-nearer, stand proud in the knowledge that you have saved worlds without number from the flame. Just as this day marks an ending, so too does it herald a new beginning...', 12516, 0, 'prophet velen - SAY2'), -- van mégegy hang 12517 ami ehhez tartozik
(-1580101, 'The creature Entropius, whom you were forced to destroy, was once the noble naaru, M\'uru. In life, M\'uru channeled vast energies of LIGHT and HOPE. For a time, a misguided few sought to steal those energies...', 12518, 0, 'prophet velen - SAY3'),
(-1580102, 'Then fortunate it is, that I have reclaimed the noble naaru\'s spark from where it fell! Where faith dwells, hope is never lost, young blood elf.', 12519, 0, 'prophet velen - SAY4'),
(-1580103, 'Gaze now, mortals - upon the HEART OF M\'URU! Unblemished. Bathed by the light of Creation - just as it was at the Dawn.', 12520, 0, 'prophet velen - SAY5'),
(-1580104, 'In time, the light and hope held within - will rebirth more than this mere fount of power... Mayhap, they will rebirth the soul of a nation.', 12521, 0, 'prophet velen - SAY6'),
(-1580105, 'Salvation, young one. It waits for us all.', 12522, 0, 'prophet velen - SAY7'),
(-1580106, 'Farewell...', 12523, 0, 'prophet velen - SAY8'),

(-1580107, 'Our arrogance was unpardonable. We damned one of the most noble beings of all. We may never atone for this sin.', 12524, 0, 'lady liadrinn - SAY1'),
(-1580108, 'Can it be?', 12525, 0, 'lady liadrinn - SAY2'),
(-1580109, 'Blessed ancestors! I feel it... so much love... so much grace... there are... no words... impossible to describe...', 12525, 0, 'lady liadrinn - SAY3');

-- Kil'jaeden script --
UPDATE `creature_template` SET `ScriptName` = 'boss_kiljaeden' WHERE `entry` = 25315;
UPDATE `creature_template` SET `ScriptName` = 'boss_kalecgosKJ' WHERE `entry` = 25319;
UPDATE `creature_template` SET `ScriptName` = 'mob_kiljaeden_controller' WHERE `entry` = 25608;
UPDATE `creature_template` SET `ScriptName` = 'mob_hand_of_the_deceiver' WHERE `entry` = 25588;
UPDATE `creature_template` SET `ScriptName` = 'mob_felfire_portal' WHERE `entry` = 25603;
UPDATE `creature_template` SET `ScriptName` = 'mob_volatile_felfire_fiend' WHERE `entry` = 25598;
UPDATE `creature_template` SET `ScriptName` = 'mob_armageddon' WHERE `entry` = 25735;
UPDATE `creature_template` SET `ScriptName` = 'mob_shield_orb' WHERE `entry` = 25502;
UPDATE `creature_template` SET `ScriptName` = 'mob_sinster_reflection' WHERE `entry` = 25708;
UPDATE `gameobject_template` SET `ScriptName` = 'go_orb_of_the_blue_flight' WHERE `entry` = 188415;

-- M'uru& Entropius --
UPDATE `creature_template` SET `ScriptName` = "npc_void_sentinel" WHERE `entry` = 25772;
UPDATE `creature_template` SET `ScriptName` = "npc_dark_fiend" WHERE `entry` = 25744;
UPDATE `creature_template` SET `ScriptName` = "boss_muru" WHERE `entry` = 25741;
UPDATE `creature_template` SET `ScriptName` = "boss_entropius" WHERE `entry` = 25840;
UPDATE `creature_template` SET `ScriptName` = "npc_muru_portal" WHERE `entry` = 25770;
UPDATE `creature_template` SET `ScriptName` = "mob_eventai" WHERE `entry` = 25798;

UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184418 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184419 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184420 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184421 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184422 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184423 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184424 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184425 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184426 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184427 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184428 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184429 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184430 LIMIT 1;
UPDATE `gameobject_template` SET `ScriptName` = 'go_ethereum_prison' WHERE `entry` = 184431 LIMIT 1;

DELETE FROM `spell_affect` WHERE `entry` IN ('16513','16514','16515','16719','16720') AND `effectId`='2';
INSERT INTO `spell_affect` VALUES 
('16513', '2', '268558336'), 
('16514', '2', '268558336'),
('16515', '2', '268558336'),
('16719', '2', '268558336'),
('16720', '2', '268558336');

# 1588
DELETE FROM `trinity_string` WHERE `entry` IN(301, 300);
INSERT INTO `trinity_string` (`entry`, `content_default`)VALUES
('300', 'Your chat has been disabled for %u minutes. Reason: %s.'),
('301', 'You have disabled %s\'s chat for %u minutes. Reason: %s.');

DELETE FROM `command` WHERE `name` = 'mute';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('mute', 1 ,'Syntax: .mute [$playerName] $timeInMinutes [$reason]\r\n\r\nDisible chat messaging for any character from account of character $playerName (or currently selected) at $timeInMinutes minutes. Player can be offline.');

# 1589
-- Spiritual Attunement
UPDATE `spell_proc_event` SET `procFlags` = `procFlags`|0x80000 WHERE `entry` IN ('31785','33776');

# 1616
-- Illumination
UPDATE `spell_proc_event` SET `SpellFamilyMask` = 0x10000C0000000 WHERE `entry` IN ('20210','20212','20213','20214','20215');

UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0, `data0` = 57, `data2` = 0 WHERE `entry` IN (186648, 187021, 186672, 186667);

UPDATE `spell_affect` SET `SpellFamilyMask` = '448' WHERE `entry` = '16179';
UPDATE `spell_affect` SET `SpellFamilyMask` = '448' WHERE `entry` = '16214';
UPDATE `spell_affect` SET `SpellFamilyMask` = '448' WHERE `entry` = '16215';
UPDATE `spell_affect` SET `SpellFamilyMask` = '448' WHERE `entry` = '16216';
UPDATE `spell_affect` SET `SpellFamilyMask` = '448' WHERE `entry` = '16217';
DELETE FROM `spell_proc_event` WHERE `entry`='20178';
INSERT INTO `spell_proc_event` VALUES ('20178', '0', '0', '0', '0', '0', '0', '0', '1');


-- (14113) Improved Poisons (Rank 1)
DELETE FROM `spell_affect` WHERE `entry` IN (14113);
INSERT INTO `spell_affect` VALUES (14113, 0, 0x000000101001E000);

-- (14114) Improved Poisons (Rank 2)
DELETE FROM `spell_affect` WHERE `entry` IN (14114);
INSERT INTO `spell_affect` VALUES (14114, 0, 0x000000101001E000);

-- (14115) Improved Poisons (Rank 3)
DELETE FROM `spell_affect` WHERE `entry` IN (14115);
INSERT INTO `spell_affect` VALUES (14115, 0, 0x000000101001E000);

-- (14116) Improved Poisons (Rank 4)
DELETE FROM `spell_affect` WHERE `entry` IN (14116);
INSERT INTO `spell_affect` VALUES (14116, 0, 0x000000101001E000);

-- (14117) Improved Poisons (Rank 5)
DELETE FROM `spell_affect` WHERE `entry` IN (14117);
INSERT INTO `spell_affect` VALUES (14117, 0, 0x000000101001E000);


