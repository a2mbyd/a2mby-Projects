-- adding 10 users for the app
INSERT INTO users (first_name, last_name, username, password, birth_year)
VALUES
('John', 'Doe', 'JohnDoe01', 'e99a18c428cb38d5f260853678922e03', 1990),
('Jane', 'Smith', 'JaneSmith02', '2c6ee24b09816a6f14f95d1698b24ead', 1992),
('Alex', 'Johnson', 'AlexJohnson03', '3d4d7e62e6adfa742ccbcf9033000a9b', 1995),
('Emily', 'Davis', 'EmilyDavis04', 'ad0234829205b9033196ba818f7a872b', 1996),
('Michael', 'Brown', 'MichaelBrown05', '8c6976e5b5410415bde908bd4dee15df', 1998),
('Sarah', 'Wilson', 'SarahWilson06', '36a8b1c4ee70865db283b1f9644b29f0', 1999),
('David', 'Taylor', 'DavidTaylor07', '9c56b798d96cb9c4a182244d08fbd2d5', 1994),
('Laura', 'Anderson', 'LauraAnderson08', '13c5cf687d507d27adf42c566f48a935', 1991),
('Daniel', 'Thomas', 'DanielThomas09', 'b5a67e1565fc11d52e6e35759f0b1d1e', 1993),
('Olivia', 'Jackson', 'OliviaJackson10', 'acb09b209ee1c3df69d35d0836729b99', 2000);

-- adding posts on the app, noting that interactions, deleted and post_date are on default values
INSERT INTO posts (type, content)
VALUES
('public', 'Exploring the beauty of nature!'),
('private', 'Personal thoughts on today’s events.'),
('public', 'Tech trends in 2025.'),
('archived', 'Old memories from college.'),
('public', 'Best coding practices for beginners.'),
('private', 'A journal entry about my progress.'),
('archived', 'A throwback to my first blog post.'),
('public', 'Exciting travel plans ahead!'),
('private', 'Reflections on recent challenges.'),
('public', 'Favorite movies of all time.'),
('private', 'Things I am grateful for today.'),
('public', 'A guide to healthy eating.'),
('archived', 'Memories from my first job.'),
('private', 'Goals for the next five years.'),
('public', 'Top 10 books to read this year.'),
('archived', 'Lessons learned from past mistakes.'),
('private', 'A letter to my future self.'),
('public', 'Photography tips for beginners.'),
('private', 'Some deep late-night thoughts.'),
('archived', 'My first painting and its story.'),
('public', 'Upcoming community event details.'),
('private', 'A playlist of songs that inspire me.'),
('public', 'The best travel destinations this year.'),
('archived', 'A collection of old poems I wrote.'),
('private', 'Writing down my dreams for the future.'),
('public', 'How to stay productive while working.'),
('archived', 'A childhood story I always cherish.'),
('private', 'A personal update on life.'),
('public', 'Debunking common tech myths.'),
('archived', 'An old but gold photography moment.');


-- Mapping users with posts
INSERT INTO posted (user_id, post_id)
VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
(5, 21), (5, 22), (5, 23), (5, 24), (5, 25),
(6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
(7, 1), (7, 2), (7, 3), (7, 4), (7, 5),
(8, 6), (8, 7), (8, 8), (8, 9), (8, 10),
(9, 11), (9, 12), (9, 13), (9, 14), (9, 15),
(10, 16), (10, 17), (10, 18), (10, 19), (10, 20);

-- adding likes to posts
INSERT INTO post_likes (user_id, post_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1),
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 10), (9, 1), (10, 2),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(6, 26), (7, 27), (8, 28), (9, 29), (10, 30),
(1, 12), (2, 13), (3, 14), (4, 15), (5, 16),
(6, 17), (7, 18), (8, 19), (9, 20), (10, 21),
(1, 23), (2, 24), (3, 25), (4, 26), (5, 27),
(6, 28), (7, 29), (8, 30), (9, 11), (10, 12);

-- adding comments to posts
INSERT INTO post_comments (user_id, post_id, content)
VALUES
(1, 1, 'Great post!'), (2, 2, 'Interesting content'), (3, 3, 'I love this!'), (4, 4, 'Nice one'), (5, 5, 'Cool post'),
(6, 6, 'Amazing content'), (7, 7, 'Well written'), (8, 8, 'Very informative'), (9, 9, 'Nice share'), (10, 10, 'Good job'),
(1, 2, 'Awesome!'), (2, 3, 'Loved it!'), (3, 4, 'Well done'), (4, 5, 'Great idea'), (5, 6, 'Very creative'),
(6, 7, 'I like it'), (7, 8, 'Fantastic post'), (8, 9, 'Helpful!'), (9, 10, 'Interesting stuff'), (10, 1, 'Loved this post'),
(1, 3, 'Very nice'), (2, 4, 'Great insights'), (3, 5, 'Fantastic work'), (4, 6, 'Good post!'), (5, 7, 'Interesting thoughts'),
(6, 8, 'Nice content'), (7, 9, 'Cool stuff'), (8, 10, 'Very good post'), (9, 1, 'Interesting read'), (10, 2, 'Well done'),
(1, 11, 'Great discussion here!'), (2, 12, 'Informative post!'), (3, 13, 'Nice idea'), (4, 14, 'Very creative'), (5, 15, 'Love this!'),
(6, 16, 'I agree with the points made'), (7, 17, 'Interesting perspective'), (8, 18, 'Well written post!'), (9, 19, 'Helpful post'), (10, 20, 'Good thoughts'),
(1, 21, 'Thanks for sharing!'), (2, 22, 'Very helpful content'), (3, 23, 'Interesting post, I’ll share this!'), (4, 24, 'Great points made'), (5, 25, 'This is insightful'),
(6, 26, 'Awesome!'), (7, 27, 'Would love to see more of this'), (8, 28, 'Great work!'), (9, 29, 'Really liked this post'), (10, 30, 'Loved reading this'),
(1, 12, 'Awesome content!'), (2, 13, 'Fantastic post!'), (3, 14, 'This is exactly what I needed'), (4, 15, 'Great discussion!'), (5, 16, 'Loved this one'),
(6, 17, 'Such an interesting read'), (7, 18, 'Well explained'), (8, 19, 'Amazing post!'), (9, 20, 'I appreciate this article'), (10, 21, 'Incredible post!'),
(1, 23, 'I really enjoyed this!'), (2, 24, 'Helpful and practical content'), (3, 25, 'Really good ideas shared'), (4, 26, 'Such a great post!'), (5, 27, 'I learned a lot'),
(6, 28, 'This is super useful'), (7, 29, 'Interesting and useful!'), (8, 30, 'Nice article, thanks for sharing!'), (9, 11, 'Really enjoyed this post!'), (10, 12, 'Great post!');


-- adding shares to posts
INSERT INTO post_shares (user_id, post_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1),
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 10), (9, 1), (10, 2),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(6, 26), (7, 27), (8, 28), (9, 29), (10, 30),
(1, 12), (2, 13), (3, 14), (4, 15), (5, 16),
(6, 17), (7, 18), (8, 19), (9, 20), (10, 21),
(1, 23), (2, 24), (3, 25), (4, 26), (5, 27),
(6, 28), (7, 29), (8, 30), (9, 11), (10, 12);

-- adding stories on the app, just inserting duration, the remaining columns are SET default
INSERT INTO stories (duration)
VALUES
(12), (10), (15), (20), (8),
(14), (16), (7), (13), (11),
(9), (18), (14), (6), (17),
(5), (16), (12), (19), (10),
(14), (13), (8), (11), (9),
(7), (15), (18), (16), (12),
(19), (10);

-- Map users to stories
INSERT INTO storied (user_id, story_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(6, 26), (7, 27), (8, 28), (9, 29), (10, 30),
(1, 31), (2, 32), (3, 31), (4, 32), (5, 31),
(6, 32), (7, 31), (8, 32), (9, 31), (10, 32);

-- Insert comments, likes, and shares for stories 1 to 30

-- Comments
INSERT INTO story_comments (user_id, story_id, content)
VALUES
(1, 1, 'Amazing story!'), (2, 2, 'Loved this one!'), (3, 3, 'Very inspiring'), (4, 4, 'Great work'), (5, 5, 'This was awesome'),
(6, 6, 'Fantastic story!'), (7, 7, 'Interesting read'), (8, 8, 'Well done'), (9, 9, 'Incredible story!'), (10, 10, 'Such a good story!'),
(1, 11, 'Nice perspective!'), (2, 12, 'Really enjoyed this one'), (3, 13, 'Great ideas!'), (4, 14, 'Love the way you think'), (5, 15, 'Amazing storytelling'),
(6, 16, 'Keep up the great work!'), (7, 17, 'Well structured story'), (8, 18, 'Loved the plot!'), (9, 19, 'Very insightful'), (10, 20, 'Great job'),
(1, 21, 'Nice story, enjoyed it'), (2, 22, 'Such an interesting read'), (3, 23, 'Good concepts shared'), (4, 24, 'Amazing work!'), (5, 25, 'Incredible story'),
(6, 26, 'Love the creativity'), (7, 27, 'Fantastic ideas'), (8, 28, 'Impressive work'), (9, 29, 'Really liked this story'), (10, 30, 'This was a fun read'),
(1, 12, 'Very inspiring, thanks!'), (2, 13, 'This is so motivational'), (3, 14, 'Great job on the plot'), (4, 15, 'Well done!'), (5, 16, 'I loved the ideas'),
(6, 17, 'Such a beautiful story'), (7, 18, 'Great storytelling'), (8, 19, 'Very good content'), (9, 20, 'Incredible ideas in this one'), (10, 21, 'Impressive work!');

-- Likes
INSERT INTO story_likes (user_id, story_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(6, 26), (7, 27), (8, 28), (9, 29), (10, 30),
(1, 12), (2, 13), (3, 14), (4, 15), (5, 16),
(6, 17), (7, 18), (8, 19), (9, 20), (10, 21);

-- Shares
INSERT INTO story_shares (user_id, story_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 16), (7, 17), (8, 18), (9, 19), (10, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(6, 26), (7, 27), (8, 28), (9, 29), (10, 30),
(1, 12), (2, 13), (3, 14), (4, 15), (5, 16),
(6, 17), (7, 18), (8, 19), (9, 20), (10, 21);

-- adding communities to the app
INSERT INTO communities (name, founder_id, capacity, genre)
VALUES
('Tech Enthusiasts', 1, 100, 'Technology'),
('Travel Lovers', 2, 150, 'Travel'),
('Sports Fans', 3, 200, 'Sports'),
('Foodies', 4, 50, 'Food'),
('Movie Buffs', 5, 75, 'Entertainment'),
('Fitness Junkies', 6, 120, 'Health'),
('Gamers United', 7, 300, 'Gaming'),
('Music Lovers', 8, 200, 'Music'),
('Art Lovers', 9, 100, 'Art'),
('Photography Lovers', 10, 50, 'Photography');


-- mapping user to craete realtionships
INSERT INTO "friends" ("user1_id", "user2_id", "type")
VALUES
(1, 2, 'close'),
(1, 3, 'acquaintance'),
(1, 4, 'close'),
(1, 5, 'acquaintance'),
(1, 6, 'close'),
(2, 3, 'acquaintance'),
(2, 4, 'close'),
(2, 5, 'acquaintance'),
(2, 6, 'close'),
(3, 4, 'acquaintance'),
(3, 5, 'close'),
(3, 6, 'acquaintance'),
(4, 5, 'close'),
(4, 6, 'acquaintance'),
(5, 6, 'close'),
(5, 7, 'acquaintance'),
(6, 7, 'close'),
(6, 8, 'acquaintance'),
(7, 8, 'close'),
(8, 9, 'acquaintance');

-- Map users to communities
INSERT INTO community_members (user_id, community_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- Adding groups
INSERT INTO groups (name, type)
VALUES
('Digital Nomads', 'private'),
('Adventure Seekers', 'public'),
('Book Club', 'private'),
('Entrepreneurs Network', 'public'),
('Science Geeks', 'private'),
('Nature Explorers', 'public'),
('Movie Nights', 'private'),
('Coding Wizards', 'public'),
('Fashionistas', 'private'),
('Comedy Lovers', 'public');

-- Map users to groups
INSERT INTO group_members (user_id, group_id)
VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 10), (9, 1), (10, 2);

-- Adding schools
INSERT INTO schools (name, type, location, founded)
VALUES
('Greenwich High School', 'High School', 'Greenwich, CT', '1900'),
('Westfield Academy', 'High School', 'Westfield, NJ', '1925'),
('Sunnyvale High School', 'High School', 'Sunnyvale, CA', '1980'),
('Riverside High School', 'High School', 'Riverside, CA', '1960'),
('Central High School', 'High School', 'Denver, CO', '1930'),
('Harvard-Westlake School', 'High School', 'Los Angeles, CA', '1951'),
('Palo Alto High School', 'High School', 'Palo Alto, CA', '1898'),
('Bishop O’Dowd High School', 'High School', 'Oakland, CA', '1951'),
('The Dalton School', 'High School', 'New York, NY', '1919'),
('The Lawrenceville School', 'High School', 'Lawrenceville, NJ', '1810'),
('Northwestern High School', 'High School', 'Hyattsville, MD', '1969'),
('St. Ignatius College Preparatory', 'High School', 'San Francisco, CA', '1855'),
('Phillips Academy Andover', 'High School', 'Andover, MA', '1778'),
('The Brearley School', 'High School', 'New York, NY', '1884'),
('Saint Joseph High School', 'High School', 'Lakewood, CA', '1961'),
('New Trier High School', 'High School', 'Winnetka, IL', '1901'),
('Bronx High School of Science', 'High School', 'Bronx, NY', '1938'),
('The Hotchkiss School', 'High School', 'Lakeville, CT', '1891'),
('The Episcopal Academy', 'High School', 'Newtown Square, PA', '1785');

-- Adding companies
INSERT INTO companies (name, industry, location)
VALUES
('Google', 'Technology', 'Mountain View, CA'),
('Apple', 'Technology', 'Cupertino, CA'),
('Microsoft', 'Technology', 'Redmond, WA'),
('Tesla', 'Automotive', 'Palo Alto, CA'),
('Facebook', 'Technology', 'Menlo Park, CA'),
('Amazon', 'E-commerce', 'Seattle, WA'),
('Netflix', 'Entertainment', 'Los Gatos, CA'),
('Spotify', 'Entertainment', 'Stockholm, Sweden'),
('Uber', 'Technology', 'San Francisco, CA'),
('Twitter', 'Technology', 'San Francisco, CA'),
('LinkedIn', 'Technology', 'Sunnyvale, CA'),
('Adobe', 'Technology', 'San Jose, CA'),
('Intel', 'Technology', 'Santa Clara, CA'),
('Slack', 'Technology', 'San Francisco, CA'),
('Salesforce', 'Technology', 'San Francisco, CA'),
('Zoom', 'Technology', 'San Jose, CA'),
('Snapchat', 'Technology', 'Santa Monica, CA'),
('Oracle', 'Technology', 'Redwood City, CA'),
('IBM', 'Technology', 'Armonk, NY');

-- Adding colleges
INSERT INTO colleges (name, type, location)
VALUES
('Amherst College', 'Private', 'Amherst, MA'),
('Williams College', 'Private', 'Williamstown, MA'),
('Swarthmore College', 'Private', 'Swarthmore, PA'),
('Pomona College', 'Private', 'Claremont, CA'),
('Middlebury College', 'Private', 'Middlebury, VT'),
('Wellesley College', 'Private', 'Wellesley, MA'),
('Bowdoin College', 'Private', 'Brunswick, ME'),
('Colgate University', 'Private', 'Hamilton, NY'),
('Claremont McKenna College', 'Private', 'Claremont, CA'),
('Carleton College', 'Private', 'Northfield, MN'),
('Hamilton College', 'Private', 'Clinton, NY'),
('Vassar College', 'Private', 'Poughkeepsie, NY'),
('Harvey Mudd College', 'Private', 'Claremont, CA'),
('Bates College', 'Private', 'Lewiston, ME'),
('Davidson College', 'Private', 'Davidson, NC'),
('Trinity College', 'Private', 'Hartford, CT'),
('Skidmore College', 'Private', 'Saratoga Springs, NY'),
('Colorado College', 'Private', 'Colorado Springs, CO'),
('Kenyon College', 'Private', 'Gambier, OH');

-- Adding universities
INSERT INTO universities (name, type, location)
VALUES
('Harvard University', 'Private', 'Cambridge, MA'),
('Stanford University', 'Private', 'Stanford, CA'),
('Massachusetts Institute of Technology', 'Private', 'Cambridge, MA'),
('University of California, Berkeley', 'Public', 'Berkeley, CA'),
('Princeton University', 'Private', 'Princeton, NJ'),
('Yale University', 'Private', 'New Haven, CT'),
('Columbia University', 'Private', 'New York, NY'),
('University of Chicago', 'Private', 'Chicago, IL'),
('California Institute of Technology', 'Private', 'Pasadena, CA'),
('University of Pennsylvania', 'Private', 'Philadelphia, PA'),
('University of Oxford', 'Public', 'Oxford, UK'),
('University of Cambridge', 'Public', 'Cambridge, UK'),
('New York University', 'Private', 'New York, NY'),
('University of California, Los Angeles', 'Public', 'Los Angeles, CA'),
('University of Michigan', 'Public', 'Ann Arbor, MI'),
('Duke University', 'Private', 'Durham, NC'),
('University of California, San Francisco', 'Public', 'San Francisco, CA'),
('Northwestern University', 'Private', 'Evanston, IL');

-- setting up profile, default values will be set to null
INSERT INTO profiles (pfp_url, visibility)
VALUES
('http://example.com/default_pfp1.jpg', 'online'),
('http://example.com/default_pfp2.jpg', 'invisible'),
('http://example.com/default_pfp3.jpg', 'idle'),
('http://example.com/default_pfp4.jpg', 'online'),
('http://example.com/default_pfp5.jpg', 'idle'),
('http://example.com/default_pfp6.jpg', 'invisible'),
('http://example.com/default_pfp7.jpg', 'online'),
('http://example.com/default_pfp8.jpg', 'idle'),
('http://example.com/default_pfp9.jpg', 'invisible'),
('http://example.com/default_pfp10.jpg', 'online');

-- adding logs to the users
INSERT INTO user_logs (user_id, action)
VALUES
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out'),
(1, 'User logged in'),
(2, 'User posted a message'),
(3, 'User commented on a post'),
(4, 'User liked a post'),
(5, 'User shared a story'),
(6, 'User updated profile'),
(7, 'User joined a community'),
(8, 'User left a group'),
(9, 'User changed profile picture'),
(10, 'User logged out');

-- show all users that their age is more than 20

SELECT *
FROM "users"
WHERE "username" IN (
    SELECT "username" FROM "user_info"
    WHERE "age" > 20 ORDER BY "age" DESC
);

-- Show all common friends between 2 users
SELECT * FROM "users"
WHERE "id" IN (
    SELECT "user2_id" FROM "friends"
    WHERE "user1_id" = (
        SELECT "id" FROM "users" WHERE "username" = 'user1'
    )
)
INTERSECT
SELECT * FROM "users"
WHERE "id" IN (
    SELECT "user2_id" FROM "friends"
    WHERE "user1_id" = (
        SELECT "id" FROM "users" WHERE "username" = 'user2'
    )
);

-- get most 5 posting users' profiles on the app
SELECT *
FROM "profiles"
WHERE "user_id" IN (
    SELECT "user_id"
    FROM "posted"
    GROUP BY "user_id"
    ORDER BY COUNT("post_id") DESC
    LIMIT 5
);

-- get most 5 school students study in
SELECT "name", "type"
FROM "schools"
WHERE "id" IN (
    SELECT "school_id"
    FROM "profiles"
    GROUP BY "school_id"
    ORDER BY COUNT("user_id") DESC
    LIMIT 5
);

-- ordering user_logs by useage
SELECT "action",
COUNT("user_id") AS "times"
FROM "user_logs"
GROUP BY "action"
ORDER BY "times" DESC, "action" ASC;
