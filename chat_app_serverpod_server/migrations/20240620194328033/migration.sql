BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "usermessage" ALTER COLUMN "replyMessages" DROP NOT NULL;

--
-- MIGRATION VERSION FOR chat_app_serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chat_app_serverpod', '20240620194328033', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240620194328033', "timestamp" = now();

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
