--
-- Copyright (C) 2005-2015 MaNGOS <http://getmangos.eu/>
-- Copyright (C) 2009-2015 MaNGOSTwo <https://github.com/mangostwo>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gameobject_addon`
--

DROP TABLE IF EXISTS `gameobject_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameobject_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_rotation0` float NOT NULL DEFAULT '0',
  `path_rotation1` float NOT NULL DEFAULT '0',
  `path_rotation2` float NOT NULL DEFAULT '0',
  `path_rotation3` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameobject_addon`
--

LOCK TABLES `gameobject_addon` WRITE;
/*!40000 ALTER TABLE `gameobject_addon` DISABLE KEYS */;
INSERT INTO `gameobject_addon` (`guid`, `path_rotation0`, `path_rotation1`, `path_rotation2`, `path_rotation3`) VALUES
(6945,0,0,1,-0.0000000437114),
(6946,0,0,1,-0.0000000437114),
(9290,0,0,0.95502,0.296542),
(9411,0,0,0.678801,0.734323),
(9450,0,0,0.678801,0.734323),
(14139,0,0,1,-0.0000000437114),
(16760,0,0,-0.378575,0.92557),
(16761,0,0,-0.378575,0.92557),
(16871,0,0,0.694658,0.71934),
(16874,0,0,0.989651,0.143493),
(16875,0,0,-0.426569,0.904455),
(16876,0,0,0.989651,0.143493),
(16877,0,0,-0.426569,0.904455),
(18298,0,0,0.612217,0.79069),
(18435,0,0,0.612217,0.79069),
(18802,0,0,1,-0.0000000437114),
(18803,0,0,1,-0.0000000437114),
(18804,0,0,1,-0.0000000437114),
(18805,0,0,1,-0.0000000437114),
(18806,0,0,1,-0.0000000437114),
(18807,0,0,1,-0.0000000437114),
(20505,0,0,-0.694658,0.71934),
(20639,0,0,0.612217,0.79069),
(20640,0,0,0.612217,0.79069),
(24055,0,0,-0.526214,0.850352),
(24074,0,0,-0.526214,0.850352),
(24075,0,0,-0.526214,0.850352),
(25138,0,0,0.45399,0.891007),
(34057,0,0,0.000000325841,1),
(35693,0,0,0.989651,0.143493),
(35694,0,0,0.989651,0.143493),
(44890,0,0,-0.0043634,0.99999),
(44891,0,0,-0.0043634,0.99999),
(44892,0,0,-0.0043634,0.99999),
(44893,0,0,-0.0043634,0.99999),
(44901,0,0,-0.0043634,0.99999),
(44909,0,0,-0.0043634,0.99999),
(44954,0,0,-0.0043634,0.99999),
(44962,0,0,-0.0043634,0.99999),
(44976,0,0,-0.0043634,0.99999),
(48263,0,0,-0.522498,0.85264),
(55230,0,0,0.999048,0.0436193),
(56744,0,0,0.951057,0.309017),
(56937,0,0,0.951057,0.309017),
(56954,0,0,0.951057,0.309017),
(56961,0,0,0.999048,0.0436193),
(57132,-0.00276125,-0.00551835,-0.370553,0.928791),
(57133,0.00544418,-0.00290476,0.918772,0.394739),
(57140,-0.00276125,-0.00551835,-0.370553,0.928791),
(57141,0.00544418,-0.00290476,0.918772,0.394739),
(57799,0,0,0.999048,0.0436193),
(57992,0,0,-0.370557,0.92881),
(57993,0,0,-0.760406,0.649448),
(57994,0,0,0.915312,0.402747),
(57995,0,0,-0.748956,0.66262),
(57996,0,0,0.995805,0.0915015),
(58299,0,0,0.999048,0.0436193),
(58304,0,0,-0.263031,0.964787),
(58305,0,0,0.522499,0.85264),
(58306,0,0,0.996917,-0.0784592),
(58310,0,0,0.333807,0.942641),
(58782,0,0,0.333807,0.942641),
(58824,0,0,0.333807,0.942641),
(58935,0,0,0.932008,-0.362438),
(59160,0,0,0.99999,0.00436324),
(59328,0,0,0.99999,-0.00436333),
(59336,0,0,0.99999,-0.00436333),
(59343,0,0,0.99999,-0.00436333),
(59350,0,0,0.99999,-0.00436333),
(59386,0,0,0.99999,-0.00436333),
(59762,0,0,-0.370557,0.92881),
(59763,0,0,-0.760406,0.649448),
(59764,0,0,0.915312,0.402747),
(59765,0,0,-0.748956,0.66262),
(59766,0,0,0.995805,0.0915015),
(59779,0,0,-0.370557,0.92881),
(59780,0,0,-0.760406,0.649448),
(59781,0,0,0.915312,0.402747),
(59782,0,0,-0.748956,0.66262),
(59783,0,0,0.995805,0.0915015),
(60421,0,0,0.99999,0.00436324),
(60463,0,0,0.999048,0.0436193),
(61053,0,0,0.999048,0.0436193),
(65435,0,0,0.915312,0.402747),
(65436,0,0,0.99999,0.00436324),
(65438,0,0,0.915312,0.402747),
(65439,0,0,0.915312,0.402747),
(65520,0,0,0.99999,0.00436324),
(65588,0,0,1,-0.0000000437114),
(66717,0,0,0.999657,0.0261769),
(67873,-0.00276125,-0.00551835,-0.370553,0.928791),
(67874,0.00544418,-0.00290476,0.918772,0.394739),
(67875,-0.00276125,-0.00551835,-0.370553,0.928791),
(67876,0.00544418,-0.00290476,0.918772,0.394739);
/*!40000 ALTER TABLE `gameobject_addon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

