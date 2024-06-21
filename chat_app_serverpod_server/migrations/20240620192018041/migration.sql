BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "messages" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "messages" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "sender" text NOT NULL,
    "receiver" text NOT NULL,
    "sent" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "usermessage" (
    "id" bigserial PRIMARY KEY,
    "message" text NOT NULL,
    "sender" text NOT NULL,
    "sent" timestamp without time zone,
    "status" text NOT NULL,
    "reactions" json,
    "reactionsUsers" json,
    "replyMessages" json NOT NULL
);


--
-- MIGRATION VERSION FOR chat_app_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chat_app_serverpod', '20240620192018041', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240620192018041', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
