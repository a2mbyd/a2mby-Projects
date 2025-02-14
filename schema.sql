-- Represent users in social app
CREATE TABLE "users" (
    "id" INTEGER ,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL, -- password should be hashed!!!!
    "birth_year" INTEGER NOT NULL CHECK("birth_year" > 1900 AND "birth_year" < 2025),
    "started" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

-- Represent all posts whith thier interactions in the social app
CREATE TABLE "posts" (
    "id" INTEGER ,
    "type" TEXT NOT NULL CHECK (lower("type") IN ('private', 'public', 'archived')),
    "likes" INTEGER DEFAULT 0 CHECK ("likes" >= 0),
    "comments" INTEGER DEFAULT 0  CHECK("comments" >= 0),
    "shares" INTEGER DEFAULT 0 CHECK("shares" >= 0),
    "post_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "content" TEXT NOT NULL,
    "deleted" INTEGER DEFAULT 0 CHECK("deleted" IN (0, 1)),
    PRIMARY KEY ("id")
);

-- Represent the relationship between users <-> posts
CREATE TABLE "posted" (
    "user_id" INTEGER,
    "post_id" INTEGER,
    PRIMARY KEY("user_id", "post_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("post_id") REFERENCES "posts"("id") ON DELETE CASCADE
);

-- Represent the likes of users for posts
CREATE TABLE "post_likes" (
    "user_id" INTEGER,
    "post_id" INTEGER,
    "like_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("user_id", "post_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("post_id") REFERENCES "posts"("id") ON DELETE CASCADE
);

-- Represent the shares of users for posts
CREATE TABLE "post_shares" (
   "user_id" INTEGER,
    "post_id" INTEGER,
    "share_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("user_id", "post_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("post_id") REFERENCES "posts"("id") ON DELETE CASCADE
);

-- Represent the comments of users for posts
CREATE TABLE "post_comments" (
    "user_id" INTEGER,
    "post_id" INTEGER,
    "comment_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "content" TEXT NOT NULL CHECK(LENGTH("content") > 0),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("post_id") REFERENCES "posts"("id") ON DELETE CASCADE
);

-- Represent all stories whith thier interactions in the social app
CREATE TABLE "stories" (
    "id" INTEGER ,
    "likes" INTEGER DEFAULT 0 CHECK ("likes" >= 0),
    "comments" INTEGER DEFAULT 0 CHECK("comments" >= 0),
    "shares" INTEGER DEFAULT 0 CHECK("shares" >= 0),
    "duration" INTEGER NOT NULL CHECK ("duration" >= 0 AND "duration" <= 24),
    "deleted" INTEGER DEFAULT 0 CHECK("deleted" IN (0, 1)),
    PRIMARY KEY ("id")
);

-- Represent the relationship between users <-> stories
CREATE TABLE "storied" (
    "user_id" INTEGER,
    "story_id" INTEGER,
    PRIMARY KEY("user_id", "story_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("story_id") REFERENCES "stories"("id") ON DELETE CASCADE
);

-- Represent the likes of users for stories
CREATE TABLE "story_likes" (
    "user_id" INTEGER,
    "story_id" INTEGER,
    "like_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("user_id", "story_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("story_id") REFERENCES "stories"("id") ON DELETE CASCADE
);

-- Represent the shares of users for stories
CREATE TABLE "story_shares" (
   "user_id" INTEGER,
    "story_id" INTEGER,
    "share_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("user_id", "story_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("story_id") REFERENCES "stories"("id") ON DELETE CASCADE
);

-- Represent the comments of users for stories
CREATE TABLE "story_comments" (
    "user_id" INTEGER,
    "story_id" INTEGER,
    "comment_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "content" TEXT NOT NULL CHECK(LENGTH("content") > 0),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("story_id") REFERENCES "stories"("id") ON DELETE CASCADE
);

-- Represent all communities on the social app
CREATE TABLE "communities" (
    "id" INTEGER ,
    "name" TEXT UNIQUE NOT NULL ,
    "founded" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "founder_id" INTEGER NOT NULL,
    "capacity" INTEGER NOT NULL CHECK("capacity" > 1),
    "genre" TEXT DEFAULT 'General',
    PRIMARY KEY ("id"),
    FOREIGN KEY("founder_id") REFERENCES "users"("id") ON DELETE CASCADE
);

-- Represent the relationship of users joinning communities
CREATE TABLE "community_members" (
    "user_id" INTEGER,
    "community_id" INTEGER,
    PRIMARY KEY("user_id", "community_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("community_id") REFERENCES "communities"("id") ON DELETE CASCADE
);

-- Represent all groups on the social app
CREATE TABLE "groups" (
    "id" INTEGER ,
    "name" TEXT UNIQUE NOT NULL,
    "type" TEXT DEFAULT 'private' CHECK(lower("type") IN ('private', 'public')),
    PRIMARY KEY ("id")
);

-- Represent the relationship of users joinning groups
CREATE TABLE "group_members" (
    "user_id" INTEGER,
    "group_id" INTEGER,
    PRIMARY KEY("user_id", "group_id"),
    FOREIGN KEY("group_id") REFERENCES "groups"("id") ON DELETE CASCADE,
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE
);

-- Represent the relationship between pairs of users on this app
CREATE TABLE "friends" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    "type" TEXT NOT NULL CHECK(lower("type") IN ('close', 'acquaintance')),
    PRIMARY KEY ("user1_id", "user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("user2_id") REFERENCES "users"("id") ON DELETE CASCADE
);

-- Represent all messages between pairs of users on this app
CREATE TABLE "messages" (
    "id" INTEGER PRIMARY KEY,
    "from_user_id" INTEGER,
    "to_user_id" INTEGER,
    "content" TEXT NOT NULL CHECK(LENGTH("content") > 0),
    "timestamp" DATETIME DEFAULT CURRENT_TIMESTAMP CHECK("timestamp" <= CURRENT_TIMESTAMP),
    "seen" INTEGER DEFAULT 0 CHECK("seen" IN (0, 1)),
    FOREIGN KEY("from_user_id") REFERENCES "users"("id") ON DELETE SET NULL,
    FOREIGN KEY("to_user_id") REFERENCES "users"("id") ON DELETE SET NULL
);

-- Represent all schools could users study in
CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded" TEXT NULL,
    PRIMARY KEY(id)
);

-- Represent all companies could users work in
CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY(id)
);

-- Represent all colleges could users study in
CREATE TABLE "colleges" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK (lower("type") IN ('private', 'public')),
    "location" TEXT NOT NULL,
    PRIMARY KEY(id)
);

-- Represent all universities could users study in
CREATE TABLE "universities" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL CHECK (lower("type") IN ('private', 'public')),
    "location" TEXT NOT NULL,
    PRIMARY KEY(id)
);

-- Represent the profile for each user
CREATE TABLE "profiles" (
    "user_id" INTEGER,
    "bio" TEXT NULL,
    "pfp_url" TEXT NOT NULL, -- it won't insert null url, cuz with backend, I can Insert url of default pfp as default value
    "location" TEXT NULL,
    "marital_status" CHECK (lower("marital_status") IN ('single', 'engaged', 'married')),
    "phone_number" NUMERIC NULL,
    "social_links" TEXT NULL,
    "visibility" TEXT NOT NULL CHECK (lower("visibility") IN ('online', 'invisible', 'idle')),
    "company_id" INTEGER NULL,
    "school_id" INTEGER NULL,
    "university_id" INTEGER NULL,
    "college_id" INTEGER NULL,
    "deleted" INTEGER DEFAULT 0 CHECK("deleted" IN (0, 1)),
    PRIMARY KEY("user_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE,
    FOREIGN KEY("school_id") REFERENCES "schools"("id") ON DELETE SET NULL,
    FOREIGN KEY("company_id") REFERENCES "companies"("id") ON DELETE SET NULL,
    FOREIGN KEY("college_id") REFERENCES "colleges"("id") ON DELETE SET NULL,
    FOREIGN KEY("university_id") REFERENCES "universities"("id") ON DELETE SET NULL
);

-- Represent user logs in a table
CREATE TABLE "user_logs" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER,
    "action" TEXT NOT NULL,
    "timestamp" NUMERIC DEFAULT CURRENT_TIMESTAMP CHECK("timestamp" <= CURRENT_TIMESTAMP),
    FOREIGN KEY("user_id") REFERENCES "users"("id") ON DELETE CASCADE
);

-- Create indexes to speed up some common redundent queries:

-- this index to speed the relationship between users and their posts searching up
CREATE INDEX "posts_users_index" ON "posted"("post_id", "user_id");

-- this index to speed the relationship between users and their stories searching up
CREATE INDEX "stories_users_index" ON "storied"("story_id", "user_id");


-- this index to speed searching process of a username
CREATE INDEX "usernames_index" ON "users"("username");

-- this index to speed searching process of a school as the number of schools is way bigger then colleges, universities and companies
CREATE INDEX "schools_index" ON "schools"("name");

-- this index helps to figure the members of a community out rapidly
CREATE INDEX "community_members_index" ON "community_members"("user_id");

-- this index helps to get the message between pair of users and look its content up efficiently
CREATE INDEX "messages_from_to_content_index" ON "messages"("from_user_id", "to_user_id", "content");

-- this index gets all users who liked posts rapidly
CREATE INDEX "post_likes_index" ON "post_likes"("user_id");

-- this index to look up all not deleted posts on the app
CREATE INDEX "available_posts_index" ON "posts"("id")
    WHERE "deleted" = 0;

-- this index to look up all  deleted posts on the app
CREATE INDEX "deleted_posts_index" ON "posts"("id")
    WHERE "deleted" = 1;

-- this index to look up all not deleted stories on the app
CREATE INDEX "available_stories_index" ON "stories"("id")
    WHERE "deleted" = 0;

-- this index to look up all  deleted stories on the app
CREATE INDEX "deleted_stories_index" ON "stories"("id")
    WHERE "deleted" = 1;

-- Prevent liking a deleted post
CREATE TRIGGER "prevent_liking_deleted_post"
BEFORE INSERT ON "post_likes"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "posts" WHERE "id" = NEW."post_id") = 1
        THEN RAISE(ABORT, "Can't like deleted post")
    END;
END;

-- Prevent commenting on a deleted post
CREATE TRIGGER "prevent_commenting_deleted_post"
BEFORE INSERT ON "post_comments"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "posts" WHERE "id" = NEW."post_id") = 1
        THEN RAISE(ABORT, "Can't comment on deleted post")
    END;
END;

-- Prevent sharing a deleted post
CREATE TRIGGER "prevent_sharing_deleted_post"
BEFORE INSERT ON "post_shares"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "posts" WHERE "id" = NEW."post_id") = 1
        THEN RAISE(ABORT, "Can't share deleted post")
    END;
END;

-- Prevent liking a deleted story
CREATE TRIGGER "prevent_liking_deleted_story"
BEFORE INSERT ON "story_likes"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "stories" WHERE "id" = NEW."story_id") = 1
        THEN RAISE(ABORT, "Can't like deleted story")
    END;
END;

-- Prevent commenting on a deleted story
CREATE TRIGGER "prevent_commenting_deleted_story"
BEFORE INSERT ON "story_comments"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "stories" WHERE "id" = NEW."story_id") = 1
        THEN RAISE(ABORT, "Can't comment on deleted story")
    END;
END;

-- Prevent sharing a deleted story
CREATE TRIGGER "prevent_sharing_deleted_story"
BEFORE INSERT ON "story_shares"
FOR EACH ROW
BEGIN
    SELECT CASE
        WHEN (SELECT "deleted" FROM "stories" WHERE "id" = NEW."story_id") = 1
        THEN RAISE(ABORT, "Can't share deleted story")
    END;
END;


-- this trigger keeps tracking the users who liked certain posts then increments likes number in posts table
CREATE TRIGGER "post_liking"
AFTER INSERT ON "post_likes"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "likes" = "likes" + 1
    WHERE "id" = NEW."post_id";
END;

-- this trigger keeps tracking the users who commented certain posts then increments comments number in posts table
CREATE TRIGGER "post_commenting"
AFTER INSERT ON "post_comments"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "comments" = "comments" + 1
    WHERE "id" = NEW."post_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who shared certain posts then increments shares number in posts table
CREATE TRIGGER "post_sharing"
AFTER INSERT ON "post_shares"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "shares" = "shares" + 1
    WHERE "id" = NEW."post_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who liked certain stories then increments likes number in stories table
CREATE TRIGGER "story_liking"
AFTER INSERT ON "story_likes"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "likes" = "likes" + 1
    WHERE "id" = NEW."story_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who commented certain stories then increments comments number in stories table
CREATE TRIGGER "story_commenting"
AFTER INSERT ON "story_comments"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "comments" = "comments" + 1
    WHERE "id" = NEW."story_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who shared certain stories then increments shares number in stories table
CREATE TRIGGER "story_sharing"
AFTER INSERT ON "story_shares"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "shares" = "shares" + 1
    WHERE "id" = NEW."story_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who unliked certain posts then decrements likes number in posts table
CREATE TRIGGER "post_unliking"
AFTER DELETE ON "post_likes"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "likes" = "likes" - 1
    WHERE "id" = OLD."post_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who uncommented certain posts then decrements comments number in posts table
CREATE TRIGGER "post_uncommenting"
AFTER DELETE ON "post_comments"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "comments" = "comments" - 1
    WHERE "id" = OLD."post_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who unshared certain posts then decrements shares number in posts table
CREATE TRIGGER "post_unsharing"
AFTER DELETE ON "post_shares"
FOR EACH ROW
BEGIN
    UPDATE "posts"
    SET "shares" = "shares" - 1
    WHERE "id" = OLD."post_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who unliked certain stories then decrements likes number in stories table
CREATE TRIGGER "story_unliking"
AFTER DELETE ON "story_likes"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "likes" = "likes" - 1
    WHERE "id" = OLD."story_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who uncommented certain stories then decrements comments number in stories table
CREATE TRIGGER "story_uncommenting"
AFTER DELETE ON "story_comments"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "comments" = "comments" - 1
    WHERE "id" = OLD."story_id" AND "deleted" = 0;
END;

-- this trigger keeps tracking the users who unshared certain stories then decrements shares number in stories table
CREATE TRIGGER "story_unsharing"
AFTER DELETE ON "story_shares"
FOR EACH ROW
BEGIN
    UPDATE "stories"
    SET "shares" = "shares" - 1
    WHERE "id" = OLD."story_id";
END;

-- This view shows all not deleted posts
CREATE VIEW "available_posts" AS
    SELECT "type", "likes", "comments", "shares", "post_date"
    FROM "posts" WHERE "deleted" = 0;

-- This view shows all  deleted posts
CREATE VIEW "deleted_posts" AS
    SELECT "type", "likes", "comments", "shares", "post_date"
    FROM "posts" WHERE "deleted" = 1;

-- This view shows all not deleted stories
CREATE VIEW "available_stories" AS
    SELECT "duration", "likes", "comments", "shares"
    FROM "stories" WHERE "deleted" = 0;

-- This view shows all  deleted stories
CREATE VIEW "deleted_stories" AS
    SELECT "duration", "likes", "comments", "shares"
    FROM "stories" WHERE "deleted" = 1;

-- This view shows all user essential information
CREATE VIEW "user_info" AS
    SELECT "username",
        COUNT( "user1_id") AS "total friends",
        (2025 - "users"."birth_year") AS "age"
    FROM "users"
    LEFT JOIN "friends" ON "friends"."user1_id" = "users"."id"
    GROUP BY "user1_id";

-- This view unions all user interactions on this app
CREATE VIEW "user_interactions" AS
    SELECT
        "users"."id",
        "users"."username",
        COUNT(DISTINCT "posts"."id") AS "total posts",
        COUNT(DISTINCT "stories"."id") AS "total stories",
        COUNT(DISTINCT "post_likes"."user_id") AS "post_likes",
        COUNT(DISTINCT "post_comments"."user_id") AS "post_comments",
        COUNT(DISTINCT "post_shares"."user_id") AS "post_shares",
        COUNT(DISTINCT "story_likes"."user_id") AS "story_likes",
        COUNT(DISTINCT "story_comments"."user_id") AS "story_comments",
        COUNT(DISTINCT "story_shares"."user_id") AS "story_shares"
    FROM "users"
    LEFT JOIN "posted" ON "posted"."user_id" = "users"."id"
    LEFT JOIN "posts" ON "posted"."post_id" = "posts"."id"
    LEFT JOIN "storied" ON "storied"."user_id" = "users"."id"
    LEFT JOIN "stories" ON "storied"."story_id" = "stories"."id"
    LEFT JOIN "post_likes" ON "post_likes"."post_id" = "posts"."id"
    LEFT JOIN "post_comments" ON "post_comments"."post_id" = "posts"."id"
    LEFT JOIN "post_shares" ON "post_shares"."post_id" = "posts"."id"
    LEFT JOIN "story_likes" ON "story_likes"."story_id" = "stories"."id"
    LEFT JOIN "story_comments" ON "story_comments"."story_id" = "stories"."id"
    LEFT JOIN "story_shares" ON "story_shares"."story_id" = "stories"."id"
    GROUP BY "users"."id";
