BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "orders" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"product_id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"quantity"	integer NOT NULL DEFAULT '1',
	"address"	varchar,
	"is_delivered"	tinyint(1) NOT NULL DEFAULT '0',
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime
);
CREATE TABLE IF NOT EXISTS "products" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar NOT NULL,
	"description"	varchar NOT NULL,
	"units"	integer NOT NULL DEFAULT '0',
	"price"	float NOT NULL,
	"image"	varchar NOT NULL,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime
);
CREATE TABLE IF NOT EXISTS "oauth_personal_access_clients" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"client_id"	integer NOT NULL,
	"created_at"	datetime,
	"updated_at"	datetime
);
CREATE TABLE IF NOT EXISTS "oauth_clients" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer,
	"name"	varchar NOT NULL,
	"secret"	varchar NOT NULL,
	"redirect"	text NOT NULL,
	"personal_access_client"	tinyint(1) NOT NULL,
	"password_client"	tinyint(1) NOT NULL,
	"revoked"	tinyint(1) NOT NULL,
	"created_at"	datetime,
	"updated_at"	datetime
);
CREATE TABLE IF NOT EXISTS "oauth_refresh_tokens" (
	"id"	varchar NOT NULL,
	"access_token_id"	varchar NOT NULL,
	"revoked"	tinyint(1) NOT NULL,
	"expires_at"	datetime,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "oauth_access_tokens" (
	"id"	varchar NOT NULL,
	"user_id"	integer,
	"client_id"	integer NOT NULL,
	"name"	varchar,
	"scopes"	text,
	"revoked"	tinyint(1) NOT NULL,
	"created_at"	datetime,
	"updated_at"	datetime,
	"expires_at"	datetime,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "oauth_auth_codes" (
	"id"	varchar NOT NULL,
	"user_id"	integer NOT NULL,
	"client_id"	integer NOT NULL,
	"scopes"	text,
	"revoked"	tinyint(1) NOT NULL,
	"expires_at"	datetime,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "password_resets" (
	"email"	varchar NOT NULL,
	"token"	varchar NOT NULL,
	"created_at"	datetime
);
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar NOT NULL,
	"email"	varchar NOT NULL,
	"is_admin"	tinyint(1) NOT NULL DEFAULT '0',
	"password"	varchar NOT NULL,
	"remember_token"	varchar,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime
);
CREATE TABLE IF NOT EXISTS "migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"migration"	varchar NOT NULL,
	"batch"	integer NOT NULL
);
INSERT INTO "orders" VALUES (1,1,2,1,'Snabbvingegatan 29',1,'2020-01-20 11:08:51','2020-01-20 11:29:18',NULL);
INSERT INTO "orders" VALUES (2,1,3,1,'Snabbvingegatan 29',1,'2020-01-20 11:29:12','2020-01-20 11:29:27',NULL);
INSERT INTO "products" VALUES (1,'Death Star','One and only deathstar',1,200.0,'https://cdn.shopify.com/s/files/1/0030/4227/9494/products/sw-death-star-neon-light-01_800x.progressive.jpg?v=1574306724','2020-01-20 11:07:25','2020-01-20 11:07:25',NULL);
INSERT INTO "products" VALUES (2,'Wonder women tofflor','Kän dig varm i dessa tofflor',15,300.0,'https://cdn.shopify.com/s/files/1/1375/9903/products/wonder-woman-retro-dc-comics-slippers-white-bg-01_800x.progressive.jpg?v=1577566856','2020-01-20 11:07:25','2020-01-20 11:07:25',NULL);
INSERT INTO "products" VALUES (3,'Test','Test product',10,240.0,'http://127.0.0.1:8000/images/1579520714_rpg-468920_1920.jpg','2020-01-20 11:45:14','2020-01-20 11:45:14',NULL);
INSERT INTO "oauth_personal_access_clients" VALUES (1,1,'2020-01-20 11:06:54','2020-01-20 11:06:54');
INSERT INTO "oauth_personal_access_clients" VALUES (2,3,'2020-01-20 11:07:08','2020-01-20 11:07:08');
INSERT INTO "oauth_clients" VALUES (1,NULL,'Laravel Personal Access Client','5vkFlTFie2pE1RWzUuprhtRcxNjKtVnY0D0VFBit','http://localhost',1,0,0,'2020-01-20 11:06:54','2020-01-20 11:06:54');
INSERT INTO "oauth_clients" VALUES (2,NULL,'Laravel Password Grant Client','Fpoki6Box9dAmh2np8kOs9kV40IJD6RkkE68dQRT','http://localhost',0,1,0,'2020-01-20 11:06:54','2020-01-20 11:06:54');
INSERT INTO "oauth_clients" VALUES (3,NULL,'Laravel Personal Access Client','VFMzRiz38oU5TGyOhTpSjS3LMYTECvBImTEyJEbx','http://localhost',1,0,0,'2020-01-20 11:07:08','2020-01-20 11:07:08');
INSERT INTO "oauth_clients" VALUES (4,NULL,'Laravel Password Grant Client','Wt6xpdmOZDB1jXjdo0K9Zix9ZyaXdxTLvKExxc8h','http://localhost',0,1,0,'2020-01-20 11:07:08','2020-01-20 11:07:08');
INSERT INTO "oauth_access_tokens" VALUES ('f494e4ce67b1f2fe13f8e9a700c3a2d9655987970e32f5d83c84dcb56fa5fdd555f60692491c2031',2,3,'bigStore','[]',0,'2020-01-20 11:08:27','2020-01-20 11:08:27','2021-01-20 11:08:27');
INSERT INTO "oauth_access_tokens" VALUES ('99f2fcb27be568991adc26c14bb86e5d5e58d15c83274ebae147bcf08c683f2354cde8780618f511',2,3,'bigStore','[]',0,'2020-01-20 11:09:39','2020-01-20 11:09:39','2021-01-20 11:09:39');
INSERT INTO "oauth_access_tokens" VALUES ('8905c3276e782eab4320b7e4bc6301c51a9711924507ffddc4294b4c38d05f30e204697c855bb31d',2,3,'bigStore','[]',0,'2020-01-20 11:10:34','2020-01-20 11:10:34','2021-01-20 11:10:34');
INSERT INTO "oauth_access_tokens" VALUES ('dad35dd0f96b8fe8c7d0f5e0b7371e16fb6678b0332c96e8b541ef44fa8217a8da266307f41eddde',2,3,'bigStore','[]',0,'2020-01-20 11:14:05','2020-01-20 11:14:05','2021-01-20 11:14:05');
INSERT INTO "oauth_access_tokens" VALUES ('a4412fde240cf6d5366287cec8d9cdf653603e826978c7db5fc85447b4c1d669eb221d142f68b952',2,3,'bigStore','[]',0,'2020-01-20 11:14:28','2020-01-20 11:14:28','2021-01-20 11:14:28');
INSERT INTO "oauth_access_tokens" VALUES ('459808a412659564cbc6b8dbf9a70d383e9b91e2c20df68a583fb54b7be911ccd4ff3cf2004b9ae1',3,3,'bigStore','[]',0,'2020-01-20 11:15:32','2020-01-20 11:15:32','2021-01-20 11:15:32');
INSERT INTO "oauth_access_tokens" VALUES ('680c9d11e51f27a5c7a401d9d41641a8fe8dfca94fa1a7c0e040e0c1151f4c890dc1e4a7176929c3',3,3,'bigStore','[]',0,'2020-01-20 11:16:39','2020-01-20 11:16:39','2021-01-20 11:16:39');
INSERT INTO "oauth_access_tokens" VALUES ('a21d73e63cefa8c77fffe73de44ec61667da23a17a5b323199e0f79b713e41046d8d8186d1329dd6',2,3,'bigStore','[]',0,'2020-01-20 11:29:36','2020-01-20 11:29:36','2021-01-20 11:29:36');
INSERT INTO "oauth_access_tokens" VALUES ('0c1aa6a93700c1935d7c908d1f856f6a70303820a210e918f785354417fb8654f886ec206cfdc870',3,3,'bigStore','[]',0,'2020-01-20 11:43:34','2020-01-20 11:43:34','2021-01-20 11:43:34');
INSERT INTO "users" VALUES (1,'Admin','admin@devtest.com',1,'$2y$10$avNpoqDnBeQ4sbllxbZOWuMQnegmAAiIfmyomx5QoeD/nQRKuV5eS',NULL,'2020-01-20 11:07:25','2020-01-20 11:07:25',NULL);
INSERT INTO "users" VALUES (2,'Anel Poturovic','poturovic_anel@hotmail.se',0,'$2y$10$Y/lR6kYmFVnKyGehmA3mLenxhYWt4qUfMFhNCtyX5BsPX0rdk3Zzm',NULL,'2020-01-20 11:08:27','2020-01-20 11:08:27',NULL);
INSERT INTO "users" VALUES (3,'Admin test','admin@test.se',1,'$2y$10$jBB2j6KSsOgXJ8WM9JEMMu7zEYZyUkMaEmi9Jaj.VFGDwUm4NYwi.',NULL,'2020-01-20 11:15:32','2020-01-20 11:15:32',NULL);
INSERT INTO "migrations" VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO "migrations" VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO "migrations" VALUES (3,'2016_06_01_000001_create_oauth_auth_codes_table',1);
INSERT INTO "migrations" VALUES (4,'2016_06_01_000002_create_oauth_access_tokens_table',1);
INSERT INTO "migrations" VALUES (5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1);
INSERT INTO "migrations" VALUES (6,'2016_06_01_000004_create_oauth_clients_table',1);
INSERT INTO "migrations" VALUES (7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
INSERT INTO "migrations" VALUES (8,'2020_01_19_171426_create_products_table',1);
INSERT INTO "migrations" VALUES (9,'2020_01_19_171500_create_orders_table',1);
CREATE INDEX IF NOT EXISTS "oauth_personal_access_clients_client_id_index" ON "oauth_personal_access_clients" (
	"client_id"
);
CREATE INDEX IF NOT EXISTS "oauth_clients_user_id_index" ON "oauth_clients" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "oauth_refresh_tokens_access_token_id_index" ON "oauth_refresh_tokens" (
	"access_token_id"
);
CREATE INDEX IF NOT EXISTS "oauth_access_tokens_user_id_index" ON "oauth_access_tokens" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "password_resets_email_index" ON "password_resets" (
	"email"
);
CREATE UNIQUE INDEX IF NOT EXISTS "users_email_unique" ON "users" (
	"email"
);
COMMIT;
