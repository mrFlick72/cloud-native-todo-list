-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.20

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
USE keycloak;

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
INSERT INTO `ASSOCIATED_POLICY` VALUES ('af10b46f-c7c7-4a28-87ac-2b32daec65a2','39fc46a1-d76e-433e-9cd0-34742b42ec4b');
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
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('000d67c5-e66c-417d-9dc4-65a8a4abab26',NULL,'registration-page-form','todo-list','98a9bb5b-68e2-4600-af2f-cfb7bf43a4dc',0,10,_binary '','fcedb764-9078-496d-b0ac-c8ea0b1ceef1',NULL),('019e4ac9-379b-487c-9745-e7aea965561b',NULL,'registration-user-creation','todo-list','fcedb764-9078-496d-b0ac-c8ea0b1ceef1',0,20,_binary '\0',NULL,NULL),('04b4b4f7-5cbe-4be1-a8c3-4c02a51a1b91',NULL,'registration-password-action','master','105fde3a-d884-46e6-9915-6b91a384815d',0,50,_binary '\0',NULL,NULL),('05508e64-3e82-452b-baba-5f2361012917',NULL,'client-x509','master','6b8f0d28-6eec-46b7-9db5-f26f5089fcc5',2,40,_binary '\0',NULL,NULL),('07cb90af-fbd2-470f-8e2b-5b380afb1016',NULL,'direct-grant-validate-otp','master','2b23240f-14a7-4533-b712-0b48319ae503',0,20,_binary '\0',NULL,NULL),('0a86159f-d8c0-43cf-8122-c9b9d02640be',NULL,NULL,'master','df32d7d7-de1c-4b0c-b5c5-fc60b5f76633',2,30,_binary '','6ceead02-94a2-441e-981f-ed53f09b27ee',NULL),('0b0d2878-904b-4160-8b58-6bb181562ae3',NULL,NULL,'master','4b68cd01-a69a-4565-99d0-587edd23a647',0,20,_binary '','a5911b7b-4986-4596-9eb5-3c6fdd4b21f6',NULL),('195c07f7-39c2-45bb-88ba-9b01d08321a3',NULL,'idp-confirm-link','master','4b68cd01-a69a-4565-99d0-587edd23a647',0,10,_binary '\0',NULL,NULL),('2167e722-f75f-4dfe-8b5b-91403a9756e9',NULL,'reset-password','master','378b0284-bee9-4908-9fac-f72886a2fcc4',0,30,_binary '\0',NULL,NULL),('24c7b6d7-064d-4c2e-a547-066e4774aaad',NULL,'client-jwt','todo-list','7026f563-4879-4df9-9cac-3ba3756cf16b',2,20,_binary '\0',NULL,NULL),('26b213ec-6884-4424-bb64-805812756525',NULL,'conditional-user-configured','todo-list','e61e1172-2202-4f66-86b5-d2403e68e744',0,10,_binary '\0',NULL,NULL),('29f8e30f-15d2-49f2-975b-f7ae49174d6f',NULL,NULL,'master','a5911b7b-4986-4596-9eb5-3c6fdd4b21f6',2,20,_binary '','3e46bf8e-a73d-4555-9f8a-71afe1f5091b',NULL),('2c77f1e6-f333-4b11-9cee-9d9939259658',NULL,'idp-create-user-if-unique','master','3bd3cda5-989b-4a70-8dfb-79b19c5289e4',2,10,_binary '\0',NULL,'c5c97691-1632-4809-8792-e9b9b2393db5'),('2e2a6e2f-8795-4a3d-9541-5441b4e372b3',NULL,'reset-credentials-choose-user','todo-list','5592c95e-e328-4127-9b8e-dad9bd217014',0,10,_binary '\0',NULL,NULL),('2f48f1dd-8321-420d-9cc8-bcef34aa5de0',NULL,'conditional-user-configured','todo-list','9d532944-388a-41f4-bb08-5db6adfc71be',0,10,_binary '\0',NULL,NULL),('30bc6019-7b4f-42cf-818f-29be842981f8',NULL,'registration-profile-action','todo-list','fcedb764-9078-496d-b0ac-c8ea0b1ceef1',0,40,_binary '\0',NULL,NULL),('40ca584d-a334-4a5d-a2a9-d51dd5edadf4',NULL,'docker-http-basic-authenticator','todo-list','9c6bc03b-b268-4678-ac55-6a9ad0346f8e',0,10,_binary '\0',NULL,NULL),('432f4761-019a-4227-95bd-07ebdb317ad4',NULL,'docker-http-basic-authenticator','master','fcf30cd8-c047-47a7-9345-304ddc3eb228',0,10,_binary '\0',NULL,NULL),('4a7cc25f-84d6-41cd-9810-bb97808578e0',NULL,'direct-grant-validate-otp','todo-list','9d532944-388a-41f4-bb08-5db6adfc71be',0,20,_binary '\0',NULL,NULL),('4ba6e1e8-53d5-4899-9889-0f35412fcada',NULL,'no-cookie-redirect','todo-list','f0fdf502-55db-4ea9-8926-751dd8ba76b9',0,10,_binary '\0',NULL,NULL),('4ca7059f-1bc9-4058-ad42-cd2c4c9a2581',NULL,NULL,'master','3bd3cda5-989b-4a70-8dfb-79b19c5289e4',2,20,_binary '','4b68cd01-a69a-4565-99d0-587edd23a647',NULL),('4dbc612e-ea69-415c-a9cf-fe833f108ef8',NULL,'idp-create-user-if-unique','todo-list','07c45026-79d6-4f69-8a54-2bbb852389cc',2,10,_binary '\0',NULL,'d98d61f0-b854-4b63-ac61-78143eba2ad6'),('4ea74eb6-dd8b-4993-9726-1875809fb79a',NULL,NULL,'master','45997a21-17fb-4ee8-afa1-05035da64dbe',1,30,_binary '','2b23240f-14a7-4533-b712-0b48319ae503',NULL),('52cc6d9f-3eaa-481f-adb9-56764b9ff335',NULL,'idp-username-password-form','master','3e46bf8e-a73d-4555-9f8a-71afe1f5091b',0,10,_binary '\0',NULL,NULL),('53523589-c053-4177-9787-018a3490e409',NULL,NULL,'master','82ef6e25-2dda-42b2-8418-8acbfab432f0',0,20,_binary '','3bd3cda5-989b-4a70-8dfb-79b19c5289e4',NULL),('55651bd0-3569-4373-bfbd-80716847e7a1',NULL,'idp-email-verification','todo-list','824b4045-accc-4034-a7fe-510a5f658bf6',2,10,_binary '\0',NULL,NULL),('575f5194-ac2a-4a10-9c77-345a5181da73',NULL,'client-secret-jwt','master','6b8f0d28-6eec-46b7-9db5-f26f5089fcc5',2,30,_binary '\0',NULL,NULL),('578703bf-287a-4f27-ae35-f7900e1d269b',NULL,'auth-otp-form','todo-list','869f9b52-5741-46a5-9c73-b6500570c6a9',0,20,_binary '\0',NULL,NULL),('58970cb3-2b9d-4c81-8db8-5c6ad194b305',NULL,'auth-spnego','todo-list','9c6ec982-b1eb-438b-a0b3-34f272d05a52',3,30,_binary '\0',NULL,NULL),('5af7d72a-4b2b-4777-aa88-785b1f46597d',NULL,'conditional-user-configured','master','8a6020db-bca3-49ee-83ea-d49169f8b1bd',0,10,_binary '\0',NULL,NULL),('5e553baa-b741-4772-bf1a-42d775aa273f',NULL,'identity-provider-redirector','master','df32d7d7-de1c-4b0c-b5c5-fc60b5f76633',2,25,_binary '\0',NULL,NULL),('61e5cef4-62e1-4ff3-96a8-1b75e96a0155',NULL,'auth-otp-form','todo-list','e61e1172-2202-4f66-86b5-d2403e68e744',0,20,_binary '\0',NULL,NULL),('634d1559-4fd0-4c27-8d78-742e0ad3337a',NULL,'conditional-user-configured','todo-list','869f9b52-5741-46a5-9c73-b6500570c6a9',0,10,_binary '\0',NULL,NULL),('6c51f37b-ba5e-4dbf-85aa-e4aa54d5afc1',NULL,'client-x509','todo-list','7026f563-4879-4df9-9cac-3ba3756cf16b',2,40,_binary '\0',NULL,NULL),('6f428040-e961-435f-a77c-c4d7e165fc5a',NULL,NULL,'todo-list','e441eb48-06de-4ee1-9190-c4e5271bcb6f',0,20,_binary '','824b4045-accc-4034-a7fe-510a5f658bf6',NULL),('7144a019-6b05-4441-8adb-cb938a576170',NULL,'conditional-user-configured','master','f908d82a-c93e-4ee1-beab-703c2ae54841',0,10,_binary '\0',NULL,NULL),('729109d6-f103-4b38-9f6d-4db6080e0e33',NULL,NULL,'todo-list','902603d1-b17c-4e24-ab8e-eb5d5d93c840',2,30,_binary '','f9782d65-4def-493b-8f0e-6727c0c07eae',NULL),('7379f566-51a8-47b6-98fd-46efe458a394',NULL,'direct-grant-validate-username','master','45997a21-17fb-4ee8-afa1-05035da64dbe',0,10,_binary '\0',NULL,NULL),('7c2e5292-8559-46a1-9587-27ac559ee8f9',NULL,'reset-password','todo-list','5592c95e-e328-4127-9b8e-dad9bd217014',0,30,_binary '\0',NULL,NULL),('7d372797-318f-4066-9ea4-a01d464b957a',NULL,'auth-spnego','master','df32d7d7-de1c-4b0c-b5c5-fc60b5f76633',3,20,_binary '\0',NULL,NULL),('7ff9908e-1581-4e55-906f-d03357e692c7',NULL,'registration-page-form','master','22bafa50-7d96-4102-b718-6a942719f902',0,10,_binary '','105fde3a-d884-46e6-9915-6b91a384815d',NULL),('88a16fd7-2128-4f39-bcc8-72106638d2ce',NULL,'reset-otp','master','a56e0953-51bf-4b75-aab1-90b7258d3d48',0,20,_binary '\0',NULL,NULL),('898a75ab-dd21-4366-a6c5-7a092967be3b',NULL,'client-jwt','master','6b8f0d28-6eec-46b7-9db5-f26f5089fcc5',2,20,_binary '\0',NULL,NULL),('8b1d9ef0-1314-4235-9e69-69a702064907',NULL,'client-secret-jwt','todo-list','7026f563-4879-4df9-9cac-3ba3756cf16b',2,30,_binary '\0',NULL,NULL),('8d28205e-1f91-4148-aa22-1ba7975104e8',NULL,'basic-auth-otp','master','b100df04-1ab5-4496-a340-a6dc6ca807b9',3,20,_binary '\0',NULL,NULL),('8d6c715a-b2f2-4e18-834c-fed584ce6e57',NULL,'http-basic-authenticator','master','ef893a77-423e-404c-9a1c-5ef334fb8cf7',0,10,_binary '\0',NULL,NULL),('8ee0e543-c347-4c89-bed4-bfa98babd8e8',NULL,'basic-auth','master','b100df04-1ab5-4496-a340-a6dc6ca807b9',0,10,_binary '\0',NULL,NULL),('8f37aefd-15fd-468f-bac6-f261542747b5',NULL,NULL,'todo-list','5592c95e-e328-4127-9b8e-dad9bd217014',1,40,_binary '','67b8b620-de0f-4a36-aa81-ac4e2fb235f8',NULL),('95d2685c-4e8d-4415-b79d-412f5af6663f',NULL,'conditional-user-configured','todo-list','67b8b620-de0f-4a36-aa81-ac4e2fb235f8',0,10,_binary '\0',NULL,NULL),('9689e7c2-eebd-47c0-ba35-50b395cd7c57',NULL,'auth-username-password-form','master','6ceead02-94a2-441e-981f-ed53f09b27ee',0,10,_binary '\0',NULL,NULL),('9a0ec0a8-a727-43c9-9385-1eb458c4a144',NULL,'idp-email-verification','master','a5911b7b-4986-4596-9eb5-3c6fdd4b21f6',2,10,_binary '\0',NULL,NULL),('9cb602ab-6475-47c3-92c0-e019e6917f3c',NULL,'reset-credential-email','master','378b0284-bee9-4908-9fac-f72886a2fcc4',0,20,_binary '\0',NULL,NULL),('9f69ab69-6167-4340-ae22-512ae919b0a2',NULL,'auth-cookie','todo-list','902603d1-b17c-4e24-ab8e-eb5d5d93c840',2,10,_binary '\0',NULL,NULL),('a1def1fe-5a47-4b5f-9c77-074030fae1f2',NULL,'auth-cookie','master','df32d7d7-de1c-4b0c-b5c5-fc60b5f76633',2,10,_binary '\0',NULL,NULL),('a3355a83-4268-47a4-9b00-e779138db4f3',NULL,NULL,'todo-list','07c45026-79d6-4f69-8a54-2bbb852389cc',2,20,_binary '','e441eb48-06de-4ee1-9190-c4e5271bcb6f',NULL),('a507fa12-f007-4e4e-aa4f-f27fb1f66bd2',NULL,NULL,'master','6ceead02-94a2-441e-981f-ed53f09b27ee',1,20,_binary '','f908d82a-c93e-4ee1-beab-703c2ae54841',NULL),('a61c69a0-e59a-4365-bc5f-ccfb1ab5e4a7',NULL,NULL,'todo-list','3cf318fc-349e-43e6-97e9-0563afa28e67',1,20,_binary '','e61e1172-2202-4f66-86b5-d2403e68e744',NULL),('a62e4ae5-2325-45cd-8a47-8b191397fcf9',NULL,NULL,'todo-list','f9782d65-4def-493b-8f0e-6727c0c07eae',1,20,_binary '','869f9b52-5741-46a5-9c73-b6500570c6a9',NULL),('b46788d3-8913-4723-b84b-aecd2e4b710d',NULL,'auth-spnego','master','b100df04-1ab5-4496-a340-a6dc6ca807b9',3,30,_binary '\0',NULL,NULL),('b572af16-3288-46dc-818b-aea9a2951a36',NULL,'client-secret','master','6b8f0d28-6eec-46b7-9db5-f26f5089fcc5',2,10,_binary '\0',NULL,NULL),('b5870be5-b5ee-4f2e-96d6-0bd0bcff30af',NULL,'basic-auth-otp','todo-list','9c6ec982-b1eb-438b-a0b3-34f272d05a52',3,20,_binary '\0',NULL,NULL),('b97a5afd-7d2f-4394-afe3-b63627dbc5a1',NULL,'reset-credential-email','todo-list','5592c95e-e328-4127-9b8e-dad9bd217014',0,20,_binary '\0',NULL,NULL),('bad83b06-258a-4ecb-9444-d63b561f352a',NULL,'registration-recaptcha-action','todo-list','fcedb764-9078-496d-b0ac-c8ea0b1ceef1',3,60,_binary '\0',NULL,NULL),('bdb05c4c-144a-4bb1-8358-82e4cd056f11',NULL,'auth-otp-form','master','f908d82a-c93e-4ee1-beab-703c2ae54841',0,20,_binary '\0',NULL,NULL),('bdf6235d-4146-4ff7-8172-325f09a8c562',NULL,'basic-auth','todo-list','9c6ec982-b1eb-438b-a0b3-34f272d05a52',0,10,_binary '\0',NULL,NULL),('bf6c70eb-39d4-41f7-a5b1-355040d66b8b',NULL,'direct-grant-validate-password','todo-list','55ef27fa-0988-4ebd-bc88-efb7aa6b8343',0,20,_binary '\0',NULL,NULL),('bfaf4610-5271-4f73-9985-49e556a80814',NULL,'direct-grant-validate-username','todo-list','55ef27fa-0988-4ebd-bc88-efb7aa6b8343',0,10,_binary '\0',NULL,NULL),('c6083c5e-4305-481d-875f-6151a27a9dbe',NULL,NULL,'todo-list','f0fdf502-55db-4ea9-8926-751dd8ba76b9',0,20,_binary '','9c6ec982-b1eb-438b-a0b3-34f272d05a52',NULL),('d22b983e-0a76-4bbc-9414-226f6728552b',NULL,'idp-review-profile','master','82ef6e25-2dda-42b2-8418-8acbfab432f0',0,10,_binary '\0',NULL,'b1fe973c-0d06-47cc-b747-24eb1fec827e'),('d24a7487-81ac-4b87-8c07-b4db682077f7',NULL,'conditional-user-configured','master','a56e0953-51bf-4b75-aab1-90b7258d3d48',0,10,_binary '\0',NULL,NULL),('d296ea31-be6a-4757-8819-c61ecb925b94',NULL,'idp-confirm-link','todo-list','e441eb48-06de-4ee1-9190-c4e5271bcb6f',0,10,_binary '\0',NULL,NULL),('d36a816e-4672-4614-9c46-285ea1c1959b',NULL,'http-basic-authenticator','todo-list','2f149c2c-3576-4bd7-b64b-a15e8e3949a7',0,10,_binary '\0',NULL,NULL),('d3ef45ed-4f46-44ad-b1cc-f36a453c06a8',NULL,'registration-profile-action','master','105fde3a-d884-46e6-9915-6b91a384815d',0,40,_binary '\0',NULL,NULL),('d66e5308-286b-4efb-99d5-fd8381a32387',NULL,'direct-grant-validate-password','master','45997a21-17fb-4ee8-afa1-05035da64dbe',0,20,_binary '\0',NULL,NULL),('d898fd03-7a66-43e6-9925-bc3250400e5d',NULL,'idp-username-password-form','todo-list','3cf318fc-349e-43e6-97e9-0563afa28e67',0,10,_binary '\0',NULL,NULL),('dc9f8cd2-b83e-497b-883b-9c0c7e3f8007',NULL,'reset-otp','todo-list','67b8b620-de0f-4a36-aa81-ac4e2fb235f8',0,20,_binary '\0',NULL,NULL),('dcbc18da-c22a-4f67-93b2-5b89846d6490',NULL,NULL,'master','db4d5710-fbca-49f0-b7d1-9f84de54e546',0,20,_binary '','b100df04-1ab5-4496-a340-a6dc6ca807b9',NULL),('df6f5db8-3b00-4943-ab3d-c7de03a46458',NULL,NULL,'todo-list','55ef27fa-0988-4ebd-bc88-efb7aa6b8343',1,30,_binary '','9d532944-388a-41f4-bb08-5db6adfc71be',NULL),('e083bb36-5093-42e0-9add-6dc166496394',NULL,'no-cookie-redirect','master','db4d5710-fbca-49f0-b7d1-9f84de54e546',0,10,_binary '\0',NULL,NULL),('e0f082ee-1e8b-4809-9431-cb46026d2e2b',NULL,'auth-username-password-form','todo-list','f9782d65-4def-493b-8f0e-6727c0c07eae',0,10,_binary '\0',NULL,NULL),('e2807709-0c6a-4c3c-8ba9-4ed93f625158',NULL,'client-secret','todo-list','7026f563-4879-4df9-9cac-3ba3756cf16b',2,10,_binary '\0',NULL,NULL),('e2d8f893-8b7f-47fb-adc0-fa83a271a7b3',NULL,'reset-credentials-choose-user','master','378b0284-bee9-4908-9fac-f72886a2fcc4',0,10,_binary '\0',NULL,NULL),('e5f17a83-a4e4-4c5c-ad09-b835b24c9891',NULL,'registration-password-action','todo-list','fcedb764-9078-496d-b0ac-c8ea0b1ceef1',0,50,_binary '\0',NULL,NULL),('e6018b2c-3e2d-49d7-9488-18e7c9c309a9',NULL,'identity-provider-redirector','todo-list','902603d1-b17c-4e24-ab8e-eb5d5d93c840',2,25,_binary '\0',NULL,NULL),('e858d43c-189d-461c-8888-387e54f72e0a',NULL,'registration-user-creation','master','105fde3a-d884-46e6-9915-6b91a384815d',0,20,_binary '\0',NULL,NULL),('e9fd5c1e-5022-4554-97ad-03c0e3c58880',NULL,'registration-recaptcha-action','master','105fde3a-d884-46e6-9915-6b91a384815d',3,60,_binary '\0',NULL,NULL),('eac932e8-2550-47c3-ba1b-baf53839698d',NULL,'auth-spnego','todo-list','902603d1-b17c-4e24-ab8e-eb5d5d93c840',3,20,_binary '\0',NULL,NULL),('ed25c3a7-73dc-49fb-848a-c1cccabdcc69',NULL,NULL,'master','378b0284-bee9-4908-9fac-f72886a2fcc4',1,40,_binary '','a56e0953-51bf-4b75-aab1-90b7258d3d48',NULL),('efd7eceb-b98f-4c4e-8160-cbb34d74db0f',NULL,NULL,'todo-list','824b4045-accc-4034-a7fe-510a5f658bf6',2,20,_binary '','3cf318fc-349e-43e6-97e9-0563afa28e67',NULL),('f6c8c1a9-8b18-459b-a7f5-bfb3e52b555c',NULL,'conditional-user-configured','master','2b23240f-14a7-4533-b712-0b48319ae503',0,10,_binary '\0',NULL,NULL),('fc37dd7d-c62f-4812-83fc-8a391f79954d',NULL,'auth-otp-form','master','8a6020db-bca3-49ee-83ea-d49169f8b1bd',0,20,_binary '\0',NULL,NULL),('fe2e4dab-7c3a-4d0d-ba81-f09e99c3ad34',NULL,NULL,'master','3e46bf8e-a73d-4555-9f8a-71afe1f5091b',1,20,_binary '','8a6020db-bca3-49ee-83ea-d49169f8b1bd',NULL),('fe751761-6b22-49a9-9d40-d5869b8235fc',NULL,NULL,'todo-list','d6879acd-1c6c-41fc-b806-52eaa2d5ed99',0,20,_binary '','07c45026-79d6-4f69-8a54-2bbb852389cc',NULL),('fff604e6-792e-4a53-aa18-6eb08f8aede5',NULL,'idp-review-profile','todo-list','d6879acd-1c6c-41fc-b806-52eaa2d5ed99',0,10,_binary '\0',NULL,'68d0dd09-1f47-4891-81df-f4e0cc8e5347');
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('07c45026-79d6-4f69-8a54-2bbb852389cc','User creation or linking','Flow for the existing/non-existing user alternatives','todo-list','basic-flow',_binary '\0',_binary ''),('105fde3a-d884-46e6-9915-6b91a384815d','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('22bafa50-7d96-4102-b718-6a942719f902','registration','registration flow','master','basic-flow',_binary '',_binary ''),('2b23240f-14a7-4533-b712-0b48319ae503','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('2f149c2c-3576-4bd7-b64b-a15e8e3949a7','saml ecp','SAML ECP Profile Authentication Flow','todo-list','basic-flow',_binary '',_binary ''),('378b0284-bee9-4908-9fac-f72886a2fcc4','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('3bd3cda5-989b-4a70-8dfb-79b19c5289e4','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('3cf318fc-349e-43e6-97e9-0563afa28e67','Verify Existing Account by Re-authentication','Reauthentication of existing account','todo-list','basic-flow',_binary '\0',_binary ''),('3e46bf8e-a73d-4555-9f8a-71afe1f5091b','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('45997a21-17fb-4ee8-afa1-05035da64dbe','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('4b68cd01-a69a-4565-99d0-587edd23a647','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('5592c95e-e328-4127-9b8e-dad9bd217014','reset credentials','Reset credentials for a user if they forgot their password or something','todo-list','basic-flow',_binary '',_binary ''),('55ef27fa-0988-4ebd-bc88-efb7aa6b8343','direct grant','OpenID Connect Resource Owner Grant','todo-list','basic-flow',_binary '',_binary ''),('67b8b620-de0f-4a36-aa81-ac4e2fb235f8','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','todo-list','basic-flow',_binary '\0',_binary ''),('6b8f0d28-6eec-46b7-9db5-f26f5089fcc5','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('6ceead02-94a2-441e-981f-ed53f09b27ee','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('7026f563-4879-4df9-9cac-3ba3756cf16b','clients','Base authentication for clients','todo-list','client-flow',_binary '',_binary ''),('824b4045-accc-4034-a7fe-510a5f658bf6','Account verification options','Method with which to verity the existing account','todo-list','basic-flow',_binary '\0',_binary ''),('82ef6e25-2dda-42b2-8418-8acbfab432f0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('869f9b52-5741-46a5-9c73-b6500570c6a9','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','todo-list','basic-flow',_binary '\0',_binary ''),('8a6020db-bca3-49ee-83ea-d49169f8b1bd','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('902603d1-b17c-4e24-ab8e-eb5d5d93c840','browser','browser based authentication','todo-list','basic-flow',_binary '',_binary ''),('98a9bb5b-68e2-4600-af2f-cfb7bf43a4dc','registration','registration flow','todo-list','basic-flow',_binary '',_binary ''),('9c6bc03b-b268-4678-ac55-6a9ad0346f8e','docker auth','Used by Docker clients to authenticate against the IDP','todo-list','basic-flow',_binary '',_binary ''),('9c6ec982-b1eb-438b-a0b3-34f272d05a52','Authentication Options','Authentication options.','todo-list','basic-flow',_binary '\0',_binary ''),('9d532944-388a-41f4-bb08-5db6adfc71be','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','todo-list','basic-flow',_binary '\0',_binary ''),('a56e0953-51bf-4b75-aab1-90b7258d3d48','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('a5911b7b-4986-4596-9eb5-3c6fdd4b21f6','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('b100df04-1ab5-4496-a340-a6dc6ca807b9','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('d6879acd-1c6c-41fc-b806-52eaa2d5ed99','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','todo-list','basic-flow',_binary '',_binary ''),('db4d5710-fbca-49f0-b7d1-9f84de54e546','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('df32d7d7-de1c-4b0c-b5c5-fc60b5f76633','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('e441eb48-06de-4ee1-9190-c4e5271bcb6f','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','todo-list','basic-flow',_binary '\0',_binary ''),('e61e1172-2202-4f66-86b5-d2403e68e744','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','todo-list','basic-flow',_binary '\0',_binary ''),('ef893a77-423e-404c-9a1c-5ef334fb8cf7','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('f0fdf502-55db-4ea9-8926-751dd8ba76b9','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','todo-list','basic-flow',_binary '',_binary ''),('f908d82a-c93e-4ee1-beab-703c2ae54841','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('f9782d65-4def-493b-8f0e-6727c0c07eae','forms','Username, password, otp and other auth forms.','todo-list','basic-flow',_binary '\0',_binary ''),('fcedb764-9078-496d-b0ac-c8ea0b1ceef1','registration form','registration form','todo-list','form-flow',_binary '\0',_binary ''),('fcf30cd8-c047-47a7-9345-304ddc3eb228','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary '');
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
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('68d0dd09-1f47-4891-81df-f4e0cc8e5347','review profile config','todo-list'),('b1fe973c-0d06-47cc-b747-24eb1fec827e','review profile config','master'),('c5c97691-1632-4809-8792-e9b9b2393db5','create unique user config','master'),('d98d61f0-b854-4b63-ac61-78143eba2ad6','create unique user config','todo-list');
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
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('68d0dd09-1f47-4891-81df-f4e0cc8e5347','missing','update.profile.on.first.login'),('b1fe973c-0d06-47cc-b747-24eb1fec827e','missing','update.profile.on.first.login'),('c5c97691-1632-4809-8792-e9b9b2393db5','false','require.password.update.after.registration'),('d98d61f0-b854-4b63-ac61-78143eba2ad6','false','require.password.update.after.registration');
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
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('10518c10-7dcb-44a5-a221-c11aa69e032b',_binary '',_binary '\0','security-admin-console',0,_binary '','4e425a00-f4fd-43ab-b79b-ab12c4cc6604','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '',_binary '','master-realm',0,_binary '\0','743b04e0-eca4-4089-b05b-03b07f76fabc',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('37ba1f70-153a-442d-994b-b3509046741d',_binary '',_binary '','application',0,_binary '\0','b047cc08-f324-4bd4-a7fa-31d8ddbc08e6','',_binary '\0',NULL,_binary '\0','todo-list','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '',_binary '\0','account',0,_binary '\0','edd42532-9b7c-4d75-9904-ce62521ef606','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089',_binary '',_binary '\0','account-console',0,_binary '','249e859a-e2f3-4830-aa4f-327c4ecfa694','/realms/todo-list/account/',_binary '\0',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('656ecf17-d896-4f52-a8bc-a06f0c43eb55',_binary '',_binary '\0','broker',0,_binary '\0','279cdd2b-a958-40b0-b12a-cfc1aa5ee714',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '',_binary '\0','account',0,_binary '\0','aec9dcf1-9817-42f4-a7a5-f9ecac6dfe9a','/realms/todo-list/account/',_binary '\0',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('78e06407-f9d5-4969-bfac-b30de79b681c',_binary '',_binary '\0','security-admin-console',0,_binary '','ac9fd5be-df66-4b98-8012-134c9de2f074','/admin/todo-list/console/',_binary '\0',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7',_binary '',_binary '\0','admin-cli',0,_binary '','51d75767-ed8b-4f92-8057-98d57348b1ec',NULL,_binary '\0',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4',_binary '',_binary '\0','broker',0,_binary '\0','76e7a798-ecd2-4518-ba96-5d0694a56c4c',NULL,_binary '\0',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('97308d31-70e2-4083-97ab-a89da2970c6d',_binary '',_binary '\0','admin-cli',0,_binary '','f40b0b3a-13d7-454a-8c97-84eed313f194',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd',_binary '',_binary '\0','account-console',0,_binary '','eb6b669d-a676-4852-aa82-80c840978b70','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('dae90119-5476-4420-acd1-1ec21e634213',_binary '',_binary '\0','realm-management',0,_binary '\0','1fd9eb85-8f65-4579-a277-a83768c11dd3',NULL,_binary '',NULL,_binary '\0','todo-list','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '',_binary '','todo-list-realm',0,_binary '\0','cba849dc-9a1b-4146-97d7-88552f481690',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','todo-list Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
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
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('10518c10-7dcb-44a5-a221-c11aa69e032b','S256','pkce.code.challenge.method'),('37ba1f70-153a-442d-994b-b3509046741d','false','display.on.consent.screen'),('37ba1f70-153a-442d-994b-b3509046741d','false','exclude.session.state.from.auth.response'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml_force_name_id_format'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.assertion.signature'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.authnstatement'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.client.signature'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.encrypt'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.force.post.binding'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.multivalued.roles'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.onetimeuse.condition'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.server.signature'),('37ba1f70-153a-442d-994b-b3509046741d','false','saml.server.signature.keyinfo.ext'),('37ba1f70-153a-442d-994b-b3509046741d','false','tls.client.certificate.bound.access.tokens'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','S256','pkce.code.challenge.method'),('78e06407-f9d5-4969-bfac-b30de79b681c','S256','pkce.code.challenge.method'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','S256','pkce.code.challenge.method');
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
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('43dd5258-f161-4f7d-b012-3a446a9db4d2','cefab88b-8d25-4bc6-9271-7d8cdbca182a'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','d070a657-79fc-4805-9e70-ca505795859e'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','e4fe75fc-da67-4225-816a-20515cd2f08e'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0b3320d7-35e9-4986-9e92-88a982560b69','roles','todo-list','OpenID Connect scope for add user roles to the access token','openid-connect'),('1aad61fc-9dd9-415d-8bb0-818bf8c35005','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('2a59091f-051a-41a9-8117-9cba7aa71e2a','offline_access','todo-list','OpenID Connect built-in scope: offline_access','openid-connect'),('33ea4ada-1205-49e6-8ec2-c7db49ede35a','email','todo-list','OpenID Connect built-in scope: email','openid-connect'),('3d2fc377-27dd-4896-bc9c-c272d2192380','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('3f8fedac-f2fb-40e3-abc0-de3731e42330','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('430f8e09-5d22-4ca6-9ac3-5863489037fd','address','todo-list','OpenID Connect built-in scope: address','openid-connect'),('4b11c96f-5205-4e85-8fcf-115db34b2403','microprofile-jwt','todo-list','Microprofile - JWT built-in scope','openid-connect'),('5838f4e6-9edf-400d-821e-90f6445eb625','role_list','master','SAML role list','saml'),('7383e098-32ee-4a3f-b0bc-d035e25bea5e','role_list','todo-list','SAML role list','saml'),('76a6c55a-27ef-441c-ba3b-5afc453c3c97','phone','todo-list','OpenID Connect built-in scope: phone','openid-connect'),('786fa720-3c49-4fed-9a05-df52e683e61a','email','master','OpenID Connect built-in scope: email','openid-connect'),('7c1a5e71-a486-4f4c-bda3-be632a565f8b','web-origins','todo-list','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('9bec7284-b799-4efb-bb0b-9dcbcb5d16a5','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('c2a55da6-7f86-46fe-bb68-6685746a2720','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('c88fd250-2a51-4608-8baa-cb9d73fd26e7','address','master','OpenID Connect built-in scope: address','openid-connect'),('ce2eaf0b-de6c-49bc-949a-075439957412','profile','todo-list','OpenID Connect built-in scope: profile','openid-connect'),('fffb323e-60f8-40d6-aa5c-53079afa41a4','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect');
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
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b3320d7-35e9-4986-9e92-88a982560b69','${rolesScopeConsentText}','consent.screen.text'),('0b3320d7-35e9-4986-9e92-88a982560b69','true','display.on.consent.screen'),('0b3320d7-35e9-4986-9e92-88a982560b69','false','include.in.token.scope'),('1aad61fc-9dd9-415d-8bb0-818bf8c35005','','consent.screen.text'),('1aad61fc-9dd9-415d-8bb0-818bf8c35005','false','display.on.consent.screen'),('1aad61fc-9dd9-415d-8bb0-818bf8c35005','false','include.in.token.scope'),('2a59091f-051a-41a9-8117-9cba7aa71e2a','${offlineAccessScopeConsentText}','consent.screen.text'),('2a59091f-051a-41a9-8117-9cba7aa71e2a','true','display.on.consent.screen'),('33ea4ada-1205-49e6-8ec2-c7db49ede35a','${emailScopeConsentText}','consent.screen.text'),('33ea4ada-1205-49e6-8ec2-c7db49ede35a','true','display.on.consent.screen'),('33ea4ada-1205-49e6-8ec2-c7db49ede35a','true','include.in.token.scope'),('3d2fc377-27dd-4896-bc9c-c272d2192380','${profileScopeConsentText}','consent.screen.text'),('3d2fc377-27dd-4896-bc9c-c272d2192380','true','display.on.consent.screen'),('3d2fc377-27dd-4896-bc9c-c272d2192380','true','include.in.token.scope'),('3f8fedac-f2fb-40e3-abc0-de3731e42330','${phoneScopeConsentText}','consent.screen.text'),('3f8fedac-f2fb-40e3-abc0-de3731e42330','true','display.on.consent.screen'),('3f8fedac-f2fb-40e3-abc0-de3731e42330','true','include.in.token.scope'),('430f8e09-5d22-4ca6-9ac3-5863489037fd','${addressScopeConsentText}','consent.screen.text'),('430f8e09-5d22-4ca6-9ac3-5863489037fd','true','display.on.consent.screen'),('430f8e09-5d22-4ca6-9ac3-5863489037fd','true','include.in.token.scope'),('4b11c96f-5205-4e85-8fcf-115db34b2403','false','display.on.consent.screen'),('4b11c96f-5205-4e85-8fcf-115db34b2403','true','include.in.token.scope'),('5838f4e6-9edf-400d-821e-90f6445eb625','${samlRoleListScopeConsentText}','consent.screen.text'),('5838f4e6-9edf-400d-821e-90f6445eb625','true','display.on.consent.screen'),('7383e098-32ee-4a3f-b0bc-d035e25bea5e','${samlRoleListScopeConsentText}','consent.screen.text'),('7383e098-32ee-4a3f-b0bc-d035e25bea5e','true','display.on.consent.screen'),('76a6c55a-27ef-441c-ba3b-5afc453c3c97','${phoneScopeConsentText}','consent.screen.text'),('76a6c55a-27ef-441c-ba3b-5afc453c3c97','true','display.on.consent.screen'),('76a6c55a-27ef-441c-ba3b-5afc453c3c97','true','include.in.token.scope'),('786fa720-3c49-4fed-9a05-df52e683e61a','${emailScopeConsentText}','consent.screen.text'),('786fa720-3c49-4fed-9a05-df52e683e61a','true','display.on.consent.screen'),('786fa720-3c49-4fed-9a05-df52e683e61a','true','include.in.token.scope'),('7c1a5e71-a486-4f4c-bda3-be632a565f8b','','consent.screen.text'),('7c1a5e71-a486-4f4c-bda3-be632a565f8b','false','display.on.consent.screen'),('7c1a5e71-a486-4f4c-bda3-be632a565f8b','false','include.in.token.scope'),('9bec7284-b799-4efb-bb0b-9dcbcb5d16a5','false','display.on.consent.screen'),('9bec7284-b799-4efb-bb0b-9dcbcb5d16a5','true','include.in.token.scope'),('c2a55da6-7f86-46fe-bb68-6685746a2720','${offlineAccessScopeConsentText}','consent.screen.text'),('c2a55da6-7f86-46fe-bb68-6685746a2720','true','display.on.consent.screen'),('c88fd250-2a51-4608-8baa-cb9d73fd26e7','${addressScopeConsentText}','consent.screen.text'),('c88fd250-2a51-4608-8baa-cb9d73fd26e7','true','display.on.consent.screen'),('c88fd250-2a51-4608-8baa-cb9d73fd26e7','true','include.in.token.scope'),('ce2eaf0b-de6c-49bc-949a-075439957412','${profileScopeConsentText}','consent.screen.text'),('ce2eaf0b-de6c-49bc-949a-075439957412','true','display.on.consent.screen'),('ce2eaf0b-de6c-49bc-949a-075439957412','true','include.in.token.scope'),('fffb323e-60f8-40d6-aa5c-53079afa41a4','${rolesScopeConsentText}','consent.screen.text'),('fffb323e-60f8-40d6-aa5c-53079afa41a4','true','display.on.consent.screen'),('fffb323e-60f8-40d6-aa5c-53079afa41a4','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('10518c10-7dcb-44a5-a221-c11aa69e032b','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('10518c10-7dcb-44a5-a221-c11aa69e032b','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('10518c10-7dcb-44a5-a221-c11aa69e032b','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('10518c10-7dcb-44a5-a221-c11aa69e032b','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('10518c10-7dcb-44a5-a221-c11aa69e032b','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('10518c10-7dcb-44a5-a221-c11aa69e032b','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('10518c10-7dcb-44a5-a221-c11aa69e032b','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('10518c10-7dcb-44a5-a221-c11aa69e032b','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('10518c10-7dcb-44a5-a221-c11aa69e032b','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('2eb2798b-c29b-4a5a-8997-b0d1f911622f','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('37ba1f70-153a-442d-994b-b3509046741d','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('37ba1f70-153a-442d-994b-b3509046741d','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('37ba1f70-153a-442d-994b-b3509046741d','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('37ba1f70-153a-442d-994b-b3509046741d','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('37ba1f70-153a-442d-994b-b3509046741d','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('37ba1f70-153a-442d-994b-b3509046741d','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('37ba1f70-153a-442d-994b-b3509046741d','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('37ba1f70-153a-442d-994b-b3509046741d','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('37ba1f70-153a-442d-994b-b3509046741d','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('43dd5258-f161-4f7d-b012-3a446a9db4d2','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('43dd5258-f161-4f7d-b012-3a446a9db4d2','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('43dd5258-f161-4f7d-b012-3a446a9db4d2','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('43dd5258-f161-4f7d-b012-3a446a9db4d2','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('43dd5258-f161-4f7d-b012-3a446a9db4d2','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('656ecf17-d896-4f52-a8bc-a06f0c43eb55','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('78e06407-f9d5-4969-bfac-b30de79b681c','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('78e06407-f9d5-4969-bfac-b30de79b681c','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('78e06407-f9d5-4969-bfac-b30de79b681c','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('78e06407-f9d5-4969-bfac-b30de79b681c','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('78e06407-f9d5-4969-bfac-b30de79b681c','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('78e06407-f9d5-4969-bfac-b30de79b681c','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('78e06407-f9d5-4969-bfac-b30de79b681c','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('78e06407-f9d5-4969-bfac-b30de79b681c','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('78e06407-f9d5-4969-bfac-b30de79b681c','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('8edc62d8-306e-41ec-9d38-8bc6ed5de9b7','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('9391b5e5-9f5d-416a-ad4c-4e5370215cd4','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('97308d31-70e2-4083-97ab-a89da2970c6d','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('97308d31-70e2-4083-97ab-a89da2970c6d','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('97308d31-70e2-4083-97ab-a89da2970c6d','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('97308d31-70e2-4083-97ab-a89da2970c6d','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('97308d31-70e2-4083-97ab-a89da2970c6d','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('97308d31-70e2-4083-97ab-a89da2970c6d','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('97308d31-70e2-4083-97ab-a89da2970c6d','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('97308d31-70e2-4083-97ab-a89da2970c6d','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('97308d31-70e2-4083-97ab-a89da2970c6d','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('dae90119-5476-4420-acd1-1ec21e634213','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('dae90119-5476-4420-acd1-1ec21e634213','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('dae90119-5476-4420-acd1-1ec21e634213','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('dae90119-5476-4420-acd1-1ec21e634213','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('dae90119-5476-4420-acd1-1ec21e634213','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('dae90119-5476-4420-acd1-1ec21e634213','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('dae90119-5476-4420-acd1-1ec21e634213','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('dae90119-5476-4420-acd1-1ec21e634213','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('dae90119-5476-4420-acd1-1ec21e634213','ce2eaf0b-de6c-49bc-949a-075439957412',_binary ''),('deaa3810-aedf-4da8-94cd-f0daece7da25','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('deaa3810-aedf-4da8-94cd-f0daece7da25','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('deaa3810-aedf-4da8-94cd-f0daece7da25','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('deaa3810-aedf-4da8-94cd-f0daece7da25','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('deaa3810-aedf-4da8-94cd-f0daece7da25','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('deaa3810-aedf-4da8-94cd-f0daece7da25','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('deaa3810-aedf-4da8-94cd-f0daece7da25','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('deaa3810-aedf-4da8-94cd-f0daece7da25','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('deaa3810-aedf-4da8-94cd-f0daece7da25','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary '');
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
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('2a59091f-051a-41a9-8117-9cba7aa71e2a','96a5f75f-5bf3-49ca-8e3f-17ba7d8c00af'),('c2a55da6-7f86-46fe-bb68-6685746a2720','b30a0dd6-b756-4f9a-9687-71f7c68ecc1b');
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
INSERT INTO `COMPONENT` VALUES ('017c1cd6-1ace-4437-9451-0198174bbd1c','Allowed Protocol Mapper Types','todo-list','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('0bf62b30-b1c5-40cd-8cff-5efbbe37ca9b','Allowed Client Scopes','todo-list','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('1c389beb-094a-47c1-8cf9-c45409f48822','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('218e213b-0cb0-4bb4-bde4-5e2fb8f1955a','rsa-generated','todo-list','rsa-generated','org.keycloak.keys.KeyProvider','todo-list',NULL),('2c67c1c3-86c9-4703-a0bb-f1c853ca03a0','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2e21e0fb-6a0d-4830-a4e0-0d00e3d52a6a','Full Scope Disabled','todo-list','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('3e492687-16ac-478c-a82b-e3fda5e31abd','Allowed Client Scopes','todo-list','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','authenticated'),('43502dc7-3527-4935-a891-0207170bef69','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('52bcf66a-4987-4e27-814f-077ff87ab6b7','Trusted Hosts','todo-list','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('66e5bd12-fd7c-49d7-8a75-ce3dbf94d5d6','Consent Required','todo-list','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('679fb3ad-bf87-44cb-b355-c80a3acb2401','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6e9b3cd6-7839-4242-bb14-d4a01969d2ad','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('838ef10a-1b72-4df6-86c9-8213b8ce4547','hmac-generated','todo-list','hmac-generated','org.keycloak.keys.KeyProvider','todo-list',NULL),('9565fd7c-b1b1-448a-8f50-941189edc0b8','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('98c22440-bda6-4b24-9db6-e1b4f2c1122d','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('a7050e82-9f87-4659-b315-23b448445f11','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('aad89658-147a-4759-90db-1c5712245486','Max Clients Limit','todo-list','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','anonymous'),('c16ed153-24e8-46ad-a79a-43af8179adaa','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('cf418637-7566-412e-9a29-57af1266cd58','Allowed Protocol Mapper Types','todo-list','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','todo-list','authenticated'),('d136e6a5-6597-4990-bc30-9a1079f0574e','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fe838d3b-65df-4477-9f51-957e2ab3f423','aes-generated','todo-list','aes-generated','org.keycloak.keys.KeyProvider','todo-list',NULL);
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
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
INSERT INTO `COMPONENT_CONFIG` VALUES ('02bbda33-6ce4-4334-bac3-c2994eda604d','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','oidc-full-name-mapper'),('06fcb0b2-fbaa-4754-b4b0-3a282115be04','fe838d3b-65df-4477-9f51-957e2ab3f423','priority','100'),('08aa34ad-f633-495c-b638-98e32a2b5ff8','1c389beb-094a-47c1-8cf9-c45409f48822','priority','100'),('0f1b853c-01b2-4294-a42a-a58e7f9b8fa7','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('11887011-6a00-4375-bd19-d4f4abbf9f2f','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','oidc-address-mapper'),('11b1c27e-eb9a-447c-87c0-e3445581077a','aad89658-147a-4759-90db-1c5712245486','max-clients','200'),('129441cb-bdaa-4040-b69c-072352dd400e','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','oidc-address-mapper'),('13011557-e3a5-43eb-82a2-1cd9fc9e421d','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','saml-role-list-mapper'),('16442513-2f9c-4331-a0d7-0a587510267d','218e213b-0cb0-4bb4-bde4-5e2fb8f1955a','privateKey','MIIEowIBAAKCAQEAhUROhPm9CVggdSHOEz41BhdgMxG2Z7YAPFV5m/E3Gi0PRWjs8DYa2nxUORYJObk/AJ9WM1AsEszJI6xyzNboNLfTM9tHUJntq7ruCYGrll97+O61HlfuM6sS5zdkgVVrmBwzc2U0uMJZO9IIrr9WxKA2yvoV287qRZKWqJBq5JSvvrnCszo3W4+UkWMQBe7T3F++V//SoXM9iRgJWp0CP7/rHqu/kKymSa+AzZquc7VQ2a5iJnR5OBz8XAx4ZRY+9ABroF6jerB18Bf6aICYMl7lX2sVVDg8enQwHitJhoqYMYTwQhYbhO93Ib1wxnUGiJCaPK88c/KK7ge/puvPIwIDAQABAoIBAApWCO0BXasK3cGX9J7DdWNajsiHOCmFETGcw4jXxZlPI18Ty0S6PYzylamzztVeS8ellA74yeJPZc5RgrnmdS4Zj9T2zeovdiKapfmwx/kqwLfG8989nKj/PMEYJ8BsOqMalNb/Y35s/HTKTogXKQipEHbfvLBGtR7eRrceNFw0G2DOWAxEHwd4C4pLgQy595hGqYkWzlKoT/nUy/FvFz2x71K462mvHORaRBJRiXSPmiVuVUgmXmrseNBn+yHasoLa2kwx6WeKyuUqADZK+zFBL5DjvcLKEJjsBe+PeC9RYh8sozck43hbc6FgVZGnsssLsLMhgGC2VGjy1dI1BKkCgYEAvMV3Z64rB/LaHm4vao4ytXk/rrJu0JcQ6hp77qFXEQ5nvwJ5O3qGpYWzMKLS9Qk3mtsu6I91pqlr0zPciaIfjjbBOsy6YYxL2+tjIgRntbWXjN5Ha3eaVtMiG65UulhFG1A/ktHvrraAyERl3wg2vGQJO/sY576MeIBkYvI9bzcCgYEAtLprQijcDQf0t9hotm3DDYDG01+k4YhP9iaZzIwYVCsw8Bf0XCr4/7we8TOdE9B5pWw3hPKgAkmmCyVtc0cGydfSGD8oe60CuPGskQ+Tpcl2xb11uVjfmkJpDY7Xh2920oVebTaHS1oyPzdlBO0RflUn8Pm1LapvIZ/JzSqXXXUCgYEAmR+wyPh9zVfQWMjWS6AHQC+XWbVBsJAp10weZaaYQqyluUpfXsD4AcJfZT9e0gdlBIdxGJJuQ//ACDVUWoyY/joqKfEx6rjsO/tHkatzGPGxekJAOsts9asUStHxxqqdfBdvSkBjJRzDgDADVpSKGe0nlHENdcaamZDEXYLUFKcCgYBQrvD3hlpHDwg3k0ucNgBgZN9eulJXxY09LRp4cQrjeKzOY0Naamzjbs65i/tSPz4vldJrbg31N4ADdeAZGNp0/f7ziC7AmAqhGnOaB0Q5PWni+aQ27PBWY9OWk/CwrBh1/8iaJT/dahUIl+hnfJbUuZutPy2dh3s5naZwC9WriQKBgGVH0RQxjqowl7y4ZSptoVrs4nzn+TPnUwWRigLs+RrS1qFLU71A6G8wf+9zv6hwLN3zS4lhMqKtBd+koH7mqkd4sPxp6YE1za32rKyn/It5t+hLnXwhiCFWX1F22gh1J+ftJ+dDSw08ZhMSYT2gHsS82YLtSNU2Nn+VZb2GTWgp'),('192d45eb-03bc-403c-a4c4-a7418e1ed060','9565fd7c-b1b1-448a-8f50-941189edc0b8','priority','100'),('1b33ccdc-751c-40eb-9721-050d78736e2c','fe838d3b-65df-4477-9f51-957e2ab3f423','kid','e01ab9c8-6205-4c5b-99bb-6a3b178e9f1a'),('2313aa80-9649-4b0d-9768-2bb3a55c6068','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('23861f81-ea9e-4b3f-8622-a52496ccda4d','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('253cde73-149b-42a8-8697-bd075e41bce1','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','saml-role-list-mapper'),('2996aefc-6c0e-4d22-abd8-f3901e2e17cb','1c389beb-094a-47c1-8cf9-c45409f48822','kid','92af9cdc-4d07-4cf6-b357-3f9444725dfc'),('2ba5412c-5a89-452d-8a28-5ef3ebf8b679','a7050e82-9f87-4659-b315-23b448445f11','client-uris-must-match','true'),('2fcd158c-6ab4-4d9d-aca0-a88f11c16d08','52bcf66a-4987-4e27-814f-077ff87ab6b7','client-uris-must-match','true'),('30f2ecb5-94d1-4ce7-ab6e-9d2db0601f49','218e213b-0cb0-4bb4-bde4-5e2fb8f1955a','priority','100'),('314f81c1-17d2-47bf-9c88-135eea14043a','98c22440-bda6-4b24-9db6-e1b4f2c1122d','secret','R0QzqRI9JZWkOAn3GsDFFA'),('347abd24-70c8-4cb2-87ad-7f788284c059','1c389beb-094a-47c1-8cf9-c45409f48822','secret','PjtcXJx7xc60FVFM4ZxzpclrGco_jnYafpoYZuV2KdLNLieBWO_ywJaxN0eii722lmlzBgy82lZQEMxqIYtIIg'),('37698ca1-a658-41d9-bf50-1b7b02ba609b','218e213b-0cb0-4bb4-bde4-5e2fb8f1955a','certificate','MIICoTCCAYkCBgFyUclOSTANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAl0b2RvLWxpc3QwHhcNMjAwNTI2MTYxOTA2WhcNMzAwNTI2MTYyMDQ2WjAUMRIwEAYDVQQDDAl0b2RvLWxpc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCFRE6E+b0JWCB1Ic4TPjUGF2AzEbZntgA8VXmb8TcaLQ9FaOzwNhrafFQ5Fgk5uT8An1YzUCwSzMkjrHLM1ug0t9Mz20dQme2ruu4JgauWX3v47rUeV+4zqxLnN2SBVWuYHDNzZTS4wlk70giuv1bEoDbK+hXbzupFkpaokGrklK++ucKzOjdbj5SRYxAF7tPcX75X/9Khcz2JGAlanQI/v+seq7+QrKZJr4DNmq5ztVDZrmImdHk4HPxcDHhlFj70AGugXqN6sHXwF/pogJgyXuVfaxVUODx6dDAeK0mGipgxhPBCFhuE73chvXDGdQaIkJo8rzxz8oruB7+m688jAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFr5i/ITi7Dg/Z1POB7kJLWob+am/f4mgVlEfAddSc92glUxRtgQJCmmAz+rF0LA9zYJfyypcmijpWdhERplg0c+joJ5gTMnOhequ6/w5++K0SZtfDVH8s57Sgri1NYwGikqZsnNCIGGJKhN10B4h99SalDPpQAnpB47ycB4hRSbklCmorMiG+UP1wvQavVAxr71hRa2xa7ClMI+hIwWci7yMv8AWCjQXHNX+VKASEJy+eO8haVUJ+gwl77/Ww1lH3pgVnM9NXjxtxHumfZWMvhWmzMVblk57tDxwzt9u4oKv0NEq1rbw3MLijS+hosUclxDgH6SQrFhfND/Z/iBFck='),('42f460a6-95d9-4968-ba7d-5c26b2647f42','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4b6bce56-745c-40b7-9ab9-bb391c5f4def','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','saml-user-property-mapper'),('4f33ef9b-d677-4adf-bf72-a9e64c210a2c','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','saml-role-list-mapper'),('5694c9d8-4276-4742-b2c6-2b667b939d72','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5bfe8a69-b218-41fb-a637-3f9eaf3dc4a1','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5cf254e3-3044-47e4-8e35-84ef451adf81','98c22440-bda6-4b24-9db6-e1b4f2c1122d','kid','54a76324-510b-4e8f-ad00-ed246412faae'),('5fa66494-0e4b-4bb5-b004-06dbe4f06c5e','fe838d3b-65df-4477-9f51-957e2ab3f423','secret','MNHob9VqCcabay05vjw_Jg'),('5fce802a-c1ca-4d71-875d-92eee972f8d3','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6121f3cb-eea3-428a-ad43-ef7d6c608feb','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('616662d7-502b-48d7-bcb3-2ab4a3227f9f','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('61ac532a-0cb9-4147-a25a-55fc29ce9a24','9565fd7c-b1b1-448a-8f50-941189edc0b8','certificate','MIICmzCCAYMCBgFyUchlETANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwNTI2MTYxODA3WhcNMzAwNTI2MTYxOTQ3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCKurYa52Zm36Lo+DdbFu3dNyRuN29Iy17unoKjVR/u5YAjtXyDcjU2hQwplhfCNH6+WmTeyrt1iC8YhJbFm1Pq5HQZGqxPaaZztfyH7/2M27EaplQKR2F+K+gxZQOOGOo0UgvIOuuzzB1MtBKgkpQ1SB93KxhZaW+xmx05fPwEhq3wDrotTtwKwgVT3h0NWnBfGftahwVL+knQLv7t1EZFJ3g/cBd+GmPKYs6QwekyYy73a1ygjmS2Njca1HxiZEMHYflIkz9qOH12fVKIi+H+1F/e4L8nblaR0Ligrv9WOpHF7AQzr6SY7D8ezFRCfkMJMvn1K/GGwX6ufm6J6e8tAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAASs24tsTbGYaOL04HNcPKiOZeWWn3PhO4XCf9Ah0PLsoXaqixzt8epiRRJPdu9C/+QhnEbu4IkxK8M0+i8B266U4QRf/z+LnyAozq/mYAhdWzOeN8aZSYZWQVKza8SU021nWHCI5QI5g92eSovp9mZs/6lYlFWG0rzzHhGk1ELlGq5xtC/v/KM/TuSptUX/1AzGSZ7PlR5sat5TK3DmhttyLaLF2r+N+qMksAzGr+mxYfP5Iwjs+S6fl4nw1M0BfBHA+X+UhAelZ+qrv0K+pcFhz1Wb4VZalPbvB44T5SkDnTVpgDHBcA7i4Lyv2cfFrS4aB/0X/+Oi3B3sTBMeboo='),('729d0d31-a889-47c1-975b-c846e4a3108f','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','oidc-full-name-mapper'),('7649bd34-97c8-493a-a40c-024a47b44458','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('7b6ca234-15ad-40de-b146-15d1a5056757','43502dc7-3527-4935-a891-0207170bef69','max-clients','200'),('7eafc529-0294-4778-8a56-0939d9d24a6e','679fb3ad-bf87-44cb-b355-c80a3acb2401','allow-default-scopes','true'),('7f3a4295-b4c3-4145-a518-2a810862aa0b','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('84d301a2-e1d2-47b3-8d9e-56a58f127dd4','9565fd7c-b1b1-448a-8f50-941189edc0b8','privateKey','MIIEowIBAAKCAQEAirq2GudmZt+i6Pg3Wxbt3TckbjdvSMte7p6Co1Uf7uWAI7V8g3I1NoUMKZYXwjR+vlpk3sq7dYgvGISWxZtT6uR0GRqsT2mmc7X8h+/9jNuxGqZUCkdhfivoMWUDjhjqNFILyDrrs8wdTLQSoJKUNUgfdysYWWlvsZsdOXz8BIat8A66LU7cCsIFU94dDVpwXxn7WocFS/pJ0C7+7dRGRSd4P3AXfhpjymLOkMHpMmMu92tcoI5ktjY3GtR8YmRDB2H5SJM/ajh9dn1SiIvh/tRf3uC/J25WkdC4oK7/VjqRxewEM6+kmOw/HsxUQn5DCTL59SvxhsF+rn5uienvLQIDAQABAoIBAFCF/52uIuojdNP0/2yH6pk0oJi45IdERF4M85cKmfZ4j+AqP5OsfuaeY2jgDfpTrh2fKl2HHzghS/TXQQyCFDuLTzgjG1Ec6djQETx2OJ3CBxKI6M7uj9BEfAnvsBiSrZ6g4OXgDV/XYkpbW1SIwC4NJvZstT1wzbwxZM0xlrao+e4QzwbSv6THv5GN6tpDWeGjcbCTbA74Uix4VcPXcBX8UbRWwowLLM9l9Eq7bVY2UMjqUIk3uzjJ3vVo9D1DTparQAx1Y/rQJjMgTgkVDqzsF8FbDKn72lheG67k+3ePdU6s67FHtQOWWSJ5hPBhX5+RVpaxOym+s9TwXANA06ECgYEA0OL0EdV1qWLqu82eLRy9yL3aBae0+PdqE2EwFML7Fp7cxOTz6XUjiZo2vRK5xiG9nKnY6TzQP0Q78doFXPjl/U/3deucvtxbZgngctDjf1FZTxPy8FTPhEh3qYLc1YlbxJpax/BSFWV/uOsylhz4xYYS7C4JFvjOW7jvGuxX8XsCgYEAqgTm/hwTg8ryjchFqxRtJEkG+ghH7B56/iP7ggQ2I1aHKa9ic+Xgjr5kye/Y66eViNUrV1Dzk90UwrNghzlPrS4QEuW6k9Op8EMPU2f05BdOx3t/uO48YFY2TmV5lXIiLIerVLe9kGq/MA4chPUvrCEv8s4HVHpJSzShP5A9XXcCgYEAoRYkeoxPDK2HsATFcqyzftdKBwpp+YVzfDZ6ycgDslIYlo6puuPm3/rZM735Hd5vRx2EdXm8bs3EHKKxeB1J36uHfpyQaG+u3GXJfUGx70FgyibsNoJw9eacwVB11Qb0ig0u7Plbk7yOXqCihjkZb9oRRanKwLhnCzz2x6BzwXkCgYBSr7mrwfnXsd8PB2SilHeUGxQSi+52rkhAyz0peWTfANkRc+Oc3CK/KWeZMlW8Hi/CcXH3sD4WHoJXQqfifAP9BJb6qdF4zYsrd2G/vaJDP/anW6+9P9gLPkKBFCbygKSQJZc0x3ug/dlnxKUoIJqDy0wneP3lnueAdOMrJ7pAdwKBgDtNBj2BXnq8A9ZUuSRJikiIxX4eu62tEp7HGGCifHdXcJglxHO2xMqNdZfTz46I9MAzGq5EY7FL9S2MnLzcHFhYA/xGGgfrUC/Wen/gqpAj1x2rfMxQDU0hSFhsp6HpgqgUZgTfBDCjvmmp8Cvmd2bHHS+9ulUZ3TPj1gGVJl3N'),('87ed9ab5-e41b-499c-a936-29cfab68c6a5','98c22440-bda6-4b24-9db6-e1b4f2c1122d','priority','100'),('8d0671cc-acb4-41bf-91fd-090183e2224b','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','saml-user-property-mapper'),('92821f0d-969a-4172-b79c-5703e3e9a4af','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('95965915-433d-4207-8d51-6f48a5fbe98b','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('97bad144-ac69-475c-972a-4e11e92f209f','838ef10a-1b72-4df6-86c9-8213b8ce4547','algorithm','HS256'),('9a4000fa-1819-477e-8f2d-6112f8f85c8d','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','oidc-address-mapper'),('af8c9433-a49e-45e9-9fd3-6d5905127113','0bf62b30-b1c5-40cd-8cff-5efbbe37ca9b','allow-default-scopes','true'),('b6d8b07d-f5e1-4626-a332-06dda3e07d23','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c4037cde-9dde-4d5d-9979-35df0a429f1d','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('cb361976-4161-4cf3-951c-c4fc73bedd17','838ef10a-1b72-4df6-86c9-8213b8ce4547','priority','100'),('ced99edc-7bce-41c7-8fc9-35e0619bebb2','838ef10a-1b72-4df6-86c9-8213b8ce4547','secret','dZOn9zvpeLvl1t7JYcAIkHfspS4k5N9qyLHhoAMjxpxuyG2OKychxDKK32XuDYaUc0guG2NY0ECeXHWCTFGv9w'),('cee88b5f-8413-4290-be35-91c0d99f7cd3','6e9b3cd6-7839-4242-bb14-d4a01969d2ad','allow-default-scopes','true'),('d134a178-d951-4d5c-9c96-8357b2e613dd','3e492687-16ac-478c-a82b-e3fda5e31abd','allow-default-scopes','true'),('d7d20c14-8464-46eb-9dbf-9e4ee6f767e0','a7050e82-9f87-4659-b315-23b448445f11','host-sending-registration-request-must-match','true'),('dd06f2db-e672-492f-a02e-0daf45d7a5e8','1c389beb-094a-47c1-8cf9-c45409f48822','algorithm','HS256'),('ded5fb22-ec0d-4aa1-bba5-1e960cb4fff4','838ef10a-1b72-4df6-86c9-8213b8ce4547','kid','c5524d73-7976-4401-8034-6b5140c5fb69'),('e09a3460-dd76-488b-a5d7-cfbbd9358e66','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','oidc-address-mapper'),('e1939b5d-0bee-4001-a8d6-5cda24cde9ee','017c1cd6-1ace-4437-9451-0198174bbd1c','allowed-protocol-mapper-types','saml-user-property-mapper'),('e2075802-0eef-4923-af43-fcbe0b22125a','a9463ab1-498c-4ad7-8d8d-68fdf7cf5e21','allowed-protocol-mapper-types','saml-user-property-mapper'),('e2a744b6-89d1-4925-9a78-5a3b8cef77de','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ec5e768e-805e-4849-a4e9-d75773393c0f','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f31e8ee3-b174-473a-8bb8-24516785b6de','d136e6a5-6597-4990-bc30-9a1079f0574e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f928e6da-d9ee-44db-8343-f1ed3628a6b6','52bcf66a-4987-4e27-814f-077ff87ab6b7','host-sending-registration-request-must-match','true'),('fada16eb-7ef2-4062-a5bb-aa44bc415afd','cf418637-7566-412e-9a29-57af1266cd58','allowed-protocol-mapper-types','saml-role-list-mapper');
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
INSERT INTO `COMPOSITE_ROLE` VALUES ('2b094438-764f-43d8-bd73-2209418bcde0','1ebc13ce-6d6e-4a5e-bbc9-d11d51b9173f'),('2e8be36e-f7b2-4b38-8f3a-5d393c0c53a0','1fecc9d0-3b7e-458c-bfdc-f10b89be062a'),('2e8be36e-f7b2-4b38-8f3a-5d393c0c53a0','cb39c664-7962-4f00-b1cd-e6480eecc7f5'),('4adbfeb4-a756-4c9c-a250-e80f8f56013c','0fb2e7f1-e998-4ab0-83bb-b0cc9c6d2f9a'),('6fec7723-430d-4c44-9ff8-a02d8660bea3','2a2eeebd-f36e-4397-8265-a3b7d79ee2a1'),('9d034cd2-dd73-4d58-a285-e1a067327b89','d82e24f2-0fc0-4f71-8d41-f07b26ddf58c'),('b146980c-255e-4f2a-a512-b5b8a567a9e1','27fc19d4-8b6d-49b0-aa1b-cc109094944c'),('b146980c-255e-4f2a-a512-b5b8a567a9e1','b5516e4f-82ed-4870-9bb5-856707b40284'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','0191aa12-df3f-41e8-a770-249e465fb03b'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','08350fc7-b3d6-4ddc-9d33-4d052302bd75'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','0dae3d10-35c6-40c9-a461-1a4e549e350e'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','11329986-2509-4c8f-be3b-33255e07d591'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','1f9dee30-bf9e-40e2-b286-18e136d5bd7f'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','1fecc9d0-3b7e-458c-bfdc-f10b89be062a'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','20eb65c2-e385-48aa-9946-ff87366d8246'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','227a5cdc-c6f2-4681-ab94-665a76a1a6fc'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','2a2eeebd-f36e-4397-8265-a3b7d79ee2a1'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','2e2eb664-d21c-43b0-9ca7-8c59293ae25d'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','2e8be36e-f7b2-4b38-8f3a-5d393c0c53a0'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','6063f29c-2478-4a6e-aedf-a6752fd8b072'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','620dcfac-428b-4277-8efb-f43af3b1f4db'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','6418d651-9318-4045-9346-0ac6a7335325'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','650ea11c-f261-456f-9838-e044d7fc2780'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','6e34144d-e0e0-44d4-b09f-61b25255f444'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','6fec7723-430d-4c44-9ff8-a02d8660bea3'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','7aba86ad-856f-449f-bec5-74c2b1a327e9'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','94a137ed-80a0-4ca6-81d5-2773ec315310'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','996a69fd-55f1-489d-8280-b5e296ef0f2a'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','a64fec53-04ba-4aac-bcc3-5dcd13a2e4ff'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','a7fded73-84f8-45d2-963a-2012d29ec11c'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','bd3e82b2-6a38-4681-bb47-fcdc04868609'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','c15d8dff-33d4-4d87-8ddc-eccb998aa95f'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','c1cf26ab-9db4-4882-8e31-f57a5e2a41c5'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','c244b068-1bdc-4ccf-a679-100b52b3f2b8'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','c8e7e651-2553-4f1d-9069-77db02afce48'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','ca33ca6d-284c-48f8-8695-a246c8b33723'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','ca398588-d45c-484f-8af6-f32d53505469'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','cb39c664-7962-4f00-b1cd-e6480eecc7f5'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','cf7351fc-15e8-498b-bb13-11057a17faf9'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','d4e25eaf-c1ee-4fb2-88cf-9aebb76c71f7'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','d7b44948-c282-4f56-a510-f0c435905dca'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','da8abe05-589a-4b8e-93ac-901af1a7a7f6'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','dac67573-27ca-49e6-a652-3a98a5839d70'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','f344f0f3-9212-4d13-ad4a-3d02eeddcbd6'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','fed833a7-1080-4ae0-8203-9cfc3620d583'),('d05b7454-c75f-4228-8d95-82689c991749','1ebc13ce-6d6e-4a5e-bbc9-d11d51b9173f'),('d05b7454-c75f-4228-8d95-82689c991749','25bf5a34-5e3e-41c6-a38b-4c04cd0f3aa7'),('d05b7454-c75f-4228-8d95-82689c991749','27fc19d4-8b6d-49b0-aa1b-cc109094944c'),('d05b7454-c75f-4228-8d95-82689c991749','2b094438-764f-43d8-bd73-2209418bcde0'),('d05b7454-c75f-4228-8d95-82689c991749','3b3df8b3-2035-4f70-ae7a-6a3505c63c88'),('d05b7454-c75f-4228-8d95-82689c991749','6e3c1471-1d5b-4416-879f-dfaef67d35fe'),('d05b7454-c75f-4228-8d95-82689c991749','7ef37998-5294-4400-ab17-e2296fa03a66'),('d05b7454-c75f-4228-8d95-82689c991749','94556fce-b007-4582-8790-559938fc8e4a'),('d05b7454-c75f-4228-8d95-82689c991749','9471a63f-5401-4ee0-a027-cd42af235df5'),('d05b7454-c75f-4228-8d95-82689c991749','a920b805-b9be-48d4-a296-b36a921b966c'),('d05b7454-c75f-4228-8d95-82689c991749','b146980c-255e-4f2a-a512-b5b8a567a9e1'),('d05b7454-c75f-4228-8d95-82689c991749','b5516e4f-82ed-4870-9bb5-856707b40284'),('d05b7454-c75f-4228-8d95-82689c991749','bf0a5619-c3bb-49fa-8abb-0ce4f641c749'),('d05b7454-c75f-4228-8d95-82689c991749','c1041ae9-ada8-4932-ab53-81664b11edc2'),('d05b7454-c75f-4228-8d95-82689c991749','cf4668bf-b6bd-44eb-a74b-609766ed0590'),('d05b7454-c75f-4228-8d95-82689c991749','d519dd5f-9d10-4306-9bfc-839f15d8ae2e'),('d05b7454-c75f-4228-8d95-82689c991749','f4de6ae9-23c3-4e23-b4b2-a2f0e249f72a'),('d05b7454-c75f-4228-8d95-82689c991749','f95699d0-2f6d-4e67-8fbc-205aedd22078'),('d070a657-79fc-4805-9e70-ca505795859e','e29a51e4-baa1-4dea-9866-1e9b0f139f30'),('da8abe05-589a-4b8e-93ac-901af1a7a7f6','20eb65c2-e385-48aa-9946-ff87366d8246'),('e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41','6ea35e9c-1596-4f8a-bdeb-1c65e55e7419'),('fed833a7-1080-4ae0-8203-9cfc3620d583','6418d651-9318-4045-9346-0ac6a7335325'),('fed833a7-1080-4ae0-8203-9cfc3620d583','c1cf26ab-9db4-4882-8e31-f57a5e2a41c5');
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
INSERT INTO `CREDENTIAL` VALUES ('aa26d102-928d-49c3-a630-d546c40e5d18',NULL,'password','e6c18707-d668-4fe3-b195-296234c0b8cb',1590509987678,NULL,'{\"value\":\"oW0XGu9XJMo/rHaIeOLywDbmgIYDWt/vG6uZEBeq0qdCMFpHMpTj6+evRtq4lpnarIezODQkTZVy3ONv0ZKuoA==\",\"salt\":\"6uKo3nO7JmZUQtzdmzGVmQ==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('e631e599-7870-4132-a85e-3e61cbfaeaf2',NULL,'password','c98f4bd8-844e-41ff-9b83-5a4214554976',1590510157667,NULL,'{\"value\":\"ZlFwBaEIHvgc7EWANWYD05nwZYoLJwUwnOE+A+tDG9KZg9dOpCE4AWfI98RKLNqiVp8I/h6TWJ7RASEC8Xd/lQ==\",\"salt\":\"G+Uh/sKCe4MWnV+aGHAtBw==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10);
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
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2020-05-26 16:18:27',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2020-05-26 16:18:28',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2020-05-26 16:18:29',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2020-05-26 16:18:29',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2020-05-26 16:18:34',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2020-05-26 16:18:34',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2020-05-26 16:18:39',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2020-05-26 16:18:39',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2020-05-26 16:18:39',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2020-05-26 16:18:44',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2020-05-26 16:18:46',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2020-05-26 16:18:46',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2020-05-26 16:18:47',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-05-26 16:18:47',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-05-26 16:18:47',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-05-26 16:18:47',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-05-26 16:18:47',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2020-05-26 16:18:51',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2020-05-26 16:18:54',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2020-05-26 16:18:54',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2020-05-26 16:18:54',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2020-05-26 16:18:54',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2020-05-26 16:18:55',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2020-05-26 16:18:55',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2020-05-26 16:18:55',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2020-05-26 16:18:56',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2020-05-26 16:19:00',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2020-05-26 16:19:00',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2020-05-26 16:19:03',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2020-05-26 16:19:03',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2020-05-26 16:19:05',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2020-05-26 16:19:05',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-05-26 16:19:05',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-05-26 16:19:05',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-05-26 16:19:09',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2020-05-26 16:19:10',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-05-26 16:19:10',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0509896416'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2020-05-26 16:19:10',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2020-05-26 16:19:10',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-05-26 16:19:10',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-05-26 16:19:10',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2020-05-26 16:19:10',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-05-26 16:19:15',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2020-05-26 16:19:15',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-05-26 16:19:15',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-05-26 16:19:15',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-05-26 16:19:15',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-05-26 16:19:19',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-05-26 16:19:19',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2020-05-26 16:19:22',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2020-05-26 16:19:22',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2020-05-26 16:19:23',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2020-05-26 16:19:23',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2020-05-26 16:19:23',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-05-26 16:19:23',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-05-26 16:19:23',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-05-26 16:19:24',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-05-26 16:19:31',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2020-05-26 16:19:33',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2020-05-26 16:19:34',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-05-26 16:19:34',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-05-26 16:19:34',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2020-05-26 16:19:34',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2020-05-26 16:19:34',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2020-05-26 16:19:34',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2020-05-26 16:19:35',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2020-05-26 16:19:35',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2020-05-26 16:19:35',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2020-05-26 16:19:35',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2020-05-26 16:19:36',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0509896416'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2020-05-26 16:19:36',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'0509896416'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-05-26 16:19:36',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-05-26 16:19:36',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-05-26 16:19:36',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-05-26 16:19:39',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-05-26 16:19:39',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-05-26 16:19:39',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-05-26 16:19:39',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-05-26 16:19:41',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-05-26 16:19:41',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-05-26 16:19:42',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-05-26 16:19:42',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-05-26 16:19:42',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-05-26 16:19:42',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0509896416'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-05-26 16:19:42',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'0509896416');
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
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','1aad61fc-9dd9-415d-8bb0-818bf8c35005',_binary ''),('master','3d2fc377-27dd-4896-bc9c-c272d2192380',_binary ''),('master','3f8fedac-f2fb-40e3-abc0-de3731e42330',_binary '\0'),('master','5838f4e6-9edf-400d-821e-90f6445eb625',_binary ''),('master','786fa720-3c49-4fed-9a05-df52e683e61a',_binary ''),('master','9bec7284-b799-4efb-bb0b-9dcbcb5d16a5',_binary '\0'),('master','c2a55da6-7f86-46fe-bb68-6685746a2720',_binary '\0'),('master','c88fd250-2a51-4608-8baa-cb9d73fd26e7',_binary '\0'),('master','fffb323e-60f8-40d6-aa5c-53079afa41a4',_binary ''),('todo-list','0b3320d7-35e9-4986-9e92-88a982560b69',_binary ''),('todo-list','2a59091f-051a-41a9-8117-9cba7aa71e2a',_binary '\0'),('todo-list','33ea4ada-1205-49e6-8ec2-c7db49ede35a',_binary ''),('todo-list','430f8e09-5d22-4ca6-9ac3-5863489037fd',_binary '\0'),('todo-list','4b11c96f-5205-4e85-8fcf-115db34b2403',_binary '\0'),('todo-list','7383e098-32ee-4a3f-b0bc-d035e25bea5e',_binary ''),('todo-list','76a6c55a-27ef-441c-ba3b-5afc453c3c97',_binary '\0'),('todo-list','7c1a5e71-a486-4f4c-bda3-be632a565f8b',_binary ''),('todo-list','ce2eaf0b-de6c-49bc-949a-075439957412',_binary '');
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
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
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
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0191aa12-df3f-41e8-a770-249e465fb03b','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_impersonation}','impersonation','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('08350fc7-b3d6-4ddc-9d33-4d052302bd75','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('09966a97-3171-4f99-9846-8f6a805f0863','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_view-applications}','view-applications','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('09fcae56-869d-479c-b33d-991c81fa4fe3','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_view-applications}','view-applications','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('0dae3d10-35c6-40c9-a461-1a4e549e350e','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-authorization}','manage-authorization','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('0fb2e7f1-e998-4ab0-83bb-b0cc9c6d2f9a','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_view-consent}','view-consent','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('11329986-2509-4c8f-be3b-33255e07d591','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_query-realms}','query-realms','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('1ebc13ce-6d6e-4a5e-bbc9-d11d51b9173f','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_query-clients}','query-clients','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('1f9dee30-bf9e-40e2-b286-18e136d5bd7f','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-users}','manage-users','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('1fecc9d0-3b7e-458c-bfdc-f10b89be062a','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_query-groups}','query-groups','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('20eb65c2-e385-48aa-9946-ff87366d8246','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_query-clients}','query-clients','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('227a5cdc-c6f2-4681-ab94-665a76a1a6fc','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-realm}','view-realm','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('25bf5a34-5e3e-41c6-a38b-4c04cd0f3aa7','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-events}','view-events','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('27fc19d4-8b6d-49b0-aa1b-cc109094944c','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_query-users}','query-users','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('2a2eeebd-f36e-4397-8265-a3b7d79ee2a1','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_query-clients}','query-clients','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('2a2fdae1-3ebb-4d98-8cb6-5fa02df92253','9391b5e5-9f5d-416a-ad4c-4e5370215cd4',_binary '','${role_read-token}','read-token','todo-list','9391b5e5-9f5d-416a-ad4c-4e5370215cd4',NULL),('2b094438-764f-43d8-bd73-2209418bcde0','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-clients}','view-clients','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('2e2eb664-d21c-43b0-9ca7-8c59293ae25d','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-clients}','manage-clients','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('2e8be36e-f7b2-4b38-8f3a-5d393c0c53a0','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-users}','view-users','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('38bee90b-d5a0-4146-9860-21e1046b9157','37ba1f70-153a-442d-994b-b3509046741d',_binary '',NULL,'uma_protection','todo-list','37ba1f70-153a-442d-994b-b3509046741d',NULL),('3b3df8b3-2035-4f70-ae7a-6a3505c63c88','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_create-client}','create-client','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('41bf334d-bb42-45c7-98e0-165f6970374e','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('4adbfeb4-a756-4c9c-a250-e80f8f56013c','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_manage-consent}','manage-consent','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('6063f29c-2478-4a6e-aedf-a6752fd8b072','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-realm}','manage-realm','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('620dcfac-428b-4277-8efb-f43af3b1f4db','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('6418d651-9318-4045-9346-0ac6a7335325','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_query-users}','query-users','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('650ea11c-f261-456f-9838-e044d7fc2780','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-clients}','manage-clients','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('6e34144d-e0e0-44d4-b09f-61b25255f444','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-realm}','view-realm','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('6e3c1471-1d5b-4416-879f-dfaef67d35fe','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_impersonation}','impersonation','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('6ea35e9c-1596-4f8a-bdeb-1c65e55e7419','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_manage-account-links}','manage-account-links','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('6fec7723-430d-4c44-9ff8-a02d8660bea3','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-clients}','view-clients','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('7aba86ad-856f-449f-bec5-74c2b1a327e9','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('7ef37998-5294-4400-ab17-e2296fa03a66','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-realm}','manage-realm','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('85a4198a-be37-4d04-b81a-13090b758125','todo-list',_binary '\0','${role_uma_authorization}','uma_authorization','todo-list',NULL,'todo-list'),('94556fce-b007-4582-8790-559938fc8e4a','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-identity-providers}','manage-identity-providers','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('9471a63f-5401-4ee0-a027-cd42af235df5','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-users}','manage-users','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('94a137ed-80a0-4ca6-81d5-2773ec315310','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-events}','manage-events','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('96a5f75f-5bf3-49ca-8e3f-17ba7d8c00af','todo-list',_binary '\0','${role_offline-access}','offline_access','todo-list',NULL,'todo-list'),('996a69fd-55f1-489d-8280-b5e296ef0f2a','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-authorization}','manage-authorization','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('9d034cd2-dd73-4d58-a285-e1a067327b89','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_manage-consent}','manage-consent','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('a64fec53-04ba-4aac-bcc3-5dcd13a2e4ff','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-authorization}','view-authorization','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('a7fded73-84f8-45d2-963a-2012d29ec11c','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-identity-providers}','view-identity-providers','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('a920b805-b9be-48d4-a296-b36a921b966c','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_query-realms}','query-realms','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('b146980c-255e-4f2a-a512-b5b8a567a9e1','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-users}','view-users','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('b30a0dd6-b756-4f9a-9687-71f7c68ecc1b','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('b5516e4f-82ed-4870-9bb5-856707b40284','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_query-groups}','query-groups','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('bd3e82b2-6a38-4681-bb47-fcdc04868609','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_create-client}','create-client','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('bf0a5619-c3bb-49fa-8abb-0ce4f641c749','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-authorization}','view-authorization','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('c1041ae9-ada8-4932-ab53-81664b11edc2','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-clients}','manage-clients','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('c15d8dff-33d4-4d87-8ddc-eccb998aa95f','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-events}','view-events','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('c1cf26ab-9db4-4882-8e31-f57a5e2a41c5','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_query-groups}','query-groups','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('c244b068-1bdc-4ccf-a679-100b52b3f2b8','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_create-client}','create-client','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('c8e7e651-2553-4f1d-9069-77db02afce48','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_manage-users}','manage-users','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('ca33ca6d-284c-48f8-8695-a246c8b33723','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-realm}','manage-realm','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('ca398588-d45c-484f-8af6-f32d53505469','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_manage-events}','manage-events','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('cb39c664-7962-4f00-b1cd-e6480eecc7f5','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_query-users}','query-users','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('cefab88b-8d25-4bc6-9271-7d8cdbca182a','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_view-profile}','view-profile','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('cf4668bf-b6bd-44eb-a74b-609766ed0590','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-identity-providers}','view-identity-providers','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('cf7351fc-15e8-498b-bb13-11057a17faf9','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_impersonation}','impersonation','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('d05b7454-c75f-4228-8d95-82689c991749','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_realm-admin}','realm-admin','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('d070a657-79fc-4805-9e70-ca505795859e','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_manage-account}','manage-account','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('d4e25eaf-c1ee-4fb2-88cf-9aebb76c71f7','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-events}','view-events','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('d519dd5f-9d10-4306-9bfc-839f15d8ae2e','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_view-realm}','view-realm','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('d7b44948-c282-4f56-a510-f0c435905dca','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_view-identity-providers}','view-identity-providers','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('d82e24f2-0fc0-4f71-8d41-f07b26ddf58c','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_view-consent}','view-consent','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('da8abe05-589a-4b8e-93ac-901af1a7a7f6','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-clients}','view-clients','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('dac67573-27ca-49e6-a652-3a98a5839d70','2eb2798b-c29b-4a5a-8997-b0d1f911622f',_binary '','${role_query-realms}','query-realms','master','2eb2798b-c29b-4a5a-8997-b0d1f911622f',NULL),('e29a51e4-baa1-4dea-9866-1e9b0f139f30','43dd5258-f161-4f7d-b012-3a446a9db4d2',_binary '','${role_manage-account-links}','manage-account-links','master','43dd5258-f161-4f7d-b012-3a446a9db4d2',NULL),('e4fe75fc-da67-4225-816a-20515cd2f08e','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_view-profile}','view-profile','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',_binary '','${role_manage-account}','manage-account','todo-list','6b8a5f78-3ce7-4b61-8199-a96d1f7311f7',NULL),('f344f0f3-9212-4d13-ad4a-3d02eeddcbd6','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-authorization}','view-authorization','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL),('f4de6ae9-23c3-4e23-b4b2-a2f0e249f72a','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-authorization}','manage-authorization','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('f7c8d52c-2569-4a2c-9eb0-24a749cee9c4','656ecf17-d896-4f52-a8bc-a06f0c43eb55',_binary '','${role_read-token}','read-token','master','656ecf17-d896-4f52-a8bc-a06f0c43eb55',NULL),('f95699d0-2f6d-4e67-8fbc-205aedd22078','dae90119-5476-4420-acd1-1ec21e634213',_binary '','${role_manage-events}','manage-events','todo-list','dae90119-5476-4420-acd1-1ec21e634213',NULL),('fed833a7-1080-4ae0-8203-9cfc3620d583','deaa3810-aedf-4da8-94cd-f0daece7da25',_binary '','${role_view-users}','view-users','master','deaa3810-aedf-4da8-94cd-f0daece7da25',NULL);
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
INSERT INTO `MIGRATION_MODEL` VALUES ('dmagy','10.0.1',1590509985);
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
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
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
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
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
INSERT INTO `POLICY_CONFIG` VALUES ('39fc46a1-d76e-433e-9cd0-34742b42ec4b','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),('af10b46f-c7c7-4a28-87ac-2b32daec65a2','defaultResourceType','urn:application:resources:default');
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
INSERT INTO `PROTOCOL_MAPPER` VALUES ('008c86f1-2f89-43f9-8b85-b7284dc735df','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('0ca0e465-4698-4111-bb64-1a88ada9a81f','full name','openid-connect','oidc-full-name-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('143d86da-0b4f-44dd-ba51-b7fd5fbe3a53','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'0b3320d7-35e9-4986-9e92-88a982560b69'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('29a8f1ff-6b03-4ec2-b5cb-a62da23202a4','role list','saml','saml-role-list-mapper',NULL,'7383e098-32ee-4a3f-b0bc-d035e25bea5e'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','address','openid-connect','oidc-address-mapper',NULL,'c88fd250-2a51-4608-8baa-cb9d73fd26e7'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','locale','openid-connect','oidc-usermodel-attribute-mapper','78e06407-f9d5-4969-bfac-b30de79b681c',NULL),('30408035-3dde-487e-8f8c-2337491dbab3','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'4b11c96f-5205-4e85-8fcf-115db34b2403'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('388c38b2-0163-42b0-b1e4-5b51c93ebd0a','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'7c1a5e71-a486-4f4c-bda3-be632a565f8b'),('3b751d26-552d-44ac-b498-c4c54a99f694','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'fffb323e-60f8-40d6-aa5c-53079afa41a4'),('42c44be7-3882-48d3-b0b1-43dcc4327836','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'9bec7284-b799-4efb-bb0b-9dcbcb5d16a5'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'76a6c55a-27ef-441c-ba3b-5afc453c3c97'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','locale','openid-connect','oidc-usermodel-attribute-mapper','10518c10-7dcb-44a5-a221-c11aa69e032b',NULL),('5335f878-c1f9-47c3-a8ef-face1af99120','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'9bec7284-b799-4efb-bb0b-9dcbcb5d16a5'),('546ed409-60a3-482b-8ba9-d406c5abf62e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'786fa720-3c49-4fed-9a05-df52e683e61a'),('58fb8666-0778-4d2f-b182-4f8408e6be00','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('5b52c68b-a921-42b3-96c4-2b4bd427e9a1','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'1aad61fc-9dd9-415d-8bb0-818bf8c35005'),('5e5df631-219c-46c8-9eec-74493b66fb81','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','37ba1f70-153a-442d-994b-b3509046741d',NULL),('645631a4-152e-41fa-872a-96e2c31632ff','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('700c9096-7a1b-44a4-a36e-ec00b8b5db9a','full name','openid-connect','oidc-full-name-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'33ea4ada-1205-49e6-8ec2-c7db49ede35a'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','37ba1f70-153a-442d-994b-b3509046741d',NULL),('83c1db55-a1e2-4a52-9106-6bad5d319caa','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('88a89f34-640f-4c1b-bc76-5c8879e64722','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'fffb323e-60f8-40d6-aa5c-53079afa41a4'),('89e01a29-fa9e-4392-ac39-d6f0ac5b85d7','audience resolve','openid-connect','oidc-audience-resolve-mapper','9f2d9e02-424b-4e81-96ec-82f4cbbd49dd',NULL),('95825476-3450-4ac8-bfee-b5927aebbd83','email','openid-connect','oidc-usermodel-property-mapper',NULL,'786fa720-3c49-4fed-9a05-df52e683e61a'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('a3dc5169-cc56-4597-9742-6764dd63304d','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','username','openid-connect','oidc-usermodel-property-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('a90499fe-db21-4745-b8dc-d630a4e31c15','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','username','openid-connect','oidc-usermodel-property-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('ad757443-580e-4114-97a8-217b5257d9b9','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'fffb323e-60f8-40d6-aa5c-53079afa41a4'),('ada5b94b-6039-46b0-a138-00ae476d91cc','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'4b11c96f-5205-4e85-8fcf-115db34b2403'),('b1800cbc-52b1-43f3-a194-8f348454cee7','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','address','openid-connect','oidc-address-mapper',NULL,'430f8e09-5d22-4ca6-9ac3-5863489037fd'),('c43c42ac-516b-4da5-9847-ea426795c034','audience resolve','openid-connect','oidc-audience-resolve-mapper','4eb6fc29-4b50-42c5-8c1a-5d5a788f5089',NULL),('c8f07753-3b68-4186-9746-e87103906a7e','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('db39f911-b43b-4284-8ced-30834d7068b0','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3f8fedac-f2fb-40e3-abc0-de3731e42330'),('de5acb54-dc30-4e41-839f-298e07cae833','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','37ba1f70-153a-442d-994b-b3509046741d',NULL),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0b3320d7-35e9-4986-9e92-88a982560b69'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3f8fedac-f2fb-40e3-abc0-de3731e42330'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','email','openid-connect','oidc-usermodel-property-mapper',NULL,'33ea4ada-1205-49e6-8ec2-c7db49ede35a'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('f8a2db2f-b7d1-47ee-88ea-fcf00b4f965c','role list','saml','saml-role-list-mapper',NULL,'5838f4e6-9edf-400d-821e-90f6445eb625'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d2fc377-27dd-4896-bc9c-c272d2192380'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ce2eaf0b-de6c-49bc-949a-075439957412'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'0b3320d7-35e9-4986-9e92-88a982560b69'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'76a6c55a-27ef-441c-ba3b-5afc453c3c97');
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
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('008c86f1-2f89-43f9-8b85-b7284dc735df','true','access.token.claim'),('008c86f1-2f89-43f9-8b85-b7284dc735df','nickname','claim.name'),('008c86f1-2f89-43f9-8b85-b7284dc735df','true','id.token.claim'),('008c86f1-2f89-43f9-8b85-b7284dc735df','String','jsonType.label'),('008c86f1-2f89-43f9-8b85-b7284dc735df','nickname','user.attribute'),('008c86f1-2f89-43f9-8b85-b7284dc735df','true','userinfo.token.claim'),('0ca0e465-4698-4111-bb64-1a88ada9a81f','true','access.token.claim'),('0ca0e465-4698-4111-bb64-1a88ada9a81f','true','id.token.claim'),('0ca0e465-4698-4111-bb64-1a88ada9a81f','true','userinfo.token.claim'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','true','access.token.claim'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','nickname','claim.name'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','true','id.token.claim'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','String','jsonType.label'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','nickname','user.attribute'),('11e9915d-a017-42ee-bf9e-85f77e3b7ab8','true','userinfo.token.claim'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','true','access.token.claim'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','updated_at','claim.name'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','true','id.token.claim'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','String','jsonType.label'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','updatedAt','user.attribute'),('23debf9a-af46-4571-9eeb-e58f0418c2b7','true','userinfo.token.claim'),('29a8f1ff-6b03-4ec2-b5cb-a62da23202a4','Role','attribute.name'),('29a8f1ff-6b03-4ec2-b5cb-a62da23202a4','Basic','attribute.nameformat'),('29a8f1ff-6b03-4ec2-b5cb-a62da23202a4','false','single'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','true','access.token.claim'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','family_name','claim.name'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','true','id.token.claim'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','String','jsonType.label'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','lastName','user.attribute'),('2a4dddef-d798-4fed-8656-ab68d6ca8d9b','true','userinfo.token.claim'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','true','access.token.claim'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','true','id.token.claim'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','country','user.attribute.country'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','formatted','user.attribute.formatted'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','locality','user.attribute.locality'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','postal_code','user.attribute.postal_code'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','region','user.attribute.region'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','street','user.attribute.street'),('2bc5ddcc-761c-427c-984d-0d8bc61d53d5','true','userinfo.token.claim'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','true','access.token.claim'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','locale','claim.name'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','true','id.token.claim'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','String','jsonType.label'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','locale','user.attribute'),('2ca276fa-dcf6-4293-b744-9508e1a3e8a1','true','userinfo.token.claim'),('30408035-3dde-487e-8f8c-2337491dbab3','true','access.token.claim'),('30408035-3dde-487e-8f8c-2337491dbab3','updated_at','claim.name'),('30408035-3dde-487e-8f8c-2337491dbab3','true','id.token.claim'),('30408035-3dde-487e-8f8c-2337491dbab3','String','jsonType.label'),('30408035-3dde-487e-8f8c-2337491dbab3','updatedAt','user.attribute'),('30408035-3dde-487e-8f8c-2337491dbab3','true','userinfo.token.claim'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','true','access.token.claim'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','birthdate','claim.name'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','true','id.token.claim'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','String','jsonType.label'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','birthdate','user.attribute'),('3161a1ed-fe65-4686-8ae9-7b81666640b4','true','userinfo.token.claim'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','true','access.token.claim'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','groups','claim.name'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','true','id.token.claim'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','String','jsonType.label'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','true','multivalued'),('3573469c-0f87-4156-bb0f-62a0541a6d9b','foo','user.attribute'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','true','access.token.claim'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','given_name','claim.name'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','true','id.token.claim'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','String','jsonType.label'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','firstName','user.attribute'),('37c85dd2-9f3b-44ed-a4cf-3f00e09524ea','true','userinfo.token.claim'),('42c44be7-3882-48d3-b0b1-43dcc4327836','true','access.token.claim'),('42c44be7-3882-48d3-b0b1-43dcc4327836','upn','claim.name'),('42c44be7-3882-48d3-b0b1-43dcc4327836','true','id.token.claim'),('42c44be7-3882-48d3-b0b1-43dcc4327836','String','jsonType.label'),('42c44be7-3882-48d3-b0b1-43dcc4327836','username','user.attribute'),('42c44be7-3882-48d3-b0b1-43dcc4327836','true','userinfo.token.claim'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','true','access.token.claim'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','family_name','claim.name'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','true','id.token.claim'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','String','jsonType.label'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','lastName','user.attribute'),('46922853-200e-4423-b3c8-c5c3d7dd0c60','true','userinfo.token.claim'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','true','access.token.claim'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','birthdate','claim.name'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','true','id.token.claim'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','String','jsonType.label'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','birthdate','user.attribute'),('47a6a9e7-c51b-428b-af54-f1e2cacdac7e','true','userinfo.token.claim'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','true','access.token.claim'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','phone_number','claim.name'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','true','id.token.claim'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','String','jsonType.label'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','phoneNumber','user.attribute'),('49ba5a8a-e12b-4f54-9b3a-13e491f92da3','true','userinfo.token.claim'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','true','access.token.claim'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','website','claim.name'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','true','id.token.claim'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','String','jsonType.label'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','website','user.attribute'),('5128a0dd-a5fd-42c7-b295-e0a5f92d421a','true','userinfo.token.claim'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','true','access.token.claim'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','locale','claim.name'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','true','id.token.claim'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','String','jsonType.label'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','locale','user.attribute'),('517e99a3-1acf-41b4-bae3-4bb12b8a70a4','true','userinfo.token.claim'),('5335f878-c1f9-47c3-a8ef-face1af99120','true','access.token.claim'),('5335f878-c1f9-47c3-a8ef-face1af99120','groups','claim.name'),('5335f878-c1f9-47c3-a8ef-face1af99120','true','id.token.claim'),('5335f878-c1f9-47c3-a8ef-face1af99120','String','jsonType.label'),('5335f878-c1f9-47c3-a8ef-face1af99120','true','multivalued'),('5335f878-c1f9-47c3-a8ef-face1af99120','foo','user.attribute'),('546ed409-60a3-482b-8ba9-d406c5abf62e','true','access.token.claim'),('546ed409-60a3-482b-8ba9-d406c5abf62e','website','claim.name'),('546ed409-60a3-482b-8ba9-d406c5abf62e','true','id.token.claim'),('546ed409-60a3-482b-8ba9-d406c5abf62e','String','jsonType.label'),('546ed409-60a3-482b-8ba9-d406c5abf62e','website','user.attribute'),('546ed409-60a3-482b-8ba9-d406c5abf62e','true','userinfo.token.claim'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','true','access.token.claim'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','email_verified','claim.name'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','true','id.token.claim'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','boolean','jsonType.label'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','emailVerified','user.attribute'),('569f3dd3-f609-4665-8693-9b5a2fe5b4ad','true','userinfo.token.claim'),('58fb8666-0778-4d2f-b182-4f8408e6be00','true','access.token.claim'),('58fb8666-0778-4d2f-b182-4f8408e6be00','locale','claim.name'),('58fb8666-0778-4d2f-b182-4f8408e6be00','true','id.token.claim'),('58fb8666-0778-4d2f-b182-4f8408e6be00','String','jsonType.label'),('58fb8666-0778-4d2f-b182-4f8408e6be00','locale','user.attribute'),('58fb8666-0778-4d2f-b182-4f8408e6be00','true','userinfo.token.claim'),('5e5df631-219c-46c8-9eec-74493b66fb81','true','access.token.claim'),('5e5df631-219c-46c8-9eec-74493b66fb81','clientId','claim.name'),('5e5df631-219c-46c8-9eec-74493b66fb81','true','id.token.claim'),('5e5df631-219c-46c8-9eec-74493b66fb81','String','jsonType.label'),('5e5df631-219c-46c8-9eec-74493b66fb81','clientId','user.session.note'),('645631a4-152e-41fa-872a-96e2c31632ff','true','access.token.claim'),('645631a4-152e-41fa-872a-96e2c31632ff','middle_name','claim.name'),('645631a4-152e-41fa-872a-96e2c31632ff','true','id.token.claim'),('645631a4-152e-41fa-872a-96e2c31632ff','String','jsonType.label'),('645631a4-152e-41fa-872a-96e2c31632ff','middleName','user.attribute'),('645631a4-152e-41fa-872a-96e2c31632ff','true','userinfo.token.claim'),('700c9096-7a1b-44a4-a36e-ec00b8b5db9a','true','access.token.claim'),('700c9096-7a1b-44a4-a36e-ec00b8b5db9a','true','id.token.claim'),('700c9096-7a1b-44a4-a36e-ec00b8b5db9a','true','userinfo.token.claim'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','true','access.token.claim'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','locale','claim.name'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','true','id.token.claim'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','String','jsonType.label'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','locale','user.attribute'),('768a2c20-8ceb-4e7b-b973-ffaacc49dce0','true','userinfo.token.claim'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','true','access.token.claim'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','email_verified','claim.name'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','true','id.token.claim'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','boolean','jsonType.label'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','emailVerified','user.attribute'),('7d2f21a3-7df9-4d60-abf2-ebcc04432ae7','true','userinfo.token.claim'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','true','access.token.claim'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','clientAddress','claim.name'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','true','id.token.claim'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','String','jsonType.label'),('80c58ca3-ca3b-41fa-a970-e4908fbed8f0','clientAddress','user.session.note'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','true','access.token.claim'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','given_name','claim.name'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','true','id.token.claim'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','String','jsonType.label'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','firstName','user.attribute'),('83c1db55-a1e2-4a52-9106-6bad5d319caa','true','userinfo.token.claim'),('88a89f34-640f-4c1b-bc76-5c8879e64722','true','access.token.claim'),('88a89f34-640f-4c1b-bc76-5c8879e64722','resource_access.${client_id}.roles','claim.name'),('88a89f34-640f-4c1b-bc76-5c8879e64722','String','jsonType.label'),('88a89f34-640f-4c1b-bc76-5c8879e64722','true','multivalued'),('88a89f34-640f-4c1b-bc76-5c8879e64722','foo','user.attribute'),('95825476-3450-4ac8-bfee-b5927aebbd83','true','access.token.claim'),('95825476-3450-4ac8-bfee-b5927aebbd83','email','claim.name'),('95825476-3450-4ac8-bfee-b5927aebbd83','true','id.token.claim'),('95825476-3450-4ac8-bfee-b5927aebbd83','String','jsonType.label'),('95825476-3450-4ac8-bfee-b5927aebbd83','email','user.attribute'),('95825476-3450-4ac8-bfee-b5927aebbd83','true','userinfo.token.claim'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','true','access.token.claim'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','middle_name','claim.name'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','true','id.token.claim'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','String','jsonType.label'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','middleName','user.attribute'),('9d00ec68-8d7e-46f2-acd8-587ee6cfcf41','true','userinfo.token.claim'),('a3dc5169-cc56-4597-9742-6764dd63304d','true','access.token.claim'),('a3dc5169-cc56-4597-9742-6764dd63304d','zoneinfo','claim.name'),('a3dc5169-cc56-4597-9742-6764dd63304d','true','id.token.claim'),('a3dc5169-cc56-4597-9742-6764dd63304d','String','jsonType.label'),('a3dc5169-cc56-4597-9742-6764dd63304d','zoneinfo','user.attribute'),('a3dc5169-cc56-4597-9742-6764dd63304d','true','userinfo.token.claim'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','true','access.token.claim'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','preferred_username','claim.name'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','true','id.token.claim'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','String','jsonType.label'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','username','user.attribute'),('a6bad173-784c-4543-8d3b-198b2d1b7afa','true','userinfo.token.claim'),('a90499fe-db21-4745-b8dc-d630a4e31c15','true','access.token.claim'),('a90499fe-db21-4745-b8dc-d630a4e31c15','profile','claim.name'),('a90499fe-db21-4745-b8dc-d630a4e31c15','true','id.token.claim'),('a90499fe-db21-4745-b8dc-d630a4e31c15','String','jsonType.label'),('a90499fe-db21-4745-b8dc-d630a4e31c15','profile','user.attribute'),('a90499fe-db21-4745-b8dc-d630a4e31c15','true','userinfo.token.claim'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','true','access.token.claim'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','preferred_username','claim.name'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','true','id.token.claim'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','String','jsonType.label'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','username','user.attribute'),('a929e3ce-39a2-4aed-90a8-63be72ee08f5','true','userinfo.token.claim'),('ad757443-580e-4114-97a8-217b5257d9b9','true','access.token.claim'),('ad757443-580e-4114-97a8-217b5257d9b9','realm_access.roles','claim.name'),('ad757443-580e-4114-97a8-217b5257d9b9','String','jsonType.label'),('ad757443-580e-4114-97a8-217b5257d9b9','true','multivalued'),('ad757443-580e-4114-97a8-217b5257d9b9','foo','user.attribute'),('ada5b94b-6039-46b0-a138-00ae476d91cc','true','access.token.claim'),('ada5b94b-6039-46b0-a138-00ae476d91cc','upn','claim.name'),('ada5b94b-6039-46b0-a138-00ae476d91cc','true','id.token.claim'),('ada5b94b-6039-46b0-a138-00ae476d91cc','String','jsonType.label'),('ada5b94b-6039-46b0-a138-00ae476d91cc','username','user.attribute'),('ada5b94b-6039-46b0-a138-00ae476d91cc','true','userinfo.token.claim'),('b1800cbc-52b1-43f3-a194-8f348454cee7','true','access.token.claim'),('b1800cbc-52b1-43f3-a194-8f348454cee7','zoneinfo','claim.name'),('b1800cbc-52b1-43f3-a194-8f348454cee7','true','id.token.claim'),('b1800cbc-52b1-43f3-a194-8f348454cee7','String','jsonType.label'),('b1800cbc-52b1-43f3-a194-8f348454cee7','zoneinfo','user.attribute'),('b1800cbc-52b1-43f3-a194-8f348454cee7','true','userinfo.token.claim'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','true','access.token.claim'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','true','id.token.claim'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','country','user.attribute.country'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','formatted','user.attribute.formatted'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','locality','user.attribute.locality'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','postal_code','user.attribute.postal_code'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','region','user.attribute.region'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','street','user.attribute.street'),('b704d0d8-c777-497a-baeb-1ce7a7405d1c','true','userinfo.token.claim'),('c8f07753-3b68-4186-9746-e87103906a7e','true','access.token.claim'),('c8f07753-3b68-4186-9746-e87103906a7e','gender','claim.name'),('c8f07753-3b68-4186-9746-e87103906a7e','true','id.token.claim'),('c8f07753-3b68-4186-9746-e87103906a7e','String','jsonType.label'),('c8f07753-3b68-4186-9746-e87103906a7e','gender','user.attribute'),('c8f07753-3b68-4186-9746-e87103906a7e','true','userinfo.token.claim'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','true','access.token.claim'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','picture','claim.name'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','true','id.token.claim'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','String','jsonType.label'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','picture','user.attribute'),('d802f6ac-dc55-4749-9d6c-b23d5f4cec29','true','userinfo.token.claim'),('db39f911-b43b-4284-8ced-30834d7068b0','true','access.token.claim'),('db39f911-b43b-4284-8ced-30834d7068b0','phone_number','claim.name'),('db39f911-b43b-4284-8ced-30834d7068b0','true','id.token.claim'),('db39f911-b43b-4284-8ced-30834d7068b0','String','jsonType.label'),('db39f911-b43b-4284-8ced-30834d7068b0','phoneNumber','user.attribute'),('db39f911-b43b-4284-8ced-30834d7068b0','true','userinfo.token.claim'),('de5acb54-dc30-4e41-839f-298e07cae833','true','access.token.claim'),('de5acb54-dc30-4e41-839f-298e07cae833','clientHost','claim.name'),('de5acb54-dc30-4e41-839f-298e07cae833','true','id.token.claim'),('de5acb54-dc30-4e41-839f-298e07cae833','String','jsonType.label'),('de5acb54-dc30-4e41-839f-298e07cae833','clientHost','user.session.note'),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','true','access.token.claim'),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','realm_access.roles','claim.name'),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','String','jsonType.label'),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','true','multivalued'),('e6f4ce44-6503-46cb-aec2-6b4d4e63ecd4','foo','user.attribute'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','true','access.token.claim'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','phone_number_verified','claim.name'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','true','id.token.claim'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','boolean','jsonType.label'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','phoneNumberVerified','user.attribute'),('e9090fc8-26a0-4fe5-b581-380d355ffd0a','true','userinfo.token.claim'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','true','access.token.claim'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','email','claim.name'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','true','id.token.claim'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','String','jsonType.label'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','email','user.attribute'),('f411e9e8-7266-4d07-a8a1-271edc0583cf','true','userinfo.token.claim'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','true','access.token.claim'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','picture','claim.name'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','true','id.token.claim'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','String','jsonType.label'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','picture','user.attribute'),('f7ff13ff-39cd-4b38-a91f-e8d17786df05','true','userinfo.token.claim'),('f8a2db2f-b7d1-47ee-88ea-fcf00b4f965c','Role','attribute.name'),('f8a2db2f-b7d1-47ee-88ea-fcf00b4f965c','Basic','attribute.nameformat'),('f8a2db2f-b7d1-47ee-88ea-fcf00b4f965c','false','single'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','true','access.token.claim'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','profile','claim.name'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','true','id.token.claim'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','String','jsonType.label'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','profile','user.attribute'),('f932b75f-fa29-4b8d-a443-d4d082e08b30','true','userinfo.token.claim'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','true','access.token.claim'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','gender','claim.name'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','true','id.token.claim'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','String','jsonType.label'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','gender','user.attribute'),('fe2e4290-6fa6-4c4b-b616-37c29c4b3a0b','true','userinfo.token.claim'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','true','access.token.claim'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','resource_access.${client_id}.roles','claim.name'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','String','jsonType.label'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','true','multivalued'),('fec192f4-d06e-4e0a-879c-05ef7f91b13b','foo','user.attribute'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','true','access.token.claim'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','phone_number_verified','claim.name'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','true','id.token.claim'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','boolean','jsonType.label'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','phoneNumberVerified','user.attribute'),('ff6e44fb-bd1a-48d9-ab0f-84b19dd13613','true','userinfo.token.claim');
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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','2eb2798b-c29b-4a5a-8997-b0d1f911622f',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','df32d7d7-de1c-4b0c-b5c5-fc60b5f76633','22bafa50-7d96-4102-b718-6a942719f902','45997a21-17fb-4ee8-afa1-05035da64dbe','378b0284-bee9-4908-9fac-f72886a2fcc4','6b8f0d28-6eec-46b7-9db5-f26f5089fcc5',2592000,_binary '\0',900,_binary '',_binary '\0','fcf30cd8-c047-47a7-9345-304ddc3eb228',0,_binary '\0',0,0),('todo-list',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'todo-list',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','deaa3810-aedf-4da8-94cd-f0daece7da25',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','902603d1-b17c-4e24-ab8e-eb5d5d93c840','98a9bb5b-68e2-4600-af2f-cfb7bf43a4dc','55ef27fa-0988-4ebd-bc88-efb7aa6b8343','5592c95e-e328-4127-9b8e-dad9bd217014','7026f563-4879-4df9-9cac-3ba3756cf16b',2592000,_binary '\0',900,_binary '',_binary '\0','9c6bc03b-b268-4678-ac55-6a9ad0346f8e',0,_binary '\0',0,0);
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
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
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
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','todo-list'),('_browser_header.contentSecurityPolicyReportOnly','','master'),('_browser_header.contentSecurityPolicyReportOnly','','todo-list'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','todo-list'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xContentTypeOptions','nosniff','todo-list'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xFrameOptions','SAMEORIGIN','todo-list'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xRobotsTag','none','todo-list'),('_browser_header.xXSSProtection','1; mode=block','master'),('_browser_header.xXSSProtection','1; mode=block','todo-list'),('actionTokenGeneratedByAdminLifespan','43200','todo-list'),('actionTokenGeneratedByUserLifespan','300','todo-list'),('bruteForceProtected','false','master'),('bruteForceProtected','false','todo-list'),('displayName','Keycloak','master'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','master'),('failureFactor','30','todo-list'),('maxDeltaTimeSeconds','43200','master'),('maxDeltaTimeSeconds','43200','todo-list'),('maxFailureWaitSeconds','900','master'),('maxFailureWaitSeconds','900','todo-list'),('minimumQuickLoginWaitSeconds','60','master'),('minimumQuickLoginWaitSeconds','60','todo-list'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespan','5184000','todo-list'),('offlineSessionMaxLifespanEnabled','false','master'),('offlineSessionMaxLifespanEnabled','false','todo-list'),('permanentLockout','false','master'),('permanentLockout','false','todo-list'),('quickLoginCheckMilliSeconds','1000','master'),('quickLoginCheckMilliSeconds','1000','todo-list'),('waitIncrementSeconds','60','master'),('waitIncrementSeconds','60','todo-list'),('webAuthnPolicyAttestationConveyancePreference','not specified','todo-list'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','todo-list'),('webAuthnPolicyAuthenticatorAttachment','not specified','todo-list'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','todo-list'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','todo-list'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','todo-list'),('webAuthnPolicyCreateTimeout','0','todo-list'),('webAuthnPolicyCreateTimeoutPasswordless','0','todo-list'),('webAuthnPolicyRequireResidentKey','not specified','todo-list'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','todo-list'),('webAuthnPolicyRpEntityName','keycloak','todo-list'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','todo-list'),('webAuthnPolicyRpId','','todo-list'),('webAuthnPolicyRpIdPasswordless','','todo-list'),('webAuthnPolicySignatureAlgorithms','ES256','todo-list'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','todo-list'),('webAuthnPolicyUserVerificationRequirement','not specified','todo-list'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','todo-list');
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
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
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
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('master','41bf334d-bb42-45c7-98e0-165f6970374e'),('todo-list','85a4198a-be37-4d04-b81a-13090b758125'),('todo-list','96a5f75f-5bf3-49ca-8e3f-17ba7d8c00af'),('master','b30a0dd6-b756-4f9a-9687-71f7c68ecc1b');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
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
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('todo-list','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
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
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master'),('password','password',_binary '',_binary '','todo-list');
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
INSERT INTO `REDIRECT_URIS` VALUES ('10518c10-7dcb-44a5-a221-c11aa69e032b','/admin/master/console/*'),('37ba1f70-153a-442d-994b-b3509046741d','http://localhost/website/login/oauth2/code/keycloak'),('43dd5258-f161-4f7d-b012-3a446a9db4d2','/realms/master/account/*'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','/realms/todo-list/account/*'),('6b8a5f78-3ce7-4b61-8199-a96d1f7311f7','/realms/todo-list/account/*'),('78e06407-f9d5-4969-bfac-b30de79b681c','/admin/todo-list/console/*'),('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','/realms/master/account/*');
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
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('2d3bed5f-2c37-4cca-9e77-ae2ebe2b11a6','update_user_locale','Update User Locale','todo-list',_binary '',_binary '\0','update_user_locale',1000),('3730a76c-3324-4bab-a255-17b6730a77c6','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('3a634f1a-b9fc-42d2-9004-725e4267c8c5','terms_and_conditions','Terms and Conditions','todo-list',_binary '\0',_binary '\0','terms_and_conditions',20),('40f9f3de-d894-4ee7-bdd0-fd11e82e1237','UPDATE_PROFILE','Update Profile','todo-list',_binary '',_binary '\0','UPDATE_PROFILE',40),('734418b5-b0cb-40e8-94ee-1a737dffac31','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('76ce713a-5601-43af-aa63-55dfcc39678c','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('8a2ff256-3c71-4804-a763-b65baa8c9072','VERIFY_EMAIL','Verify Email','todo-list',_binary '',_binary '\0','VERIFY_EMAIL',50),('a391cb99-3b71-4597-9efe-e2b178043de8','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('a5f3aa59-d918-49f5-884e-8a91aa16143f','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('abcfc70d-3691-475c-a868-ea81dd76800a','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('c3676bf0-fe49-4fc6-8516-779571fd169f','UPDATE_PASSWORD','Update Password','todo-list',_binary '',_binary '\0','UPDATE_PASSWORD',30),('fe420273-5d83-4247-a8b3-2ec22bb11205','CONFIGURE_TOTP','Configure OTP','todo-list',_binary '',_binary '\0','CONFIGURE_TOTP',10);
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
INSERT INTO `RESOURCE_SERVER` VALUES ('37ba1f70-153a-442d-994b-b3509046741d',_binary '','0',1);
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('39fc46a1-d76e-433e-9cd0-34742b42ec4b','Default Policy','A policy that grants access only for users within this realm','js','0','0','37ba1f70-153a-442d-994b-b3509046741d',NULL),('af10b46f-c7c7-4a28-87ac-2b32daec65a2','Default Permission','A permission that applies to the default resource type','resource','1','0','37ba1f70-153a-442d-994b-b3509046741d',NULL);
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
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('18a785f3-824c-441d-9b58-3cc2264ba6d8','Default Resource','urn:application:resources:default',NULL,'37ba1f70-153a-442d-994b-b3509046741d','37ba1f70-153a-442d-994b-b3509046741d',_binary '\0',NULL);
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
INSERT INTO `RESOURCE_URIS` VALUES ('18a785f3-824c-441d-9b58-3cc2264ba6d8','/*');
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
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('9f2d9e02-424b-4e81-96ec-82f4cbbd49dd','d070a657-79fc-4805-9e70-ca505795859e'),('4eb6fc29-4b50-42c5-8c1a-5d5a788f5089','e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41');
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
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
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
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
INSERT INTO `USER_ENTITY` VALUES ('9305be72-5c1e-4304-a44a-cfba2c039253',NULL,'13298612-e21e-4a1e-90e4-c3f915135159',_binary '\0',_binary '',NULL,NULL,NULL,'todo-list','service-account-application',1590510126930,'37ba1f70-153a-442d-994b-b3509046741d',0),('c98f4bd8-844e-41ff-9b83-5a4214554976',NULL,'b11dba07-496b-4e2f-99dd-7bdf9baa583f',_binary '\0',_binary '',NULL,'User',NULL,'todo-list','user',1590510143700,NULL,0),('e6c18707-d668-4fe3-b195-296234c0b8cb',NULL,'9b8ea8c9-103d-4361-b68c-4a14163414a8',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1590509987503,NULL,0);
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
INSERT INTO `USER_ROLE_MAPPING` VALUES ('38bee90b-d5a0-4146-9860-21e1046b9157','9305be72-5c1e-4304-a44a-cfba2c039253'),('85a4198a-be37-4d04-b81a-13090b758125','9305be72-5c1e-4304-a44a-cfba2c039253'),('96a5f75f-5bf3-49ca-8e3f-17ba7d8c00af','9305be72-5c1e-4304-a44a-cfba2c039253'),('e4fe75fc-da67-4225-816a-20515cd2f08e','9305be72-5c1e-4304-a44a-cfba2c039253'),('e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41','9305be72-5c1e-4304-a44a-cfba2c039253'),('85a4198a-be37-4d04-b81a-13090b758125','c98f4bd8-844e-41ff-9b83-5a4214554976'),('96a5f75f-5bf3-49ca-8e3f-17ba7d8c00af','c98f4bd8-844e-41ff-9b83-5a4214554976'),('e4fe75fc-da67-4225-816a-20515cd2f08e','c98f4bd8-844e-41ff-9b83-5a4214554976'),('e54e11b7-fdc4-4777-9ba3-ba4bc10a1d41','c98f4bd8-844e-41ff-9b83-5a4214554976'),('41bf334d-bb42-45c7-98e0-165f6970374e','e6c18707-d668-4fe3-b195-296234c0b8cb'),('b30a0dd6-b756-4f9a-9687-71f7c68ecc1b','e6c18707-d668-4fe3-b195-296234c0b8cb'),('cad3bea2-ac56-4b37-a68b-b0580f7dc284','e6c18707-d668-4fe3-b195-296234c0b8cb'),('cefab88b-8d25-4bc6-9271-7d8cdbca182a','e6c18707-d668-4fe3-b195-296234c0b8cb'),('d070a657-79fc-4805-9e70-ca505795859e','e6c18707-d668-4fe3-b195-296234c0b8cb');
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
INSERT INTO `WEB_ORIGINS` VALUES ('10518c10-7dcb-44a5-a221-c11aa69e032b','+'),('78e06407-f9d5-4969-bfac-b30de79b681c','+');
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

-- Dump completed on 2020-05-26 16:28:40
