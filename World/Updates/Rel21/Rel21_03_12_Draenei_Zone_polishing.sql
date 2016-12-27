-- ----------------------------------------
-- Added to prevent timeout's while loading
-- ----------------------------------------
SET GLOBAL net_read_timeout=30;
SET GLOBAL net_write_timeout=60;
SET GLOBAL net_buffer_length=1000000; 
SET GLOBAL max_allowed_packet=1000000000;
SET GLOBAL connect_timeout=10000000;

-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.3)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '03'; 
    SET @cOldContent = '11';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '12';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Draenei_Zone_polishing';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Draenei_Zone_polishing';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- UDB UPDATE [557] Draenei Zone - polishing Part1.
-- Draenei Zone - polishing

-- q.9421 'Shaman Training' 
UPDATE quest_template SET OfferRewardEmote1 = 1, OfferRewardEmote2 = 1, OfferRewardEmote3 = 1, OfferRewardEmoteDelay2 = 2000, OfferRewardEmoteDelay3 = 5000 WHERE entry = 9421;

-- q.9409 'Urgent Delivery!'
-- follow-up fixed (quest window wont hang itself anymore) 
UPDATE quest_template SET NextQuestInChain = 9283 WHERE entry = 9409;

-- Zalduun
-- Waypoints + script
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 57213;
DELETE FROM creature_movement WHERE id = 57213;
UPDATE creature_template SET MovementType = 2 WHERE entry = 16502;
DELETE FROM creature_movement_template WHERE entry = 16502;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(16502,1,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,2,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,3,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,4,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,5,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,6,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,7,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,8,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0),
(16502,9,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,10,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,11,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,12,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,13,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,14,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,15,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,16,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,17,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,18,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,19,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,20,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,21,-4102.44,-13763.8,74.5717, 12000, 1650201,2.63796, 0, 0),
(16502,22,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,23,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0),
(16502,24,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,25,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,26,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,27,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,28,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,29,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,30,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,31,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,32,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,33,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,34,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,35,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,36,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,37,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,38,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0),
(16502,39,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,40,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,41,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,42,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,43,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,44,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,45,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,46,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,47,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,48,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,49,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,50,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,51,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,52,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,53,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0), 
(16502,54,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,55,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,56,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,57,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,58,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,59,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,60,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,61,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,62,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,63,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,64,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,65,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,66,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,67,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,68,-4129.88,-13764.2,74.5865, 12000, 1650202,3.28513, 0, 0),
(16502,69,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,70,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,71,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,72,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,73,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,74,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,75,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,76,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,77,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,78,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,79,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,80,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,81,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,82,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,83,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0),
(16502,84,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,85,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,86,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,87,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,88,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,89,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,90,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0),
(16502,91,-4113.68,-13762,73.5694, 0, 0,5.80705, 0, 0),
(16502,92,-4110.51,-13765.2,73.6102, 0, 0,5.19209, 0, 0),
(16502,93,-4107.71,-13772.5,74.6982, 0, 0,5.80705, 0, 0),
(16502,94,-4102.51,-13772.3,74.7185, 0, 0,0.511104, 0, 0),
(16502,95,-4099.89,-13768,74.7256, 0, 0,1.36954, 0, 0),
(16502,96,-4102.44,-13763.8,74.5717, 0, 0,2.63796, 0, 0),
(16502,97,-4125.6,-13762,74.1406, 0, 0,3.4807, 0, 0),
(16502,98,-4129.88,-13764.2,74.5865, 0, 0,3.28513, 0, 0), 
(16502,99,-4135.57,-13762.7,74.657, 0, 0,2.14081, 0, 0),
(16502,100,-4137.16,-13760,74.6108, 0, 0,1.35698, 0, 0),
(16502,101,-4135.66,-13756.6,74.5907, 0, 0,0.545662, 0, 0),
(16502,102,-4131.3,-13754.6,74.6109, 0, 0,6.14319, 0, 0),
(16502,103,-4127.9,-13756.6,74.2825, 0, 0,5.30675, 0, 0),
(16502,104,-4127.08,-13760.8,74.2562, 0, 0,5.74265, 0, 0),
(16502,105,-4121.58,-13761.4,73.5881, 0, 0,0.0354084, 0, 0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1650201,1650202); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1650201,0,0,0,0,0,0,0,2000001010,0,0,0,0,0,0,0,''),
(1650201,2,3,0,0,0,0,0,0,0,0,0,0,0,0,4.31173,''),
(1650201,4,15,29170,0,16971,59238,1,0,0,0,0,0,0,0,0,''),
(1650202,0,0,0,0,0,0,0,2000001010,0,0,0,0,0,0,0,''),
(1650202,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0.157151,''),
(1650202,4,15,29170,0,16971,59240,1,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry = 2000001010;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES 
(2000001010,'Oh no!  I\'m losing this one!',0,0,0,0,NULL);
-- Injured Draenei
UPDATE creature SET Spawntimesecs = 10, curhealth = 12 WHERE id = 16971;
UPDATE creature_template SET RegenerateStats = 0 WHERE entry = 16971;

-- q.9371 'Botanist Taerix' 
UPDATE quest_template SET DetailsEmote1 = 1 WHERE entry = 9371;

-- q.9303 'Inoculation' 
UPDATE quest_template SET PrevQuestId = 0 WHERE entry = 9303;

-- q.9283 'Rescue the Survivors!'
-- Draenei Survivor -- missing added
DELETE FROM creature WHERE guid IN (76416,128970,128971,128972,128973,128975);
DELETE FROM creature_addon WHERE guid IN (76416,128970,128971,128972,128973,128975);
DELETE FROM creature_movement WHERE id IN (76416,128970,128971,128972,128973,128975);
DELETE FROM game_event_creature WHERE guid IN (76416,128970,128971,128972,128973,128975);
DELETE FROM game_event_creature_data WHERE guid IN (76416,128970,128971,128972,128973,128975);
DELETE FROM creature_battleground WHERE guid IN (76416,128970,128971,128972,128973,128975);
DELETE FROM creature_linking WHERE guid IN (76416,128970,128971,128972,128973,128975)
OR master_guid IN (76416,128970,128971,128972,128973,128975);
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES 
(76416,16483,530,1,1,0,0,-4070.36,-13914.9,87.7194,0.453713,60,0,0,57,0,0,0),
(128970,16483,530,1,1,0,0,-4175.48,-13482.1,44.74,3.001966,60,0,0,57,0,0,0),
(128971,16483,530,1,1,0,0,-4381.12,-13481.7,43.1182,0.453713,60,0,0,72,0,0,0),
(128972,16483,530,1,1,0,0,-4386.3,-13424.6,46.2821,2.949606,60,0,0,102,0,0,0),
(128973,16483,530,1,1,0,0,-4480.67,-13447.9,47.3222,5.794493,60,0,0,42,0,0,0),
(128975,16483,530,1,1,0,0,-3918.66,-13674.1,62.6927,0.397932,60,0,0,87,0,0,0);
UPDATE creature SET Spawntimesecs = 60 WHERE id = 16483;
UPDATE creature_template SET Expansion = 0, RegenerateStats = 0 WHERE entry = 16483;
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id = 16483);
UPDATE creature_template_addon SET b2_1_pvp_state = 1 WHERE entry = 16483;

-- q.9294 'Healing the Lake'
-- must automat. show up after prev quest competed.
-- new gossip must show up after q.9293 
UPDATE quest_template SET NextQuestInChain = 9294 WHERE entry = 9293;
UPDATE conditions SET value1 = 9293 WHERE condition_entry = 1033;

-- Respawntime corrected for 'Restless Spirit of Earth'
UPDATE creature SET Spawntimesecs = 60 WHERE id = 17179;

-- q.9451 'Call of Earth'
-- emote corrected 
UPDATE quest_template SET CompleteEmote = 6 WHERE entry = 9451;

-- q.9303 'Inoculation'
-- next quest must automat. show up after this one competed.
UPDATE quest_template SET NextQuestInChain = 9309 WHERE entry = 9303;    
    

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;



        ELSE
            COMMIT;
            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
		IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
		ELSE
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
