CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar NOT NULL, "course_picture" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "admin" boolean, "instructor" boolean, "profile_picture" varchar, "date_of_birth" varchar, "gender" varchar, "name" varchar DEFAULT '' NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_courses_on_user_id" ON "courses" ("user_id");
CREATE TABLE "lectures" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "content" text, "attached_file" varchar, "course_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_lectures_on_course_id" ON "lectures" ("course_id");
CREATE TABLE "votes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "votable_id" integer, "votable_type" varchar, "voter_id" integer, "voter_type" varchar, "vote_flag" boolean, "vote_scope" varchar, "vote_weight" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_votes_on_voter_id_and_voter_type_and_vote_scope" ON "votes" ("voter_id", "voter_type", "vote_scope");
CREATE INDEX "index_votes_on_votable_id_and_votable_type_and_vote_scope" ON "votes" ("votable_id", "votable_type", "vote_scope");
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "lecture_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO schema_migrations (version) VALUES ('20160502193057');

INSERT INTO schema_migrations (version) VALUES ('20160502193451');

INSERT INTO schema_migrations (version) VALUES ('20160503144833');

INSERT INTO schema_migrations (version) VALUES ('20160503181418');

INSERT INTO schema_migrations (version) VALUES ('20160503204624');

INSERT INTO schema_migrations (version) VALUES ('20160504230228');

