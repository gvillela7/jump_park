-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('c28479b9-9bb8-45ed-8424-fe512583e49d','7e8ea590-4748-4431-89cc-4441f14fbb16');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('04b2d7cf-f83a-4105-99c2-b92146bef4eb',NULL,'registration-recaptcha-action','seller','6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7',3,60,_binary '\0',NULL,NULL),('0bb08b2b-9a3e-4834-89cd-adf33097c00a',NULL,NULL,'master','683f0601-6b21-4124-9a08-2b3351ca17f6',2,20,_binary '','11f8b2e7-0983-4258-8ece-a328466092f5',NULL),('0d8ee440-e06f-4a40-8112-08913f249125',NULL,'basic-auth-otp','master','597d2b67-26ea-4705-afb4-420448d64006',3,20,_binary '\0',NULL,NULL),('12fa1588-4b91-41de-bf0f-975cc6321538',NULL,'idp-review-profile','seller','fba591f6-b11e-4230-9af5-85ab991d33ee',0,10,_binary '\0',NULL,'5e8001bb-dbb5-4a8d-9d42-7a654b461463'),('13f5b61d-ba31-4d4b-b983-7df9f7d5e2ae',NULL,NULL,'master','36662c76-741a-4e92-b27c-cb93d3ec75b2',0,20,_binary '','ac08e908-4805-4496-ac17-31c885a832e6',NULL),('159764b8-95db-40a8-98fd-b1b503610d46',NULL,'client-jwt','seller','1b40ca56-5c6e-4cce-949a-c8ba402a2a1a',2,20,_binary '\0',NULL,NULL),('168cece1-4f2a-44e7-a81e-0aaade201829',NULL,'reset-credentials-choose-user','seller','aa266561-bbe0-404b-9159-b1cd6fa5f00e',0,10,_binary '\0',NULL,NULL),('178d1ade-5e56-4da0-b4d0-970680b7b3b5',NULL,NULL,'master','5531a1d0-3e89-40c5-a0d2-ad61108e08b2',0,20,_binary '','683f0601-6b21-4124-9a08-2b3351ca17f6',NULL),('193a99dd-bfdc-41b0-9ae3-2ccd8c06a2ba',NULL,'docker-http-basic-authenticator','master','1b9b21ed-125b-4a06-9d8c-f32c8275c4f5',0,10,_binary '\0',NULL,NULL),('1c336256-b196-46db-9a1b-0572da96e9d8',NULL,'reset-otp','seller','b217ac5d-903a-4e1c-a333-4b4b1aa4c2b3',0,20,_binary '\0',NULL,NULL),('1cba175b-60ea-429d-ae16-36b8ecb99044',NULL,'reset-otp','master','4006fadb-be6b-46b0-b772-d9f8b0e51c8a',0,20,_binary '\0',NULL,NULL),('249a1850-9c77-4e14-95d3-d6f9e8912906',NULL,'http-basic-authenticator','seller','ab8f3cc7-9bd5-4ae9-b4b6-c0544b5e93d2',0,10,_binary '\0',NULL,NULL),('28b28712-c3e1-415d-9bf5-1aeddabb23c7',NULL,'idp-confirm-link','seller','97ac22c0-4be7-4251-b224-0939a2cea71e',0,10,_binary '\0',NULL,NULL),('297d7ba1-0b8a-46ac-ac26-dd4411a8a2c6',NULL,'idp-review-profile','master','36662c76-741a-4e92-b27c-cb93d3ec75b2',0,10,_binary '\0',NULL,'14e3aa2e-c3de-47f2-8bf8-169e1e75fb8d'),('2b6c02ea-b9de-483c-b03a-c4a7654a272b',NULL,'registration-password-action','master','7ca38298-e271-4844-adc1-7f71572bb96b',0,50,_binary '\0',NULL,NULL),('2c9b0cd5-0866-4014-817c-6865391586dd',NULL,'registration-recaptcha-action','master','7ca38298-e271-4844-adc1-7f71572bb96b',3,60,_binary '\0',NULL,NULL),('2d88bae2-e188-41e3-8a35-3ef4523fabd8',NULL,'auth-otp-form','seller','2aa93ea6-560b-4aea-b3f9-7e43cde1cc54',0,20,_binary '\0',NULL,NULL),('2f54d465-5a02-4975-9991-1e91e782ee47',NULL,'idp-confirm-link','master','5531a1d0-3e89-40c5-a0d2-ad61108e08b2',0,10,_binary '\0',NULL,NULL),('30252c83-b590-4e23-9c0e-ed78ba165b64',NULL,'http-basic-authenticator','master','c382ee19-ec01-4042-9064-be7fbeb4914f',0,10,_binary '\0',NULL,NULL),('357e375e-2c9e-46aa-9fca-541c36e658c8',NULL,'conditional-user-configured','master','078f6bc3-80ab-490f-9c43-f68dd95306ef',0,10,_binary '\0',NULL,NULL),('37bbad84-28ea-4aec-9187-a061e4bc754a',NULL,NULL,'seller','aa266561-bbe0-404b-9159-b1cd6fa5f00e',1,40,_binary '','b217ac5d-903a-4e1c-a333-4b4b1aa4c2b3',NULL),('38a3057a-a008-4768-8667-4a85274934a9',NULL,'conditional-user-configured','master','5e19aebe-7efd-4927-990b-dff89d6e5df8',0,10,_binary '\0',NULL,NULL),('3902a0ef-d8ab-4dae-a4ea-76cf787e77d2',NULL,'no-cookie-redirect','seller','fdfe1b55-1796-4cf6-9389-602c7b9249a5',0,10,_binary '\0',NULL,NULL),('3c542cff-93c3-45e3-99ce-99af8ad08eef',NULL,'client-x509','seller','1b40ca56-5c6e-4cce-949a-c8ba402a2a1a',2,40,_binary '\0',NULL,NULL),('3e8b70d5-ad08-4ea1-b0cc-c0ef715c6f77',NULL,'conditional-user-configured','master','295d795e-f2ff-4959-aa9c-38b3e1ce2c8e',0,10,_binary '\0',NULL,NULL),('3f37f73c-b807-405a-a2e1-a71ead673e8d',NULL,NULL,'master','bf6502a1-9c36-4918-8920-45c8ca133e94',1,20,_binary '','078f6bc3-80ab-490f-9c43-f68dd95306ef',NULL),('4bd31c98-e322-48a5-b76d-149bca5e90fc',NULL,'conditional-user-configured','master','4006fadb-be6b-46b0-b772-d9f8b0e51c8a',0,10,_binary '\0',NULL,NULL),('4ea642df-a4f8-441b-bc99-469c67ce22ce',NULL,'client-secret','master','718fb30f-a544-40af-b9ae-847f9fe25dbd',2,10,_binary '\0',NULL,NULL),('51d8d58b-e4f0-49ee-a5c6-baf33f8a796d',NULL,'idp-create-user-if-unique','seller','805d6963-7d12-4f9c-b8a8-420a268b8c0d',2,10,_binary '\0',NULL,'d165bec7-215b-474d-a12c-d5f4ff678edd'),('5239701c-c5e7-4364-867a-ba43b7b8c272',NULL,NULL,'master','d377934d-ed45-43f4-a05e-b231ad81225f',2,30,_binary '','bf6502a1-9c36-4918-8920-45c8ca133e94',NULL),('55547b6c-b1b5-4004-a750-9bcce75087af',NULL,'reset-password','master','17b95ab6-df31-4774-a903-bbef8f1aefd8',0,30,_binary '\0',NULL,NULL),('57536263-d587-428b-b4cf-4be421030260',NULL,'client-x509','master','718fb30f-a544-40af-b9ae-847f9fe25dbd',2,40,_binary '\0',NULL,NULL),('58e925e6-6cae-46e1-a1dd-513dc7d345bf',NULL,'client-secret-jwt','master','718fb30f-a544-40af-b9ae-847f9fe25dbd',2,30,_binary '\0',NULL,NULL),('5a03cdda-3d8a-43d0-9bfb-97e4c071a49c',NULL,'basic-auth','seller','3570a517-c9c6-4d67-a11c-72de4b07d009',0,10,_binary '\0',NULL,NULL),('6216370e-0e4e-4505-b7fe-e3f810328ad9',NULL,'direct-grant-validate-password','seller','7c48b28a-655d-42a4-aee2-c429de7e375a',0,20,_binary '\0',NULL,NULL),('62f37839-530e-4225-8d59-755e9f1ba786',NULL,NULL,'master','ac08e908-4805-4496-ac17-31c885a832e6',2,20,_binary '','5531a1d0-3e89-40c5-a0d2-ad61108e08b2',NULL),('63c495fe-4b3b-4953-8607-3b63917bf7b3',NULL,'registration-profile-action','master','7ca38298-e271-4844-adc1-7f71572bb96b',0,40,_binary '\0',NULL,NULL),('6974829b-0190-451d-a822-98d2d4caf40d',NULL,'registration-password-action','seller','6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7',0,50,_binary '\0',NULL,NULL),('6b68855f-b37b-41a7-9066-24ca702a1d75',NULL,NULL,'seller','1bbcdf1c-21a7-4f54-be32-994ab33c7530',2,30,_binary '','f21d850f-afcb-4027-a9e5-be6a0e79c014',NULL),('6b88e4d3-29fa-4a16-bcfa-a4894c132787',NULL,NULL,'seller','805d6963-7d12-4f9c-b8a8-420a268b8c0d',2,20,_binary '','97ac22c0-4be7-4251-b224-0939a2cea71e',NULL),('6cfd0eb0-e076-45b3-84ba-512f0f9f909e',NULL,'idp-email-verification','master','683f0601-6b21-4124-9a08-2b3351ca17f6',2,10,_binary '\0',NULL,NULL),('6fa959c0-b377-45d6-a0e8-dac803d5fbdb',NULL,'auth-username-password-form','master','bf6502a1-9c36-4918-8920-45c8ca133e94',0,10,_binary '\0',NULL,NULL),('706b2754-9c31-4efb-a267-738f18f7a456',NULL,'reset-credential-email','master','17b95ab6-df31-4774-a903-bbef8f1aefd8',0,20,_binary '\0',NULL,NULL),('74a9f88c-7214-45bf-9f10-e7451752a88d',NULL,'registration-user-creation','master','7ca38298-e271-4844-adc1-7f71572bb96b',0,20,_binary '\0',NULL,NULL),('76040852-0bed-4891-8baa-217e1cf687d6',NULL,'no-cookie-redirect','master','e994a2eb-8954-4ae7-a18f-e5a5a60b9e73',0,10,_binary '\0',NULL,NULL),('7b8d4a7b-8f69-4a75-9838-12b3e7bf3a55',NULL,'basic-auth','master','597d2b67-26ea-4705-afb4-420448d64006',0,10,_binary '\0',NULL,NULL),('7e82fa4c-bf08-4942-8f55-ccd7cc94d5c5',NULL,'client-secret','seller','1b40ca56-5c6e-4cce-949a-c8ba402a2a1a',2,10,_binary '\0',NULL,NULL),('808849e6-eded-43a7-896e-b907edbebb8d',NULL,'reset-credential-email','seller','aa266561-bbe0-404b-9159-b1cd6fa5f00e',0,20,_binary '\0',NULL,NULL),('8258cafc-df28-40f3-a15d-1c52925c3e3e',NULL,'auth-otp-form','seller','1b512dde-6f56-4c70-9ef5-9a972c674259',0,20,_binary '\0',NULL,NULL),('89849573-5087-4ef8-b3f8-48b9cd20c98a',NULL,'auth-spnego','seller','3570a517-c9c6-4d67-a11c-72de4b07d009',3,30,_binary '\0',NULL,NULL),('8a23818f-b09d-44b9-a9fd-33eb01682325',NULL,'conditional-user-configured','seller','b217ac5d-903a-4e1c-a333-4b4b1aa4c2b3',0,10,_binary '\0',NULL,NULL),('9172f0bf-a556-439a-8abe-c282cbe7fe1b',NULL,NULL,'seller','fba591f6-b11e-4230-9af5-85ab991d33ee',0,20,_binary '','805d6963-7d12-4f9c-b8a8-420a268b8c0d',NULL),('934a0da6-f851-48ff-a616-8a1b38e90068',NULL,'client-secret-jwt','seller','1b40ca56-5c6e-4cce-949a-c8ba402a2a1a',2,30,_binary '\0',NULL,NULL),('93a7d9f9-cc15-47b6-abb3-ba605a8695ab',NULL,'idp-create-user-if-unique','master','ac08e908-4805-4496-ac17-31c885a832e6',2,10,_binary '\0',NULL,'740ca6dc-6566-4516-9fb7-83cff27efb23'),('9a7e43c9-02f5-493f-a34f-769d958f1ed9',NULL,'conditional-user-configured','seller','28e63dab-b99a-4b50-af1d-944886ebdbfa',0,10,_binary '\0',NULL,NULL),('9af87b05-f8ab-4d71-8491-53dd2039e42b',NULL,NULL,'seller','f21d850f-afcb-4027-a9e5-be6a0e79c014',1,20,_binary '','1b512dde-6f56-4c70-9ef5-9a972c674259',NULL),('9b56d37b-f781-4e0e-9f08-e4663f3df35e',NULL,NULL,'seller','7c48b28a-655d-42a4-aee2-c429de7e375a',1,30,_binary '','28e63dab-b99a-4b50-af1d-944886ebdbfa',NULL),('9c0220a9-9964-4a5a-b5e8-4fbfc611cae6',NULL,NULL,'seller','4244306a-218c-492f-a008-6cfeed6b7cf2',2,20,_binary '','4fcebe3f-525a-4791-aa4c-20e97454b553',NULL),('9f341746-a7b7-4bad-a546-65a3a4a27c56',NULL,'idp-username-password-form','master','11f8b2e7-0983-4258-8ece-a328466092f5',0,10,_binary '\0',NULL,NULL),('a845af8f-2c61-4f5f-b625-383605300c77',NULL,'auth-username-password-form','seller','f21d850f-afcb-4027-a9e5-be6a0e79c014',0,10,_binary '\0',NULL,NULL),('a8664a01-bc75-4f71-acef-5d7617525934',NULL,'idp-email-verification','seller','4244306a-218c-492f-a008-6cfeed6b7cf2',2,10,_binary '\0',NULL,NULL),('a8aaf965-b70e-4d34-a3a8-81156975ea7f',NULL,'registration-page-form','seller','b6dab85c-6506-420e-a13c-89f00a165808',0,10,_binary '','6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7',NULL),('abc6c78b-14cf-4888-9498-2e8e8f7ff3c8',NULL,'identity-provider-redirector','seller','1bbcdf1c-21a7-4f54-be32-994ab33c7530',2,25,_binary '\0',NULL,NULL),('ac48e5ec-423a-420b-adf4-cd6c7e16f679',NULL,'direct-grant-validate-password','master','733e5d22-ee1b-496e-b5d4-2434c0768ad8',0,20,_binary '\0',NULL,NULL),('b074c507-2aa0-40f4-9a18-b463827b3c23',NULL,'registration-profile-action','seller','6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7',0,40,_binary '\0',NULL,NULL),('b7128a8d-8ed5-4452-b5e4-b7bc944723c5',NULL,'docker-http-basic-authenticator','seller','879fcff2-f50d-441a-9fb4-2dab1c126668',0,10,_binary '\0',NULL,NULL),('b725ae83-e129-41e4-81d6-2722869592d2',NULL,'reset-credentials-choose-user','master','17b95ab6-df31-4774-a903-bbef8f1aefd8',0,10,_binary '\0',NULL,NULL),('b773c54b-4571-44ab-a938-998724815159',NULL,'direct-grant-validate-username','master','733e5d22-ee1b-496e-b5d4-2434c0768ad8',0,10,_binary '\0',NULL,NULL),('b8d980f8-97cc-4550-8bae-12e17be9a1f7',NULL,'direct-grant-validate-otp','master','295d795e-f2ff-4959-aa9c-38b3e1ce2c8e',0,20,_binary '\0',NULL,NULL),('bc3d4caf-5cb2-4bec-bc6c-8fe8eb40d5c9',NULL,'basic-auth-otp','seller','3570a517-c9c6-4d67-a11c-72de4b07d009',3,20,_binary '\0',NULL,NULL),('c36db19f-1194-40d1-9753-6e3ee1cf67b4',NULL,'direct-grant-validate-otp','seller','28e63dab-b99a-4b50-af1d-944886ebdbfa',0,20,_binary '\0',NULL,NULL),('c6ccc7bc-af56-4497-9331-09eb4c9d2697',NULL,'identity-provider-redirector','master','d377934d-ed45-43f4-a05e-b231ad81225f',2,25,_binary '\0',NULL,NULL),('cc3ccbf1-30fe-46d0-aeac-1dd0d7693733',NULL,'registration-user-creation','seller','6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7',0,20,_binary '\0',NULL,NULL),('cce7bdbb-18c3-449c-9393-fac4ae31ea78',NULL,NULL,'master','17b95ab6-df31-4774-a903-bbef8f1aefd8',1,40,_binary '','4006fadb-be6b-46b0-b772-d9f8b0e51c8a',NULL),('ce49ce93-323b-4a59-8cb4-4e489c5e7389',NULL,'auth-otp-form','master','078f6bc3-80ab-490f-9c43-f68dd95306ef',0,20,_binary '\0',NULL,NULL),('d0888b5c-b1b6-4fc3-afc5-6482c02e8bb5',NULL,NULL,'seller','fdfe1b55-1796-4cf6-9389-602c7b9249a5',0,20,_binary '','3570a517-c9c6-4d67-a11c-72de4b07d009',NULL),('d130fa78-b434-4f20-bcee-b1543b9779e3',NULL,'direct-grant-validate-username','seller','7c48b28a-655d-42a4-aee2-c429de7e375a',0,10,_binary '\0',NULL,NULL),('d21ca0fe-8a5f-42a4-bd9a-31d67cf37d86',NULL,'idp-username-password-form','seller','4fcebe3f-525a-4791-aa4c-20e97454b553',0,10,_binary '\0',NULL,NULL),('d3709160-6ed8-4ed6-92cc-f44cbb539207',NULL,'reset-password','seller','aa266561-bbe0-404b-9159-b1cd6fa5f00e',0,30,_binary '\0',NULL,NULL),('da766935-2389-483c-92eb-062835d9965e',NULL,NULL,'seller','97ac22c0-4be7-4251-b224-0939a2cea71e',0,20,_binary '','4244306a-218c-492f-a008-6cfeed6b7cf2',NULL),('da91f480-c2bf-4599-b637-c82707b715f1',NULL,'auth-otp-form','master','5e19aebe-7efd-4927-990b-dff89d6e5df8',0,20,_binary '\0',NULL,NULL),('dc563e0f-61fa-4b12-b576-cfe8033b5576',NULL,'auth-cookie','master','d377934d-ed45-43f4-a05e-b231ad81225f',2,10,_binary '\0',NULL,NULL),('e0a0bd35-ff3e-460b-a521-f74ccf377926',NULL,NULL,'master','11f8b2e7-0983-4258-8ece-a328466092f5',1,20,_binary '','5e19aebe-7efd-4927-990b-dff89d6e5df8',NULL),('e26a71bb-5ac0-468d-bf58-f96c0f453e21',NULL,'registration-page-form','master','9b17274c-2fb7-4faa-af51-3df5eb0c60ab',0,10,_binary '','7ca38298-e271-4844-adc1-7f71572bb96b',NULL),('e33bf6f2-d7e3-4565-a740-80a946cd96c3',NULL,NULL,'master','733e5d22-ee1b-496e-b5d4-2434c0768ad8',1,30,_binary '','295d795e-f2ff-4959-aa9c-38b3e1ce2c8e',NULL),('eb02b819-9faf-4d0c-8182-caf6bb6c5783',NULL,'client-jwt','master','718fb30f-a544-40af-b9ae-847f9fe25dbd',2,20,_binary '\0',NULL,NULL),('eba8dedd-07af-4fcb-a3fa-dcd8731bdba4',NULL,NULL,'master','e994a2eb-8954-4ae7-a18f-e5a5a60b9e73',0,20,_binary '','597d2b67-26ea-4705-afb4-420448d64006',NULL),('f10fcd7d-29c8-40cf-a3de-6963293fd7c2',NULL,'auth-cookie','seller','1bbcdf1c-21a7-4f54-be32-994ab33c7530',2,10,_binary '\0',NULL,NULL),('f501a265-38da-4515-8535-e87626510bd5',NULL,NULL,'seller','4fcebe3f-525a-4791-aa4c-20e97454b553',1,20,_binary '','2aa93ea6-560b-4aea-b3f9-7e43cde1cc54',NULL),('f9ed17fd-7743-483e-b415-68e6c2de319f',NULL,'auth-spnego','master','597d2b67-26ea-4705-afb4-420448d64006',3,30,_binary '\0',NULL,NULL),('faa79c2d-540d-4326-b604-79255152d6b3',NULL,'auth-spnego','master','d377934d-ed45-43f4-a05e-b231ad81225f',3,20,_binary '\0',NULL,NULL),('fd5f468e-0e54-4ecd-b5ac-4709f51dc507',NULL,'auth-spnego','seller','1bbcdf1c-21a7-4f54-be32-994ab33c7530',3,20,_binary '\0',NULL,NULL),('ff0f4b4e-34e1-4fb4-8bd1-c439b78d72c6',NULL,'conditional-user-configured','seller','1b512dde-6f56-4c70-9ef5-9a972c674259',0,10,_binary '\0',NULL,NULL),('ff5958f6-d15a-4c7b-af55-5c96bc98bc75',NULL,'conditional-user-configured','seller','2aa93ea6-560b-4aea-b3f9-7e43cde1cc54',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('078f6bc3-80ab-490f-9c43-f68dd95306ef','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('11f8b2e7-0983-4258-8ece-a328466092f5','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('17b95ab6-df31-4774-a903-bbef8f1aefd8','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('1b40ca56-5c6e-4cce-949a-c8ba402a2a1a','clients','Base authentication for clients','seller','client-flow',_binary '',_binary ''),('1b512dde-6f56-4c70-9ef5-9a972c674259','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','seller','basic-flow',_binary '\0',_binary ''),('1b9b21ed-125b-4a06-9d8c-f32c8275c4f5','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('1bbcdf1c-21a7-4f54-be32-994ab33c7530','browser','browser based authentication','seller','basic-flow',_binary '',_binary ''),('28e63dab-b99a-4b50-af1d-944886ebdbfa','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','seller','basic-flow',_binary '\0',_binary ''),('295d795e-f2ff-4959-aa9c-38b3e1ce2c8e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('2aa93ea6-560b-4aea-b3f9-7e43cde1cc54','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','seller','basic-flow',_binary '\0',_binary ''),('3570a517-c9c6-4d67-a11c-72de4b07d009','Authentication Options','Authentication options.','seller','basic-flow',_binary '\0',_binary ''),('36662c76-741a-4e92-b27c-cb93d3ec75b2','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('4006fadb-be6b-46b0-b772-d9f8b0e51c8a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('4244306a-218c-492f-a008-6cfeed6b7cf2','Account verification options','Method with which to verity the existing account','seller','basic-flow',_binary '\0',_binary ''),('4fcebe3f-525a-4791-aa4c-20e97454b553','Verify Existing Account by Re-authentication','Reauthentication of existing account','seller','basic-flow',_binary '\0',_binary ''),('5531a1d0-3e89-40c5-a0d2-ad61108e08b2','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('597d2b67-26ea-4705-afb4-420448d64006','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('5e19aebe-7efd-4927-990b-dff89d6e5df8','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('683f0601-6b21-4124-9a08-2b3351ca17f6','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('6a5a45d4-5af3-4a01-b4f8-5f7e1c1b9ba7','registration form','registration form','seller','form-flow',_binary '\0',_binary ''),('718fb30f-a544-40af-b9ae-847f9fe25dbd','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('733e5d22-ee1b-496e-b5d4-2434c0768ad8','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('7c48b28a-655d-42a4-aee2-c429de7e375a','direct grant','OpenID Connect Resource Owner Grant','seller','basic-flow',_binary '',_binary ''),('7ca38298-e271-4844-adc1-7f71572bb96b','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('805d6963-7d12-4f9c-b8a8-420a268b8c0d','User creation or linking','Flow for the existing/non-existing user alternatives','seller','basic-flow',_binary '\0',_binary ''),('879fcff2-f50d-441a-9fb4-2dab1c126668','docker auth','Used by Docker clients to authenticate against the IDP','seller','basic-flow',_binary '',_binary ''),('97ac22c0-4be7-4251-b224-0939a2cea71e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','seller','basic-flow',_binary '\0',_binary ''),('9b17274c-2fb7-4faa-af51-3df5eb0c60ab','registration','registration flow','master','basic-flow',_binary '',_binary ''),('aa266561-bbe0-404b-9159-b1cd6fa5f00e','reset credentials','Reset credentials for a user if they forgot their password or something','seller','basic-flow',_binary '',_binary ''),('ab8f3cc7-9bd5-4ae9-b4b6-c0544b5e93d2','saml ecp','SAML ECP Profile Authentication Flow','seller','basic-flow',_binary '',_binary ''),('ac08e908-4805-4496-ac17-31c885a832e6','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('b217ac5d-903a-4e1c-a333-4b4b1aa4c2b3','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','seller','basic-flow',_binary '\0',_binary ''),('b6dab85c-6506-420e-a13c-89f00a165808','registration','registration flow','seller','basic-flow',_binary '',_binary ''),('bf6502a1-9c36-4918-8920-45c8ca133e94','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('c382ee19-ec01-4042-9064-be7fbeb4914f','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('d377934d-ed45-43f4-a05e-b231ad81225f','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('e994a2eb-8954-4ae7-a18f-e5a5a60b9e73','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('f21d850f-afcb-4027-a9e5-be6a0e79c014','forms','Username, password, otp and other auth forms.','seller','basic-flow',_binary '\0',_binary ''),('fba591f6-b11e-4230-9af5-85ab991d33ee','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','seller','basic-flow',_binary '',_binary ''),('fdfe1b55-1796-4cf6-9389-602c7b9249a5','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','seller','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('14e3aa2e-c3de-47f2-8bf8-169e1e75fb8d','review profile config','master'),('5e8001bb-dbb5-4a8d-9d42-7a654b461463','review profile config','seller'),('740ca6dc-6566-4516-9fb7-83cff27efb23','create unique user config','master'),('d165bec7-215b-474d-a12c-d5f4ff678edd','create unique user config','seller');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('14e3aa2e-c3de-47f2-8bf8-169e1e75fb8d','missing','update.profile.on.first.login'),('5e8001bb-dbb5-4a8d-9d42-7a654b461463','missing','update.profile.on.first.login'),('740ca6dc-6566-4516-9fb7-83cff27efb23','false','require.password.update.after.registration'),('d165bec7-215b-474d-a12c-d5f4ff678edd','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('02151d90-245f-4739-9f19-5c839f4c3e1f',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/jump_park/console/',_binary '\0',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('523cef04-dde9-4f52-b634-f85170b42a94',_binary '',_binary '\0','admin-cli',0,_binary '\0','lpuKQwP28rVZT7NYGjuWQsDOmMhzlCMX',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '',_binary '\0','jump_park-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','seller Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/jump_park/account/',_binary '\0',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8d790a83-7626-46c1-807e-1558d7dcb480',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/seller/account/',_binary '\0',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e68da95f-d316-4323-88b2-c78290e786ae',_binary '',_binary '\0','manager-cli',0,_binary '\0','nZZURxM9y7JysjxWDDSjlm6lc2cjDA1a',NULL,_binary '\0',NULL,_binary '\0','seller','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','seller','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('02151d90-245f-4739-9f19-5c839f4c3e1f','S256','pkce.code.challenge.method'),('523cef04-dde9-4f52-b634-f85170b42a94','false','backchannel.logout.revoke.offline.tokens'),('523cef04-dde9-4f52-b634-f85170b42a94','false','backchannel.logout.session.required'),('523cef04-dde9-4f52-b634-f85170b42a94','false','client_credentials.use_refresh_token'),('523cef04-dde9-4f52-b634-f85170b42a94','false','display.on.consent.screen'),('523cef04-dde9-4f52-b634-f85170b42a94','false','exclude.session.state.from.auth.response'),('523cef04-dde9-4f52-b634-f85170b42a94','false','id.token.as.detached.signature'),('523cef04-dde9-4f52-b634-f85170b42a94','false','oauth2.device.authorization.grant.enabled'),('523cef04-dde9-4f52-b634-f85170b42a94','false','oidc.ciba.grant.enabled'),('523cef04-dde9-4f52-b634-f85170b42a94','false','require.pushed.authorization.requests'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml_force_name_id_format'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.artifact.binding'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.assertion.signature'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.authnstatement'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.client.signature'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.encrypt'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.force.post.binding'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.multivalued.roles'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.onetimeuse.condition'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.server.signature'),('523cef04-dde9-4f52-b634-f85170b42a94','false','saml.server.signature.keyinfo.ext'),('523cef04-dde9-4f52-b634-f85170b42a94','false','tls.client.certificate.bound.access.tokens'),('523cef04-dde9-4f52-b634-f85170b42a94','true','use.refresh.tokens'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','S256','pkce.code.challenge.method'),('8d790a83-7626-46c1-807e-1558d7dcb480','S256','pkce.code.challenge.method'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','S256','pkce.code.challenge.method'),('e68da95f-d316-4323-88b2-c78290e786ae','false','backchannel.logout.revoke.offline.tokens'),('e68da95f-d316-4323-88b2-c78290e786ae','true','backchannel.logout.session.required'),('e68da95f-d316-4323-88b2-c78290e786ae','false','client_credentials.use_refresh_token'),('e68da95f-d316-4323-88b2-c78290e786ae','false','display.on.consent.screen'),('e68da95f-d316-4323-88b2-c78290e786ae','false','exclude.session.state.from.auth.response'),('e68da95f-d316-4323-88b2-c78290e786ae','false','id.token.as.detached.signature'),('e68da95f-d316-4323-88b2-c78290e786ae','false','oauth2.device.authorization.grant.enabled'),('e68da95f-d316-4323-88b2-c78290e786ae','false','oidc.ciba.grant.enabled'),('e68da95f-d316-4323-88b2-c78290e786ae','false','require.pushed.authorization.requests'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml_force_name_id_format'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.artifact.binding'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.assertion.signature'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.authnstatement'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.client.signature'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.encrypt'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.force.post.binding'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.multivalued.roles'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.onetimeuse.condition'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.server.signature'),('e68da95f-d316-4323-88b2-c78290e786ae','false','saml.server.signature.keyinfo.ext'),('e68da95f-d316-4323-88b2-c78290e786ae','false','tls.client.certificate.bound.access.tokens'),('e68da95f-d316-4323-88b2-c78290e786ae','true','use.refresh.tokens'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','2592000','access.token.lifespan'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','backchannel.logout.revoke.offline.tokens'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','backchannel.logout.session.required'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','client_credentials.use_refresh_token'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','display.on.consent.screen'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','exclude.session.state.from.auth.response'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','id.token.as.detached.signature'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','oauth2.device.authorization.grant.enabled'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','oidc.ciba.grant.enabled'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','require.pushed.authorization.requests'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml_force_name_id_format'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.artifact.binding'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.assertion.signature'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.authnstatement'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.client.signature'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.encrypt'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.force.post.binding'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.multivalued.roles'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.onetimeuse.condition'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.server.signature'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','saml.server.signature.keyinfo.ext'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','false','tls.client.certificate.bound.access.tokens'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('1ea65159-5e69-46d3-84b1-bfaad8fce6dc','microprofile-jwt','seller','Microprofile - JWT built-in scope','openid-connect'),('27e61af0-c464-4b51-b0c3-9ecca3577f99','phone','seller','OpenID Connect built-in scope: phone','openid-connect'),('43f0481f-ac1c-4244-ac77-2a5f8f34f4a0','offline_access','seller','OpenID Connect built-in scope: offline_access','openid-connect'),('6695c119-657c-4895-89bf-5da23774a0e6','role_list','seller','SAML role list','saml'),('6d6a4b5e-4626-4475-ba49-b0c9864a7999','profile','seller','OpenID Connect built-in scope: profile','openid-connect'),('6edc9bba-0109-4fdb-9c63-53248e8eb642','email','seller','OpenID Connect built-in scope: email','openid-connect'),('72c5ded6-294f-456a-a6e1-1ff62ddda2a6','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('768bfc3b-b305-432b-832d-58a2758a6c76','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('7a19a270-cf91-46c3-931b-955fb037ed98','web-origins','seller','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('811ba392-4793-4db7-bea5-89ba2efcd197','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('85afee6e-2747-4fc2-ab90-07f9890732f4','address','master','OpenID Connect built-in scope: address','openid-connect'),('893597ac-b61f-4604-9630-7484c1bea407','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('9c65f00c-bee5-4248-820a-223fb5a1db6b','address','seller','OpenID Connect built-in scope: address','openid-connect'),('a71a93be-a1ee-47b0-b3a4-1832c2d23d2b','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('b629baaa-934b-4640-89e4-81fcced60b60','email','master','OpenID Connect built-in scope: email','openid-connect'),('c58dc9f1-2ce7-4344-b15f-fea0d28eab89','role_list','master','SAML role list','saml'),('d28d52bf-d2cf-4331-8c0c-cb16d61f8b80','roles','seller','OpenID Connect scope for add user roles to the access token','openid-connect'),('fb184a4a-77ea-432b-b57c-c3bd32ed63d3','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('1ea65159-5e69-46d3-84b1-bfaad8fce6dc','false','display.on.consent.screen'),('1ea65159-5e69-46d3-84b1-bfaad8fce6dc','true','include.in.token.scope'),('27e61af0-c464-4b51-b0c3-9ecca3577f99','${phoneScopeConsentText}','consent.screen.text'),('27e61af0-c464-4b51-b0c3-9ecca3577f99','true','display.on.consent.screen'),('27e61af0-c464-4b51-b0c3-9ecca3577f99','true','include.in.token.scope'),('43f0481f-ac1c-4244-ac77-2a5f8f34f4a0','${offlineAccessScopeConsentText}','consent.screen.text'),('43f0481f-ac1c-4244-ac77-2a5f8f34f4a0','true','display.on.consent.screen'),('6695c119-657c-4895-89bf-5da23774a0e6','${samlRoleListScopeConsentText}','consent.screen.text'),('6695c119-657c-4895-89bf-5da23774a0e6','true','display.on.consent.screen'),('6d6a4b5e-4626-4475-ba49-b0c9864a7999','${profileScopeConsentText}','consent.screen.text'),('6d6a4b5e-4626-4475-ba49-b0c9864a7999','true','display.on.consent.screen'),('6d6a4b5e-4626-4475-ba49-b0c9864a7999','true','include.in.token.scope'),('6edc9bba-0109-4fdb-9c63-53248e8eb642','${emailScopeConsentText}','consent.screen.text'),('6edc9bba-0109-4fdb-9c63-53248e8eb642','true','display.on.consent.screen'),('6edc9bba-0109-4fdb-9c63-53248e8eb642','true','include.in.token.scope'),('72c5ded6-294f-456a-a6e1-1ff62ddda2a6','${offlineAccessScopeConsentText}','consent.screen.text'),('72c5ded6-294f-456a-a6e1-1ff62ddda2a6','true','display.on.consent.screen'),('768bfc3b-b305-432b-832d-58a2758a6c76','${profileScopeConsentText}','consent.screen.text'),('768bfc3b-b305-432b-832d-58a2758a6c76','true','display.on.consent.screen'),('768bfc3b-b305-432b-832d-58a2758a6c76','true','include.in.token.scope'),('7a19a270-cf91-46c3-931b-955fb037ed98','','consent.screen.text'),('7a19a270-cf91-46c3-931b-955fb037ed98','false','display.on.consent.screen'),('7a19a270-cf91-46c3-931b-955fb037ed98','false','include.in.token.scope'),('811ba392-4793-4db7-bea5-89ba2efcd197','','consent.screen.text'),('811ba392-4793-4db7-bea5-89ba2efcd197','false','display.on.consent.screen'),('811ba392-4793-4db7-bea5-89ba2efcd197','false','include.in.token.scope'),('85afee6e-2747-4fc2-ab90-07f9890732f4','${addressScopeConsentText}','consent.screen.text'),('85afee6e-2747-4fc2-ab90-07f9890732f4','true','display.on.consent.screen'),('85afee6e-2747-4fc2-ab90-07f9890732f4','true','include.in.token.scope'),('893597ac-b61f-4604-9630-7484c1bea407','${phoneScopeConsentText}','consent.screen.text'),('893597ac-b61f-4604-9630-7484c1bea407','true','display.on.consent.screen'),('893597ac-b61f-4604-9630-7484c1bea407','true','include.in.token.scope'),('9c65f00c-bee5-4248-820a-223fb5a1db6b','${addressScopeConsentText}','consent.screen.text'),('9c65f00c-bee5-4248-820a-223fb5a1db6b','true','display.on.consent.screen'),('9c65f00c-bee5-4248-820a-223fb5a1db6b','true','include.in.token.scope'),('a71a93be-a1ee-47b0-b3a4-1832c2d23d2b','false','display.on.consent.screen'),('a71a93be-a1ee-47b0-b3a4-1832c2d23d2b','true','include.in.token.scope'),('b629baaa-934b-4640-89e4-81fcced60b60','${emailScopeConsentText}','consent.screen.text'),('b629baaa-934b-4640-89e4-81fcced60b60','true','display.on.consent.screen'),('b629baaa-934b-4640-89e4-81fcced60b60','true','include.in.token.scope'),('c58dc9f1-2ce7-4344-b15f-fea0d28eab89','${samlRoleListScopeConsentText}','consent.screen.text'),('c58dc9f1-2ce7-4344-b15f-fea0d28eab89','true','display.on.consent.screen'),('d28d52bf-d2cf-4331-8c0c-cb16d61f8b80','${rolesScopeConsentText}','consent.screen.text'),('d28d52bf-d2cf-4331-8c0c-cb16d61f8b80','true','display.on.consent.screen'),('d28d52bf-d2cf-4331-8c0c-cb16d61f8b80','false','include.in.token.scope'),('fb184a4a-77ea-432b-b57c-c3bd32ed63d3','${rolesScopeConsentText}','consent.screen.text'),('fb184a4a-77ea-432b-b57c-c3bd32ed63d3','true','display.on.consent.screen'),('fb184a4a-77ea-432b-b57c-c3bd32ed63d3','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('02151d90-245f-4739-9f19-5c839f4c3e1f','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('02151d90-245f-4739-9f19-5c839f4c3e1f','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('02151d90-245f-4739-9f19-5c839f4c3e1f','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('02151d90-245f-4739-9f19-5c839f4c3e1f','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('02151d90-245f-4739-9f19-5c839f4c3e1f','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('02151d90-245f-4739-9f19-5c839f4c3e1f','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('02151d90-245f-4739-9f19-5c839f4c3e1f','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('02151d90-245f-4739-9f19-5c839f4c3e1f','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('181f6a8b-b028-41e2-96c4-2e1e1ecf066b','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('1cfd4fd5-e544-4985-b0c4-6000e9a57199','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('294080fb-805f-4d5a-8abc-a6e46e65b950','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('294080fb-805f-4d5a-8abc-a6e46e65b950','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('294080fb-805f-4d5a-8abc-a6e46e65b950','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('294080fb-805f-4d5a-8abc-a6e46e65b950','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('294080fb-805f-4d5a-8abc-a6e46e65b950','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('294080fb-805f-4d5a-8abc-a6e46e65b950','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('294080fb-805f-4d5a-8abc-a6e46e65b950','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('294080fb-805f-4d5a-8abc-a6e46e65b950','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('523cef04-dde9-4f52-b634-f85170b42a94','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('523cef04-dde9-4f52-b634-f85170b42a94','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('523cef04-dde9-4f52-b634-f85170b42a94','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('523cef04-dde9-4f52-b634-f85170b42a94','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('523cef04-dde9-4f52-b634-f85170b42a94','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('523cef04-dde9-4f52-b634-f85170b42a94','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('523cef04-dde9-4f52-b634-f85170b42a94','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('523cef04-dde9-4f52-b634-f85170b42a94','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('7ca7ce72-c43c-463e-8491-f4eb2598de22','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('7ca7ce72-c43c-463e-8491-f4eb2598de22','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('7ca7ce72-c43c-463e-8491-f4eb2598de22','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('7ca7ce72-c43c-463e-8491-f4eb2598de22','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('7ca7ce72-c43c-463e-8491-f4eb2598de22','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('7ca7ce72-c43c-463e-8491-f4eb2598de22','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('7ca7ce72-c43c-463e-8491-f4eb2598de22','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('7ca7ce72-c43c-463e-8491-f4eb2598de22','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('8d790a83-7626-46c1-807e-1558d7dcb480','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('8d790a83-7626-46c1-807e-1558d7dcb480','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('8d790a83-7626-46c1-807e-1558d7dcb480','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('8d790a83-7626-46c1-807e-1558d7dcb480','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('8d790a83-7626-46c1-807e-1558d7dcb480','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('8d790a83-7626-46c1-807e-1558d7dcb480','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('8d790a83-7626-46c1-807e-1558d7dcb480','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('8d790a83-7626-46c1-807e-1558d7dcb480','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('94affb35-62bf-4f33-b1b2-a6f47663c232','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('94affb35-62bf-4f33-b1b2-a6f47663c232','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('94affb35-62bf-4f33-b1b2-a6f47663c232','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('94affb35-62bf-4f33-b1b2-a6f47663c232','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('94affb35-62bf-4f33-b1b2-a6f47663c232','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('94affb35-62bf-4f33-b1b2-a6f47663c232','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('94affb35-62bf-4f33-b1b2-a6f47663c232','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('94affb35-62bf-4f33-b1b2-a6f47663c232','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('e3fcbbd1-9871-4195-9711-e29daa2ce7f1','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('e68da95f-d316-4323-88b2-c78290e786ae','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('e68da95f-d316-4323-88b2-c78290e786ae','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('e68da95f-d316-4323-88b2-c78290e786ae','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('e68da95f-d316-4323-88b2-c78290e786ae','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('e68da95f-d316-4323-88b2-c78290e786ae','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('e68da95f-d316-4323-88b2-c78290e786ae','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('e68da95f-d316-4323-88b2-c78290e786ae','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('e68da95f-d316-4323-88b2-c78290e786ae','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary ''),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('43f0481f-ac1c-4244-ac77-2a5f8f34f4a0','63cc56db-734b-40be-a915-e0d2fc9b03a7'),('72c5ded6-294f-456a-a6e1-1ff62ddda2a6','44f486c0-12d5-4da2-b3e8-8cfa3f80f9b2');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('016f6d64-480a-4943-af2d-16fbab16528b','Trusted Hosts','seller','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('03425828-4a2c-4158-b41f-381434c2e059','Max Clients Limit','seller','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('354f2e35-c5a5-403d-be36-6dfd1a33d7ef','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('4654d944-653e-47cb-a65a-19866692169b','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('4f49290b-8dad-4da1-b7cd-9f0117755a31','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5438ca21-9f5e-4d8e-94b7-d5a8117e3c5c','Allowed Client Scopes','seller','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('608e5c4e-d849-4f2a-8aac-b85e443caa0e','Full Scope Disabled','seller','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('730cf862-99c9-430b-8a89-b1d35319eace','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('7e5e9e0c-9788-4e34-b402-a829717fd359','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('821e1e91-9dfe-45f5-a540-933658aab54a','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('828c4950-8a0c-4658-9695-c0c34b7211d7','Consent Required','seller','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('8b7c88bb-f550-420e-9570-80a0a7989ea4','Allowed Protocol Mapper Types','seller','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','authenticated'),('9620fc8e-8ea5-4362-b228-aaed4df3202a','aes-generated','seller','aes-generated','org.keycloak.keys.KeyProvider','seller',NULL),('97bc54c2-161e-416d-b931-0bf61d7cbd1d','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9a14ee08-92ef-4a9c-977e-e9bb85525c02','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ae08d9c0-a986-47f2-8f2f-c6ab61acb22c',NULL,'master','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','master',NULL),('b44f0e07-c497-4022-b185-3bc75c693507','Allowed Client Scopes','seller','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','authenticated'),('b586de2e-5c6c-4972-b69a-396280d0d957','Allowed Protocol Mapper Types','seller','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','seller','anonymous'),('d063b473-633e-44ac-b90a-8d495fb02023','rsa-generated','seller','rsa-generated','org.keycloak.keys.KeyProvider','seller',NULL),('d6378bb8-b941-4c40-9223-2aab39f07993','rsa-enc-generated','seller','rsa-enc-generated','org.keycloak.keys.KeyProvider','seller',NULL),('df060f8d-c3b0-4c04-8b70-3076826720f0','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('ea4700a9-25a8-4050-bd83-2f3a36d05d0e','hmac-generated','seller','hmac-generated','org.keycloak.keys.KeyProvider','seller',NULL),('f0db650b-03d5-4efd-9563-e84cf5b55b0e','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('f9db562b-e1fa-4ee2-9f25-b59e5ee12dae','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('083e0da8-3b9f-421f-a2cd-2921cee17f1b','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('113e23ba-3656-4c25-9cd9-6dd116c6b0a4','016f6d64-480a-4943-af2d-16fbab16528b','host-sending-registration-request-must-match','true'),('14037528-a778-4eee-9332-830805b0b86f','f0db650b-03d5-4efd-9563-e84cf5b55b0e','algorithm','RSA-OAEP'),('14160ee7-6c30-4f2a-b4f7-b9af0cf32dcf','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','saml-role-list-mapper'),('17a1f36c-a157-451e-9aff-27930fdd36f7','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('17b46b4c-fd80-4430-a57e-9d6061addb40','4654d944-653e-47cb-a65a-19866692169b','certificate','MIICmzCCAYMCBgGA2mkcUDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwNTE5MDM0MTAzWhcNMzIwNTE5MDM0MjQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCROvvCvdJKOdSMASu6jjRLbDLkEmzm+EciiT1MaE0IQfR5vJOw1cjaeP2q4TNmREL2bRH69LKM3OMFOB4LnMnm0/9/6yGnSjm6R5Ia1Y0eCmAWVgkdY9csN+RhdlIHPeL/zQcdtXsvvDvtCt44E575+l0V7kCH5FZy5LZ8PHLrtxk1x3MhxAV5hQVF9OoF6t+I0sKDA2+xU+8fyDhaY/k8/zdQUQ+xem/Mf20cmgMBf+l3Oy/axP5takWvte7kLIKgLNG5rqp0ixR5oM9h8Bjq3G/SrC5NjPJ5RgqW47dVff3LXzX+GnGds3Q6qXO8FiJ6nJfvPfmejaq6C0Kf28vJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG7hjBA6ThRZzQm4W3ldKif4CoW3MOWCRIzemUApinJQrHYquOsA6/ogmwl4RMV1/ToCy1RjAHpORgLj8ALZ4TMV0rgAjtytLgnyt4Ogs1V3tXruYhuwDyCcYpOUphs3vZILqDCAGT91JrBkCvwPX5QjL/vlLxJRjrB/WmpL/PjHRVg+7VCafRxy8dS6RCr5n3VtHiGLYQOPlNX1YY/K+TPPG5OpEhvLNoNBHJlX46YYj3vqipGSu2iBYG8Hi5jykkrkK4MRRXN7+QxNmq/Kz7rIRb1WMvB/ijmuJcXY4Qco/CIjASDSbCaHf6iqU161PzN8vf4KGF0I/5xA6et3kPk='),('1a3065dd-fbec-448b-b7e6-7294ca49c805','9a14ee08-92ef-4a9c-977e-e9bb85525c02','max-clients','200'),('1d30e87d-2dfd-4269-a9a7-c7a9cb543f6f','821e1e91-9dfe-45f5-a540-933658aab54a','priority','100'),('2466c499-b821-4081-880a-ea3d34cf6045','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('26fb2596-ee35-4d48-b756-811accde2ac1','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('27fe4e7d-fc6c-47c9-8336-c99828cab9e8','7e5e9e0c-9788-4e34-b402-a829717fd359','allow-default-scopes','true'),('290804ba-3a81-42d9-b101-765129c401cd','d6378bb8-b941-4c40-9223-2aab39f07993','algorithm','RSA-OAEP'),('2a394e79-0da1-49d0-b139-2aaee5fda303','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2b89c1ce-601a-4dba-914b-50eb6b567cb3','9620fc8e-8ea5-4362-b228-aaed4df3202a','kid','42d12c21-8520-405c-a2aa-f5066f65a93d'),('2c113e1b-94bc-4677-afea-70b2e1bfde3a','9620fc8e-8ea5-4362-b228-aaed4df3202a','secret','mgJ4HNFEhUph-HalO-lvaA'),('2e93f9ac-984a-465f-9c1e-a3976b5ac470','4f49290b-8dad-4da1-b7cd-9f0117755a31','allow-default-scopes','true'),('2e9a4ec1-3e39-4d1d-9e8c-3fb2388b07e6','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2f900e6f-23f9-48a1-b37d-ff487ce3ee17','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','saml-user-property-mapper'),('3c24d1b6-8264-4ead-b8e8-3b7f08eae561','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3e855bbe-9fe3-481c-b5d1-a1c198edaca4','f9db562b-e1fa-4ee2-9f25-b59e5ee12dae','priority','100'),('4c83d9b0-89c8-497d-947f-cf5b885b9cc3','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','saml-user-property-mapper'),('4efaf742-d216-419b-b95e-b10a7bfa936d','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','saml-role-list-mapper'),('519d6b22-94be-4a02-b821-398fe91bb268','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','saml-user-property-mapper'),('5207d660-239c-4849-a60c-7a6499e8c31c','730cf862-99c9-430b-8a89-b1d35319eace','client-uris-must-match','true'),('542d1551-5131-4fb9-99be-d6a9c70cc305','f0db650b-03d5-4efd-9563-e84cf5b55b0e','certificate','MIICmzCCAYMCBgGA2mkdWzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwNTE5MDM0MTAzWhcNMzIwNTE5MDM0MjQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDb/5o0xtZE5TwvqtukbOHuh89hoRKkKMCSBHqZ4cv+KsWUzJhjKTGhwwjN7mL0rU3BBfV8nt4WqF56E7mHPnuj+vvW6kVOzVGGKtM9W5fy6iEjUcpt6y9SFJH3DpSxSqTa2wZhR8aZIK93C63Q1y68zmIjkQ0AUflmQg9sKF2G/e7LGVoTOmua8YHvzE5JscDFqKLxZElk5fXqr1EiTctpREk6JM33dpNhjyvWEek9Xk4hZpaMblW1KRCYBXxEf5B6f6HPrBdLg65NiTQO5vZ1DWCYRM0HYKDOy3FzotnCw9Gpu2wC+a4IoVlGlMqX6s6+fLKIbEFbmfxokodkRhFhAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABcBHfALW0ijB9nHghFSe2Z1+rVfsFWpCTHeGuf4lbswB6Cvz4E/9cgBz88r6XADiUecU7XJNYgStp/Y153BJxa/kHc3Io3f31ULWRIK0IhXvbJ4tmpCdsDb5NBBlxD1WH8kjDtwrRsOt6feUFtDgq95R4u+4mQXPXnlUC4sRPjzVRsYpJeoPbG/c4NBmcFViIYzoE4H9syd4/jYAadzJowHwMrDYmnjNUzDszs55n37PtvJJjaocl3ErrEZ+C245scFdgyqEQ/XwEzZykYpII4O/LCCUTUvxF2WdQ7bJ3uXK3PYINBM/YSuJCXo/6B1T7v1JokRVsVaGgrEET4QbJc='),('54ad3bbe-c875-46b3-a954-3f2be3c6fab4','5438ca21-9f5e-4d8e-94b7-d5a8117e3c5c','allow-default-scopes','true'),('56fef1e6-0193-4bfb-8f24-c39d2c1335c6','4654d944-653e-47cb-a65a-19866692169b','keyUse','SIG'),('57deb48f-fcc6-4597-9576-215fc2e5aed8','821e1e91-9dfe-45f5-a540-933658aab54a','secret','G6NueFO5SPSZnb7Q1LnHWUELo0v_I9d57Q8SO1hsxio_BTHjroFCtbjhXFyfjlk_Y-8OcLeMmX6oqgbLdGUCjQ'),('5ea5a727-0dbd-44b6-becc-2f1d0e502280','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','oidc-full-name-mapper'),('66a2a00a-ecc6-4e6d-989d-9898b7eb5b21','ea4700a9-25a8-4050-bd83-2f3a36d05d0e','secret','9La51iFW5yw_SUw3lHfsWGdEkJO2bPsogv9uMsOR9_DMVPTBty7iD_STW7LcEQxGNXS1840N2bPiegqRVNCpCw'),('6774e473-37c1-46c6-b8c5-c71d41a21565','d6378bb8-b941-4c40-9223-2aab39f07993','priority','100'),('67ec0b01-72ca-45d6-ad40-a57bf46462aa','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6fcebce8-afe5-48f1-aa3c-9771acb2223f','f9db562b-e1fa-4ee2-9f25-b59e5ee12dae','kid','bc5dddf6-9dad-4fbf-b35e-c037c2941fa5'),('724db9bb-42c6-4e18-941d-90668a98c9ed','d063b473-633e-44ac-b90a-8d495fb02023','certificate','MIICmzCCAYMCBgGISFZzhTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZzZWxsZXIwHhcNMjMwNTIzMTExODI1WhcNMzMwNTIzMTEyMDA1WjARMQ8wDQYDVQQDDAZzZWxsZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZS2TPlvTqUvvNHEbtAQOVW/PqLVTJmUjymBBW4xQXF0xspaY0h+V8tHWHMA7X8Cu2P9pXGd6AfFHjeZBTNT+C60Ui9gvwODaKZ144cFYN0kPumrUmWTjT2uYPetweaCJkI3QRDilhz+WcQ8DI/EQ5xBZgVjvyI5fEHgcdN36ngaS5IwcpGMgyB+QPZQFBzH5+DNE2FIkdjrS6bLRt36x1cNuMYgKkfKdVriUjYu9o1qmR43mzM3KsG2NfkY5dEM+bbmPG2OC3hs9bCSsZm1PmIhajfJApAaVlsVA9AEvZaXmyhvouf/hxDG7EUGk+SaGue+/swwcvpnNg8LCpzKwpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABp+d2vr0+Qi4oWTnSvKaepptWHO4DPdTrvLoWtnQ0IMY2MWJQjNCOuMEwz1IPc3BMJ/wKuNEeNofnP2F4ns8+pwrELuFEGMiZYi5IMLfJA3W4hNfqPfYYvq9LttciRqPL/ESPbqYP9bm3Ob8NtAYO6vmo4D0AJtAbhgb9w4CeHeFg144XGZsYu0dYufr7Is/eqgERGl4kX4niK+/9xM31zV+ar2CDVNpGEujb+sFY8fZJ6S/sqBZ0mKQQ82lPumJwIxxLicrM7h/6Pj0MNfifOyFw8NSs1M2eu3DMRIGJ4QrS+UbI4kSSpD71ZIeEMFsiLZT1SFvokogejopvfG95E='),('730ca30a-44c3-41c4-a1bd-2249faf2e97e','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','oidc-address-mapper'),('750aa57e-cac7-4ac9-a71b-f51b83f1502b','9620fc8e-8ea5-4362-b228-aaed4df3202a','priority','100'),('76a59531-8394-4b71-9511-d648e816ba8d','4654d944-653e-47cb-a65a-19866692169b','privateKey','MIIEogIBAAKCAQEAkTr7wr3SSjnUjAEruo40S2wy5BJs5vhHIok9TGhNCEH0ebyTsNXI2nj9quEzZkRC9m0R+vSyjNzjBTgeC5zJ5tP/f+shp0o5ukeSGtWNHgpgFlYJHWPXLDfkYXZSBz3i/80HHbV7L7w77QreOBOe+fpdFe5Ah+RWcuS2fDxy67cZNcdzIcQFeYUFRfTqBerfiNLCgwNvsVPvH8g4WmP5PP83UFEPsXpvzH9tHJoDAX/pdzsv2sT+bWpFr7Xu5CyCoCzRua6qdIsUeaDPYfAY6txv0qwuTYzyeUYKluO3VX39y181/hpxnbN0OqlzvBYiepyX7z35no2qugtCn9vLyQIDAQABAoIBACDSz+vnswuLnno2GYgEc9VIEwhxEaPyIUGw+uW1/RMMtRB+inLBHrAiAFMKqu9GJkxDwniRrXkgwz5+vGureAZvi6OBpQ2GPR3Y5zCha0+K0MS7lTvLQOqBh2BvuYJhfliKIj2YssrLJFAi0K6j4J5m83rtajBMby1we74Ae4jCdZzG5q/UE1A2VxzBKJZz5V9fygfUghF6eD71QJA2ulTZMZbVuXQEKUZhiknEkXDKmQr/U+p+dVZILARHpdETcTiFAI2U0aCM5bS68aq2dj+fp0e7vYj8s1yCGTyctnieGz7cEcZG1rxbx/fncBdq4k19vC+F7NZpBFUNKq3uEgECgYEA1QEoZcRWXVIQpcf3TABK4ro/bdcU7mgAC0LrG+EjTAGGuifVhz8i0BB/zQRC9g+fYhMoO/dJaTucTI2kAzXqwCu+mfsokVR4K+PLAUumn4IbLUWkGsfr98MXV8dWPcQE0PwHbaPxGQB0Thp4BRMW0D3aXIAeye6XAc7if5FuYrkCgYEAroumqobKliyuHGEoUX+RQ+NvAvZ7gPm/BELyjP8+smyzn+594OgvtjpTQ9B2GuLf3/31PoVZ/KyPF2fUxUyefx6qwoTX08LWuUUlREatj/rM5K2/mlGr08TQO4JdyfJ1B4fNTElrsks2FjsG6lvuff38NLTXNmMxlT/AlTyYaZECgYB3KPGnlOHXzQwhIi/3ZYZ/NkA7u4IrKSU1J5eNfjKX15a+V4B969UW3tQQJl0reGvqmtr8SQfZhg6XSPnDDguovBAh5j64pq+fpgywSdkKDOgVOItorAUXEx3g7lQRs7IaE5Q4Qumi2f02oFoaRKaTkraw3r/aqc3ypgFR6lL9iQKBgBZU9ckBn+/g3ZHx+FedC7f05GIrqReSXJct/Zx+l8X6VG0U9XQOIPSet8KIbGP6PQyKkJMkOqQya8hh13461FiNUum6V2bXmeNwblky9cfjHc3wUQBsjKB2oPHMNzW8WK7S+DhXeHkCWHQ1ryfTBUuHcHpJ3PMvc8uVsY0miJWRAoGAbIjP2X8X+FS1E/RN7d8zfRekOx3WxpgiObcG5AjwEpOa9qoPBTo9DPgbyoRL0/qEn0q5gePmtaOZ9xamLvDUruDRlF/Z+QD6VLm/BcibbU+DlLAP/wSr5YQae2dW86TO93+vVEMAzEGmue6nlQiaRxuTR+wk0/lmxAhIjEXbmXg='),('7f0a326c-94c8-46ea-b88e-54643444cd68','821e1e91-9dfe-45f5-a540-933658aab54a','algorithm','HS256'),('80905491-76e4-4221-a2b5-2e3af64f5bcf','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','oidc-address-mapper'),('82b68025-870b-4c9d-8030-25113d03a93f','03425828-4a2c-4158-b41f-381434c2e059','max-clients','200'),('836605e3-c57d-4124-b796-537b4f4c8fca','b44f0e07-c497-4022-b185-3bc75c693507','allow-default-scopes','true'),('8827adef-3dd6-482c-9da2-a3a31d611cda','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8a5cf09b-afb9-4548-bca9-ec9a07688900','f0db650b-03d5-4efd-9563-e84cf5b55b0e','privateKey','MIIEpAIBAAKCAQEA2/+aNMbWROU8L6rbpGzh7ofPYaESpCjAkgR6meHL/irFlMyYYykxocMIze5i9K1NwQX1fJ7eFqheehO5hz57o/r71upFTs1RhirTPVuX8uohI1HKbesvUhSR9w6UsUqk2tsGYUfGmSCvdwut0NcuvM5iI5ENAFH5ZkIPbChdhv3uyxlaEzprmvGB78xOSbHAxaii8WRJZOX16q9RIk3LaURJOiTN93aTYY8r1hHpPV5OIWaWjG5VtSkQmAV8RH+Qen+hz6wXS4OuTYk0Dub2dQ1gmETNB2Cgzstxc6LZwsPRqbtsAvmuCKFZRpTKl+rOvnyyiGxBW5n8aJKHZEYRYQIDAQABAoIBAQC1dVaUQY1qtkm2Z49TSBvyy0JanKjrjlGIHvmhA4Vm15Cw8zCeWdP+QQh6Ey678lY359pcOA2nUqjauHpG+1qwHsyqsAEKxn9/0sL50Rq72jILF+OIVnxpj132EajDs3XWruHMS4+brkIMRy3PHC4IvZJlE7dNlE/J8KMX6xN5y2GmlTKoOcJN23Yh9UbniDfZzbktiQhL+3T61FqBBiV505RiNxOcP63gsdaXOEBsb/sefZKhdGKi3+1a8QL2QV6mUyTg3ebHsJdOUeIbakpapcL8R3QjmG9Jjm3fm/cMZzzMfv75SCE98MoWqNr9ELtPjeXWsGa1ze6j4G3EhRchAoGBAPpRqxsx88NA9u/mbN3fdKnoxRXHSi7OxHRrsdLJUzidAacF7UW5cmhv9Ww0h6zRctt+HBPCUmgldqNckVc6qzf8/qx4h3zURCCxYFMH/d2dcYowMLlCTPIuoX6N2/IdZ5/hkdGQW0Qty7IN+VvFevBI0NRIMxHSWOxOGZ6hJhjzAoGBAOD9xiy048ymENQy6xXOJlw5RJpVZVtjAQhOCMvgRNaddx11qywpd1VC6Bn8UmSPJwH4YZQbuLis0dVoKut0RTmAHANgmfpUlcABHzdFD8o0PbNQWY8wpzynOLowyKdtJPzpj4B+e0fXfa4oMDS2uWe4uZhxJLOKq/7upFHMZMFbAoGAbxFDoap1ZYJyzxln3r6iji1pHXOy17gI9Ts/yK5pzankrM51bEWPnQVoWR2pwaWhmACJxr6nP+y3il6tYo32oL4R5kcInvu0SulJOy5Fl0qfsVgWlmzzpVXJdFTPbctcSlWVFO4/gK3tPtDyfqTOGsXEWxy6BENYD2nL9lW8iL8CgYEApHTbBpKycERyyKjvbWDiaUby/lytWb9kYc2oYF3t83HmP4JjPESTFZ9ySIxHLXn16VrE+J3KyDKKrpMVzEWQ1BbwYweZhYGOdGpdhujUQdktwIRa8m99zrfsnyxJfxgokTWnzySkuD6rf0Gg+ucVXtuHzgXl7dbPIekN8zyT6UECgYBB59QfP4MTuM81AEVgSl7TI+datKtPog2w8DcgAoOeZQY8mh246xI3cBS0H5a+Uruf16lVXFkpNB74iWl0o2ic1Zt79lzZgd/oH/3RYWs0jWnatwoGaIP3SrQ0dH1zBdFWykYu+HWh1DdMS3dbNDmQ4NdcYgTPB04+mGn4CjKcVw=='),('8b62be23-95f4-4885-b5d1-3bae48f45f07','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','saml-role-list-mapper'),('8d655734-d043-436d-9dae-1af60e3e3987','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','saml-role-list-mapper'),('8d96ab26-e7a4-40ae-a2c7-a306a61d0167','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','saml-user-property-mapper'),('90165bd7-0087-4929-a758-0ee477a33893','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','oidc-full-name-mapper'),('91f7066f-49d5-45b3-991d-5f858a87d4c0','f0db650b-03d5-4efd-9563-e84cf5b55b0e','keyUse','ENC'),('98ed0cdc-c6c4-4712-b1a4-0036db45d514','4654d944-653e-47cb-a65a-19866692169b','priority','100'),('9cc5d1b0-6140-4e62-baed-44a0203faaac','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9e01182c-55b6-463d-927a-b52db96b270a','f9db562b-e1fa-4ee2-9f25-b59e5ee12dae','secret','PTXWuMoAWAHbGMJxjmbJog'),('a685e108-04f6-4e10-b6cf-772260eb9a56','d6378bb8-b941-4c40-9223-2aab39f07993','keyUse','ENC'),('b1b8809b-5363-448f-9ead-95ee3082c71f','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('b6165064-7e4c-4e80-95b8-6aea7c44e211','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b8539a65-3e39-4ac6-93c0-c013c2cc5eef','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('bcb91c92-a48e-4966-a2fa-6bf1b00e9839','ea4700a9-25a8-4050-bd83-2f3a36d05d0e','priority','100'),('be158c95-a104-4fa3-ace7-4875822fc654','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c5c5d307-61b4-44ed-a4b5-cdb545aaea2b','d6378bb8-b941-4c40-9223-2aab39f07993','certificate','MIICmzCCAYMCBgGISFZ24jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZzZWxsZXIwHhcNMjMwNTIzMTExODI2WhcNMzMwNTIzMTEyMDA2WjARMQ8wDQYDVQQDDAZzZWxsZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDv/OVhy1acvNSN8+UX1k+gJgQATjXGgNVJoUcS4IciV8dxoztJbhrW2NbXJ0BpJdR7cX1/8hxMaOGH1OAYCj/qcfmVYV4Y0FoB2lMsBDj86IGXW2Y0IFGuJhVA8mlytJEvUwIJts8kEPwvzxal/UtYGCm/FpDvSlIICzVCHkyLzZKTVAZnM679BFWlPM4ls/EvMYHQrNaSHy038IOK2Ie3hBAkYBC3ZZma6znp5uYlO8TJGwGB3harFua4oscOMw5ln3od5aEWTaiiaz5lLYLjmES++L71OuonATttDTGHYtZnWGx5Sn/o4rXdZtZeny1KpRTxLbZ8on174ydlS3ePAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGiwySCxeLPiBRUr0DpgHLySLlxz17K9DOQolePuRpp9OzOLF1yzjJkjkJSbxHgmEtoDUKLKkVt/UgtK2qzT2A9vrsFA4fT3J9qAdnTu2ck2n2GOdNRP0ogfU+nGQVVWDCZo62VYlRuSynnBfrIc1zAzH5OpSSIWdg83q+GlPFs0stoNhhVesuWBlBHMT+v+fyzlHQAWFSUV9Xf73pZO/hpGSL9KidVP7Qsl+F+hVhvIeHu3PwIHkuUxRPkkTfl8tpILT3ikb17RYaIx1cAW/0hlTLnU8ALZ+XNc3BjnlS1Oqb6rTicJ5hVg2FaLViEqkKJYMLHmk4jIdILd889/I5w='),('c97e6393-39d3-41e6-beef-d8e0763bcaaf','df060f8d-c3b0-4c04-8b70-3076826720f0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ca751b01-8f3d-4427-ac74-6daef49a1f07','f0db650b-03d5-4efd-9563-e84cf5b55b0e','priority','100'),('d088d28b-ebdd-4589-8658-feef2b14b92b','ea4700a9-25a8-4050-bd83-2f3a36d05d0e','kid','61d5b7de-9902-485c-b8e1-896a6eb1e0a3'),('d81c8239-2839-430c-b425-e5b3c4d7fb3b','d063b473-633e-44ac-b90a-8d495fb02023','priority','100'),('d99016d9-1dac-46b9-9725-8d818b17fadd','b586de2e-5c6c-4972-b69a-396280d0d957','allowed-protocol-mapper-types','oidc-address-mapper'),('e254efc8-9fee-4ac4-b413-d753793eb666','aa5563e7-eeb5-404d-a4fd-c75ac1e803ab','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e3a986ab-c54f-4823-b397-393543ebbd1a','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e40a364e-1754-45f9-86c1-470c44ea243e','d6378bb8-b941-4c40-9223-2aab39f07993','privateKey','MIIEpAIBAAKCAQEA7/zlYctWnLzUjfPlF9ZPoCYEAE41xoDVSaFHEuCHIlfHcaM7SW4a1tjW1ydAaSXUe3F9f/IcTGjhh9TgGAo/6nH5lWFeGNBaAdpTLAQ4/OiBl1tmNCBRriYVQPJpcrSRL1MCCbbPJBD8L88Wpf1LWBgpvxaQ70pSCAs1Qh5Mi82Sk1QGZzOu/QRVpTzOJbPxLzGB0KzWkh8tN/CDitiHt4QQJGAQt2WZmus56ebmJTvEyRsBgd4WqxbmuKLHDjMOZZ96HeWhFk2ooms+ZS2C45hEvvi+9TrqJwE7bQ0xh2LWZ1hseUp/6OK13WbWXp8tSqUU8S22fKJ9e+MnZUt3jwIDAQABAoIBAQCTkOPTEF8/nXTtnGzgDW2EwhtvvKegWZPM5Jh5aQpu+Z6vp3lLG6LxPQBN59rZTOOszAopZEw2R7918FWjMpo+pLqdOfPMOkE+JmtCA46vJKCa2x6rKrxO4yfqeaSRXapweRAlvPz95lvLYgFBK9DqaGEzGMMiAIcUXx/uegcDZsGyirNCkcvo0f5aSr4/N0HBJE2Y3zNrTDSKXk+NFsRfqmJEnrQfW/Q/zTm6vR+cS4L0SV6vnoqR6oryRXlSp/R/MYt8tDdArRWDUHaObjL304nkA7LYvlCRZL0UzR6FMATLHdB/85tSeKnaAcPeII7qHaKHk//zNDIqMUeKEqkhAoGBAP3z9iyL3GYnvJk8CMAqoWfpgQ0g1z690UfiaCeBqiPWBlOYvwJkVn2VC4vAJmHPHbPR9EouR8npPZr5drBc+7vSMBQzT5+2DFqkofXaGJZI18d6KodLDOjlC9LwtnaRYhXBcB4SMmLTZZQLmpa0rNcrc6Enqy3Nhx1ZzcIjFbK5AoGBAPHsHfhD7LWCvzWn/7fGdnUk+P+mhCmlOH0FA3MMjw5LfK6wsnhjZcmuYBiiVUGWEauuAScnFc85uriqHeY7tX31FpIanTJmd0NXfHR5AosdwOXPqjR8UZjSUje5utCLnh79ok1gBEKALPjXLLVd6kZMpj+ZPSptmOVIXkmt7/iHAoGBAJRYTWZKMO3vqmjsu8PdYzm7GiqcE4BQC49tPyBMyyFx5XIx2OpByJBFX2A8V29tOFGRhJ1MmZzlxZngvadaOabGqlUygAGwq1jLsNxXkWNAm+Onhm5PtfPZ0GVhPYTXei9xNtgqEwrNqBmqCZydYBW1CS+LZ6Ay3gmUKvCL5CHpAoGAE5rd5uOiSCdbVX7S01LLAL1JTHZzGWjhRghk+irXYQIvDX0WSXlMo2Z1NSnanOELd403XLPnKY71Gcf3elP2Zkm5VYfAm3gATD3HwSyZTyrPGhCVK4Gznx3UOd3cTNAztTE6uOiCD92RR20wm1YMCTxm8Jp7gXe2P0Z5FaF54/sCgYB1L5vA50tekZEjXi5BPLL3/x4v/w7eLXYuzoBIIbCtH3YW5QbwzoGuCbCEOwVRjx8FN5+BPohAJfKiyEhm8GMB40cPxag1weMYOUwYPYEqnDG0R3qHcw0jVDGwW1cFi6MYcqnelVmRRy+Fk1TAhJ3r2YEASfS5VSikUrivQNUZug=='),('e7d752bc-31e7-4e0d-a825-a8db26b7de44','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','oidc-address-mapper'),('e8ca90b2-7adf-4347-af44-3e2403ebd4d4','8b7c88bb-f550-420e-9570-80a0a7989ea4','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f08a43eb-730b-42e3-980c-d16bbb328f60','d063b473-633e-44ac-b90a-8d495fb02023','keyUse','SIG'),('f5df9e3b-0470-4f71-acee-ad560aa1eeaf','016f6d64-480a-4943-af2d-16fbab16528b','client-uris-must-match','true'),('f6e1853e-54d3-4f9e-b0e5-ea3ee2e8b68c','ea4700a9-25a8-4050-bd83-2f3a36d05d0e','algorithm','HS256'),('f7567638-3c88-4faf-a0ce-aeef0f63a245','821e1e91-9dfe-45f5-a540-933658aab54a','kid','3e114613-2816-4281-a8ab-76f9194dd042'),('fb0257c1-79a1-4ebe-b168-ca22d49ad010','730cf862-99c9-430b-8a89-b1d35319eace','host-sending-registration-request-must-match','true'),('fe4b80ec-be71-41ba-b4e1-98bdd3807c8c','d063b473-633e-44ac-b90a-8d495fb02023','privateKey','MIIEowIBAAKCAQEAmUtkz5b06lL7zRxG7QEDlVvz6i1UyZlI8pgQVuMUFxdMbKWmNIflfLR1hzAO1/Artj/aVxnegHxR43mQUzU/gutFIvYL8Dg2imdeOHBWDdJD7pq1Jlk409rmD3rcHmgiZCN0EQ4pYc/lnEPAyPxEOcQWYFY78iOXxB4HHTd+p4GkuSMHKRjIMgfkD2UBQcx+fgzRNhSJHY60umy0bd+sdXDbjGICpHynVa4lI2LvaNapkeN5szNyrBtjX5GOXRDPm25jxtjgt4bPWwkrGZtT5iIWo3yQKQGlZbFQPQBL2Wl5sob6Ln/4cQxuxFBpPkmhrnvv7MMHL6ZzYPCwqcysKQIDAQABAoIBAF8hscM+PGm66/cDKGTmrzGeqgVW8npVvTaH9gPl0k7uL4hxWG7bMyir2Q/3XA7YRlhI0hghvrpf7HXNuCpbLjnyBarHpOsEB5zmv0spM85KAcxuiCLvVdvrycArj7TzDPy2H86Byl6gJS9PwLE6FKEAtp48heEkA4g61lFkYh5S1SF5ieGWnBtjkxNPDC0taiE+CeOUd5jXlMU+40d8kMs1Z75SnKD6wJDfkRqsRRRNeQ3RPNFIH0veyw5aNvvwAQ7GSlLZzFiyfhIQ8ftRRR8crkWDLhrxq/pjX77enX3G3N0ReF3/oci3CP8jwshHPOeZNTHjVEs8bRdGpeo2W60CgYEA7pgU3woYo0cyGLB7fKQaxH5UnX9LoKIsYcFTqMPpRLklb8/M79OGkPEGeIpix+y6nzRsLS9uCELmwHHKTCAOgtNa4t673xucCIc8dsMs2M+OUAsgby0yQLedFQP5DddNIfGfwRJErKiEgNFSo9pzG6Wree74PTWvD8YfTvcUpE8CgYEApHpH2Vu7dIkMExI1LH4pbOnVMxSmry6XVPAfyJg4NInH3JWmLpiXqV0eprxt8v+XCytA77Tn3IDlr6SCe+ASc5AUM5xFa+SzTJe4KMBIeO7fk7KEQHet43ygvzcMsN9bZwfOwqCsHlENNYwI/pZJnaB9cfmVjLjSKw0lGjafcgcCgYAjNVAHJc9C8POkjw558yF8E4RbBXjciHHyLvwwcFCQ8p1ipZCBZ355Dwg8a3duNzHG4o6AEHq1P2Ibze7jUuuxRI0p42Jn5wQcghBbGiwZBm/iwfGUVmAPCslkW4S6FSZttuEzNYXq0KdU9w6x3T+VOdpXEPuS1MQzmLHwDif+owKBgQCO5t797kFT4q5m827XlVWQlyjxFIQtuCErXuV+dyJ+IydOc4bK/TDnqUw0OYqdkYs93PqySU8ZubPVgu0Li4b8eLXUkXWPZEiTx03tugI9b+04eeWFzXV7LJDNEZspISZcwd/WIZrpTCpZ160I5LJZDVNwbxSMCxgu52DRAZxOiQKBgBz6XjpP8MqySMiFAW/Mo3SWKCYQRHVujSvd7U48zziw7YxlnLDIVd3iA+cHXjGMoC733uli0VqLMnqKAoNnXxZWou/hzx/baR5Okwqmrc++IinZiAIxVlIPQw9EScPCGrQ63y6/VBh8xZWXk8uyUH3GPIs1cyBVapG4vxVPDY90');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0c340735-0ac9-4f9f-8d08-100539e2b14b','213c97e9-f63c-4607-b0a9-4b9e9bb9fee3'),('0c340735-0ac9-4f9f-8d08-100539e2b14b','c6bf9c6b-22c4-43ef-a393-2b1587b41fa6'),('13814992-cd91-46f1-b012-56d53b4cf2eb','a285cc97-d519-45e4-bd0f-6595bd9966ca'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','0e276156-7341-4128-81a4-876926708f73'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','125b31ef-aead-4416-8e35-11317760b7ea'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','143ace31-f720-4d70-939e-7bc09a38716c'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','23bf90eb-b3b3-4fab-80ea-24e912072cc1'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','23d1143c-1bed-45e2-9b93-077ade4e88fd'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','2ff82da8-912a-46d5-9449-0d71d8712b81'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','52b214e8-8a72-4a43-9167-3df40a5b81bb'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','54d5aa5e-9966-4ef5-9b03-78aa8d130a28'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','5958754b-8dc2-4613-bdc1-4ccf27b236b4'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','76f047ee-f2cd-4116-9668-d226750c289d'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','7e95ff78-866f-4d11-9496-7ef82d8d056e'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','952d92db-a11b-4736-828e-2196c28e8607'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','98836c0a-5740-4598-a76f-8d65387da824'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','988c6cd1-4e7f-451b-9d05-f4a835a1ccf4'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','a1e12378-9d38-455e-9de1-9f2bd4fb2789'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','ae57b834-0272-4b07-9e9f-419f0a6d6a6b'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','cab13f5a-6ff0-4dc9-a3bd-367a972b0b18'),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','e0d77ecc-b927-413d-9fc4-6c8547832287'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','0e276156-7341-4128-81a4-876926708f73'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','28f7852b-8b93-42fc-b005-fd280c9c3440'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','2a5737c2-16f5-4a91-881a-98209036c229'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','4fc9d01f-b219-4e9a-be74-28c381b6b853'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','5958754b-8dc2-4613-bdc1-4ccf27b236b4'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','63cc56db-734b-40be-a915-e0d2fc9b03a7'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','952d92db-a11b-4736-828e-2196c28e8607'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','98836c0a-5740-4598-a76f-8d65387da824'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','d7b9ca5d-8dc7-47a2-9978-98f3ae1458ee'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','0182f75c-f7cb-4d7b-bf08-ba3940771ac2'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','02f70213-70bb-4c78-9000-aca9ed314cb8'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','0b4a539a-094c-4273-a9ac-c4ef4f26be6e'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','0c340735-0ac9-4f9f-8d08-100539e2b14b'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','0ffeee57-fc35-4173-9211-ddaad8aca245'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','13814992-cd91-46f1-b012-56d53b4cf2eb'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','13a93ce8-be4b-4194-9cb6-bdf78eadb73c'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','1436f664-d1be-4898-be6c-4464c63c4cdb'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','17c7cfa7-ed90-4963-8ed3-66b835240404'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','213c97e9-f63c-4607-b0a9-4b9e9bb9fee3'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','316f6b44-2409-4e19-931d-1bbb0de6abce'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','3a675d0c-1681-4d9e-9ebc-0396cb7610b8'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','3ecc70f2-1e71-429b-bf7d-eda7a84e24f4'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','4ab5ebdb-0905-40e0-be27-bdb35f7eeba9'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','50c498dd-584d-4b45-be4d-29b19a05e6be'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','5199cad3-f2e5-4dd5-b0f4-0e80f3b43ad6'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','6e9a887e-c891-4f83-ab02-ec58c0cd5e2e'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','72942785-b997-4a0c-851d-93dda76374fd'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','858edefe-50f9-46c0-8972-acd889f5b446'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','8aff21aa-96e0-443e-9c01-4467ea0b929a'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','8f72fb33-4e4b-40a0-b78a-8b8902abbb73'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','a110e455-adc2-4cf4-8ebe-c3dc43ee45a1'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','a285cc97-d519-45e4-bd0f-6595bd9966ca'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','ab3bf639-95a0-4bed-bdd8-b6ce297cfece'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','b184daea-bc17-4010-92b6-f4de51e640d8'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','b30854d6-e442-4dd4-93cb-9e431d6ad599'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','b85fa610-d9c6-4382-9cc5-0a42f128b3b6'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','c2d7fb07-4046-410b-90fd-075bd939ac28'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','c6bf9c6b-22c4-43ef-a393-2b1587b41fa6'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','cde6feb0-517d-48de-94ea-94a9fc4ef50d'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','ce2fb321-9c56-4161-8b6b-cd83e2d76883'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','d62f8d17-c3bd-4ee6-bf76-26ec1ca9d30d'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','ddb0350f-68e6-4946-b909-b10967d860ff'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','e1ce459c-5223-4529-96ec-e998469cb133'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','ec5b78ae-590d-4371-ae59-d8b55c24be32'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','f7a500e8-a8d2-4de2-b845-34241897e72c'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','fefc5962-2b13-4011-a043-9b0df10789cc'),('5958754b-8dc2-4613-bdc1-4ccf27b236b4','0e276156-7341-4128-81a4-876926708f73'),('5958754b-8dc2-4613-bdc1-4ccf27b236b4','2ff82da8-912a-46d5-9449-0d71d8712b81'),('5ad9dd6b-5122-4519-9848-1b0a29d806aa','087987d3-2f3a-45cf-a354-6fda54a6d7c7'),('b30854d6-e442-4dd4-93cb-9e431d6ad599','316f6b44-2409-4e19-931d-1bbb0de6abce'),('b30854d6-e442-4dd4-93cb-9e431d6ad599','ddb0350f-68e6-4946-b909-b10967d860ff'),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','06061f42-15a6-4e40-8772-436dbc56cc10'),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','44f486c0-12d5-4da2-b3e8-8cfa3f80f9b2'),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','7d238473-7cbb-49f1-8db8-812d4dcbcfec'),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','c546eb18-19ca-4453-9a35-75bdf309329e'),('c546eb18-19ca-4453-9a35-75bdf309329e','629e09a5-022f-4fb7-87cd-ae1d5ede011a'),('ce2fb321-9c56-4161-8b6b-cd83e2d76883','6e9a887e-c891-4f83-ab02-ec58c0cd5e2e'),('d6c580a3-b013-49ef-902b-44f36998a2bd','513c5b95-c7e2-4eaa-b75a-b420fd3d6e5e'),('d7b9ca5d-8dc7-47a2-9978-98f3ae1458ee','23dec37f-3e7d-44e6-bfc2-da3bba15c40d'),('e0d77ecc-b927-413d-9fc4-6c8547832287','cab13f5a-6ff0-4dc9-a3bd-367a972b0b18');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('57c36752-9a84-4f9d-bab1-b21b328ebf8d',NULL,'password','1d3b63d5-b551-47b0-b066-1d5899e29ce2',1701468889353,NULL,'{\"value\":\"JJRfelQzFMEhnkc0U4GBM2io+KOwnOi/Tg1AUq1+n1b0Ho5dX290aEVucP7wm6qeVdxWPqXvFf0JZv0oMKMbvQ==\",\"salt\":\"BuKdIRnHNtCDKj8UD2pylA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-05-19 02:50:55',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-05-19 02:50:55',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-05-19 02:50:56',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-05-19 02:50:56',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-05-19 02:50:58',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-05-19 02:50:58',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-05-19 02:51:01',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-05-19 02:51:01',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-05-19 02:51:01',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-05-19 02:51:03',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-05-19 02:51:04',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-05-19 02:51:04',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-05-19 02:51:04',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-05-19 02:51:04',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-05-19 02:51:04',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-05-19 02:51:04',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-05-19 02:51:04',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-05-19 02:51:06',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-05-19 02:51:07',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-05-19 02:51:07',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-05-19 02:51:07',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-05-19 02:51:07',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-05-19 02:51:07',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-05-19 02:51:07',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-05-19 02:51:07',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-05-19 02:51:07',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-05-19 02:51:09',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-05-19 02:51:09',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-05-19 02:51:10',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-05-19 02:51:10',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-05-19 02:51:11',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-05-19 02:51:11',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-05-19 02:51:11',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-05-19 02:51:11',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-05-19 02:51:12',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-05-19 02:51:12',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-05-19 02:51:12',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2928651243'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-05-19 02:51:12',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-05-19 02:51:12',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-05-19 02:51:12',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-05-19 02:51:12',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-05-19 02:51:12',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-05-19 02:51:14',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-05-19 02:51:15',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-05-19 02:51:15',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-05-19 02:51:15',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-05-19 02:51:15',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-05-19 02:51:16',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-05-19 02:51:16',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-05-19 02:51:17',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-05-19 02:51:17',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-05-19 02:51:17',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-05-19 02:51:17',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-05-19 02:51:17',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-05-19 02:51:17',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-05-19 02:51:17',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-05-19 02:51:18',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-05-19 02:51:20',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-05-19 02:51:21',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-05-19 02:51:21',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-05-19 02:51:21',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-05-19 02:51:21',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-05-19 02:51:21',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-05-19 02:51:21',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-05-19 02:51:21',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-05-19 02:51:21',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-05-19 02:51:21',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-05-19 02:51:21',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-05-19 02:51:22',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-05-19 02:51:22',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2928651243'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-05-19 02:51:22',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'2928651243'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-05-19 02:51:22',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-05-19 02:51:22',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-05-19 02:51:22',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-05-19 02:51:23',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-05-19 02:51:23',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-05-19 02:51:23',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-05-19 02:51:23',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-05-19 02:51:24',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-05-19 02:51:24',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-05-19 02:51:24',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-05-19 02:51:24',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-05-19 02:51:24',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-05-19 02:51:24',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2928651243'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-05-19 02:51:24',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2928651243'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-05-19 02:51:24',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'2928651243'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-05-19 02:51:24',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-05-19 02:51:24',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'2928651243'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:24',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'2928651243'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:24',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:24',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2928651243'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:24',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:24',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:25',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2928651243'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:25',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'2928651243'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-05-19 02:51:25',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2928651243'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2928651243'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2928651243'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2928651243'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-05-19 02:51:25',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'2928651243'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-05-19 02:51:25',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'2928651243');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','72c5ded6-294f-456a-a6e1-1ff62ddda2a6',_binary '\0'),('master','768bfc3b-b305-432b-832d-58a2758a6c76',_binary ''),('master','811ba392-4793-4db7-bea5-89ba2efcd197',_binary ''),('master','85afee6e-2747-4fc2-ab90-07f9890732f4',_binary '\0'),('master','893597ac-b61f-4604-9630-7484c1bea407',_binary '\0'),('master','a71a93be-a1ee-47b0-b3a4-1832c2d23d2b',_binary '\0'),('master','b629baaa-934b-4640-89e4-81fcced60b60',_binary ''),('master','c58dc9f1-2ce7-4344-b15f-fea0d28eab89',_binary ''),('master','fb184a4a-77ea-432b-b57c-c3bd32ed63d3',_binary ''),('seller','1ea65159-5e69-46d3-84b1-bfaad8fce6dc',_binary '\0'),('seller','27e61af0-c464-4b51-b0c3-9ecca3577f99',_binary '\0'),('seller','43f0481f-ac1c-4244-ac77-2a5f8f34f4a0',_binary '\0'),('seller','6695c119-657c-4895-89bf-5da23774a0e6',_binary ''),('seller','6d6a4b5e-4626-4475-ba49-b0c9864a7999',_binary ''),('seller','6edc9bba-0109-4fdb-9c63-53248e8eb642',_binary ''),('seller','7a19a270-cf91-46c3-931b-955fb037ed98',_binary ''),('seller','9c65f00c-bee5-4248-820a-223fb5a1db6b',_binary '\0'),('seller','d28d52bf-d2cf-4331-8c0c-cb16d61f8b80',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('36824859-ccb9-4253-9994-9d0f4a0cf80b','user',' ','seller');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0182f75c-f7cb-4d7b-bf08-ba3940771ac2','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_query-realms}','query-realms','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('02f70213-70bb-4c78-9000-aca9ed314cb8','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_create-client}','create-client','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('06061f42-15a6-4e40-8772-436dbc56cc10','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('087987d3-2f3a-45cf-a354-6fda54a6d7c7','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_view-consent}','view-consent','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('0b4a539a-094c-4273-a9ac-c4ef4f26be6e','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_query-realms}','query-realms','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('0c340735-0ac9-4f9f-8d08-100539e2b14b','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-users}','view-users','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('0e276156-7341-4128-81a4-876926708f73','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_query-users}','query-users','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('0ffeee57-fc35-4173-9211-ddaad8aca245','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-users}','manage-users','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('125b31ef-aead-4416-8e35-11317760b7ea','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-events}','view-events','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('13814992-cd91-46f1-b012-56d53b4cf2eb','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-clients}','view-clients','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('13a93ce8-be4b-4194-9cb6-bdf78eadb73c','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-events}','view-events','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('1436f664-d1be-4898-be6c-4464c63c4cdb','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-events}','manage-events','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('143ace31-f720-4d70-939e-7bc09a38716c','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-realm}','view-realm','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('17093e23-8eb1-4c2d-a372-0f34ebb6f4b2','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_realm-admin}','realm-admin','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('17c7cfa7-ed90-4963-8ed3-66b835240404','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-realm}','manage-realm','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('213c97e9-f63c-4607-b0a9-4b9e9bb9fee3','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_query-users}','query-users','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('23bf90eb-b3b3-4fab-80ea-24e912072cc1','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-identity-providers}','view-identity-providers','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('23d1143c-1bed-45e2-9b93-077ade4e88fd','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-authorization}','view-authorization','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('23dec37f-3e7d-44e6-bfc2-da3bba15c40d','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_manage-account-links}','manage-account-links','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('28f7852b-8b93-42fc-b005-fd280c9c3440','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_view-profile}','view-profile','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('2a5737c2-16f5-4a91-881a-98209036c229','fc54cf71-939d-4ab8-914a-7e4d2c653ddd',_binary '',NULL,'seller','seller','fc54cf71-939d-4ab8-914a-7e4d2c653ddd',NULL),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','seller',_binary '\0','${role_default-roles}','default-roles-seller','seller',NULL,NULL),('2ff82da8-912a-46d5-9449-0d71d8712b81','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_query-groups}','query-groups','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('316f6b44-2409-4e19-931d-1bbb0de6abce','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_query-users}','query-users','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('3a675d0c-1681-4d9e-9ebc-0396cb7610b8','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-clients}','manage-clients','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('3ecc70f2-1e71-429b-bf7d-eda7a84e24f4','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_impersonation}','impersonation','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('44f486c0-12d5-4da2-b3e8-8cfa3f80f9b2','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('4ab5ebdb-0905-40e0-be27-bdb35f7eeba9','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-authorization}','view-authorization','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('4fc9d01f-b219-4e9a-be74-28c381b6b853','seller',_binary '\0','${role_uma_authorization}','uma_authorization','seller',NULL,NULL),('50c498dd-584d-4b45-be4d-29b19a05e6be','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-identity-providers}','view-identity-providers','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('513c5b95-c7e2-4eaa-b75a-b420fd3d6e5e','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_view-consent}','view-consent','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('5199cad3-f2e5-4dd5-b0f4-0e80f3b43ad6','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('52b214e8-8a72-4a43-9167-3df40a5b81bb','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-identity-providers}','manage-identity-providers','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('54d5aa5e-9966-4ef5-9b03-78aa8d130a28','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-authorization}','manage-authorization','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('5958754b-8dc2-4613-bdc1-4ccf27b236b4','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-users}','view-users','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('5ad9dd6b-5122-4519-9848-1b0a29d806aa','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_manage-consent}','manage-consent','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('629e09a5-022f-4fb7-87cd-ae1d5ede011a','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_manage-account-links}','manage-account-links','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('63cc56db-734b-40be-a915-e0d2fc9b03a7','seller',_binary '\0','${role_offline-access}','offline_access','seller',NULL,NULL),('68f51e46-d4e5-4f5d-a820-a9725b5950fd','seller',_binary '\0',NULL,'Sellers','seller',NULL,NULL),('69470bc0-7034-4ad9-9eaf-3bd02ed6f1b7','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_view-applications}','view-applications','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('6e9a887e-c891-4f83-ab02-ec58c0cd5e2e','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_query-clients}','query-clients','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('72942785-b997-4a0c-851d-93dda76374fd','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_create-client}','create-client','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('73fcc32a-3836-48c7-ba41-1625565e5d08','e68da95f-d316-4323-88b2-c78290e786ae',_binary '',NULL,'seller','seller','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('76f047ee-f2cd-4116-9668-d226750c289d','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_create-client}','create-client','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('7d238473-7cbb-49f1-8db8-812d4dcbcfec','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_view-profile}','view-profile','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('7e95ff78-866f-4d11-9496-7ef82d8d056e','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-events}','manage-events','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('858edefe-50f9-46c0-8972-acd889f5b446','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-authorization}','manage-authorization','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('8aff21aa-96e0-443e-9c01-4467ea0b929a','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-clients}','manage-clients','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('8f72fb33-4e4b-40a0-b78a-8b8902abbb73','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('952d92db-a11b-4736-828e-2196c28e8607','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-realm}','manage-realm','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('967cf2ea-bdff-4d6f-ad25-93e35f69b931','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_view-applications}','view-applications','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('98836c0a-5740-4598-a76f-8d65387da824','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-users}','manage-users','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('988c6cd1-4e7f-451b-9d05-f4a835a1ccf4','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_query-realms}','query-realms','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('9e445066-0b81-4b8c-aca6-92fe36e692d8','181f6a8b-b028-41e2-96c4-2e1e1ecf066b',_binary '','${role_read-token}','read-token','seller','181f6a8b-b028-41e2-96c4-2e1e1ecf066b',NULL),('a110e455-adc2-4cf4-8ebe-c3dc43ee45a1','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-events}','manage-events','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('a1e12378-9d38-455e-9de1-9f2bd4fb2789','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_impersonation}','impersonation','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('a285cc97-d519-45e4-bd0f-6595bd9966ca','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_query-clients}','query-clients','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('ab3bf639-95a0-4bed-bdd8-b6ce297cfece','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-authorization}','manage-authorization','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('ae57b834-0272-4b07-9e9f-419f0a6d6a6b','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_manage-clients}','manage-clients','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('ae68adf0-d090-4844-9a3e-489b8ce28677','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_delete-account}','delete-account','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('b184daea-bc17-4010-92b6-f4de51e640d8','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-authorization}','view-authorization','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('b30854d6-e442-4dd4-93cb-9e431d6ad599','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-users}','view-users','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('b85fa610-d9c6-4382-9cc5-0a42f128b3b6','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_view-realm}','view-realm','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('c2d7fb07-4046-410b-90fd-075bd939ac28','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-realm}','manage-realm','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('c546eb18-19ca-4453-9a35-75bdf309329e','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_manage-account}','manage-account','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('c6bf9c6b-22c4-43ef-a393-2b1587b41fa6','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_query-groups}','query-groups','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('c8a06cda-af8c-4f58-a0bf-eaa58ac1f2d5','e68da95f-d316-4323-88b2-c78290e786ae',_binary '',NULL,'uma_protection','seller','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('cab13f5a-6ff0-4dc9-a3bd-367a972b0b18','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_query-clients}','query-clients','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('cde6feb0-517d-48de-94ea-94a9fc4ef50d','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_manage-users}','manage-users','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('ce2fb321-9c56-4161-8b6b-cd83e2d76883','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-clients}','view-clients','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('d62f8d17-c3bd-4ee6-bf76-26ec1ca9d30d','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('d6c580a3-b013-49ef-902b-44f36998a2bd','294080fb-805f-4d5a-8abc-a6e46e65b950',_binary '','${role_manage-consent}','manage-consent','master','294080fb-805f-4d5a-8abc-a6e46e65b950',NULL),('d7b9ca5d-8dc7-47a2-9978-98f3ae1458ee','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_manage-account}','manage-account','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('ddb0350f-68e6-4946-b909-b10967d860ff','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',_binary '','${role_query-groups}','query-groups','master','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',NULL),('e0d77ecc-b927-413d-9fc4-6c8547832287','1cfd4fd5-e544-4985-b0c4-6000e9a57199',_binary '','${role_view-clients}','view-clients','seller','1cfd4fd5-e544-4985-b0c4-6000e9a57199',NULL),('e1ce459c-5223-4529-96ec-e998469cb133','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-identity-providers}','view-identity-providers','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('ec5b78ae-590d-4371-ae59-d8b55c24be32','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-realm}','view-realm','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('ecbfc6cd-ff44-45cf-ba5a-7c5ba2a5ec09','e3fcbbd1-9871-4195-9711-e29daa2ce7f1',_binary '','${role_read-token}','read-token','master','e3fcbbd1-9871-4195-9711-e29daa2ce7f1',NULL),('f7a500e8-a8d2-4de2-b845-34241897e72c','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_view-events}','view-events','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL),('f7a77bf8-2366-4379-bfb1-69127f175446','7ca7ce72-c43c-463e-8491-f4eb2598de22',_binary '','${role_delete-account}','delete-account','seller','7ca7ce72-c43c-463e-8491-f4eb2598de22',NULL),('fefc5962-2b13-4011-a043-9b0df10789cc','94affb35-62bf-4f33-b1b2-a6f47663c232',_binary '','${role_impersonation}','impersonation','master','94affb35-62bf-4f33-b1b2-a6f47663c232',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('2k5hm','16.1.1',1652928691);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('7e8ea590-4748-4431-89cc-4441f14fbb16','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),('c28479b9-9bb8-45ed-8424-fe512583e49d','defaultResourceType','urn:manager-cli:resources:default');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('00c98ce4-627a-42d1-b886-faed7465e2e1','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','523cef04-dde9-4f52-b634-f85170b42a94',NULL),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','523cef04-dde9-4f52-b634-f85170b42a94',NULL),('0de1c3ed-b7ca-4cbb-bf06-377b4f98d4ad','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'7a19a270-cf91-46c3-931b-955fb037ed98'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'893597ac-b61f-4604-9630-7484c1bea407'),('23d39fd8-8bce-4a10-bb34-801143255024','username','openid-connect','oidc-usermodel-property-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','username','openid-connect','oidc-usermodel-property-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d28d52bf-d2cf-4331-8c0c-cb16d61f8b80'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27e61af0-c464-4b51-b0c3-9ecca3577f99'),('35b3c311-ae8b-4962-8318-8ac45c798d69','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','locale','openid-connect','oidc-usermodel-attribute-mapper','02151d90-245f-4739-9f19-5c839f4c3e1f',NULL),('3e10e837-e76b-408c-8c9c-88686643f647','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'fb184a4a-77ea-432b-b57c-c3bd32ed63d3'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','email','openid-connect','oidc-usermodel-property-mapper',NULL,'6edc9bba-0109-4fdb-9c63-53248e8eb642'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27e61af0-c464-4b51-b0c3-9ecca3577f99'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','locale','openid-connect','oidc-usermodel-attribute-mapper','5d8a87a7-ccc2-4c01-bef6-5c82899bc3af',NULL),('4859656d-dec6-4af2-ad2a-49e752788b9a','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'a71a93be-a1ee-47b0-b3a4-1832c2d23d2b'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'b629baaa-934b-4640-89e4-81fcced60b60'),('5318f65f-86c6-4dc7-aea0-d63c0f485c03','full name','openid-connect','oidc-full-name-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('54a1498a-c84f-4013-bec5-060ff614e31f','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('568f2e58-6b16-42ac-9080-af388ca59714','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('599776c3-514d-4f7d-814a-7c977de310cc','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('5d6f1441-27c1-4716-891a-abb67b34caa7','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('65c23030-084e-4ce4-82fc-a83cedd012b8','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6edc9bba-0109-4fdb-9c63-53248e8eb642'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','address','openid-connect','oidc-address-mapper',NULL,'85afee6e-2747-4fc2-ab90-07f9890732f4'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'fb184a4a-77ea-432b-b57c-c3bd32ed63d3'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('71be7884-ee14-4c94-885f-05610b51d17e','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'d28d52bf-d2cf-4331-8c0c-cb16d61f8b80'),('7b1178aa-73bf-498a-897c-51ac0d2e0ef5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'811ba392-4793-4db7-bea5-89ba2efcd197'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'a71a93be-a1ee-47b0-b3a4-1832c2d23d2b'),('7dab5f02-1ad6-4163-9d29-a7f3c7af796e','role list','saml','saml-role-list-mapper',NULL,'6695c119-657c-4895-89bf-5da23774a0e6'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('8b285118-c2df-4659-85ad-9a6152b039c1','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('8d103672-35da-4739-b439-7d313bebc4d1','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'893597ac-b61f-4604-9630-7484c1bea407'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('a3cd7882-2246-4930-9391-365bc49b51b6','full name','openid-connect','oidc-full-name-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('a4d123ef-189e-42a4-ae22-3d524c119a36','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('aff0e31e-31dd-4d27-a375-877748d8933e','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','email','openid-connect','oidc-usermodel-property-mapper',NULL,'b629baaa-934b-4640-89e4-81fcced60b60'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'1ea65159-5e69-46d3-84b1-bfaad8fce6dc'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6d6a4b5e-4626-4475-ba49-b0c9864a7999'),('cebc3837-0612-486c-a396-5e6e6be69453','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'fb184a4a-77ea-432b-b57c-c3bd32ed63d3'),('d50e86d8-5d97-400f-926a-c23a445866e8','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','523cef04-dde9-4f52-b634-f85170b42a94',NULL),('d902070f-43f1-4fae-ab6b-bdc903b19ec0','audience resolve','openid-connect','oidc-audience-resolve-mapper','a9ae2f9a-1b76-45b1-9d28-fb83547caef3',NULL),('de5d3aba-5b63-4290-ad5a-00165bf5743f','audience resolve','openid-connect','oidc-audience-resolve-mapper','8d790a83-7626-46c1-807e-1558d7dcb480',NULL),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'768bfc3b-b305-432b-832d-58a2758a6c76'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1ea65159-5e69-46d3-84b1-bfaad8fce6dc'),('e4158096-92be-4816-b3a2-a4e8b661de55','address','openid-connect','oidc-address-mapper',NULL,'9c65f00c-bee5-4248-820a-223fb5a1db6b'),('eab159f7-9f79-4c6a-a75b-6422b13eed6b','role list','saml','saml-role-list-mapper',NULL,'c58dc9f1-2ce7-4344-b15f-fea0d28eab89'),('f9ea4e26-8547-412d-b530-f121039464c7','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'d28d52bf-d2cf-4331-8c0c-cb16d61f8b80');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('00c98ce4-627a-42d1-b886-faed7465e2e1','true','access.token.claim'),('00c98ce4-627a-42d1-b886-faed7465e2e1','clientAddress','claim.name'),('00c98ce4-627a-42d1-b886-faed7465e2e1','true','id.token.claim'),('00c98ce4-627a-42d1-b886-faed7465e2e1','String','jsonType.label'),('00c98ce4-627a-42d1-b886-faed7465e2e1','clientAddress','user.session.note'),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','true','access.token.claim'),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','clientHost','claim.name'),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','true','id.token.claim'),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','String','jsonType.label'),('09099bf7-55c8-4d36-ae9d-9dc05d758b39','clientHost','user.session.note'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','true','access.token.claim'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','nickname','claim.name'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','true','id.token.claim'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','String','jsonType.label'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','nickname','user.attribute'),('0f19b9ca-ce04-4dba-9692-cc09b6e26dd0','true','userinfo.token.claim'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','true','access.token.claim'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','updated_at','claim.name'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','true','id.token.claim'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','String','jsonType.label'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','updatedAt','user.attribute'),('0fe470b3-7f98-4154-a58c-2a8cfeffc95f','true','userinfo.token.claim'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','true','access.token.claim'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','phone_number','claim.name'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','true','id.token.claim'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','String','jsonType.label'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','phoneNumber','user.attribute'),('22bed3f1-05dc-435b-9b30-8994ad04e28c','true','userinfo.token.claim'),('23d39fd8-8bce-4a10-bb34-801143255024','true','access.token.claim'),('23d39fd8-8bce-4a10-bb34-801143255024','preferred_username','claim.name'),('23d39fd8-8bce-4a10-bb34-801143255024','true','id.token.claim'),('23d39fd8-8bce-4a10-bb34-801143255024','String','jsonType.label'),('23d39fd8-8bce-4a10-bb34-801143255024','username','user.attribute'),('23d39fd8-8bce-4a10-bb34-801143255024','true','userinfo.token.claim'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','true','access.token.claim'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','preferred_username','claim.name'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','true','id.token.claim'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','String','jsonType.label'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','username','user.attribute'),('2891f264-1bc2-418c-8d8e-cf29c7d3e578','true','userinfo.token.claim'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','true','access.token.claim'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','realm_access.roles','claim.name'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','String','jsonType.label'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','true','multivalued'),('2b43327f-72dd-4f0b-a6cc-cac4b304b6d8','foo','user.attribute'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','true','access.token.claim'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','given_name','claim.name'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','true','id.token.claim'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','String','jsonType.label'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','firstName','user.attribute'),('2d262ee4-e451-4b70-88b8-9bc381477e0f','true','userinfo.token.claim'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','true','access.token.claim'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','birthdate','claim.name'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','true','id.token.claim'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','String','jsonType.label'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','birthdate','user.attribute'),('318ca0e5-bc56-49bb-ac9c-2c9819a8516e','true','userinfo.token.claim'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','true','access.token.claim'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','phone_number','claim.name'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','true','id.token.claim'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','String','jsonType.label'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','phoneNumber','user.attribute'),('339a1319-7256-4c6b-afd6-a4a4dd9cf33c','true','userinfo.token.claim'),('35b3c311-ae8b-4962-8318-8ac45c798d69','true','access.token.claim'),('35b3c311-ae8b-4962-8318-8ac45c798d69','birthdate','claim.name'),('35b3c311-ae8b-4962-8318-8ac45c798d69','true','id.token.claim'),('35b3c311-ae8b-4962-8318-8ac45c798d69','String','jsonType.label'),('35b3c311-ae8b-4962-8318-8ac45c798d69','birthdate','user.attribute'),('35b3c311-ae8b-4962-8318-8ac45c798d69','true','userinfo.token.claim'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','true','access.token.claim'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','locale','claim.name'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','true','id.token.claim'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','String','jsonType.label'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','locale','user.attribute'),('3a922ec4-5de4-40ac-85bd-ffa2228c2189','true','userinfo.token.claim'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','true','access.token.claim'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','email','claim.name'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','true','id.token.claim'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','String','jsonType.label'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','email','user.attribute'),('3f85481d-7b0d-4bf3-8036-05d448cf92d6','true','userinfo.token.claim'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','true','access.token.claim'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','phone_number_verified','claim.name'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','true','id.token.claim'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','boolean','jsonType.label'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','phoneNumberVerified','user.attribute'),('41c3a4a2-3d8d-4213-b600-0b327a0c1225','true','userinfo.token.claim'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','true','access.token.claim'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','locale','claim.name'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','true','id.token.claim'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','String','jsonType.label'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','locale','user.attribute'),('423aa4bf-0db3-4bda-b18f-fb5c4fa43312','true','userinfo.token.claim'),('4859656d-dec6-4af2-ad2a-49e752788b9a','true','access.token.claim'),('4859656d-dec6-4af2-ad2a-49e752788b9a','clientId','claim.name'),('4859656d-dec6-4af2-ad2a-49e752788b9a','true','id.token.claim'),('4859656d-dec6-4af2-ad2a-49e752788b9a','String','jsonType.label'),('4859656d-dec6-4af2-ad2a-49e752788b9a','clientId','user.session.note'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','true','access.token.claim'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','family_name','claim.name'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','true','id.token.claim'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','String','jsonType.label'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','lastName','user.attribute'),('4d27a0f3-2229-4779-bcaa-e76c0a765a50','true','userinfo.token.claim'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','true','access.token.claim'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','groups','claim.name'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','true','id.token.claim'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','String','jsonType.label'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','true','multivalued'),('4ddf4823-c7db-4eea-901c-f38c6cc7d7f4','foo','user.attribute'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','true','access.token.claim'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','email_verified','claim.name'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','true','id.token.claim'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','boolean','jsonType.label'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','emailVerified','user.attribute'),('52b2447a-5736-4d41-b4e7-97aebdc76ce9','true','userinfo.token.claim'),('5318f65f-86c6-4dc7-aea0-d63c0f485c03','true','access.token.claim'),('5318f65f-86c6-4dc7-aea0-d63c0f485c03','true','id.token.claim'),('5318f65f-86c6-4dc7-aea0-d63c0f485c03','true','userinfo.token.claim'),('54a1498a-c84f-4013-bec5-060ff614e31f','true','access.token.claim'),('54a1498a-c84f-4013-bec5-060ff614e31f','given_name','claim.name'),('54a1498a-c84f-4013-bec5-060ff614e31f','true','id.token.claim'),('54a1498a-c84f-4013-bec5-060ff614e31f','String','jsonType.label'),('54a1498a-c84f-4013-bec5-060ff614e31f','firstName','user.attribute'),('54a1498a-c84f-4013-bec5-060ff614e31f','true','userinfo.token.claim'),('568f2e58-6b16-42ac-9080-af388ca59714','true','access.token.claim'),('568f2e58-6b16-42ac-9080-af388ca59714','website','claim.name'),('568f2e58-6b16-42ac-9080-af388ca59714','true','id.token.claim'),('568f2e58-6b16-42ac-9080-af388ca59714','String','jsonType.label'),('568f2e58-6b16-42ac-9080-af388ca59714','website','user.attribute'),('568f2e58-6b16-42ac-9080-af388ca59714','true','userinfo.token.claim'),('599776c3-514d-4f7d-814a-7c977de310cc','true','access.token.claim'),('599776c3-514d-4f7d-814a-7c977de310cc','gender','claim.name'),('599776c3-514d-4f7d-814a-7c977de310cc','true','id.token.claim'),('599776c3-514d-4f7d-814a-7c977de310cc','String','jsonType.label'),('599776c3-514d-4f7d-814a-7c977de310cc','gender','user.attribute'),('599776c3-514d-4f7d-814a-7c977de310cc','true','userinfo.token.claim'),('5d6f1441-27c1-4716-891a-abb67b34caa7','true','access.token.claim'),('5d6f1441-27c1-4716-891a-abb67b34caa7','nickname','claim.name'),('5d6f1441-27c1-4716-891a-abb67b34caa7','true','id.token.claim'),('5d6f1441-27c1-4716-891a-abb67b34caa7','String','jsonType.label'),('5d6f1441-27c1-4716-891a-abb67b34caa7','nickname','user.attribute'),('5d6f1441-27c1-4716-891a-abb67b34caa7','true','userinfo.token.claim'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','true','access.token.claim'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','middle_name','claim.name'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','true','id.token.claim'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','String','jsonType.label'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','middleName','user.attribute'),('642e911c-9c34-473e-b93e-e40a36eb5cc0','true','userinfo.token.claim'),('65c23030-084e-4ce4-82fc-a83cedd012b8','true','access.token.claim'),('65c23030-084e-4ce4-82fc-a83cedd012b8','middle_name','claim.name'),('65c23030-084e-4ce4-82fc-a83cedd012b8','true','id.token.claim'),('65c23030-084e-4ce4-82fc-a83cedd012b8','String','jsonType.label'),('65c23030-084e-4ce4-82fc-a83cedd012b8','middleName','user.attribute'),('65c23030-084e-4ce4-82fc-a83cedd012b8','true','userinfo.token.claim'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','true','access.token.claim'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','email_verified','claim.name'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','true','id.token.claim'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','boolean','jsonType.label'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','emailVerified','user.attribute'),('66be804d-4c2e-4cb0-87c1-c4d651b5e730','true','userinfo.token.claim'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','true','access.token.claim'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','true','id.token.claim'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','country','user.attribute.country'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','formatted','user.attribute.formatted'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','locality','user.attribute.locality'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','postal_code','user.attribute.postal_code'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','region','user.attribute.region'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','street','user.attribute.street'),('6a0746a7-78ba-49a3-95c0-c5b0d8e26235','true','userinfo.token.claim'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','true','access.token.claim'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','realm_access.roles','claim.name'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','String','jsonType.label'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','true','multivalued'),('6d016940-cadc-4ee3-bb0d-d95f898d4e9c','foo','user.attribute'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','true','access.token.claim'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','website','claim.name'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','true','id.token.claim'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','String','jsonType.label'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','website','user.attribute'),('6d4ec3b4-393e-4da3-9e02-aacd4d736847','true','userinfo.token.claim'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','true','access.token.claim'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','clientHost','claim.name'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','true','id.token.claim'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','String','jsonType.label'),('6e8e8ace-a786-4d3c-ad6a-9e026f1e61a2','clientHost','user.session.note'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','true','access.token.claim'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','upn','claim.name'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','true','id.token.claim'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','String','jsonType.label'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','username','user.attribute'),('7b1fdcf6-0a31-4cfa-bd9b-77b6fe2e34fb','true','userinfo.token.claim'),('7dab5f02-1ad6-4163-9d29-a7f3c7af796e','Role','attribute.name'),('7dab5f02-1ad6-4163-9d29-a7f3c7af796e','Basic','attribute.nameformat'),('7dab5f02-1ad6-4163-9d29-a7f3c7af796e','false','single'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','true','access.token.claim'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','locale','claim.name'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','true','id.token.claim'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','String','jsonType.label'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','locale','user.attribute'),('86e8539c-ba7b-45a0-be93-6783a89a5bfb','true','userinfo.token.claim'),('8b285118-c2df-4659-85ad-9a6152b039c1','true','access.token.claim'),('8b285118-c2df-4659-85ad-9a6152b039c1','zoneinfo','claim.name'),('8b285118-c2df-4659-85ad-9a6152b039c1','true','id.token.claim'),('8b285118-c2df-4659-85ad-9a6152b039c1','String','jsonType.label'),('8b285118-c2df-4659-85ad-9a6152b039c1','zoneinfo','user.attribute'),('8b285118-c2df-4659-85ad-9a6152b039c1','true','userinfo.token.claim'),('8d103672-35da-4739-b439-7d313bebc4d1','true','access.token.claim'),('8d103672-35da-4739-b439-7d313bebc4d1','phone_number_verified','claim.name'),('8d103672-35da-4739-b439-7d313bebc4d1','true','id.token.claim'),('8d103672-35da-4739-b439-7d313bebc4d1','boolean','jsonType.label'),('8d103672-35da-4739-b439-7d313bebc4d1','phoneNumberVerified','user.attribute'),('8d103672-35da-4739-b439-7d313bebc4d1','true','userinfo.token.claim'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','true','access.token.claim'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','clientAddress','claim.name'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','true','id.token.claim'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','String','jsonType.label'),('901f48e5-605b-42ab-b9f2-f80671d9a18b','clientAddress','user.session.note'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','true','access.token.claim'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','picture','claim.name'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','true','id.token.claim'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','String','jsonType.label'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','picture','user.attribute'),('a1a0b064-aebd-4839-8b1c-321abef9c4f1','true','userinfo.token.claim'),('a3cd7882-2246-4930-9391-365bc49b51b6','true','access.token.claim'),('a3cd7882-2246-4930-9391-365bc49b51b6','true','id.token.claim'),('a3cd7882-2246-4930-9391-365bc49b51b6','true','userinfo.token.claim'),('a4d123ef-189e-42a4-ae22-3d524c119a36','true','access.token.claim'),('a4d123ef-189e-42a4-ae22-3d524c119a36','family_name','claim.name'),('a4d123ef-189e-42a4-ae22-3d524c119a36','true','id.token.claim'),('a4d123ef-189e-42a4-ae22-3d524c119a36','String','jsonType.label'),('a4d123ef-189e-42a4-ae22-3d524c119a36','lastName','user.attribute'),('a4d123ef-189e-42a4-ae22-3d524c119a36','true','userinfo.token.claim'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','true','access.token.claim'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','updated_at','claim.name'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','true','id.token.claim'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','String','jsonType.label'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','updatedAt','user.attribute'),('a9389ca1-2fce-4ffc-bb9d-40c7fb9a21fa','true','userinfo.token.claim'),('aff0e31e-31dd-4d27-a375-877748d8933e','true','access.token.claim'),('aff0e31e-31dd-4d27-a375-877748d8933e','gender','claim.name'),('aff0e31e-31dd-4d27-a375-877748d8933e','true','id.token.claim'),('aff0e31e-31dd-4d27-a375-877748d8933e','String','jsonType.label'),('aff0e31e-31dd-4d27-a375-877748d8933e','gender','user.attribute'),('aff0e31e-31dd-4d27-a375-877748d8933e','true','userinfo.token.claim'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','true','access.token.claim'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','locale','claim.name'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','true','id.token.claim'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','String','jsonType.label'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','locale','user.attribute'),('b16ce8c7-8b97-44cd-a9f8-372d7297878c','true','userinfo.token.claim'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','true','access.token.claim'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','picture','claim.name'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','true','id.token.claim'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','String','jsonType.label'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','picture','user.attribute'),('bf994649-c58d-43d0-96b1-f60bedfc36cc','true','userinfo.token.claim'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','true','access.token.claim'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','zoneinfo','claim.name'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','true','id.token.claim'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','String','jsonType.label'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','zoneinfo','user.attribute'),('c0f5bb98-40ee-4ed9-859d-2f334a2e611b','true','userinfo.token.claim'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','true','access.token.claim'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','email','claim.name'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','true','id.token.claim'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','String','jsonType.label'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','email','user.attribute'),('c2d2d928-ae45-4701-a90c-d2d4013e22b2','true','userinfo.token.claim'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','true','access.token.claim'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','upn','claim.name'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','true','id.token.claim'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','String','jsonType.label'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','username','user.attribute'),('c309cdbb-49fb-4b78-aa25-96b909c6af8b','true','userinfo.token.claim'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','true','access.token.claim'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','profile','claim.name'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','true','id.token.claim'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','String','jsonType.label'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','profile','user.attribute'),('cc8dd2d0-7856-41f1-ab09-37b64aeeb6dc','true','userinfo.token.claim'),('cebc3837-0612-486c-a396-5e6e6be69453','true','access.token.claim'),('cebc3837-0612-486c-a396-5e6e6be69453','resource_access.${client_id}.roles','claim.name'),('cebc3837-0612-486c-a396-5e6e6be69453','String','jsonType.label'),('cebc3837-0612-486c-a396-5e6e6be69453','true','multivalued'),('cebc3837-0612-486c-a396-5e6e6be69453','foo','user.attribute'),('d50e86d8-5d97-400f-926a-c23a445866e8','true','access.token.claim'),('d50e86d8-5d97-400f-926a-c23a445866e8','clientId','claim.name'),('d50e86d8-5d97-400f-926a-c23a445866e8','true','id.token.claim'),('d50e86d8-5d97-400f-926a-c23a445866e8','String','jsonType.label'),('d50e86d8-5d97-400f-926a-c23a445866e8','clientId','user.session.note'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','true','access.token.claim'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','profile','claim.name'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','true','id.token.claim'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','String','jsonType.label'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','profile','user.attribute'),('dffd1869-c144-4f00-a341-d77fa3e9a5ee','true','userinfo.token.claim'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','true','access.token.claim'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','groups','claim.name'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','true','id.token.claim'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','String','jsonType.label'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','true','multivalued'),('e371afa9-d52f-40a3-a5d8-ee1a87b34887','foo','user.attribute'),('e4158096-92be-4816-b3a2-a4e8b661de55','true','access.token.claim'),('e4158096-92be-4816-b3a2-a4e8b661de55','true','id.token.claim'),('e4158096-92be-4816-b3a2-a4e8b661de55','country','user.attribute.country'),('e4158096-92be-4816-b3a2-a4e8b661de55','formatted','user.attribute.formatted'),('e4158096-92be-4816-b3a2-a4e8b661de55','locality','user.attribute.locality'),('e4158096-92be-4816-b3a2-a4e8b661de55','postal_code','user.attribute.postal_code'),('e4158096-92be-4816-b3a2-a4e8b661de55','region','user.attribute.region'),('e4158096-92be-4816-b3a2-a4e8b661de55','street','user.attribute.street'),('e4158096-92be-4816-b3a2-a4e8b661de55','true','userinfo.token.claim'),('eab159f7-9f79-4c6a-a75b-6422b13eed6b','Role','attribute.name'),('eab159f7-9f79-4c6a-a75b-6422b13eed6b','Basic','attribute.nameformat'),('eab159f7-9f79-4c6a-a75b-6422b13eed6b','false','single'),('f9ea4e26-8547-412d-b530-f121039464c7','true','access.token.claim'),('f9ea4e26-8547-412d-b530-f121039464c7','resource_access.${client_id}.roles','claim.name'),('f9ea4e26-8547-412d-b530-f121039464c7','String','jsonType.label'),('f9ea4e26-8547-412d-b530-f121039464c7','true','multivalued'),('f9ea4e26-8547-412d-b530-f121039464c7','foo','user.attribute');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','NONE',1800,36000,_binary '\0',_binary '\0','94affb35-62bf-4f33-b1b2-a6f47663c232',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','d377934d-ed45-43f4-a05e-b231ad81225f','9b17274c-2fb7-4faa-af51-3df5eb0c60ab','733e5d22-ee1b-496e-b5d4-2434c0768ad8','17b95ab6-df31-4774-a903-bbef8f1aefd8','718fb30f-a544-40af-b9ae-847f9fe25dbd',2592000,_binary '\0',900,_binary '',_binary '\0','1b9b21ed-125b-4a06-9d8c-f32c8275c4f5',0,_binary '\0',0,0,'c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e'),('seller',60,300,300,'keycloak','keycloak','keycloak',_binary '',_binary '\0',0,'keycloak','jump_park',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','NONE',2592000,3024000,_binary '\0',_binary '','6bf0b760-8150-44ef-ab2e-ef1c713a0d6a',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','1bbcdf1c-21a7-4f54-be32-994ab33c7530','b6dab85c-6506-420e-a13c-89f00a165808','7c48b28a-655d-42a4-aee2-c429de7e375a','aa266561-bbe0-404b-9159-b1cd6fa5f00e','1b40ca56-5c6e-4cce-949a-c8ba402a2a1a',2592000,_binary '',900,_binary '',_binary '\0','879fcff2-f50d-441a-9fb4-2dab1c126668',0,_binary '\0',0,0,'2b7ad436-4f80-42a9-9061-9c8928b9b19d');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','seller','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.contentSecurityPolicyReportOnly','seller',''),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','seller','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xContentTypeOptions','seller','nosniff'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xFrameOptions','seller','SAMEORIGIN'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xRobotsTag','seller','none'),('_browser_header.xXSSProtection','master','1; mode=block'),('_browser_header.xXSSProtection','seller','1; mode=block'),('actionTokenGeneratedByAdminLifespan','master','43200'),('actionTokenGeneratedByAdminLifespan','seller','300'),('actionTokenGeneratedByUserLifespan','master','300'),('actionTokenGeneratedByUserLifespan','seller','300'),('bruteForceProtected','master','false'),('bruteForceProtected','seller','true'),('cibaAuthRequestedUserHint','master','login_hint'),('cibaAuthRequestedUserHint','seller','login_hint'),('cibaBackchannelTokenDeliveryMode','master','poll'),('cibaBackchannelTokenDeliveryMode','seller','poll'),('cibaExpiresIn','master','120'),('cibaExpiresIn','seller','120'),('cibaInterval','master','5'),('cibaInterval','seller','5'),('client-policies.policies','master','{\"policies\":[]}'),('client-policies.policies','seller','{\"policies\":[]}'),('client-policies.profiles','master','{\"profiles\":[]}'),('client-policies.profiles','seller','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','master','0'),('clientOfflineSessionIdleTimeout','seller','0'),('clientOfflineSessionMaxLifespan','master','0'),('clientOfflineSessionMaxLifespan','seller','0'),('clientSessionIdleTimeout','master','0'),('clientSessionIdleTimeout','seller','0'),('clientSessionMaxLifespan','master','0'),('clientSessionMaxLifespan','seller','0'),('defaultSignatureAlgorithm','master','RS256'),('defaultSignatureAlgorithm','seller','RS256'),('displayName','master','Keycloak'),('displayName','seller','jump park'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('displayNameHtml','seller','jump park'),('failureFactor','master','30'),('failureFactor','seller','5'),('maxDeltaTimeSeconds','master','43200'),('maxDeltaTimeSeconds','seller','43200'),('maxFailureWaitSeconds','master','900'),('maxFailureWaitSeconds','seller','900'),('minimumQuickLoginWaitSeconds','master','60'),('minimumQuickLoginWaitSeconds','seller','60'),('oauth2DeviceCodeLifespan','master','600'),('oauth2DeviceCodeLifespan','seller','600'),('oauth2DevicePollingInterval','master','600'),('oauth2DevicePollingInterval','seller','5'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespan','seller','5184000'),('offlineSessionMaxLifespanEnabled','master','false'),('offlineSessionMaxLifespanEnabled','seller','false'),('parRequestUriLifespan','master','60'),('parRequestUriLifespan','seller','60'),('permanentLockout','master','false'),('permanentLockout','seller','false'),('quickLoginCheckMilliSeconds','master','1000'),('quickLoginCheckMilliSeconds','seller','1000'),('userProfileEnabled','seller','false'),('waitIncrementSeconds','master','60'),('waitIncrementSeconds','seller','60'),('webAuthnPolicyAttestationConveyancePreference','master','not specified'),('webAuthnPolicyAttestationConveyancePreference','seller','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','master','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','seller','not specified'),('webAuthnPolicyAuthenticatorAttachment','master','not specified'),('webAuthnPolicyAuthenticatorAttachment','seller','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','master','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','seller','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','master','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','seller','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','master','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','seller','false'),('webAuthnPolicyCreateTimeout','master','0'),('webAuthnPolicyCreateTimeout','seller','0'),('webAuthnPolicyCreateTimeoutPasswordless','master','0'),('webAuthnPolicyCreateTimeoutPasswordless','seller','0'),('webAuthnPolicyRequireResidentKey','master','not specified'),('webAuthnPolicyRequireResidentKey','seller','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','master','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','seller','not specified'),('webAuthnPolicyRpEntityName','master','keycloak'),('webAuthnPolicyRpEntityName','seller','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','master','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','seller','keycloak'),('webAuthnPolicyRpId','master',''),('webAuthnPolicyRpId','seller',''),('webAuthnPolicyRpIdPasswordless','master',''),('webAuthnPolicyRpIdPasswordless','seller',''),('webAuthnPolicySignatureAlgorithms','master','ES256'),('webAuthnPolicySignatureAlgorithms','seller','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','master','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','seller','ES256'),('webAuthnPolicyUserVerificationRequirement','master','not specified'),('webAuthnPolicyUserVerificationRequirement','seller','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','master','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','seller','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('seller','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','seller');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
INSERT INTO `REALM_SMTP_CONFIG` VALUES ('seller','true','auth'),('seller','gustavo@belltecnologia.com.br','from'),('seller','Mumbuca Shopping','fromDisplayName'),('seller','smtp.dreamhost.com','host'),('seller','B&llb&ll','password'),('seller','587','port'),('seller','','ssl'),('seller','true','starttls'),('seller','gustavo@belltecnologia.com.br','user');
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('seller','');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('02151d90-245f-4739-9f19-5c839f4c3e1f','/admin/jump_park/console/*'),('294080fb-805f-4d5a-8abc-a6e46e65b950','/realms/master/account/*'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','/admin/master/console/*'),('7ca7ce72-c43c-463e-8491-f4eb2598de22','/realms/jump_park/account/*'),('8d790a83-7626-46c1-807e-1558d7dcb480','/realms/master/account/*'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','/realms/seller/account/*'),('e68da95f-d316-4323-88b2-c78290e786ae','*'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','http://marica.bellcommerce.com.br/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('111c6808-97c3-470a-b7a3-e136179bb0f5','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('3feecaa7-ca0e-4ced-8450-a808a6cbd8a6','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('475995f5-e996-4b3f-865d-7dd980df1cca','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('61704adc-dee8-461a-8d0d-95570586d99c','CONFIGURE_TOTP','Configure OTP','seller',_binary '',_binary '\0','CONFIGURE_TOTP',10),('7bf59c8d-1214-43f4-8c3e-5aab5239cb02','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('7dc7c14f-65f5-4317-84ca-0aac9fad0644','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('91c01f55-c694-4f76-a654-5889021999be','terms_and_conditions','Terms and Conditions','seller',_binary '\0',_binary '\0','terms_and_conditions',20),('a34c8e3c-3615-4a24-b1fc-6e77024ef687','delete_account','Delete Account','seller',_binary '\0',_binary '\0','delete_account',60),('a3e68701-cd87-4dff-871d-43ca848b1e0e','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('c31ac5f7-b495-4b51-8d03-40cad7ca5665','UPDATE_PASSWORD','Update Password','seller',_binary '',_binary '\0','UPDATE_PASSWORD',30),('cffdd510-0046-4c98-8fcc-72d4c656cf8f','VERIFY_EMAIL','Verify Email','seller',_binary '',_binary '\0','VERIFY_EMAIL',50),('e3109aba-268a-4307-8516-e6d6d4c73388','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('e7eae933-e3f0-4a32-949e-20044809e357','update_user_locale','Update User Locale','seller',_binary '',_binary '\0','update_user_locale',1000),('eba33e3a-79df-464c-9df0-ea6fd870310a','UPDATE_PROFILE','Update Profile','seller',_binary '',_binary '\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('e68da95f-d316-4323-88b2-c78290e786ae',_binary '','0',1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('7e8ea590-4748-4431-89cc-4441f14fbb16','Default Policy','A policy that grants access only for users within this realm','js','0','0','e68da95f-d316-4323-88b2-c78290e786ae',NULL),('c28479b9-9bb8-45ed-8424-fe512583e49d','Default Permission','A permission that applies to the default resource type','resource','1','0','e68da95f-d316-4323-88b2-c78290e786ae',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('6c9bb6e2-225f-410b-bc72-cd8ed59c609d','Default Resource','urn:manager-cli:resources:default',NULL,'e68da95f-d316-4323-88b2-c78290e786ae','e68da95f-d316-4323-88b2-c78290e786ae',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('6c9bb6e2-225f-410b-bc72-cd8ed59c609d','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `ROLE_ATTRIBUTE` VALUES ('624cc8aa-acd1-4221-8301-fdf77cceb12c','2a5737c2-16f5-4a91-881a-98209036c229','create','true');
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('e68da95f-d316-4323-88b2-c78290e786ae','0e276156-7341-4128-81a4-876926708f73'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','0e276156-7341-4128-81a4-876926708f73'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','23bf90eb-b3b3-4fab-80ea-24e912072cc1'),('e68da95f-d316-4323-88b2-c78290e786ae','2b7ad436-4f80-42a9-9061-9c8928b9b19d'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','2b7ad436-4f80-42a9-9061-9c8928b9b19d'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','52b214e8-8a72-4a43-9167-3df40a5b81bb'),('e68da95f-d316-4323-88b2-c78290e786ae','5958754b-8dc2-4613-bdc1-4ccf27b236b4'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','5958754b-8dc2-4613-bdc1-4ccf27b236b4'),('e68da95f-d316-4323-88b2-c78290e786ae','98836c0a-5740-4598-a76f-8d65387da824'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','98836c0a-5740-4598-a76f-8d65387da824'),('8d790a83-7626-46c1-807e-1558d7dcb480','c546eb18-19ca-4453-9a35-75bdf309329e'),('a9ae2f9a-1b76-45b1-9d28-fb83547caef3','d7b9ca5d-8dc7-47a2-9978-98f3ae1458ee');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('0b31056d-016f-4171-9d04-28656c1d63b0',NULL,'51c82282-b409-4a4a-b29a-40ddf79999cd',_binary '\0',_binary '',NULL,NULL,NULL,'master','service-account-admin-cli',1652932283292,'523cef04-dde9-4f52-b634-f85170b42a94',0),('1d3b63d5-b551-47b0-b066-1d5899e29ce2','admin@local','admin@local',_binary '',_binary '',NULL,'Admin','Keycloak','master','admin',1652931764399,NULL,0),('614f6679-14fa-4d36-82d5-6ee539f06280',NULL,'f094456d-b570-468a-8e2d-04eb724fd3e3',_binary '\0',_binary '',NULL,NULL,NULL,'seller','service-account-manager-cli',1684896488951,'e68da95f-d316-4323-88b2-c78290e786ae',0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','0b31056d-016f-4171-9d04-28656c1d63b0'),('0b4a539a-094c-4273-a9ac-c4ef4f26be6e','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('13814992-cd91-46f1-b012-56d53b4cf2eb','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('13a93ce8-be4b-4194-9cb6-bdf78eadb73c','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('316f6b44-2409-4e19-931d-1bbb0de6abce','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('3e9028c0-81a5-49dc-9d6e-0be1889395a9','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('50c498dd-584d-4b45-be4d-29b19a05e6be','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('5199cad3-f2e5-4dd5-b0f4-0e80f3b43ad6','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('72942785-b997-4a0c-851d-93dda76374fd','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('858edefe-50f9-46c0-8972-acd889f5b446','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('8aff21aa-96e0-443e-9c01-4467ea0b929a','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('a110e455-adc2-4cf4-8ebe-c3dc43ee45a1','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('a285cc97-d519-45e4-bd0f-6595bd9966ca','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('b184daea-bc17-4010-92b6-f4de51e640d8','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('b30854d6-e442-4dd4-93cb-9e431d6ad599','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('b85fa610-d9c6-4382-9cc5-0a42f128b3b6','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('c1b87ed6-0ac4-4160-a52c-e8ba67e75b4e','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('c2d7fb07-4046-410b-90fd-075bd939ac28','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('cde6feb0-517d-48de-94ea-94a9fc4ef50d','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('ddb0350f-68e6-4946-b909-b10967d860ff','1d3b63d5-b551-47b0-b066-1d5899e29ce2'),('2b7ad436-4f80-42a9-9061-9c8928b9b19d','614f6679-14fa-4d36-82d5-6ee539f06280'),('c8a06cda-af8c-4f58-a0bf-eaa58ac1f2d5','614f6679-14fa-4d36-82d5-6ee539f06280');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('02151d90-245f-4739-9f19-5c839f4c3e1f','+'),('5d8a87a7-ccc2-4c01-bef6-5c82899bc3af','+'),('e68da95f-d316-4323-88b2-c78290e786ae','*'),('fc54cf71-939d-4ab8-914a-7e4d2c653ddd','*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01 19:15:12
