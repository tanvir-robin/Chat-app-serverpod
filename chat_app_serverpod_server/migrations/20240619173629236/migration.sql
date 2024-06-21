BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "chat" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "sender" text NOT NULL,
    "sent" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "messages" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "sender" text NOT NULL,
    "sent" timestamp without time zone
);


--
-- MIGRATION VERSION FOR chat_app_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chat_app_serverpod', '20240619173629236', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240619173629236', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
