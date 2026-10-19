-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2026 at 09:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_token`
--

CREATE TABLE `account_token` (
  `token_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expire_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `summary` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `trending_score` double NOT NULL DEFAULT 0,
  `score_calculated_at` datetime DEFAULT NULL,
  `background_cosmetic_id` int(11) DEFAULT NULL,
  `bridging_score` double DEFAULT NULL,
  `bridging_calculated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(1, 'Nintendo Reveals a New Adventure Coming to Switch', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Nintendo has revealed a new adventure for Switch players, featuring a colorful world, new characters, and a focus on exploration. The announcement has already sparked plenty of discussion among fans who are looking forward to seeing how the new title expands on familiar Nintendo gameplay.', 'https://placehold.co/800x450/png?text=Gaming+News+1', 1, 1, '2026-09-18 04:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(2, 'The Next Nintendo Direct Has Fans Guessing What Comes Next', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Nintendo has announced another presentation, giving players a chance to learn more about upcoming games and updates. With several titles still generating interest among the community, fans are already sharing their predictions about what could appear during the presentation.', 'https://placehold.co/800x450/png?text=Gaming+News+2', 2, 1, '2026-09-17 19:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(3, 'Mario Kart Gets a Fresh Update for Switch Players', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new Mario Kart update brings additional content and several small improvements to the racing experience. Players can look forward to new ways to customize their races while continuing to compete with friends both locally and online.', 'https://placehold.co/800x450/png?text=Gaming+News+3', 3, 1, '2026-09-17 10:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(4, 'Pokémon Fans Discover a New Feature in the Latest Update', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'The latest Pokémon update introduces a new feature designed to make exploration and collecting more engaging. The addition gives returning players another reason to revisit the game while providing newcomers with more ways to interact with the world.', 'https://placehold.co/800x450/png?text=Gaming+News+4', 4, 4, '2026-09-17 01:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(5, 'Kirby Returns in a Colorful New Platforming Adventure', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Kirby is back in a new platforming adventure filled with colorful environments, familiar abilities, and hidden secrets. The new game aims to offer an accessible experience while still giving longtime fans plenty to explore across its stages.', 'https://placehold.co/800x450/png?text=Gaming+News+5', 5, 1, '2026-09-17 02:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(6, 'Nintendo Announces New Features for Its Online Service', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Nintendo has announced several new additions and improvements for its online service. The changes are focused on making the experience more convenient for players and giving subscribers more ways to interact with their games and friends.', 'https://placehold.co/800x450/png?text=Gaming+News+6', 6, 1, '2026-09-16 17:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(7, 'Fans Share Their Most-Wanted Nintendo Remakes', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Nintendo fans are once again discussing which classic games deserve to return on modern hardware. Community discussions have highlighted a wide range of older titles, with players hoping that future remakes can preserve the original experience while introducing updated visuals and quality-of-life improvements.', 'https://placehold.co/800x450/png?text=Gaming+News+7', 7, 1, '2026-09-16 08:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(8, 'The Latest Switch Update Adds Several Quality-of-Life Changes', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new system update for Switch introduces several smaller changes aimed at improving the everyday experience. While the update does not completely transform the console, the improvements should make common tasks more convenient for players.', 'https://placehold.co/800x450/png?text=Gaming+News+8', 8, 1, '2026-09-15 23:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(9, 'A New Fantasy RPG Is Coming to Nintendo Switch', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new fantasy role-playing game is making its way to Nintendo Switch, bringing players into a world filled with exploration, mysterious characters, and challenging encounters. The title has attracted attention for its colorful presentation and adventure-focused gameplay.', 'https://placehold.co/800x450/png?text=Gaming+News+9', 9, 1, '2026-09-15 14:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(10, 'Nintendo Fans Get a First Look at an Upcoming Adventure', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Players have received their first look at an upcoming Nintendo adventure, offering a glimpse at its world, characters, and gameplay. Although details remain limited, the reveal has given fans plenty to discuss while they wait for more information.', 'https://placehold.co/800x450/png?text=Gaming+News+10', 10, 1, '2026-09-15 15:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(11, 'PlayStation Reveals a New Story-Driven Adventure', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'PlayStation has unveiled a new story-driven adventure that places a strong focus on exploration, characters, and cinematic moments. The first details have given players an early look at what could become one of the platform\'s upcoming narrative-focused releases.', 'https://placehold.co/800x450/png?text=Gaming+News+11', 11, 1, '2026-09-15 06:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(12, 'New PlayStation Update Introduces Several Quality-of-Life Improvements', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new PlayStation system update introduces a collection of quality-of-life improvements for players. The changes focus on making everyday features easier to use while addressing several smaller issues reported by the community.', 'https://placehold.co/800x450/png?text=Gaming+News+12', 12, 4, '2026-09-18 21:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(13, 'Fans React to the Latest PlayStation Showcase', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'The latest PlayStation showcase gave players a look at several upcoming games across different genres. New trailers and announcements have sparked conversations among the community, with fans discussing which titles they are most interested in following.', 'https://placehold.co/800x450/png?text=Gaming+News+13', 13, 4, '2026-09-14 12:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(14, 'A New Fantasy RPG Is Coming to PlayStation', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new fantasy RPG is set to arrive on PlayStation, offering players a large world to explore alongside a story built around memorable characters and challenging encounters. The project is still being revealed gradually, with more details expected in future announcements.', 'https://placehold.co/800x450/png?text=Gaming+News+14', 14, 1, '2026-09-14 03:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(15, 'PlayStation Players Discover a Hidden Feature in the Latest Update', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Players have discovered an easily overlooked feature included in a recent PlayStation update. The addition is relatively small, but it provides another useful option for managing games and interacting with the console.', 'https://placehold.co/800x450/png?text=Gaming+News+15', 15, 1, '2026-09-16 04:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(16, 'The Year\'s Biggest PlayStation Releases Continue to Take Shape', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Several major PlayStation releases are continuing to take shape as developers reveal more information about their upcoming projects. New trailers, gameplay details, and announcements are giving players a clearer picture of what is ahead.', 'https://placehold.co/800x450/png?text=Gaming+News+16', 16, 1, '2026-09-13 19:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(17, 'A New Co-op Adventure Is Coming to PlayStation', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new cooperative adventure is bringing two or more players together for a journey filled with puzzles, exploration, and combat. The game is designed around teamwork, giving players reasons to communicate and work together throughout the experience.', 'https://placehold.co/800x450/png?text=Gaming+News+17', 17, 1, '2026-09-13 10:30:00', NULL, 2, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(18, 'Xbox Players Get a New Open-World Adventure to Explore', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Xbox players are getting a new open-world adventure featuring a large environment, optional activities, and a story built around exploration. The game gives players plenty of freedom to decide how they want to approach its world.', 'https://placehold.co/800x450/png?text=Gaming+News+18', 18, 1, '2026-09-13 01:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(19, 'Xbox Game Pass Adds More Games This Month', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Xbox Game Pass is adding several new games to its library, giving subscribers more opportunities to discover different genres and experiences. The latest additions include a mix of larger releases and smaller titles that are worth checking out.', 'https://placehold.co/800x450/png?text=Gaming+News+19', 19, 1, '2026-09-12 16:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(20, 'New Xbox Update Improves the Gaming Experience', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new Xbox update introduces several improvements focused on performance, navigation, and general usability. The changes are designed to make the console experience smoother while addressing some of the smaller frustrations players have encountered.', 'https://placehold.co/800x450/png?text=Gaming+News+20', 20, 1, '2026-09-12 17:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(21, 'A New Co-op Adventure Is Coming to Xbox', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Xbox players will soon have another cooperative adventure to play with friends. The upcoming title combines exploration and teamwork, with challenges that encourage players to communicate and coordinate their actions.', 'https://placehold.co/800x450/png?text=Gaming+News+21', 1, 1, '2026-09-12 08:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(22, 'Xbox Fans Get Their First Look at an Upcoming RPG', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Xbox fans have received an early look at a new role-playing game currently in development. The reveal showcases its world, combat system, and characters while leaving plenty of details for future announcements.', 'https://placehold.co/800x450/png?text=Gaming+News+22', 2, 1, '2026-09-18 18:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(23, 'The Latest Xbox Features Give Players More Ways to Play', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Several new Xbox features are giving players more flexibility in how they manage and enjoy their games. The additions focus on convenience and accessibility, continuing the platform\'s steady stream of system improvements.', 'https://placehold.co/800x450/png?text=Gaming+News+23', 3, 1, '2026-09-11 14:30:00', NULL, 3, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(24, 'The Latest PC Gaming Update Brings Major Performance Improvements', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new PC gaming update focuses on performance and stability improvements across a range of systems. Players can expect smoother gameplay in supported titles, along with fixes for several issues that have affected the experience.', 'https://placehold.co/800x450/png?text=Gaming+News+24', 4, 1, '2026-09-11 05:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(25, 'Indie Developers Show Off Their Most Ambitious Projects Yet', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Independent developers are continuing to experiment with creative ideas, distinctive art styles, and unusual gameplay systems. Several upcoming indie projects are attracting attention for taking familiar genres in new directions.', 'https://placehold.co/800x450/png?text=Gaming+News+25', 5, 1, '2026-09-11 06:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(26, 'PC Players Are Getting More Ways to Customize Their Games', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'PC players continue to benefit from new customization tools and community-made content. From visual changes to gameplay modifications, these options give players more freedom to tailor their experiences to their own preferences.', 'https://placehold.co/800x450/png?text=Gaming+News+26', 6, 1, '2026-09-10 21:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(27, 'A New Survival Game Is Taking the PC Community by Storm', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new survival game has quickly attracted attention from PC players with its combination of exploration, crafting, and resource management. The growing community is already sharing strategies and discovering different ways to survive its challenging world.', 'https://placehold.co/800x450/png?text=Gaming+News+27', 7, 1, '2026-09-10 12:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(28, 'The Most Interesting PC Games to Watch This Month', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'Several upcoming PC games are worth keeping an eye on this month, ranging from ambitious role-playing games to smaller experimental projects. Each offers something different, giving players plenty of options to add to their watchlists.', 'https://placehold.co/800x450/png?text=Gaming+News+28', 8, 1, '2026-09-10 03:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(29, 'New Graphics Update Promises Smoother PC Performance', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'A new graphics update is aiming to improve visual quality and performance for supported PC games. The changes are expected to provide a smoother experience while giving players additional options for adjusting their graphics settings.', 'https://placehold.co/800x450/png?text=Gaming+News+29', 9, 1, '2026-09-09 18:30:00', NULL, 4, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(30, 'The Games Everyone Is Talking About This Week', 'The latest gaming news has caught the attention of players and the wider community. More details are expected as developers and publishers share additional information about the project.\r\n\r\nFor now, players can look forward to further announcements and updates as development continues.', 'From major announcements to unexpected community discoveries, the gaming world has had plenty to talk about this week. Several new updates and upcoming releases have captured attention across different platforms and genres.', 'https://placehold.co/800x450/png?text=Gaming+News+30', 10, 1, '2026-09-18 19:30:00', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(31, 'Nintendo Reveals a New Adventure Coming to Switch', '<p>Nintendo has revealed a brand-new adventure coming to Nintendo Switch, giving players their first look at a colorful world filled with exploration, characters, and hidden secrets. The announcement gives fans an early glimpse at what they can expect from the upcoming title.</p><h3>A New World to Explore</h3><p>The upcoming adventure will take players across a variety of environments, each featuring its own challenges and discoveries. Exploration appears to be an important part of the experience, with players encouraged to search through the environment and uncover optional areas.</p><p>Players can expect:</p><ul><li>Multiple environments to explore</li><li>New characters and encounters</li><li>Different gameplay challenges</li><li>Hidden areas and collectibles</li><li>New mechanics built around exploration</li></ul><h3>Familiar Gameplay, New Ideas</h3><p>Alongside exploration, the game introduces several new gameplay mechanics designed to give players more freedom in how they approach different situations. Some areas will focus on platforming and action, while others encourage players to interact with the environment.</p><blockquote><p>“We wanted to create an adventure that feels familiar to longtime players while giving them something new to discover.”</p></blockquote><h3>More Details Still to Come</h3><p>Nintendo has only revealed a portion of the game so far. Details about the full story, additional characters, and later gameplay systems are still being kept under wraps.</p><p>More information is expected to be shared through future announcements as the release approaches. Until then, fans will have plenty to speculate about as they wait for another look at the upcoming adventure.asd23e</p>', 'Nintendo has revealed a brand-new adventure coming to Switch, introducing players to a colorful world filled with exploration, memorable characters, and hidden secrets. The upcoming title looks set to combine familiar Nintendo charm with new gameplay ideas, giving both longtime fans and newcomers another adventure to look forward to.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1789720359/FYP-NRS/thumbnails/pkh74cfpu6s4e3jfty1s.png', 1, 1, '2026-09-18 21:46:23', '2026-09-19 12:43:39', 1, 0, '2026-10-15 20:00:04', NULL, 0.03765203054638673, '2026-10-15 20:00:16'),
(32, 'Trails in the Sky 2nd Chapter demo now available', '<p>Here is an overview of the demo:</p><blockquote><p>This is a free demo version of <i>Trails in the Sky 2nd Chapter</i>, the next chapter of Nihon Falcom’s iconic remake series! The demo picks up immediately after the events of Trails in the Sky 1st Chapter.</p><p>In the demo version, players can experience up through Chapter 1 of the story. Any save data can be carried over to the full version of the game to continue the journey. (Some specifications from the demo may differ from the final version.)</p></blockquote><p><i>Trails in the Sky 2nd Chapter</i> is due out for Play Station 5, Switch 2, Switch, and PC via <a href=\"https://store.steampowered.com/app/4225980/Trails_in_the_Sky_2nd_Chapter/\"><strong>Steam</strong></a> on September 17 worldwide.</p><p>Watch the opening movie and a new teaser trailer below.</p><figure class=\"media\"><div data-oembed-url=\"https://www.youtube.com/watch?v=6NiqCCKaed4\"><div><iframe src=\"https://www.youtube.com/embed/6NiqCCKaed4\" width=\"1280\" height=\"720\" frameborder=\"0\"></iframe></div></div></figure>', 'A demo for Trails in the Sky 2nd Chapter is available now for PlayStation 5, Switch, and PC via Steam, Falcom and GungHo Online Entertainment announced. The opening movie was also released.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1789722747/FYP-NRS/thumbnails/jeeumndyz5zmqea6rmrk.webp', 1, 1, '2026-09-19 12:48:59', NULL, 1, 0, '2026-10-15 20:00:04', NULL, NULL, NULL),
(33, 'asd', '<p>action</p>', 'action', NULL, 1, 3, '2026-09-21 18:06:51', '2026-09-21 18:07:30', 1, 0, NULL, NULL, NULL, NULL),
(34, 'new', '<p>asdnew</p>', 'asd', NULL, 1, 3, '2026-09-21 18:11:39', '2026-09-21 23:45:01', 2, 0, NULL, NULL, NULL, NULL),
(35, 'newdraftasd', '<p>draftasdasd</p>', '', NULL, 1, 3, '2026-09-21 23:45:10', '2026-09-21 23:46:51', 4, 0, NULL, NULL, NULL, NULL),
(36, 'new ary', '<p>asd</p>', '', NULL, 1, 3, '2026-09-21 23:50:00', NULL, 3, 0, NULL, NULL, NULL, NULL),
(37, 'Minecraft Dungeons II launches with Sift dimension preview', '<p>Minecraft Dungeons II launches September 29, giving players their first playable preview of The Sift, a new dimension Mojang plans to add to Minecraft’s Java and Bedrock editions in 2027. The action-RPG sequel expands the original’s mission-based format into connected regions and ties its story more directly to the main Minecraft universe (<a href=\"https://gameranx.com/updates/id/564204/article/minecraft-is-adding-its-first-new-dimension-in-14-years-introducing-the-sift/\">gameranx.com</a>, <a href=\"https://www.gamespot.com/reviews/minecraft-dungeons-2-is-more-ambitious-more-interesting-and-more-flawed/\">gamespot.com</a>, <a href=\"https://news.xbox.com/en-us/2026/09/28/how-minecraft-dungeons-iis-interconnected-world-makes-every-journey-an-adventure/\">xbox.com</a>).</p>\n<p>Mojang also revealed Ice Caves, a new underground biome with light-reactive ice crystals and Frozen Zombies, for a future Minecraft update. The Sift is the first new dimension in the game in more than 14 years; Mojang has not announced an exact release date for the main game (<a href=\"https://games.mxdwn.com/news/minecraft-live-2026-reveals-ice-caves-and-new-dimension-coming-in-the-future/\">mxdwn.com</a>, <a href=\"https://www.pressfire.no/artikkel/minecraft-far-sin-forste-nye-dimensjon-siden-2011\">pressfire.no</a>, <a href=\"https://www.gamingonlinux.com/2026/09/minecraft-live-fall-2026-reveals-a-new-dimension-for-minecraft-called-the-sift/\">gamingonlinux.com</a>).</p>\n<h2>Key points</h2>\n<ul><li>Expanded builds: Players can equip four separate armor pieces, use Enchantment Books and jump, adding character-customization and movement options (<a href=\"https://www.gamespot.com/articles/minecraft-dungeons-2-deliberately-moves-closer-to-vanilla-minecraft/\">gamespot.com</a>, <a href=\"https://www.pcgamesn.com/minecraft-dungeons-2/review\">pcgamesn.com</a>, <a href=\"https://www.ign.com/articles/minecraft-dungeons-2-review\">ign.com</a>).</li><li>Navigation tools: Repeatable encounters and smart navigation tools help players find their way while exploring the Overworld and the Sift (<a href=\"https://news.xbox.com/en-us/2026/09/28/how-minecraft-dungeons-iis-interconnected-world-makes-every-journey-an-adventure/\">xbox.com</a>).</li><li>Co-op support: Minecraft Dungeons II supports up to four players in local or online co-op, with cross-play and matchmaking (<a href=\"https://techgenyz.com/minecraft-dungeons-ii-minecraft-dimension-14-years/\">techgenyz.com</a>).</li><li>Bugs and repetition: GamesRadar+ found the game somewhat buggy and said it becomes repetitive quickly (<a href=\"https://www.gamesradar.com/games/minecraft/minecraft-dungeons-2-review/\">gamesradar.com</a>).</li></ul>\n<blockquote><p>\"As much as Dungeons 1 tried to interpret vanilla Minecraft--and I think we did a pretty good job of it--with some of the things that we had deviated from, we decided to take them even closer to vanilla\"</p><p>— <a href=\"https://www.gamespot.com/articles/minecraft-dungeons-2-deliberately-moves-closer-to-vanilla-minecraft/\">Laura de Llorens Garcia, GameSpot</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>IGN reviewer Travis Northup called the sequel brief and shallow, arguing that players can see most of what it offers in an afternoon (<a href=\"https://www.ign.com/articles/minecraft-dungeons-2-review\">ign.com</a>).</li><li>PCGamesN reviewer Ken Allsop described the sequel as a welcoming, short-form action RPG rather than a reinvention of the loot genre (<a href=\"https://www.pcgamesn.com/minecraft-dungeons-2/review\">pcgamesn.com</a>).</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMipAFBVV95cUxQdGc2dWZFbGtNOWVlcmJMT1ZwaW1NbUhucmp2RERocGcxZ2ctNDY2ckNkcTliNWpHcXVPN041MWp6OFJ2cVhaSXlfYzlLVEJxazRtWnF1YjRIczZubEJBZkZZSnRJVkE0QVJuelhHaGpNaWFvclpfXzRoSzZ6ckxUTW5zaWY4S0I2TkRVRGtjSUNNUmw5dGgybU9mQXBUREZXLVdwVg\">Minecraft Dungeons 2 Deliberately Moves Closer To Vanilla Minecraft - GameSpot</a> (google.com)</li><li><a href=\"https://gameranx.com/updates/id/564204/article/minecraft-is-adding-its-first-new-dimension-in-14-years-introducing-the-sift/\">Minecraft Is Adding Its First New Dimension In 14 Years – Introducing The Sift</a> (gameranx.com)</li><li><a href=\"https://games.mxdwn.com/news/minecraft-live-2026-reveals-ice-caves-and-new-dimension-coming-in-the-future/\">Minecraft LIVE 2026 Reveals Ice Caves and New Dimension Coming In the Future</a> (mxdwn.com)</li><li><a href=\"https://www.gamespot.com/articles/minecraft-dungeons-2-deliberately-moves-closer-to-vanilla-minecraft/\">Minecraft Dungeons 2 Deliberately Moves Closer To Vanilla Minecraft</a> (gamespot.com)</li><li><a href=\"https://www.gamespot.com/videos/minecraft-dungeons-2-is-more-ambitious-more-interesting-and-more-flawed-review/\">Minecraft Dungeons 2 Is More Ambitious, More Interesting, And More Flawed – Review</a> (gamespot.com)</li><li><a href=\"https://www.gamespot.com/reviews/minecraft-dungeons-2-is-more-ambitious-more-interesting-and-more-flawed/\">Minecraft Dungeons 2 Is More Ambitious, More Interesting, And More Flawed</a> (gamespot.com)</li><li><a href=\"https://news.xbox.com/en-us/2026/09/28/how-minecraft-dungeons-iis-interconnected-world-makes-every-journey-an-adventure/\">How Minecraft Dungeons II’s Interconnected World Makes Every Journey an Adventure</a> (xbox.com)</li><li><a href=\"https://www.destructoid.com/reviews/minecraft-dungeons-2-review/\">Minecraft Dungeons 2 review – A diamond in the rift, and even more in the Sift</a> (destructoid.com)</li><li><a href=\"https://www.pcgamesn.com/minecraft-dungeons-2/review\">Minecraft Dungeons 2 review - block-blasting bliss</a> (pcgamesn.com)</li><li><a href=\"https://www.ign.com/articles/minecraft-dungeons-2-review\">Minecraft Dungeons 2 Review</a> (ign.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1wse10h/minecraft_dungeons_ii_review_thread/\">Minecraft Dungeons II Review Thread</a> (reddit.com)</li><li><a href=\"https://www.gamesradar.com/games/minecraft/minecraft-dungeons-2-review/\">Minecraft Dungeons 2 review: \"This family friendly take on Diablo embraces old school vibes in the best ways\"</a> (gamesradar.com)</li><li><a href=\"https://www.neowin.net/reviews/minecraft-dungeons-ii-review-braving-the-sift-in-a-fun-and-blocky-co-op-adventure/\">Minecraft Dungeons II review: Braving The Sift in a fun and blocky co-op adventure</a> (neowin.net)</li><li><a href=\"https://techgenyz.com/minecraft-dungeons-ii-minecraft-dimension-14-years/\">Minecraft Dungeons II Opens the Door to Minecraft’s First New Dimension in 14 Years</a> (techgenyz.com)</li><li><a href=\"https://www.pressfire.no/artikkel/minecraft-far-sin-forste-nye-dimensjon-siden-2011\">«Minecraft» får sin første nye dimensjon siden 2011</a> (pressfire.no)</li><li><a href=\"https://respawn.media/gaming/msuwa-minecraft-dungeons-2-ocherednaya-prokhodnaya-igra-otsenki-kritikov-govoryat-sami-za-sebya\">Minecraft Dungeons 2 — очередная проходная игра? Оценки критиков говорят сами за себя</a> (respawn.media)</li><li><a href=\"https://www.heise.de/tests/Minecraft-Dungeons-2-angespielt-Neue-Dimension-altes-Spielprinzip-11468027.html\">„Minecraft Dungeons 2“ angespielt: „Diablo“-Light in der Klötzchenwelt</a> (heise.de)</li><li><a href=\"https://hk.news.yahoo.com/minecraft-%E8%BF%8E%E4%BE%86-14-%E5%B9%B4%E4%BE%86%E9%A6%96%E5%80%8B%E5%85%A8%E6%96%B0%E7%B6%AD%E5%BA%A6-sift-203535948.html\">Minecraft 迎來 14 年來首個全新維度 The Sift　同步公開《Dungeons 2》與 Switch 2 發售時間</a> (yahoo.com)</li><li><a href=\"https://www.windowscentral.com/gaming/minecraft/minecraft-dungeons-2-review-round-up\">Minecraft Dungeons 2 review round-up: Here\'s what critics are saying</a> (windowscentral.com)</li><li><a href=\"https://www.reddit.com/r/linux_gaming/comments/1wsrs2d/minecraft_dungeons_2_issue/\">Minecraft Dungeons 2 issue</a> (reddit.com)</li><li><a href=\"https://www.gamingonlinux.com/2026/09/minecraft-live-fall-2026-reveals-a-new-dimension-for-minecraft-called-the-sift/\">Minecraft LIVE Fall 2026 reveals a new dimension for Minecraft called The Sift</a> (gamingonlinux.com)</li><li><a href=\"https://tweakers.net/nieuws/252666/minecraft-krijgt-na-ruim-veertien-jaar-een-nieuwe-dimensie-de-sift.html\">Minecraft krijgt na ruim veertien jaar een nieuwe dimensie: de Sift</a> (tweakers.net)</li><li><a href=\"https://tech.wp.pl/tworcy-minecrafta-pokazali-nowy-wymiar-to-najwieksza-zmiana-od-lat,7334311930771712a\">Twórcy Minecrafta pokazali nowy wymiar. To największa zmiana od lat</a> (wp.pl)</li><li><a href=\"https://www.pobjeda.me/clanak/minecraft-dobija-novu-dimenziju-nakon-15-godina\">Minecraft dobija novu dimenziju nakon 15 godina</a> (pobjeda.me)</li><li><a href=\"https://www.benchmark.pl/14-lat-czekania-minecraft-wreszcie-dostanie-nowy-wymiar-7334302978222304a\">14 lat czekania. Minecraft wreszcie dostanie nowy wymiar</a> (benchmark.pl)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Minecraft Dungeons II launches September 29, giving players their first playable preview of The Sift, a new dimension Mojang plans to add to Minecraft’s Java and Bedrock editions in 2027. The action-RPG sequel expands the original’s mission-based format into connected regions and ties its story more directly to the main Minecraft universe.', NULL, 21, 3, '2026-09-29 21:06:52', NULL, 4, 0, NULL, NULL, NULL, NULL),
(38, 'Discord’s second age-verification rollout draws user backlash', '<p>Discord began rolling out age verification for all users last week, its second attempt following an earlier effort in February (<a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">kotaku.com</a>). The company said new laws in various countries required it to proceed (<a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">kotaku.com</a>). The rollout drew renewed criticism after bugs mistakenly restricted users across different age groups. Discord also faced a wave of online artwork depicting its mascot, Wumpus, being harmed—a protest tied to both the policy and the company’s attempt to joke about the faulty launch (<a href=\"https://dotesports.com/general/news/discord-wumpus-torture-art-age-restriction-protest\">dotesports.com</a>).</p>\n<h2>Key points</h2>\n<ul><li>Age estimation: Discord says its system estimates users’ ages using factors including account age, servers and communities joined, and games connected to the account (<a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">kotaku.com</a>).</li><li>Data boundaries: The company says its age-estimation system does not examine users’ messages or calls (<a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">kotaku.com</a>).</li><li>Most users: Discord estimates that 90% of users will not need a separate age check because of its age-estimation system (<a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">kotaku.com</a>).</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wsh8rt/discords_second_attempt_to_roll_out_age/\">Discord\'s Second Attempt To Roll Out Age Verification Is Going Badly</a> (reddit.com)</li><li><a href=\"https://kotaku.com/discords-second-attempt-to-roll-out-age-verification-is-going-badly-2000737908\">Discord’s Second Attempt To Roll Out Age Verification Is Going Badly</a> (kotaku.com)</li><li><a href=\"https://dotesports.com/general/news/discord-wumpus-torture-art-age-restriction-protest\">The Internet has been torturing Wumpus, Discord’s mascot, for days following new age policy</a> (dotesports.com)</li><li><a href=\"https://www.pcgamer.com/software/platforms/the-internet-is-ritualistically-murdering-discords-cartoon-mascot/\">The internet is ritualistically murdering Discord\'s cartoon mascot</a> (pcgamer.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Discord began rolling out age verification for all users last week, its second attempt following an earlier effort in February. The company said new laws in various countries required it to proceed. The rollout drew renewed criticism after bugs mistakenly restricted users across different age groups. Discord also faced a wave of online artwork depicting its mascot, Wumpus, being harmed—a protest tied to both the policy and the company’s attempt to joke about the faulty launch.', NULL, 21, 3, '2026-09-29 21:06:52', NULL, 4, 0, NULL, NULL, NULL, NULL);
INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(39, 'The Witcher 3 remaster brings free Switch 2 upgrade', '<p>CD Projekt Red is set to launch The Witcher 3: Wild Hunt – Remastered for Nintendo Switch 2 on September 29, with updated visuals and gameplay changes for the 2015 role-playing game (<a href=\"https://www.nintendolife.com/news/2026/09/psa-the-witcher-3-remastered-file-size-and-release-time-confirmed-separate-purchase-required\">nintendolife.com</a>, <a href=\"https://gonintendo.com/contents/65488-the-witcher-3-wild-hunt-remastered-switch-vs-switch-2-vs-pc-graphics-comparison\">gonintendo.com</a>, <a href=\"https://wccftech.com/the-witcher-3-remastered-incredible-path-tracing-combat-shows-age/\">wccftech.com</a>). Owners of the original Switch version can claim the Switch 2 edition at no extra cost, but it is listed as a separate eShop product and must be downloaded separately (<a href=\"https://www.nintendolife.com/news/2026/09/psa-the-witcher-3-remastered-file-size-and-release-time-confirmed-separate-purchase-required\">nintendolife.com</a>).</p>\n<p>A comparison of the Switch and Switch 2 versions highlights changes to lighting and frame rate (<a href=\"https://nintendoeverything.com/video-the-witcher-3-nintendo-switch-2-vs-switch-1-graphics-comparison/\">nintendoeverything.com</a>, <a href=\"https://www.nintendolife.com/news/2026/09/video-the-witcher-3-remastered-side-by-side-comparison-switch-vs-switch-2\">nintendolife.com</a>). CD Projekt\'s patch notes also list updated textures and improved lighting for grass and foliage (<a href=\"https://gonintendo.com/contents/65487-the-witcher-3-wild-hunt-remastered-patch-notes-shared\">gonintendo.com</a>). The remaster includes the Hearts of Stone and Blood and Wine expansions (<a href=\"https://gonintendo.com/contents/65488-the-witcher-3-wild-hunt-remastered-switch-vs-switch-2-vs-pc-graphics-comparison\">gonintendo.com</a>, <a href=\"https://www.nintendolife.com/news/2026/09/video-the-witcher-3-remastered-side-by-side-comparison-switch-vs-switch-2\">nintendolife.com</a>).</p>\n<h2>Key points</h2>\n<ul><li>Storage and access: CD Projekt community manager Marcin Momot put the download at about 50GB (<a href=\"https://nintendowire.com/news/2026/09/28/cd-projekt-red-confirms-the-witcher-3-remastered-release-time-and-download-size/\">nintendowire.com</a>).</li></ul>\n<h2>Perspectives</h2>\n<ul><li>Wccftech reviewer: The review said combat and character models still show the game\'s age despite the updated presentation (<a href=\"https://wccftech.com/the-witcher-3-remastered-incredible-path-tracing-combat-shows-age/\">wccftech.com</a>).</li><li>PCGamesN reviewer: The reviewer said the remaster\'s brighter, more colorful look can weaken the atmosphere in areas such as White Orchard (<a href=\"https://www.pcgamesn.com/the-witcher-3-wild-hunt/remastered-review\">pcgamesn.com</a>, <a href=\"https://dtf.ru/hard/5323726-remaster-vedmaka-3-grafika-i-proizvoditelnost\">dtf.ru</a>).</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMitgFBVV95cUxQWmNFbEZvekNuazBpS1pJejRFLU9yZlJYaUI4ZkVwcklxcTdudFVSdV9obUtla2lxbVpPcnVNUE5yNjIxZElNbW5GdjN2ZXNEQUpWOW5OWXhlVmt2dVdDVnRRVWQ0NjNfRElZbVBZRVlveGQyWGgyaG9uNUlFaUpNU0VFWldTdl9yeGM2bzBqblliZ1BmOUxqbU9yOXhSelhVeHpLSmltMVF3V2NsR1RLTTFuNUJFZw\">Video: The Witcher 3 Remastered Side-By-Side Comparison, Switch Vs. Switch 2 - Nintendo Life</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqAFBVV95cUxOMDhNTmljMDMzVjlrbUVoWVVoY0tUbVRZSXFOWE1BVkpteUpyVHNkaG9SZGhwYVRsQ040MlEtSXNyVHJPNkpFTTFiUWpVaTl1b2lHdFZCdW1ITVR3VnpFX3AzMGFLZU9zT0FwZXBzNHlqTU9tbFB2SVF3Qy1RVmpqNnctQ3RzcTNDX04tT09uYnhFNV9SU3Bhc2pvYXBTV3NVdGJRTGRpWVc\">The Witcher 3: Wild Hunt – Remastered Impressions &amp; Nintendo Switch 2 Analysis - gamewatcher.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMilwFBVV95cUxNcjZkbGt4YUk5SW5SY1VNV1I5UEdUbHFZY0RvY1ctaUVMekw4b1BoZU5Ob3NweTlVTUswYVp3MHZ0VHA4eklzd3pyUHRLZlhEVm1VYVU2QWt6aGpjdTFTM0xxSm9Sd3R6YktPUWU1VWtNell5WXNYVTEwc3BPblJRM01NMzJsdjl5N29COWVUbUstN05tYmEw\">The Witcher 3 on Nintendo Switch 2 is now the best way to play this masterpiece - GAMINGbible</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiowFBVV95cUxQM3JJTkFuY285V0xHZ0drU3hlaUVRYktQelRYX2RpZW5PYzZqS1VSZ3phUDgycV9QVWhKWlF1SWRpTVpUREJfM0Z4WURCYTI3SjJfQ3c5XzVzcloxaTBDM1k4X01ybVpkYjZ2dloxVzA3M1lnT1dSX0ZlZjdteVlrMk4tU2NOaGR4RlhJMHlFZEE5dlV0MEhwWXVESUVwRnlON1RV\">Video: The Witcher 3 Nintendo Switch 2 vs. Switch 1 graphics comparison - Nintendo Everything</a> (google.com)</li><li><a href=\"https://nintendoeverything.com/video-the-witcher-3-nintendo-switch-2-vs-switch-1-graphics-comparison/\">Video: The Witcher 3 Nintendo Switch 2 vs. Switch 1 graphics comparison</a> (nintendoeverything.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wsgdw7/the_witcher_3_remastered_on_switch_2_offers_a/\">The Witcher 3 Remastered on Switch 2 offers a gigantic upgrade over the Switch port &amp; is the new gold standard</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wslb73/rpg_site_has_far_and_away_the_best_switch_switch/\">RPG Site has far and away the best Switch / Switch 2 comparison images for the Witcher 3 Remastered</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsfel7/holy_cow_the_witcher_3_remastered_on_switch_2/\">Holy cow, the Witcher 3 Remastered on Switch 2 blows the Switch 1 version out of the water</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsawen/the_witcher_3_remastered_switch_vs_switch_2/\">The Witcher 3 Remastered: Switch vs Switch 2 Comparison</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsdlrt/the_witcher_3_remastered_switch_2_vs_pc_graphics/\">The Witcher 3 Remastered - Switch 2 Vs PC Graphics Comparison</a> (reddit.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/video-the-witcher-3-remastered-side-by-side-comparison-switch-vs-switch-2\">Video: The Witcher 3 Remastered Side-By-Side Comparison, Switch Vs. Switch 2</a> (nintendolife.com)</li><li><a href=\"https://gonintendo.com/contents/65488-the-witcher-3-wild-hunt-remastered-switch-vs-switch-2-vs-pc-graphics-comparison\">The Witcher 3: Wild Hunt – Remastered \"Switch vs Switch 2 vs PC\" graphics comparison</a> (gonintendo.com)</li><li><a href=\"https://www.gamewatcher.com/the-witcher-3-wild-hunt-remastered-impressions-and-nintendo-switch-2-analysis\">The Witcher 3: Wild Hunt – Remastered Impressions &amp; Nintendo Switch 2 Analysis</a> (gamewatcher.com)</li><li><a href=\"https://www.gamespot.com/videos/should-you-play-witcher-3-remastered-on-the-switch-2/\">Should You Play Witcher 3 Remastered On The Switch 2?</a> (gamespot.com)</li><li><a href=\"https://wccftech.com/the-witcher-3-remastered-incredible-path-tracing-combat-shows-age/\">The Witcher 3: Wild Hunt Remastered Looks Incredible With Path Tracing, but the Combat and Characters Still Show Its Age</a> (wccftech.com)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1wsg6xf/the_witcher_3_remastered_has_nintendo_switch_2/\">The Witcher 3 Remastered has Nintendo Switch 2 exclusive features, such as touchscreen Gwent, that make CDPR’s masterpiece even better on the handheld</a> (reddit.com)</li><li><a href=\"https://itc.ua/ua/novini/grafiku-the-witcher-3-porivnyaly-do-i-pislya-remasteru/\">Графіку The Witcher 3 порівняли до і після ремастеру</a> (itc.ua)</li><li><a href=\"https://www.windowscentral.com/gaming/the-witcher-3-wild-hunt-remastered-gives-a-decade-old-game-a-facelift-worthy-of-yet-another-playthrough\">The Witcher 3: Wild Hunt Remastered review — Worth another run?</a> (windowscentral.com)</li><li><a href=\"https://www.computerbase.de/artikel/gaming/the-witcher-3-remastered-benchmark-test.99563/\">The Witcher 3 Remastered im Test: So gut ist das kostenlose Upgrade der PC-Version</a> (computerbase.de)</li><li><a href=\"https://www.pcgamesn.com/the-witcher-3-wild-hunt/remastered-review\">The Witcher 3 Remastered is the perfect excuse to get back on the Path, even if it looks a bit too colorful</a> (pcgamesn.com)</li><li><a href=\"https://www.thegamer.com/the-witcher-3-remastered-2026-best-game/\">The Witcher 3 Remastered Is Officially The Best Game Of 2026</a> (thegamer.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/round-up-the-first-impressions-for-the-witcher-3-remastered-are-in\">Round Up: The First Impressions For The Witcher 3 Remastered Are In</a> (nintendolife.com)</li><li><a href=\"https://dtf.ru/hard/5323726-remaster-vedmaka-3-grafika-i-proizvoditelnost\">Ремастер «Ведьмака 3» — сравнения графики, тесты производительности на ПК и консольные режимы</a> (dtf.ru)</li><li><a href=\"https://www.pcgamer.com/games/the-witcher/heres-a-gallery-of-the-times-the-witcher-3s-remastered-lighting-had-me-like-damn/\">Here\'s a gallery of the times The Witcher 3\'s remastered lighting had me like, \'Damn\'</a> (pcgamer.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMizwFBVV95cUxNWDlWZnFuenJvUXR3cEFnb1pEVUVJbGpzRWp0RXRILUw1dGpMZFFlSkM5bmo3WEQ4N05MN3VRUmtPdHI1ZlotTGxkQUZTQzdqSU1YQkIxSjR0MURjVzN2XzVuYlpJdDZzMk1QZU5lM1hDaHY0cEhlam9rYTQtMEhvN0dETUtUVDZwUGFSNXdveUFlVm5JQ05YeGNXRy04NjZRZDB3RnNNVEdCV0VMMkhIRm9MVHh5R3dZY3ZzYmJZeHZId1l1VmZYNkNBYWJtZW8\">PSA: The Witcher 3 Remastered File Size And Release Time Confirmed, Separate Purchase Required - Nintendo Life</a> (google.com)</li><li><a href=\"https://nintendowire.com/news/2026/09/28/cd-projekt-red-confirms-the-witcher-3-remastered-release-time-and-download-size/\">CD Projekt Red confirms The Witcher 3: Remastered release time and download size</a> (nintendowire.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/psa-the-witcher-3-remastered-file-size-and-release-time-confirmed-separate-purchase-required\">PSA: The Witcher 3 Remastered File Size And Release Time Confirmed, Separate Purchase Required</a> (nintendolife.com)</li><li><a href=\"https://www.pcgamer.com/games/rpg/witcher-3-remastered-release-date-launch-times/\">Here\'s The Witcher 3 Remastered release time for your region</a> (pcgamer.com)</li><li><a href=\"https://www.ign.com/articles/the-witcher-3-wild-hunt-remastered-update-patch-notes-include-pc-specific-and-console-specific-changes\">The Witcher 3: Wild Hunt – Remastered Update Patch Notes Include PC-Specific and Console-Specific Changes</a> (ign.com)</li><li><a href=\"https://techgenyz.com/witcher-3-remastered-upgrade/\">The Witcher 3 Remastered Launches September 29</a> (techgenyz.com)</li><li><a href=\"https://www.eurogamer.net/witcher-3-wild-hunt-remastered-generous-upgrade-makes-it-new-again\">The Witcher 3 Remastered is an extraordinarily generous upgrade that doesn\'t change the game, but does make it new again</a> (eurogamer.net)</li><li><a href=\"https://gonintendo.com/contents/65487-the-witcher-3-wild-hunt-remastered-patch-notes-shared\">The Witcher 3: Wild Hunt – Remastered Patch Notes shared</a> (gonintendo.com)</li><li><a href=\"https://www.ign.com/articles/cd-projekt-releases-official-list-of-all-the-improvements-in-the-witcher-3-wild-hunt-remastered\">CD Projekt Releases Official List of All the Improvements in The Witcher 3: Wild Hunt — Remastered</a> (ign.com)</li><li><a href=\"https://www.gamesradar.com/games/the-witcher/the-witcher-3-remaster-overhauls-skill-trees-adds-new-quest-markers-brings-a-mode-to-reduce-cognitive-load-and-more-cd-projekt-red-reveals-in-patch-notes/\">The Witcher 3 Remaster overhauls skill trees, adds new quest markers, and more, CDPR reveals</a> (gamesradar.com)</li><li><a href=\"https://www.pcgamer.com/games/rpg/just-happy-the-witcher-3s-back-in-the-news/\">Just happy The Witcher 3\'s back in the news</a> (pcgamer.com)</li><li><a href=\"https://www.pcgamer.com/games/the-witcher/cd-projekt-lays-out-why-you-should-play-the-witcher-3-remastered/\">CD Projekt lays out why you should play The Witcher 3 Remastered</a> (pcgamer.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1wsrz3p/witcher_3_remastered_pc_specs_guide/\">Witcher 3 Remastered PC Specs guide</a> (reddit.com)</li><li><a href=\"https://itavisen.no/2026/09/28/slik-far-du-witcher-3-remastered-gratis/\">Slik får du The Witcher 3 Remastered gratis i morgen</a> (itavisen.no)</li><li><a href=\"https://www.rockpapershotgun.com/cd-projekt-release-full-updated-witcher-3-wild-hunt-remastered-system-specs-including-ray-tracing-and-path-tracing-requirements\">CD Projekt release full updated Witcher 3: Wild Hunt Remastered system specs, including ray-tracing and path-tracing requirements</a> (rockpapershotgun.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wsfmax/see_whats_new_in_the_witcher_3_wild_hunt/\">See what\'s new in The Witcher 3: Wild Hunt – Remastered</a> (reddit.com)</li><li><a href=\"https://itc.ua/ua/novini/the-witcher-3-zminytsya-ne-lyshe-vizualno-cd-projekt-rozkryla-vsi-novynky-remasteru/\">The Witcher 3 зміниться не лише візуально: CD Projekt розкрила всі новинки ремастеру</a> (itc.ua)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'CD Projekt Red is set to launch The Witcher 3: Wild Hunt – Remastered for Nintendo Switch 2 on September 29, with updated visuals and gameplay changes for the 2015 role-playing game. Owners of the original Switch version can claim the Switch 2 edition at no extra cost, but it is listed as a separate eShop product and must be downloaded separately.', NULL, 22, 3, '2026-09-29 21:16:48', NULL, 1, 0, NULL, NULL, NULL, NULL),
(40, 'GTA 6 fans recreate $400 collector\'s gator statue', '<p>Rockstar’s roughly $400 Grand Theft Auto 6 collector’s box contains themed merchandise but no copy of the game. After the set was revealed the previous week, Cults3D user Jouhna117 uploaded a fan-made, 3D-printable version of its Macca the Gator statue on September 24. The upload criticized the price and the absence of a physical game disc.</p>\n<p>Separately, IGN reports that Game Informer’s upcoming 14-page GTA 6 cover story will discuss an “advanced” weather system that simulates Florida’s less-sunny conditions. The preview does not specify how the weather system works or confirm whether hurricanes will appear.</p>\n<h2>Key points</h2>\n<ul><li>Merchandise lineup: The collector’s set contains 11 items, including Oakley Frogskins sunglasses, a Leonida Keys bag and a manatee shot glass.</li><li>Weather preview: The Game Informer feature is set to include exclusive interviews and screenshots alongside its weather-system coverage.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://kotaku.com/gta-6s-collectors-box-gator-statue-can-now-be-3d-printed-400-an-no-disc-fk-you-rockstar-2000737999\">GTA 6′s Collector’s Box Gator Statue Can Now Be 3D Printed: ‘$400 And No Disc? F**k You Rockstar’</a> (kotaku.com)</li><li><a href=\"https://www.ign.com/articles/gta-6-has-an-advanced-weather-system-but-how-will-it-work\">GTA 6 Has an \'Advanced\' Weather System, but How Will It Work?</a> (ign.com)</li><li><a href=\"https://www.polygon.com/gta-6-good-time-state-collectors-editions/\">GTA 6’s $400 Collector’s Edition Is the Latest Example of a Horrible Trend</a> (polygon.com)</li><li><a href=\"https://www.gamesradar.com/games/grand-theft-auto/gta-6-fans-replicate-the-usd400-collectors-box-statue-and-you-can-now-3d-print-your-own-ugly-gator-at-home/\">GTA 6 fans replicate the $400 Collector\'s Box statue, and you can now 3D print your own ugly gator at home</a> (gamesradar.com)</li><li><a href=\"https://www.operationsports.com/gta-6s-400-collectors-edition-was-revealed-days-ago-and-fans-have-already-found-a-cheaper-alternative/\">GTA 6\'s $400 Collector\'s Edition was revealed days ago, and fans have already found a cheaper alternative</a> (operationsports.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wse9vj/gta_6s_advanced_weather_system_finally_confirmed/\">GTA 6’s “advanced” weather system finally confirmed after years of rumors</a> (reddit.com)</li><li><a href=\"https://www.techjuice.pk/gta-6-confirms-advanced-weather-system-some-more-map-details/\">GTA 6 Confirms Advanced Weather System &amp; Some More Map Details</a> (techjuice.pk)</li><li><a href=\"https://refresher.sk/211892-Rockstar-vyda-zberatelsku-ediciu-GTA-VI-Hru-v-nej-ale-nenajdes\">Rockstar vydá zberateľskú edíciu GTA VI. Hru v nej ale nenájdeš!</a> (refresher.sk)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Rockstar’s roughly $400 Grand Theft Auto 6 collector’s box contains themed merchandise but no copy of the game. After the set was revealed the previous week, Cults3D user Jouhna117 uploaded a fan-made, 3D-printable version of its Macca the Gator statue on September 24. The upload criticized the price and the absence of a physical game disc.', NULL, 21, 1, '2026-09-29 21:21:06', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.038961682171288925, '2026-10-15 20:00:16'),
(41, 'The Witcher 3 remaster brings free Switch 2 upgrade', '<p>CD Projekt Red is set to launch The Witcher 3: Wild Hunt – Remastered for Nintendo Switch 2 on September 29, with updated visuals and gameplay changes for the 2015 role-playing game. Owners of the original Switch version can claim the Switch 2 edition at no extra cost, but it is listed as a separate eShop product and must be downloaded separately.</p>\n<p>A comparison of the Switch and Switch 2 versions highlights changes to lighting and frame rate. CD Projekt\'s patch notes also list updated textures and improved lighting for grass and foliage. The remaster includes the Hearts of Stone and Blood and Wine expansions.</p>\n<h2>Key points</h2>\n<ul><li>Storage and access: CD Projekt community manager Marcin Momot put the download at about 50GB.</li></ul>\n<h2>Perspectives</h2>\n<ul><li>Wccftech reviewer: The review said combat and character models still show the game\'s age despite the updated presentation.</li><li>PCGamesN reviewer: The reviewer said the remaster\'s brighter, more colorful look can weaken the atmosphere in areas such as White Orchard.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMitgFBVV95cUxQWmNFbEZvekNuazBpS1pJejRFLU9yZlJYaUI4ZkVwcklxcTdudFVSdV9obUtla2lxbVpPcnVNUE5yNjIxZElNbW5GdjN2ZXNEQUpWOW5OWXhlVmt2dVdDVnRRVWQ0NjNfRElZbVBZRVlveGQyWGgyaG9uNUlFaUpNU0VFWldTdl9yeGM2bzBqblliZ1BmOUxqbU9yOXhSelhVeHpLSmltMVF3V2NsR1RLTTFuNUJFZw\">Video: The Witcher 3 Remastered Side-By-Side Comparison, Switch Vs. Switch 2 - Nintendo Life</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqAFBVV95cUxOMDhNTmljMDMzVjlrbUVoWVVoY0tUbVRZSXFOWE1BVkpteUpyVHNkaG9SZGhwYVRsQ040MlEtSXNyVHJPNkpFTTFiUWpVaTl1b2lHdFZCdW1ITVR3VnpFX3AzMGFLZU9zT0FwZXBzNHlqTU9tbFB2SVF3Qy1RVmpqNnctQ3RzcTNDX04tT09uYnhFNV9SU3Bhc2pvYXBTV3NVdGJRTGRpWVc\">The Witcher 3: Wild Hunt – Remastered Impressions &amp; Nintendo Switch 2 Analysis - gamewatcher.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMilwFBVV95cUxNcjZkbGt4YUk5SW5SY1VNV1I5UEdUbHFZY0RvY1ctaUVMekw4b1BoZU5Ob3NweTlVTUswYVp3MHZ0VHA4eklzd3pyUHRLZlhEVm1VYVU2QWt6aGpjdTFTM0xxSm9Sd3R6YktPUWU1VWtNell5WXNYVTEwc3BPblJRM01NMzJsdjl5N29COWVUbUstN05tYmEw\">The Witcher 3 on Nintendo Switch 2 is now the best way to play this masterpiece - GAMINGbible</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiowFBVV95cUxQM3JJTkFuY285V0xHZ0drU3hlaUVRYktQelRYX2RpZW5PYzZqS1VSZ3phUDgycV9QVWhKWlF1SWRpTVpUREJfM0Z4WURCYTI3SjJfQ3c5XzVzcloxaTBDM1k4X01ybVpkYjZ2dloxVzA3M1lnT1dSX0ZlZjdteVlrMk4tU2NOaGR4RlhJMHlFZEE5dlV0MEhwWXVESUVwRnlON1RV\">Video: The Witcher 3 Nintendo Switch 2 vs. Switch 1 graphics comparison - Nintendo Everything</a> (google.com)</li><li><a href=\"https://nintendoeverything.com/video-the-witcher-3-nintendo-switch-2-vs-switch-1-graphics-comparison/\">Video: The Witcher 3 Nintendo Switch 2 vs. Switch 1 graphics comparison</a> (nintendoeverything.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wsgdw7/the_witcher_3_remastered_on_switch_2_offers_a/\">The Witcher 3 Remastered on Switch 2 offers a gigantic upgrade over the Switch port &amp; is the new gold standard</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wslb73/rpg_site_has_far_and_away_the_best_switch_switch/\">RPG Site has far and away the best Switch / Switch 2 comparison images for the Witcher 3 Remastered</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsfel7/holy_cow_the_witcher_3_remastered_on_switch_2/\">Holy cow, the Witcher 3 Remastered on Switch 2 blows the Switch 1 version out of the water</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsawen/the_witcher_3_remastered_switch_vs_switch_2/\">The Witcher 3 Remastered: Switch vs Switch 2 Comparison</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wsdlrt/the_witcher_3_remastered_switch_2_vs_pc_graphics/\">The Witcher 3 Remastered - Switch 2 Vs PC Graphics Comparison</a> (reddit.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/video-the-witcher-3-remastered-side-by-side-comparison-switch-vs-switch-2\">Video: The Witcher 3 Remastered Side-By-Side Comparison, Switch Vs. Switch 2</a> (nintendolife.com)</li><li><a href=\"https://gonintendo.com/contents/65488-the-witcher-3-wild-hunt-remastered-switch-vs-switch-2-vs-pc-graphics-comparison\">The Witcher 3: Wild Hunt – Remastered \"Switch vs Switch 2 vs PC\" graphics comparison</a> (gonintendo.com)</li><li><a href=\"https://www.gamewatcher.com/the-witcher-3-wild-hunt-remastered-impressions-and-nintendo-switch-2-analysis\">The Witcher 3: Wild Hunt – Remastered Impressions &amp; Nintendo Switch 2 Analysis</a> (gamewatcher.com)</li><li><a href=\"https://www.gamespot.com/videos/should-you-play-witcher-3-remastered-on-the-switch-2/\">Should You Play Witcher 3 Remastered On The Switch 2?</a> (gamespot.com)</li><li><a href=\"https://wccftech.com/the-witcher-3-remastered-incredible-path-tracing-combat-shows-age/\">The Witcher 3: Wild Hunt Remastered Looks Incredible With Path Tracing, but the Combat and Characters Still Show Its Age</a> (wccftech.com)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1wsg6xf/the_witcher_3_remastered_has_nintendo_switch_2/\">The Witcher 3 Remastered has Nintendo Switch 2 exclusive features, such as touchscreen Gwent, that make CDPR’s masterpiece even better on the handheld</a> (reddit.com)</li><li><a href=\"https://itc.ua/ua/novini/grafiku-the-witcher-3-porivnyaly-do-i-pislya-remasteru/\">Графіку The Witcher 3 порівняли до і після ремастеру</a> (itc.ua)</li><li><a href=\"https://www.windowscentral.com/gaming/the-witcher-3-wild-hunt-remastered-gives-a-decade-old-game-a-facelift-worthy-of-yet-another-playthrough\">The Witcher 3: Wild Hunt Remastered review — Worth another run?</a> (windowscentral.com)</li><li><a href=\"https://www.computerbase.de/artikel/gaming/the-witcher-3-remastered-benchmark-test.99563/\">The Witcher 3 Remastered im Test: So gut ist das kostenlose Upgrade der PC-Version</a> (computerbase.de)</li><li><a href=\"https://www.pcgamesn.com/the-witcher-3-wild-hunt/remastered-review\">The Witcher 3 Remastered is the perfect excuse to get back on the Path, even if it looks a bit too colorful</a> (pcgamesn.com)</li><li><a href=\"https://www.thegamer.com/the-witcher-3-remastered-2026-best-game/\">The Witcher 3 Remastered Is Officially The Best Game Of 2026</a> (thegamer.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/round-up-the-first-impressions-for-the-witcher-3-remastered-are-in\">Round Up: The First Impressions For The Witcher 3 Remastered Are In</a> (nintendolife.com)</li><li><a href=\"https://dtf.ru/hard/5323726-remaster-vedmaka-3-grafika-i-proizvoditelnost\">Ремастер «Ведьмака 3» — сравнения графики, тесты производительности на ПК и консольные режимы</a> (dtf.ru)</li><li><a href=\"https://www.pcgamer.com/games/the-witcher/heres-a-gallery-of-the-times-the-witcher-3s-remastered-lighting-had-me-like-damn/\">Here\'s a gallery of the times The Witcher 3\'s remastered lighting had me like, \'Damn\'</a> (pcgamer.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMizwFBVV95cUxNWDlWZnFuenJvUXR3cEFnb1pEVUVJbGpzRWp0RXRILUw1dGpMZFFlSkM5bmo3WEQ4N05MN3VRUmtPdHI1ZlotTGxkQUZTQzdqSU1YQkIxSjR0MURjVzN2XzVuYlpJdDZzMk1QZU5lM1hDaHY0cEhlam9rYTQtMEhvN0dETUtUVDZwUGFSNXdveUFlVm5JQ05YeGNXRy04NjZRZDB3RnNNVEdCV0VMMkhIRm9MVHh5R3dZY3ZzYmJZeHZId1l1VmZYNkNBYWJtZW8\">PSA: The Witcher 3 Remastered File Size And Release Time Confirmed, Separate Purchase Required - Nintendo Life</a> (google.com)</li><li><a href=\"https://nintendowire.com/news/2026/09/28/cd-projekt-red-confirms-the-witcher-3-remastered-release-time-and-download-size/\">CD Projekt Red confirms The Witcher 3: Remastered release time and download size</a> (nintendowire.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/psa-the-witcher-3-remastered-file-size-and-release-time-confirmed-separate-purchase-required\">PSA: The Witcher 3 Remastered File Size And Release Time Confirmed, Separate Purchase Required</a> (nintendolife.com)</li><li><a href=\"https://www.pcgamer.com/games/rpg/witcher-3-remastered-release-date-launch-times/\">Here\'s The Witcher 3 Remastered release time for your region</a> (pcgamer.com)</li><li><a href=\"https://www.ign.com/articles/the-witcher-3-wild-hunt-remastered-update-patch-notes-include-pc-specific-and-console-specific-changes\">The Witcher 3: Wild Hunt – Remastered Update Patch Notes Include PC-Specific and Console-Specific Changes</a> (ign.com)</li><li><a href=\"https://techgenyz.com/witcher-3-remastered-upgrade/\">The Witcher 3 Remastered Launches September 29</a> (techgenyz.com)</li><li><a href=\"https://www.eurogamer.net/witcher-3-wild-hunt-remastered-generous-upgrade-makes-it-new-again\">The Witcher 3 Remastered is an extraordinarily generous upgrade that doesn\'t change the game, but does make it new again</a> (eurogamer.net)</li><li><a href=\"https://gonintendo.com/contents/65487-the-witcher-3-wild-hunt-remastered-patch-notes-shared\">The Witcher 3: Wild Hunt – Remastered Patch Notes shared</a> (gonintendo.com)</li><li><a href=\"https://www.ign.com/articles/cd-projekt-releases-official-list-of-all-the-improvements-in-the-witcher-3-wild-hunt-remastered\">CD Projekt Releases Official List of All the Improvements in The Witcher 3: Wild Hunt — Remastered</a> (ign.com)</li><li><a href=\"https://www.gamesradar.com/games/the-witcher/the-witcher-3-remaster-overhauls-skill-trees-adds-new-quest-markers-brings-a-mode-to-reduce-cognitive-load-and-more-cd-projekt-red-reveals-in-patch-notes/\">The Witcher 3 Remaster overhauls skill trees, adds new quest markers, and more, CDPR reveals</a> (gamesradar.com)</li><li><a href=\"https://www.pcgamer.com/games/rpg/just-happy-the-witcher-3s-back-in-the-news/\">Just happy The Witcher 3\'s back in the news</a> (pcgamer.com)</li><li><a href=\"https://www.pcgamer.com/games/the-witcher/cd-projekt-lays-out-why-you-should-play-the-witcher-3-remastered/\">CD Projekt lays out why you should play The Witcher 3 Remastered</a> (pcgamer.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1wsrz3p/witcher_3_remastered_pc_specs_guide/\">Witcher 3 Remastered PC Specs guide</a> (reddit.com)</li><li><a href=\"https://itavisen.no/2026/09/28/slik-far-du-witcher-3-remastered-gratis/\">Slik får du The Witcher 3 Remastered gratis i morgen</a> (itavisen.no)</li><li><a href=\"https://www.rockpapershotgun.com/cd-projekt-release-full-updated-witcher-3-wild-hunt-remastered-system-specs-including-ray-tracing-and-path-tracing-requirements\">CD Projekt release full updated Witcher 3: Wild Hunt Remastered system specs, including ray-tracing and path-tracing requirements</a> (rockpapershotgun.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wsfmax/see_whats_new_in_the_witcher_3_wild_hunt/\">See what\'s new in The Witcher 3: Wild Hunt – Remastered</a> (reddit.com)</li><li><a href=\"https://itc.ua/ua/novini/the-witcher-3-zminytsya-ne-lyshe-vizualno-cd-projekt-rozkryla-vsi-novynky-remasteru/\">The Witcher 3 зміниться не лише візуально: CD Projekt розкрила всі новинки ремастеру</a> (itc.ua)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'CD Projekt Red is set to launch The Witcher 3: Wild Hunt – Remastered for Nintendo Switch 2 on September 29, with updated visuals and gameplay changes for the 2015 role-playing game. Owners of the original Switch version can claim the Switch 2 edition at no extra cost, but it is listed as a separate eShop product and must be downloaded separately.', NULL, 22, 1, '2026-09-29 21:21:06', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.21687442717319488, '2026-10-15 20:00:16');
INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(42, 'The Witcher 3 remaster breaks Steam player record', '<p>CD Projekt Red released The Witcher 3: Wild Hunt – Remastered on September 29 for PC, PlayStation 5, Xbox Series X|S and Nintendo Switch 2. Existing owners receive the update for free, and it includes both expansions, Hearts of Stone and Blood and Wine. Alongside visual and performance upgrades, the update revises combat, character progression, animations, accessibility options and the interface.</p>\n<p>The remaster drew a record Steam audience, reaching 120,975 concurrent players and exceeding the previous peak of 103,329 set in January 2020. Steam figures do not include players on consoles or other PC storefronts.</p>\n<h2>Key points</h2>\n<ul><li>Switch 2 performance: The Switch 2 version targets up to 1080p at 40 frames per second while docked and 720p in handheld mode.</li><li>Skill changes: The rebuilt skill tree requires prerequisite skills and gives each skill three ranks, while the update resets existing skill points.</li><li>Console mods: The PS5 version launched with more than 40 downloadable mods, but enabling them disables Trophies.</li><li>PC requirements: For 4K path tracing with DLSS and frame generation, PC Gamer lists an Nvidia RTX 5080 as the required graphics card.</li></ul>\n<blockquote><p>\"Seeing so many of you set out on this journey for the very first time, or relive it once more, means the world to us. Thank you for putting your trust in us, all these years later.\"</p><p>— <a href=\"https://www.destructoid.com/the-witcher-3-steam-player-count-record-11-years-after-launch/\">CD Projekt Red, Destructoid</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>CD Projekt Red designer Paweł Sasko said the team revisited player and journalist feedback because the gameplay had aged less well than the story.</li><li>Push Square’s reviewer said the PS5 remaster smooths over rough edges effectively but adds no truly game-changing features.</li><li>Fans celebrated the remaster’s retention of the familiar low-polygon model for flying pigeons, while grounded pigeons use a different model.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2015</strong>: The Witcher 3 originally launched.</li><li><strong>2022</strong>: A next-generation update added visual enhancements and ray tracing.</li><li><strong>29 September 2026</strong>: CD Projekt Red released the Remastered update across PC and consoles.</li><li><strong>2027</strong>: The announced Songs of the Past expansion is scheduled to arrive.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.pcgamesn.com/the-witcher-3-wild-hunt/remastered-system-requirements\">The Witcher 3 Remastered system requirements will show you how radiant Roach can be on your rig</a> (pcgamesn.com)</li><li><a href=\"https://www.eurogamer.net/witcher-3-steam-most-played-record-remastered\">The Witcher 3 surges to its highest Steam concurrent player-count ever, following Remastered edition\'s release</a> (eurogamer.net)</li><li><a href=\"https://www.eurogamer.net/all-versions-of-the-witcher-3-that-exist-in-the-world-will-be-upgraded-with-the-free-remastered-edition-today\">All versions of The Witcher 3 \"that exist in the world\" will be upgraded with the free Remastered edition today</a> (eurogamer.net)</li><li><a href=\"https://www.ign.com/articles/the-witcher-3-fans-relieved-to-find-low-polygon-pigeons-have-survived-the-remaster-process\">The Witcher 3 Fans Relieved to Find Low-Polygon Pigeons Have Survived the Remaster Process</a> (ign.com)</li><li><a href=\"https://www.ign.com/articles/the-witcher-3-remastered-has-already-broken-steam-concurrent-player-record\">The Witcher 3 Remastered Has Already Broken Steam Concurrent Player Record</a> (ign.com)</li><li><a href=\"https://www.mmorpg.com/news/the-witcher-3-wild-hunt-remastered-is-out-now-as-a-purchase-or-a-free-upgrade-for-current-witcher-3-owners-2000139026\">The Witcher 3: Wild Hunt Remastered is Out Now As a Purchase or A Free Upgrade For Current Witcher 3 Owners</a> (mmorpg.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1wt84sn/the_witcher_3_wild_hunt_remastered_is_now_out/\">The Witcher 3: Wild Hunt — Remastered is now out!</a> (reddit.com)</li><li><a href=\"https://www.destructoid.com/best-answers-when-simulating-the-witcher-2-in-the-witcher-3-remastered/\">Best answers when simulating The Witcher 2 in The Witcher 3: Remastered</a> (destructoid.com)</li><li><a href=\"https://www.destructoid.com/the-witcher-3-steam-player-count-record-11-years-after-launch/\">The Witcher 3 just flew past its own Steam player count record 11 years after launching</a> (destructoid.com)</li><li><a href=\"https://www.destructoid.com/best-the-witcher-3-remastered-graphics-settings-for-no-lag-and-max-fps/\">Best The Witcher 3: Remastered graphics settings for no lag and steady FPS</a> (destructoid.com)</li><li><a href=\"https://www.reddit.com/r/playstation/comments/1wta4iw/back_home_witcher_3_remastered/\">Back Home: Witcher 3 Remastered</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/playstation/comments/1wt6p0m/its_time_to_revisit_the_witcher_3/\">It’s time to revisit the Witcher 3</a> (reddit.com)</li><li><a href=\"https://www.pcgamer.com/games/the-witcher/cd-projekt-urges-witcher-3-remastered-owners-to-update-their-drivers/\">CD Projekt urges Witcher 3 Remastered owners to update their drivers</a> (pcgamer.com)</li><li><a href=\"https://www.pcgamer.com/hardware/the-witcher-3-updated-system-requirements-are-in-and-you-will-need-an-rtx-5080-for-path-tracing-with-dlss-and-frame-generation/\">The Witcher 3 updated system requirements are in, and you will need an RTX 5080 for path tracing with DLSS and frame generation at 4K</a> (pcgamer.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wtej4i/the_witcher_3_wild_hunt_remastered_discussion/\">The Witcher 3: Wild Hunt — Remastered | Discussion Thread</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wt74qe/the_witcher_3_wild_hunt_remastered_launch_trailer/\">The Witcher 3: Wild Hunt Remastered - Launch Trailer | PS5 Games</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wt62n3/the_witcher_3_remaster_can_now_be_downloaded/\">The Witcher 3 Remaster can now be downloaded</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1wt6s7q/the_witcher_3_wild_hunt_remastered_official/\">The Witcher 3: Wild Hunt — Remastered | Official Launch Trailer</a> (reddit.com)</li><li><a href=\"https://kotaku.com/you-can-get-a-free-digital-copy-of-the-witcher-3-remastered-on-switch-2-if-you-just-borrow-an-old-physical-switch-copy-of-the-rpg-2000738492\">You Can Get A Free Digital Copy Of The Witcher 3 Remastered  On Switch 2 If You Just Borrow An Old Physical Switch Copy Of The RPG</a> (kotaku.com)</li><li><a href=\"https://kotaku.com/the-witcher-3-remastered-players-are-turning-bloom-off-to-make-it-look-better-on-pc-2000738434\">The Witcher 3 Remastered Players Are Turning Bloom Off To Make It Look Better On PC</a> (kotaku.com)</li><li><a href=\"https://kotaku.com/the-witcher-3-remastered-just-broke-a-steam-record-as-people-rush-back-to-play-a-new-and-improved-version-of-one-of-the-best-rpgs-ever-2000738418\">The Witcher 3 Remastered Just Broke A Steam Record As People Rush Back To Play A New And Improved Version Of One Of The Best RPGs Ever</a> (kotaku.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wt6qz0/the_witcher_3_wild_hunt_remastered_official/\">The Witcher 3: Wild Hunt - Remastered | Official Launch Trailer</a> (reddit.com)</li><li><a href=\"https://www.pushsquare.com/news/2026/09/the-witcher-3-remastered-ps5-pays-homage-to-the-worst-dlc-in-history\">The Witcher 3 Remastered PS5 Pays Homage to the Worst DLC in History</a> (pushsquare.com)</li><li><a href=\"https://www.pushsquare.com/reviews/ps5/the-witcher-3-wild-hunt-remastered\">Review: The Witcher 3: Wild Hunt Remastered (PS5) - How to Improve a Masterpiece</a> (pushsquare.com)</li><li><a href=\"https://www.pushsquare.com/news/2026/09/the-witcher-3-remastered-available-to-download-now\">The Witcher 3 Remastered Available to Download Now</a> (pushsquare.com)</li><li><a href=\"https://www.pushsquare.com/news/2026/09/the-witcher-3-remastered-has-over-40-mods-available-at-launch-on-ps5\">The Witcher 3 Remastered Has Over 40 Mods Available at Launch on PS5</a> (pushsquare.com)</li><li><a href=\"https://80.lv/articles/the-witcher-3-remastered-makes-an-11-year-old-rpg-feel-new-again/\">The Witcher 3 Remastered Makes an 11-Year-Old RPG Feel New Again</a> (80.lv)</li><li><a href=\"https://www.rockpapershotgun.com/the-witcher-3-remastered-has-scuppered-an-ambitious-cut-plague-quest-restoration-mod-but-therell-be-something-extra-in-the-update-that-gets-it-working-again\">The Witcher 3 Remastered has scuppered an ambitious cut plague quest restoration mod, but there\'ll be \"something extra\" in the update that gets it working again</a> (rockpapershotgun.com)</li><li><a href=\"https://gameranx.com/updates/id/564230/article/the-witcher-3-wild-hunt-remastered-launches-today-alongside-free-upgrades-on-all-platforms/\">The Witcher 3: Wild Hunt Remastered Launches Today – Alongside Free Upgrades On All Platforms</a> (gameranx.com)</li><li><a href=\"https://www.thegamer.com/the-witcher-3-wild-hunt-remaster-free-cosmetic-dlc/\">The Witcher 3: The Wild Hunt Remastered - How To Get All Free Cosmetics</a> (thegamer.com)</li><li><a href=\"https://www.thegamer.com/the-witcher-3-bloom-setting-visual-complaints/\">How To Fix The Witcher 3 Remaster\'s Washed Out Visuals</a> (thegamer.com)</li><li><a href=\"https://www.thegamer.com/the-witcher-3-wild-hunt-remastered-free-upgrades-visual-changes/\">The Witcher 3: Wild Hunt Remastered Is The Definitive Way To Experience This Classic RPG</a> (thegamer.com)</li><li><a href=\"https://www.gamesradar.com/games/the-witcher/the-witcher-3-remastered-breaks-the-rpgs-all-time-steam-peak-hours-after-launch-with-a-surging-player-count-that-shows-no-signs-of-slowing-down/\">The Witcher 3 Remastered breaks the RPG\'s all-time Steam peak hours after launch</a> (gamesradar.com)</li><li><a href=\"https://www.gamesradar.com/games/the-witcher/the-witcher-3-remastered-did-not-in-fact-change-the-rpgs-hilarious-low-poly-pigeons-much-to-fans-delight-glory-to-low-poly/\">The Witcher 3 Remastered didn\'t change the RPG\'s hilarious low-poly pigeons, much to fans\' delight</a> (gamesradar.com)</li><li><a href=\"https://www.gamesradar.com/games/the-witcher/the-witcher-3-remastered-metacritic-score-places-it-as-the-best-version-of-the-rpg-yet-and-the-top-scoring-game-of-2026/\">The Witcher 3 Remastered Metacritic score makes it the best version yet and 2026\'s top-scoring game</a> (gamesradar.com)</li><li><a href=\"https://www.gamingonlinux.com/2026/09/the-witcher-3-wild-hunt-remastered-is-out-now/\">The Witcher 3: Wild Hunt — Remastered is out now</a> (gamingonlinux.com)</li><li><a href=\"https://canaltech.com.br/games/the-witcher-3-remastered-no-pc-veja-requisitos-para-jogar/\">The Witcher 3: Remastered no PC: veja requisitos para jogar</a> (canaltech.com.br)</li><li><a href=\"https://nintendonews.com/news/156749\">The Witcher 3 Remastered launch trailer – acclaimed RPG returns on Nintendo Switch 2</a> (nintendonews.com)</li><li><a href=\"https://www.metal-hammer.de/the-witcher-3-wild-hunt-remastered-kostenlos-erhaeltlich-2549449/\">‘The Witcher 3: Wild Hunt – Remastered’ kostenlos erhältlich</a> (metal-hammer.de)</li><li><a href=\"https://www.hardwarezone.com.sg/entertainment/gaming/cd-projekt-red-the-witcher-3-wild-hunt-remastered-pc-version-release\">The Witcher 3: Wild Hunt – Remastered is out, and the PC version gets the best visual upgrades</a> (hardwarezone.com.sg)</li><li><a href=\"https://tweakers.net/nieuws/252752/remaster-van-the-witcher-3-is-uit-en-breekt-meteen-spelersrecord-op-steam.html\">Remaster van The Witcher 3 is uit en breekt meteen spelersrecord op Steam</a> (tweakers.net)</li><li><a href=\"https://www.ghacks.net/2026/09/29/the-witcher-3-remastered-launches-september-29-as-a-free-45gb-update-with-path-tracing-and-transmog/\">The Witcher 3 Remastered Launches September 29 as a Free 45GB Update With Path Tracing and Transmog</a> (ghacks.net)</li><li><a href=\"https://www.computerbase.de/news/gaming/the-witcher-3-kostenloses-remaster-gipfelt-in-neuem-spielerrekord-auf-steam.99607/\">The Witcher 3: Kostenloses Remaster bringt neuen Spielerrekord auf Steam</a> (computerbase.de)</li><li><a href=\"https://techgenyz.com/the-witcher-3-remastered/\">The Witcher 3 Remastered Is Now Available With Major Upgrades</a> (techgenyz.com)</li><li><a href=\"https://nintendonews.com/news/156744\">The Witcher 3: Developers talk remastering a classic and creating Songs of the Past</a> (nintendonews.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/round-up-the-first-reviews-for-the-witcher-3-remastered-are-in\">Round Up: The First Reviews For The Witcher 3 Remastered Are In</a> (nintendolife.com)</li><li><a href=\"https://gonintendo.com/contents/65510-the-witcher-3-wild-hunt-remastered-now-available-on-switch-2\">The Witcher 3: Wild Hunt — Remastered now available on Switch 2</a> (gonintendo.com)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1wt8bjy/the_witcher_3_remastered_on_switch_2_offers_a/\">The Witcher 3 Remastered on Switch 2 offers a gigantic upgrade over the Switch port &amp; is the new gold standard</a> (reddit.com)</li><li><a href=\"https://refresher.sk/211999-The-Witcher-3-Wild-Hunt-Remastered-je-vonku-Prinasa-technologicke-novinky-nove-mody-a-je-uplne-zadarmo\">The Witcher 3: Wild Hunt Remastered je vonku. Prináša technologické novinky, nové módy a je úplne zadarmo</a> (refresher.sk)</li><li><a href=\"https://itc.ua/ua/novini/the-witcher-3-remastered-pobyla-rekord-oryginalu-za-chotyry-godyny-pislya-relizu/\">The Witcher 3 Remastered побила рекорд оригіналу за чотири години після релізу</a> (itc.ua)</li><li><a href=\"https://www.reddit.com/r/linux_gaming/comments/1wtlvw8/witcher_3_sourcing_post/\">Witcher 3 Sourcing Post</a> (reddit.com)</li><li><a href=\"https://www.yna.co.kr/view/AKR20260930085200017\">CDPR, \'더 위쳐 3: 와일드 헌트\' 리마스터 출시</a> (yna.co.kr)</li><li><a href=\"https://www.tomsguide.com/gaming/nintendo/witcher-3-remastered-on-switch-2-is-the-portable-rpg-experience-nintendo-fans-deserve-and-a-huge-upgrade-over-the-switch-1s-compromised-port\">Witcher 3 Remastered on Switch 2 is the portable RPG experience Nintendo fans deserve — and a huge upgrade over the Switch 1’s compromised port</a> (tomsguide.com)</li><li><a href=\"https://www.techradar.com/gaming/the-witcher-3-wild-hunt-remastered-adds-a-neat-bards-ballad-preset-designed-to-streamline-gameplay-by-offering-a-ton-of-custom-options-you-would-normally-need-mods-for-and-im-eager-to-try-it-out\">The Witcher 3: Wild Hunt – Remastered adds a neat Bard\'s Ballad preset designed to \'streamline gameplay\' by offering a ton of custom options you would normally need mods for, and I\'m eager to try it out</a> (techradar.com)</li><li><a href=\"https://www.techspot.com/review/3180-the-witcher-3-remastered-benchmarks/\">The Witcher 3 Remastered GPU Benchmark: RTX 5090 to Arc B580</a> (techspot.com)</li><li><a href=\"https://www.heise.de/news/Remaster-Release-Mehr-Spieler-denn-je-spielen-The-Witcher-3-11470479.html\">Remaster-Release: Mehr Spieler denn je spielen „The Witcher 3“</a> (heise.de)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wt88vc/witcher_3_remastered_looks_amazing_handheld_mode/\">Witcher 3 Remastered looks amazing! (Handheld mode)</a> (reddit.com)</li><li><a href=\"https://www.radiofrance.fr/francemusique/podcasts/maxxi-classique/pourquoi-la-musique-de-the-witcher-iii-est-aussi-ensorcelante-2559302\">Pourquoi la musique de The Witcher III nous ensorcelle toujours ?</a> (radiofrance.fr)</li><li><a href=\"https://respawn.media/gaming/rkfqm-the-witcher-3-kak-obnovit-na-nintendo-switch-2\">The Witcher 3 — как обновить на Nintendo Switch 2</a> (respawn.media)</li><li><a href=\"https://www.ithome.com/1/008/613.htm\">《巫师 3：重制版》登陆 Switch 2：画质大幅进化，最高 1080p/40FPS</a> (ithome.com)</li><li><a href=\"https://www.gamer.no/artikler/stor-pagang-for-the-witcher-3-oppussingen/521092\">Stor pågang for The Witcher 3-oppussingen</a> (gamer.no)</li><li><a href=\"https://tech.wp.pl/wiedzmin-3-dziki-gon-remaster-dostepny-za-darmo-dla-posiadaczy-gry,7334652746737888a\">Wiedźmin 3: Dziki Gon – Remaster dostępny za darmo dla posiadaczy gry</a> (wp.pl)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1wtq77u/you_can_get_witcher_3_remaster_for_free_on_your/\">You can get Witcher 3 Remaster for free on your S2 by borrowing a normal W3 cartridge</a> (reddit.com)</li><li><a href=\"https://wccftech.com/the-witcher-3-remastered-dlss-5-geralt-facelift-performance-cost/\">Injecting DLSS 5 Into The Witcher 3 Remastered Gives Geralt a Much-Needed Facelift, but Costs Up to 30% Performance</a> (wccftech.com)</li><li><a href=\"https://www.xda-developers.com/the-witcher-3-remastered-was-just-released-and-linux-gamers-already-found-a-way-to-make-it-run-with-no-issues/\">The Witcher 3 Remastered only just released, and Linux gamers already got it running \"with no issues\"</a> (xda-developers.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wtvl91/how_are_yall_feeling_so_far_about_witcher_3/\">How are yall feeling so far about Witcher 3 Remastered?</a> (reddit.com)</li><li><a href=\"https://respawn.media/gaming/vvcyd-vyshel-remaster-vedmaka-3-a-na-twitch-razdayut-skin-dlya-plotvy\">Вышел ремастер «Ведьмака 3», а на Twitch раздают скин для Плотвы</a> (respawn.media)</li><li><a href=\"https://www.pb.pl/trzecie-zycie-wiedzmina-3-gracze-znow-ruszyli-wiedzminskim-szlakiem-1267866\">Trzecie życie „Wiedźmina 3”. Gracze znów ruszyli wiedźmińskim szlakiem</a> (pb.pl)</li><li><a href=\"https://www.reddit.com/r/linux_gaming/comments/1wtskcc/witcher_3_remastered_working_with_path_tracing/\">Witcher 3 Remastered working with path tracing, frame generation and dlss all on cachyos, with no issues! It takes setup but once setup, I haven\'t had a single crash. (5070 Ti)</a> (reddit.com)</li><li><a href=\"https://gonintendo.com/contents/65540-the-witcher-3-wild-hunt-remastered-switch-2-vs-ps5-graphics-comparison\">The Witcher 3: Wild Hunt – Remastered \"Switch 2 vs. PS5\" graphics comparison</a> (gonintendo.com)</li><li><a href=\"https://nintendonews.com/news/156751\">CD Projekt says it overhauled Witcher 3 gameplay because it was ‘obviously’ the weakest part</a> (nintendonews.com)</li><li><a href=\"https://canaltech.com.br/games/injogavel-no-time-vermelho-the-witcher-3-remastered-chega-quebrado-nas-placas-amd/\">Injogável no time vermelho: The Witcher 3 Remastered chega quebrado nas placas AMD</a> (canaltech.com.br)</li><li><a href=\"https://www.computerbase.de/news/grafikkarten/the-witcher-3-remastered-rx-9000-gamer-benoetigen-zwingend-den-adrenalin-26-9-2.99598/\">Treiber für The Witcher 3 Remastered: RX 9000 benötigt unter Windows den Adrenalin 26.9.2 (Update)</a> (computerbase.de)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wt6zia/the_witcher_3_remastered_looks_blurry_in_handheld/\">The Witcher 3 remastered looks blurry in handheld mode</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wtdimw/the_witcher_11_years_after_launch_more_witchers/\">The Witcher: 11 years after launch, more witchers are now walking the Path across the Continent than ever before. Seeing so many of you set out on this journey for the very first time, or relive it once more, means the world to us. Thank you for putting your trust in us, all these years later.</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'CD Projekt Red released The Witcher 3: Wild Hunt – Remastered on September 29 for PC, PlayStation 5, Xbox Series X|S and Nintendo Switch 2. Existing owners receive the update for free, and it includes both expansions, Hearts of Stone and Blood and Wine. Alongside visual and performance upgrades, the update revises combat, character progression, animations, accessibility options and the interface.', NULL, 21, 1, '2026-09-30 22:56:07', NULL, 4, 0, '2026-10-15 20:00:04', NULL, -0.02091859424702928, '2026-10-15 20:00:16'),
(43, 'Nintendo releases free Star Fox update with four-player battles', '<p>Nintendo released version 1.2.0 for the Nintendo Switch 2 remake of Star Fox on Sept. 29. The free update adds Battle Mode content and supports up to four players in split-screen on one console. The update adds the Katina, Sector X and Venom stages, along with new battle items.</p>\n<p>The patch also adjusts Campaign and Challenge modes, changes Battle Mode behavior and includes bug fixes.</p>\n<h2>Key points</h2>\n<ul><li>Stage objectives: Katina centers on controlling a powerful laser, Sector X challenges players to destroy asteroids while avoiding energy waves, and Venom tasks players with scanning data modules before escaping a surge.</li><li>Online teams: Players using split-screen can join random online matches together as a team.</li><li>Controller options: Each player needs a controller. Joy-Con 2 and original Joy-Con controllers can be used individually in horizontal grip.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMifkFVX3lxTE03SjQ0MW9FTWxMT2hlNHFxTWJpdmo2U29vc0xRanlOVUdEaER2VWhVVHdlbnM5dXFFbkFIdWVtZk9ULTVoZF9xNldiMEZGN0VfTVQwMjE5VFhnVjNoRmd2WXRJRzNNbHM2elh5bXB5ZW1FVXFiM0FsZGJwV2VDUQ\">Star Fox 1.2.0 update out now, patch notes - Nintendo Everything</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMijAFBVV95cUxOQTljVzhiOUJhME9zNlRCMkFKcENNS3FnTkhDVlA1ZjZ1YUY5dkRNTkZGQlhrMGVvUHQ3ZlVUWU9SU3o4VDlRRy11aC12V1U1U0hNNWppU0p4VXJfWVZRbFh4UUoyaFM1bmVhZ3Y5emY1ZlMtRmtkVVk3bXlNRW5SVWZDZjZJTUIxVm01MQ\">Star Fox updated to Version 1.2.0 (patch notes) - mynintendonews.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqgFBVV95cUxPbm41dXU3T1pzVEZsWkR6T3V3ODBjTlZLUVZlZE93WTlEc2NxRzlOTDl5b1NKZnJ6aEZWUWQ1OFktNlhIamdYSDc0OVRGRzRkaEZfTzVFcjV6aTBiTGRGZzZ2Rmd6eVFnX3k2dFpNMFBtVTdZal84WGw4S3p5QXl6dkVWN3ZDeG92UldnVWNsT3Y5Nl9haFpFLW1Nc1FELUdSWXhtMmh2d2V2Zw\">Star Fox Version 1.2.0 Is Now Live, Here Are The Full Patch Notes - Nintendo Life</a> (google.com)</li><li><a href=\"https://mynintendonews.com/2026/09/30/star-fox-updated-to-version-1-2-0-patch-notes/\">Star Fox updated to Version 1.2.0 (patch notes)</a> (mynintendonews.com)</li><li><a href=\"https://nintendoeverything.com/star-fox-1-2-0-update-out-now-patch-notes/\">Star Fox 1.2.0 update out now, patch notes</a> (nintendoeverything.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wtrhv5/star_fox_version_120_is_out_now/\">Star Fox Version 1.2.0 is out now!</a> (reddit.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/star-fox-version-1-2-0-is-now-live-here-are-the-full-patch-notes\">Star Fox Version 1.2.0 Is Now Live, Here Are The Full Patch Notes</a> (nintendolife.com)</li><li><a href=\"https://gonintendo.com/contents/65543-star-fox-updated-to-ver-1-2-0-free-battle-mode-content-now-available\">Star Fox updated to Ver. 1.2.0, free Battle Mode content now available</a> (gonintendo.com)</li><li><a href=\"https://www.gematsu.com/2026/09/star-fox-version-1-2-0-update-now-available\">Star Fox version 1.2.0 update now available</a> (gematsu.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wtra7p/gather_the_crewa_free_update_is_taking_off_in/\">Gather the crew—a free update is taking off in Star Fox!</a> (reddit.com)</li><li><a href=\"https://www.vooks.net/star-fox-split-screen-battle-mode-update-now-available/\">Star Fox split-screen battle mode update now available</a> (vooks.net)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo released version 1.2.0 for the Nintendo Switch 2 remake of Star Fox on Sept. 29. The free update adds Battle Mode content and supports up to four players in split-screen on one console. The update adds the Katina, Sector X and Venom stages, along with new battle items.', NULL, 22, 1, '2026-09-30 22:56:08', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.31107057099188423, '2026-10-15 20:00:16'),
(44, 'Nintendo opens Zelda 40th anniversary concert ticket sales', '<p>Tickets for the European leg of Nintendo’s The Legend of Zelda 40th Anniversary concert tour went on sale September 30, 2026. Presales and ticket sales for selected North American cities also began at noon local time that day, following Nintendo’s September 29 announcement.</p>\n<p>The tour includes dates in Chicago, Dallas, Houston, Seattle, Los Angeles and New York. Ticket details for Boston and San Francisco were still pending in the article’s latest update.</p>\n<h2>Key points</h2>\n<ul><li>Australian presales: Vooks reported that Australian presale dates had been revealed for Sydney and Melbourne-area shows.</li></ul>\n<blockquote><p>\"I\'ve been waiting for well over an hour for the London shows, and I\'m still 8,000th in line\"</p><p>— <a href=\"https://www.nintendolife.com/news/2026/09/zelda-40th-anniversary-concert-tickets-are-now-live-across-europe\">Jim Norman, Nintendo Life</a></p></blockquote>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.vooks.net/the-legend-of-zelda-40th-anniversary-concert-australian-presale-dates-revealed/\">The Legend of Zelda 40th Anniversary Concert Australian presale dates revealed</a> (vooks.net)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqwFBVV95cUxPSnVSY1E0cURaOUFSNGllT3ktdlgyZXdtRFZwdUFGS3VpbkxBSE9ab0doYU5PTU5IQTc5cnZTeTVJTm81VzVyLUFodmt2czViTnUyTXIwSklTUjVwbmpBQW4ycERyT0U1LXFaLVB0eW13ckpLckREcXZQTnN5YTBLRWVLNlNYd3Z3V0tBT3NDVVFIQmpYbF80ZG1IU2NKcEZPM1JYRWwzZnhlSjA\">Zelda 40th Anniversary Concert Tickets Are Now Live Across Europe - Nintendo Life</a> (google.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/09/zelda-40th-anniversary-concert-tickets-are-now-live-across-europe\">Zelda 40th Anniversary Concert Tickets Are Now Live Across Europe</a> (nintendolife.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Tickets for the European leg of Nintendo’s The Legend of Zelda 40th Anniversary concert tour went on sale September 30, 2026. Presales and ticket sales for selected North American cities also began at noon local time that day, following Nintendo’s September 29 announcement.', NULL, 22, 1, '2026-10-01 23:18:15', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.1772841994293846, '2026-10-15 20:00:16'),
(45, 'Pokémon Legends: Z-A gets a Switch 2 physical DLC bundle', '<p>Nintendo and The Pokémon Company announced a physical Nintendo Switch 2 Edition of Pokémon Legends: Z-A that includes the base game and Mega Dimension expansion on a standard game card. The package is scheduled for release in North America and Europe on October 29, 2026. The cartridge is also compatible with the original Nintendo Switch, and the package includes a serial code for 100 Ultra Balls that can be redeemed through Mystery Gift.</p>\n<p>Mega Dimension originally launched as a separate download last October. Nintendo had not announced a price for the physical package as of September 30.</p>\n<h2>Key points</h2>\n<ul><li>Regional availability: In Australia and New Zealand, the physical release is exclusive to the Nintendo Store.</li><li>Expansion features: Mega Dimension adds portal-based adventures in Lumiose City and allows players to temporarily control Pokémon above level 100.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://mynintendonews.com/2026/09/30/nintendo-europe-announces-pokemon-legends-z-a-physical-with-dlc-bundle/\">Nintendo Europe announces Pokemon Legends Z-A physical with DLC bundle</a> (mynintendonews.com)</li><li><a href=\"https://nintendonews.com/news/156785\">Pokémon Legends: Z-A Is Getting A New Switch 2 Physical Release Next Month</a> (nintendonews.com)</li><li><a href=\"https://nintendonews.com/news/156783\">Pokemon Legends: Z-A – Nintendo Switch 2 Edition, Pokemon Pokopia game and DLC bundles on the way</a> (nintendonews.com)</li><li><a href=\"https://www.vooks.net/pokemon-legends-z-a-getting-physical-release-bundled-with-mega-dimension-dlc/\">Pokémon Legends: Z-A getting physical release bundled with Mega Dimension DLC</a> (vooks.net)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wu4bqw/a_physical_bundle_including_both_pokemonlegendsza/\">A physical bundle including both #PokemonLegendsZA – Nintendo Switch 2 Edition and the Mega Dimension DLC will release on October 29th! If you purchase it, you’ll also receive a serial code for 100 Ultra Balls</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wu6of6/nintendo_is_releasing_a_pok%C3%A9mon_legends_za/\">Nintendo is Releasing a Pokémon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension bundle on a single Game Card.</a> (reddit.com)</li><li><a href=\"https://www.ign.com/articles/pokemon-legends-z-a-nintendo-switch-2-edition-mega-dimension-physical-bundle-announced\">Pokémon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension Physical Bundle Announced</a> (ign.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMisAFBVV95cUxPRURId1pCLUhGdEE4LUF3RlVmLTRReHpmdVV3S1B0MEwwTGpyTXpfV3BhXzNyWEx1TENnMW1pZ2JhOGZTaV9qTzV6dDZDYVdaN2JJVE92djZRcHl4cEN4anRsSUF1RFhrd2pXbU1SaXZyQ0R4Z0pLT0pDcS1PSUJqZXVxbzlSaWZrbl92SllLX1RMZHluSzE3NHBrV3NaMFpsVEl5RWV3RnZTN2xqUDdYdw\">Pokémon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension Bundle Coming Soon - Pokemon.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMitgFBVV95cUxOYmpjdUgzNHhNZUcwMkZVblhESHVTZTB4UzlzbElsa1lTT2ZSLVU2cDAyZ0c4THdLZ2t0MmFrYkdyNUZnc25NYzZ4bzR1SnFJcjNHSV9WMXVEM1NiMW91bFc5aUpRdmhhcmladlBZa0E0R0owcndwRno2Zm5LdDRhTHM5MF9qNDNxX05BNllzNlZGcU9zaEFEckZQSmFNRWVyT3RSc1JWWUxKOWJLVUNzUGgwTmlwZw\">Pokémon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension Physical Bundle Announced - IGN</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMimAFBVV95cUxQZlBONjA1dWNuTGQ5S1dteWVNT3A4YldJcmRmbklpSy1NZzVjTXU0ZmdhMmY1T1VFTVZIV19neTdMUHN2T1RDN1dheTNWRnpXNDRUVEZ3S3o3Sm5seHZLZ3JCUWxVLUNSX3h5WXlYcTZoNy1HU05WZ2d3MmZhdWtXdGJhMjhRS05JckVnVGYyckVtZGRpRHM4TA\">Nintendo reveals new physical release for Pokémon Legends: Z-A - Polygon.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiwwFBVV95cUxQQm9Vend1a3YtQjZZeHdNYmc5NjdYRFl2S0dZb0xOYUJycGdGTEhaVFhKYkhNNXhhY3RSbHVpN1RWd3hhRFoxVm5yX2FuOUZ0Y1VPYURabER1LWd1dTJ3clp0LVo5U3pZLWZicnFHb2YxQXhXM0JyUHRhTWY2WmozaTRXODljVlFRZ3Z0SDY0U3BLVGFacTh0cl9IZnBjdVFsUkFER1luZTFpMEFlamViekZvejlLbFcxLTFkWXUtR2s3Zjg\">Pokemon Legends: Z-A - Nintendo Switch 2 Edition, Pokemon Pokopia game and DLC bundles on the way - nintendoeverything.com</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiiAFBVV95cUxOa2hOeXVNT2plWGdRRVlfVHBzdzFfNWNnSUFIWVpZVHo0SVUzN1Z5Q1o0U1JObXNQekZEWnh1REQ1SG81Mmd1Wmo0ZjYwTFZ0ak1ZMWw2RGxYS3IzZDFHdzFuVl9zZ2d5eFQ4QjdhZnk4X2NxeGFlcEJKb1ltcksxZzVFWjFtbnBJ\">\'Pokémon Legends: Z-A\' is getting a physical Switch 2 bundle with \'Mega Dimension\' DLC - Mashable</a> (google.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMitgFBVV95cUxOdkg3YkRXeHlkcDZZcnczOTRaWEgwUHZHVnhuRVdPamRKaUh5OUF4b3o3ZHhnV1p1Y0FnSlRsbXlxb0dpbDlIRjZfWENQVThZRkJUbWRpbi15aEx0S2xfNi1NcnVuM09mVEt3X2s5dkoyNXJjQ3JQakY4OGxYNHZSVlpTR3pHUVNwNTRkeC1nRUR2bFgtVTQ0RURzZ2JkWWRZdTZSZmlLVl9uLXo5LVlRMXZZR0s3UQ\">Pokémon Legends: Z-A Is Getting A New Switch 2 Physical Release Next Month - Nintendo Life</a> (google.com)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1wu64jt/pok%C3%A9mon_legends_za_nintendo_switch_2_edition_mega/\">Pokémon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension Bundle Coming Oct. 29</a> (reddit.com)</li><li><a href=\"https://mashable.com/life/pokemon-legends-z-a-nintendo-switch-2-bundle-how-to-buy\">Pokémon Legends: Z-A is getting a physical Switch 2 bundle with Mega Dimension DLC</a> (mashable.com)</li><li><a href=\"https://www.siliconera.com/pokemon-legends-z-a-bundled-with-dlc-on-a-cartridge/\">Pokemon Legends: Z-A Bundled With DLC on a Cartridge</a> (siliconera.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo and The Pokémon Company announced a physical Nintendo Switch 2 Edition of Pokémon Legends: Z-A that includes the base game and Mega Dimension expansion on a standard game card. The package is scheduled for release in North America and Europe on October 29, 2026. The cartridge is also compatible with the original Nintendo Switch, and the package includes a serial code for 100 Ultra Balls that can be redeemed through Mystery Gift.', NULL, 22, 1, '2026-10-01 23:18:15', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.21803528549594212, '2026-10-15 20:00:16'),
(46, 'Steam launches weeklong Autumn Sale with discounts on thousands of games', '<p>Valve’s Steam Autumn Sale began October 1, cutting prices across thousands of PC games and downloadable-content packages. The promotion runs through October 8 at 7 p.m. Central European Summer Time and includes major franchises and indie releases across genres.</p>\n<p>Discounted games range from older, low-cost titles to recent releases. Hitman: World of Assassination and XCOM 2 cost $3 each, while Canadian listings price Resident Evil Requiem at $66.49 and 007 First Light at $62.99. ComputerBase points to SteamDB’s price-history database for checking whether a discount is a historical low. Valve’s next scheduled themed sale is Cooking Fest, October 12–19, followed by Steam Next Fest, October 19–26.</p>\n<h2>Key points</h2>\n<ul><li>Low-cost picks: Destructoid highlighted Warhammer 40,000: Mechanicus at $1.50, Skyrim Special Edition at $5 and the four-game Arkham collection at $8.99</li><li>Recent releases: Taiwan listings priced Ninja Gaiden 4 at NT$995 and Final Fantasy VII Rebirth at NT$387; Yahoo said both prices were new Steam lows</li><li>Deep discounts: GamingOnLinux listed Far Cry 6 at £4.99, Kingdom Come: Deliverance at £3.97 and theHunter: Call of the Wild at £1.67</li><li>Canadian listings: Arc Raiders was listed at $27.99, down from $54.99, and Space Marine 2 Standard Edition at $19.99, down from $79.99</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>1 October 2026</strong>: Steam Autumn Sale opened with discounts across its catalog</li><li><strong>8 October 2026</strong>: Autumn Sale closes at 7 p.m. Central European Summer Time</li><li><strong>12 October 2026</strong>: Cooking Fest begins and runs through October 19</li><li><strong>19 October 2026</strong>: Steam Next Fest begins, running through October 26</li><li><strong>26 October 2026</strong>: Steam Scream V Fest begins and continues into November</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.gamespot.com/articles/the-best-steam-autumn-sale-deals/\">The Best Steam Autumn Sale 2026 Deals</a> (gamespot.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1wv4vcl/steam_autumn_2026_sale_is_now_live/\">Steam Autumn 2026 Sale is now live</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMilgFBVV95cUxQc2RpMkhYa2R4V18xYm1PVlZCbkhOWG1qRVJaZWdfWHFxSndBTEdhRGpxSGhRUFpWTGtKUm5kOGFKSFg4dDNGQVBhbmV2UWFRSmJJYXNkdmpFVFowb1U5XzQ3NTNIQk52Y01kWmVkUEZrRzVIS2hOT3NkSnhCZWhRNEpLbURiTWJJbXJrZUpnTFA5eXhYWkE\">Steam Autumn Sale is live with heavy discounts for a full week</a> (neowin.net)</li><li><a href=\"https://www.destructoid.com/steam-autumn-sale-deals/\">The Steam Autumn Sale is live—here are some of its hottest deals</a> (destructoid.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wv50du/steam_autumn_sale_2026_is_now_live/\">Steam Autumn Sale 2026 is now live</a> (reddit.com)</li><li><a href=\"https://steamcommunity.com/games/593110/announcements/detail/687517158280790640\">Die Steam-Herbstaktion hat begonnen</a> (steamcommunity.com)</li><li><a href=\"https://www.pcgamer.com/software/platforms/9-new-2026-games-on-sale-in-the-steam-autumn-sale/\">9 new 2026 games on sale in the Steam Autumn Sale</a> (pcgamer.com)</li><li><a href=\"https://www.pcgamer.com/games/steam-autumn-sale-2026/\">You can now buy more than 44,000 games for $5 or less on Steam</a> (pcgamer.com)</li><li><a href=\"https://kotaku.com/fall-2026-steam-sale-features-so-many-great-games-for-15-or-less-2000739030\">Fall 2026 Steam Sale Features So Many Great Games For $15 Or Less</a> (kotaku.com)</li><li><a href=\"https://www.gamingonlinux.com/2026/10/steam-autumn-sale-2026-is-live-now-with-lots-of-discounts/\">Steam Autumn Sale 2026 is live now with lots of discounts</a> (gamingonlinux.com)</li><li><a href=\"https://mobilesyrup.com/2026/10/01/steam-kicks-off-big-autumn-sale/\">Steam kicks off big Autumn Sale</a> (mobilesyrup.com)</li><li><a href=\"https://stadt-bremerhaven.de/steam-herbstaktion-zahlreiche-spiele-sind-wieder-mal-rabatiert/\">Steam Herbstaktion: Zahlreiche Spiele sind wieder mal rabattiert</a> (stadt-bremerhaven.de)</li><li><a href=\"https://habr.com/ru/companies/ggsel/news/1089316/\">В Steam началась масштабная Осенняя распродажа</a> (habr.com)</li><li><a href=\"https://www.reddit.com/r/simracing/comments/1wv79pv/steam_fall_sale_reccomendations/\">Steam Fall Sale Reccomendations</a> (reddit.com)</li><li><a href=\"https://www.computerbase.de/news/gaming/steam-sale-valve-laeutet-den-herbst-mit-der-traditionellen-rabattwoche-ein.99637/\">Steam Sale: Valve läutet den Herbst mit traditioneller Rabattwoche ein</a> (computerbase.de)</li><li><a href=\"https://news.google.com/rss/articles/CBMirwFBVV95cUxPVU9tZnZKdmt2MXYtTDFZdVJjOEVjUFBrdklxMG1DdDcwTm40N21iQld4Sm1IZl9lMFRxcmJKbGhJcmwxMmNzYmQ0dTktcWRvbEZIY2RHSVZqSmo5MklfTHZ2WW5PUjVqNk9LSk9DWGhhQktaNGNHX1U5RDliTlhKU2QtRS1USTFLR183VjhfTDkzTEFFb1l2Rk9mOUF0Zm5FYXEzU211Zkg2a2cwQnpF\">The Steam Autumn Sale Has Deals On Resident Evil Requiem And 007 First Light</a> (engadget.com)</li><li><a href=\"https://tw.news.yahoo.com/steam%E7%A7%8B%E5%AD%A3%E7%89%B9%E8%B3%A3%E9%96%8B%E8%B7%91%EF%BC%81%E3%80%8A%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA%E5%B4%9B%E8%B5%B7%E3%80%8B%E5%8F%AA%E8%A6%81119%E5%85%83-17%E6%AC%BE%E6%96%B0%E5%8F%B2%E4%BD%8E%E5%A4%A7%E4%BD%9C%E4%B8%80%E6%AC%A1%E7%9C%8B-070257982.html\">Steam秋季特賣開跑！《魔物獵人崛起》只要119元　17款新史低大作一次看</a> (yahoo.com)</li><li><a href=\"https://www.reddit.com/r/AUTOMOBILISTA/comments/1wv5dx1/of_course_the_game_isnt_on_sale/\">Of course the game isn’t on sale ;-;</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Valve’s Steam Autumn Sale began October 1, cutting prices across thousands of PC games and downloadable-content packages. The promotion runs through October 8 at 7 p.m. Central European Summer Time and includes major franchises and indie releases across genres.', NULL, 21, 1, '2026-10-02 21:21:14', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.29735721542042554, '2026-10-15 20:00:16'),
(47, 'Nintendo brings back Donkey Kong Bananza DLC events monthly', '<p>Nintendo has resumed the limited-time Emerald Rush events for Donkey Kong Bananza, with past events returning on a monthly rotation beginning Oct. 1, 2026. The events are part of the paid DK Island &amp; Emerald Rush add-on for Nintendo Switch 2; players need the DLC to access DK Island and participate.</p>\n<p>The final event before the rotation began was September’s “Bananza Antics,” which let players unlock Candy Kong and Funky Kong statues. Nintendo has published a schedule of the recurring events on its Japanese website, giving players another chance to earn rewards they missed.</p>\n<h2>Key points</h2>\n<ul><li>The rotation includes 12 Emerald Rush events previously offered as part of the paid DLC.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMitAFBVV95cUxPNC1fZV9SZWdTSWNMc21qWG1FYWNvTUFxaEg2Q05wMVJfYVpObUhudktzTnNZYnoxNE1oLUd1M0tCdFB5U3hBRHZaQ2FBV3lMN0laaGpIaDl4T01IUFp3bzZ4RW1vZ202Q21DLUpYMm9BWUx3WjR2OVpMUjNRUHVKLWMwSGJXejdON1RqVXdFeXNCalJOdTM1dlpweHNsN083RHluUzE3c2p3OE5pUjhEeWtkZm4\">Time-limited Donkey Kong Bananza DLC events return with monthly rotation</a> (nintendowire.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/10/surprise-donkey-kong-bananzas-limited-time-dlc-events-are-back\">Surprise! Donkey Kong Bananza\'s Limited-Time DLC Events Are Back</a> (nintendolife.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wum86k/all_previous_donkey_kong_bananza_emerald_rush/\">All Previous Donkey Kong Bananza Emerald Rush Events will be available to play on a monthly basis</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo has resumed the limited-time Emerald Rush events for Donkey Kong Bananza, with past events returning on a monthly rotation beginning Oct. 1, 2026. The events are part of the paid DK Island & Emerald Rush add-on for Nintendo Switch 2; players need the DLC to access DK Island and participate.', NULL, 22, 1, '2026-10-02 21:21:14', NULL, 1, 0, '2026-10-15 20:00:04', NULL, -0.16666666666666666, '2026-10-15 20:00:16'),
(48, 'Used Ryzen CPU reportedly linked to previous owner’s Valorant ban', '<p>A German player says a used AMD Ryzen 7 5800X3D bought through classifieds triggered a Valorant hardware ban because its previous owner had been caught cheating. The buyer says Riot support identified the processor as blacklisted on August 12, before the September 21 purchase, and later said the motherboard and storage drive had also been flagged.</p>\n<p>The processor reportedly works normally, but Vanguard blocked access when the player launched Valorant. Riot support declined to remove the restriction, according to the buyer. Riot has not publicly explained how Vanguard identified this individual CPU.</p>\n<h2>Key points</h2>\n<ul><li>Other games: The reported hardware restriction may affect other Riot PC games, including League of Legends, Teamfight Tactics, Legends of Runeterra and 2XKO.</li><li>Used-hardware market: PCWorld says demand for used hardware has grown amid high prices and suggests reports of false positives may have increased, though the rate among used-part sales is unknown.</li><li>System requirements: A June 2026 Vanguard update allows the anti-cheat software to start with a game when Secure Boot and TPM are enabled, rather than requiring it to start with the PC.</li><li>Company responses: Riot, Valve and Epic did not answer PCWorld’s questions about flagged hardware, how to avoid blacklisted parts or what recourse buyers have before publication.</li></ul>\n<h2>Perspectives</h2>\n<ul><li>PCWorld says buyers are more likely to encounter a defective component or an ordinary resale scam than an inherited anti-cheat ban.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://wccftech.com/gamer-buys-used-ryzen-7-5800x3d-gets-locked-out-of-valorant-because-previous-owner-cheated/\">Gamer Buys Used Ryzen 7 5800X3D, Gets Locked Out of Valorant Because Previous Owner Cheated</a> (wccftech.com)</li><li><a href=\"https://www.pcworld.com/article/3250222/your-used-cpu-might-come-with-someone-elses-valorant-ban.html\">Your used CPU might come with someone else’s Valorant ban</a> (pcworld.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wvyvil/gamer_buys_a_used_ryzen_7_5800x3d_only_to_get/\">Gamer buys a used Ryzen 7 5800X3D, only to get locked out of VALORANT after inheriting the previous owner\'s Riot hardware ban.</a> (reddit.com)</li><li><a href=\"https://hardware.slashdot.org/story/26/10/02/1750242/used-processor-leads-to-game-ban\">Used Processor Leads To Game Ban</a> (slashdot.org)</li><li><a href=\"https://www.reddit.com/r/hardware/comments/1wvr3nf/used_processor_leads_to_game_ban/\">Used processor leads to game ban</a> (reddit.com)</li><li><a href=\"https://www.computerbild.de/artikel/News-PC-Hardware-Wegen-Riot-Games-muss-sich-dieser-Gamer-jetzt-wohl-einen-neuen-PC-kaufen-42ccc7f-41269759.html\">Wegen Riot Games muss sich dieser Gamer jetzt wohl einen neuen PC kaufen</a> (computerbild.de)</li><li><a href=\"https://www.xda-developers.com/someone-bought-a-second-hand-cpu-owned-by-a-valorant-cheater-and-they-got-banned-too/\">Someone bought a second-hand CPU owned by a Valorant cheater, and it got them banned too</a> (xda-developers.com)</li><li><a href=\"https://t3n.de/news/gebrauchte-cpu-gamer-in-spielen-gesperrt-1766331/\">Gamer wollte mit gebrauchter CPU sparen: Jetzt wird er in Spielen gesperrt</a> (t3n.de)</li><li><a href=\"https://www.reddit.com/r/de/comments/1wwgrpw/f%C3%BCr_immer_gebannt_gebrauchte_hardware_wird_f%C3%BCr/\">Für immer gebannt: Gebrauchte Hardware wird für Gamer zum Problem</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'A German player says a used AMD Ryzen 7 5800X3D bought through classifieds triggered a Valorant hardware ban because its previous owner had been caught cheating. The buyer says Riot support identified the processor as blacklisted on August 12, before the September 21 purchase, and later said the motherboard and storage drive had also been flagged.', NULL, 21, 1, '2026-10-03 21:20:38', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.022466405344025598, '2026-10-15 20:00:16'),
(49, 'Nintendo\'s Zelda 40th anniversary Switch 2 console returns for preorder', '<p>Nintendo’s Zelda 40th anniversary Switch 2 console is available for preorder again, The PC Enthusiast reported on Oct. 2. Gizmodo also published a feature on the anniversary console the same day.</p>\n<p>One Reddit post described a regional Walmart drop, while another shared live images of the console and controller.</p>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMif0FVX3lxTFBKbVd5eFc4b2w1YmozLXF3WTU3RVN4N0VRYnJ6aDRjZk9seFU2ZGRhMkoydGRfU2JjYmc3M29BNm5LTGFWemNfQmliZS1MaEVKeDlXWWNTc3NIQWFRNC1Jcl96UERCd0VSRzlxWGpMNFNraFZ6V1Ytc2ViV3RjLVE\">Nintendo’s Zelda 40th Anniversary Switch 2 Is Finally Back for Preorder</a> (thepcenthusiast.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMihgFBVV95cUxQSFRlX2JxSGNMWExxS2xqQ0UzWl8xa3liSHZxMGJDeTNsSV9fU2VPOG85YW1hVGM2LTdrQmJtM0ZneGtzZ2JCQ2EyMnFVSnJod3pJVFRoaEZVdE9pRlI1WEpvRkJWZERLQ1RBM2w2T1cyM3FZeml2SE1fdWl0aVRrWjVSQWZxdw\">The 40th Anniversary Zelda Switch 2 Is a Beauty to Behold and Now I Hate That I Want It</a> (gizmodo.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wvffvx/live_shots_of_the_zelda_40th_edition_console_and/\">Live shots of the Zelda 40th edition console and controller</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wvvjba/huge_walmart_regional_drop_for_zelda_40th/\">Huge walmart regional drop for Zelda 40th anniversary switch 2</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo’s Zelda 40th anniversary Switch 2 console is available for preorder again, The PC Enthusiast reported on Oct. 2. Gizmodo also published a feature on the anniversary console the same day.', NULL, 22, 1, '2026-10-03 21:20:38', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.2907137139945895, '2026-10-15 20:00:16');
INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(50, 'Steam Autumn Sale cuts prices on nearly 65,000 games through October 8', '<p>Steam’s Autumn Sale offers discounts on nearly 65,000 games through October 8. Deals include Mirror’s Edge: Catalyst for $0.99, Watch_Dogs 2 for $2.49 and Skyrim Special Edition for $3.99. The sale also includes newer releases and smaller independent games.</p>\n<p>On Steam’s global top sellers list, Korean MMO AION 2 climbed more than 30 places to No. 1, while Cyberpunk 2077 reached No. 5 with a 70% discount, PC Gamer reported on October 4.</p>\n<h2>Key points</h2>\n<ul><li>Staff picks: PC Gamer’s team recommended RPGs, visual novels, shooters and cozy games, including Skald: Against the Black Priory at $6.74 and Beacon Pines at $6.</li><li>Under $3: GamingBible’s sale roundup lists five PC games priced below $3, while Insider Gaming lists Endzone: A World Apart at $1.99 and WRC 7 at $0.99.</li></ul>\n<blockquote><p>\"I do not care for roguelites, but this space western FPS nails the format with quick, decisive shootouts, a bevy of cowboys with distinct abilities, and elevating tension throughout a run.\"</p><p>— <a href=\"https://www.pcgamer.com/games/11-underappreciated-games-you-should-buy-in-the-steam-autumn-sale-according-to-some-of-our-biggest-genre-sickos/\">Morgan Park, PC Gamer</a></p></blockquote>\n<h2>Sources</h2>\n<ul><li><a href=\"https://insider-gaming.com/best-games-to-buy-in-the-massive-steam-autumn-sale/\">Best Games To Buy in the Massive Steam Autumn Sale</a> (insider-gaming.com)</li><li><a href=\"https://www.pcgamer.com/gaming-industry/steams-global-top-sellers-are-my-top-of-the-pops/\">Steam\'s global top sellers are my Top of the Pops</a> (pcgamer.com)</li><li><a href=\"https://www.pcgamer.com/games/11-underappreciated-games-you-should-buy-in-the-steam-autumn-sale-according-to-some-of-our-biggest-genre-sickos/\">11 underappreciated games you should buy in the Steam Autumn Sale, according to some of our biggest genre sickos</a> (pcgamer.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMipgFBVV95cUxOR2JPM1JrWVNYYVBYNVMzbWFYY00wanlYbEIzWjNYcnhBQ2dCLVNjdWdDN2szVHUxZ2dsTmRvQllYNG83djFoVGF1VTFNWWw0aUFBdENpVXV0bHUxc29UR1d6U3l5c2puYm9sTjk2NWtXZVc1aEtlWnFWbm5EUFcwcU53S2Z1X1FBVHdWZjZ2Tll2WDdKQWhNMWxRaHE5WUdPUlFSbG9n\">5 must-buy PC games for less than $3 in the Steam Autumn Sale</a> (gamingbible.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Steam’s Autumn Sale offers discounts on nearly 65,000 games through October 8. Deals include Mirror’s Edge: Catalyst for $0.99, Watch_Dogs 2 for $2.49 and Skyrim Special Edition for $3.99. The sale also includes newer releases and smaller independent games.', NULL, 21, 1, '2026-10-04 21:27:42', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.29735721542042554, '2026-10-15 20:00:16'),
(51, 'Nintendo Switch and Switch 2 to get 15 games in October', '<p>Nintendo Switch and Switch 2 will receive 15 games in October, spanning horror, role-playing, sports and family titles, according to Nintendo Life’s monthly release roundup. The release calendar begins with Clive Barker’s Hellraiser: Revival and Kingdom Hearts Collection on Oct. 8 and includes Resident Evil 2, 3 and 4 on Oct. 16, Call of Duty: Modern Warfare 4 on Oct. 23, and Minecraft: Switch 2 Edition on Oct. 27.</p>\n<p>Castlevania: Belmont’s Curse is due Oct. 15 for Switch, PlayStation 5, Xbox Series X and PC. A playable demo follows Rose Belmont as she explores monster-filled Paris, combining side-scrolling combat with hidden routes and character upgrades. Polygon’s preview described the controls as fluid and noted that the demo ended just as exploration opened up. The lineup includes established series, with several launches clustered in mid-October.</p>\n<h2>Key points</h2>\n<ul><li>Boss fights: The demo’s Fallen encounter features a projectile attack, an aerial hook swing and shockwaves. Polygon says players must learn attack patterns because powerful foes can absorb substantial damage.</li><li>Exploration tools: Belmont’s Curse lets players place up to 50 map markers to track missed items and inaccessible areas. Secret walls and one-way gates reward backtracking.</li><li>Switch 2 performance: Nintendo Life says the Switch 2 version of Dragon’s Dogma 2 uses frame generation to deliver what the game describes as the equivalent of 60 frames per second.</li><li>Classic returns: Bubble Bobble 4 Friends: The Baron is Back! – Nintendo Switch 2 Edition + Stardrop Mountain is due Feb. 15, 2027, with new stages and returning villain Invaduh. ComicBook reports a $40 price for previous owners.</li></ul>\n<h2>Perspectives</h2>\n<ul><li>Polygon reviewer: The reviewer said intimidating gothic backdrops that create an illusion of depth, along with tense, moody music, helped establish the demo’s atmosphere.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.nintendolife.com/news/2026/10/video-15-exciting-new-games-coming-to-switch-1-and-2-in-october-2026\">Video: 15 Exciting New Games Coming To Switch 1 &amp; 2 In October 2026</a> (nintendolife.com)</li><li><a href=\"https://www.polygon.com/castlevania-belmonts-curse-release-date-metroidvania/\">Metroid Meets Dead Cells In October\'s Coolest New Action Game</a> (polygon.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqgFBVV95cUxObEdwcjNKV2hTNFpXMTZvTnY3X1BzNUUxYUNlaG9Fdzl5NWRiemZuTjNjNnZMcjEyU3ZXZFNQN0RxNXFjQzFtLUpDUnoxckEyM2xBeTRRb3FJNVhrbV9vV1dMTFIyLXJuMmtlVXFuUWRBbnNhX19VNHdRa1VGYS1SU3NHZU94QXJhNVFCX2lXOGdFalFhYUhhbDBLSzBwWTBlU2dUeDR5cktRZw\">Flowstone Saga Brings Its Puzzle-Based JRPG Adventure to Nintendo Switch</a> (opencritic.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMikwFBVV95cUxQVlpMTnh1X1lrSGVRRlZCVEFjRVhPUVF5TGc1VVZjN3VhZU9tNmdrZTVRVHJSVnpqU0JtbVRtSlgtczlibEJub3R5ZmV1ZTlBaGdxeTVidVkyalYtanJOSFVxa08xb3lrREs0M1JMa3RiRHFodGpXdFBTUS1ZMldxdXgxM3F0THEyTGxXakgzUnFLZzQ\">Save The World In Astonishia Story On Nintendo Switch 2</a> (nintendo-insider.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxOc0hKajM2cFVUOTNZLTVjQlRMX0t1ZE1YQVBoU0x5YTkzZmFzd2FBQTZvTjktZHBfVUFWSk5KSUFlcjMzal9lUVk0N05XTEZGRVJWTDI4V05pNU82a1lpanFOa3pLZkdsQ1llR3dGeHpobmVwczZ5RjV1bmFPN1lOeGw3NA\">Well Dweller (Switch 2) Review</a> (nintendoworldreport.com)</li><li><a href=\"https://comicbook.com/gaming/news/nintendo-switch-2-nes-game-classic-announced/\">New Game in Classic NES Series Announced for Nintendo Switch 2</a> (comicbook.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxORFlhdFdKcU1CQjloc2xyd0pXalhKVFVhelFnS3phd0thV3BjRWhrNUNXX1FMX191R0llTFlKaExhTXRIUDhNeHI4Q3IyMUJvVFRpa3o4bnZqclJQVlJmQ2tIbnBNMkx2azBBaldsMW1aNlExd3QxTTBiUWdyN3Jjbk0zWQ\">Neatly Organized incoming for Nintendo Switch</a> (nintendoeverything.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiQkFVX3lxTE43SWpaMFRSWkwzV2FoQjRsbGEtMGk4Q1l3VFRxNHJJS2hPR0tDYXd3M0ZRVFhzcGJhblQxeUN4U2REUQ\">FUR Squadron Phoenix - Gameplay - Nintendo Switch 2</a> (youtu.be)</li><li><a href=\"https://news.google.com/rss/articles/CBMilwFBVV95cUxQTFJrNVRFZm1reUN0LWZDc3RhOWhGN2FpUVE3bkZFSHkyQTlfVWxfVjktNjd0N0RjYzNSTGZ3NV9LUkZGczlYV0NraVVtaEYzc0FZOWtETjJKRDdNR1Z5VG5FMnZKVzdSbTlVMGJwTGVzV3pBaThsYmRjQnZkQVhoUWRJc2RfWHV5TzF3TUJvRmFMZWZIWW40\">Pardon My French Toast Out On Nintendo Switch 2 This Month</a> (nintendo-insider.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMilwFBVV95cUxQMmJpSkdTcjMxbHBlZDY4ZjJ2QUdfVVlZUWdKVUU3QjFITHdiN0J5NXFBaGtXSS01T1VoNmdDdUpfUEVnT2hfaEo0ZG1BbW5Uakhzb1FZQTJQeFpOTW4yVElGcnEyODcwT3dWWHZ4LXdWZkExRlc0c19jejdtVk5mUEo1WGF4dUZyV2NTQl8xbnBPU01nbklB\">Read The Wind In Where The Seeds Fall On Nintendo Switch 2</a> (nintendo-insider.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo Switch and Switch 2 will receive 15 games in October, spanning horror, role-playing, sports and family titles, according to Nintendo Life’s monthly release roundup. The release calendar begins with Clive Barker’s Hellraiser: Revival and Kingdom Hearts Collection on Oct. 8 and includes Resident Evil 2, 3 and 4 on Oct. 16, Call of Duty: Modern Warfare 4 on Oct. 23, and Minecraft: Switch 2 Edition on Oct. 27.', NULL, 21, 1, '2026-10-04 21:27:42', NULL, 1, 0, '2026-10-15 20:00:04', NULL, -0.1111111111111111, '2026-10-15 20:00:16'),
(52, '5 Easy Ways to Free Up Console Storage Without Deleting Your Favorites', '<p>Nothing kills the mood like a \"not enough storage\" message right before a big download. Here are five ways to fix it.</p><p><strong>1. Check what is actually taking up space</strong><br />Open your console\'s storage menu and sort by size. A few large games usually eat most of the space. Start there.</p><p><strong>2. Remove games you finished</strong><br />If you beat a game months ago, you probably won\'t replay it soon. Uninstall it. Your save data stays on the console or in the cloud, and you can reinstall later.</p><p><strong>3. Clear out old captures</strong><br />Screenshots and gameplay clips add up quickly. Copy the ones you like to a USB drive or the cloud, then delete the rest.</p><p><strong>4. Add external storage</strong><br />An external drive is the cheapest long-term fix. Check which drive types your console supports first. Some consoles only play certain games from their internal drive.</p><p><strong>5. Delete demos, trials, and old updates</strong><br />Free demos and unused add-ons often sit forgotten. Remove anything you haven\'t touched in a while.</p><p><strong>Quick tip:</strong> Make this a habit. A five-minute check once a month keeps your storage from filling up again.</p><p><strong>Final word:</strong> Most players can free up dozens of gigabytes just by doing steps 2 and 3. Try those first.</p>', 'Running out of space on your console? These five simple fixes can clear room for new games fast, and none of them cost you your save progress.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791160044/FYP-NRS/thumbnails/xkqil3bwiabuslaqbfpm.png', 23, 1, '2026-10-05 08:27:25', NULL, 6, 0, '2026-10-15 20:00:04', NULL, 0.23637893257251277, '2026-10-15 20:00:16'),
(53, 'Jagex announces Unreal Engine RuneScape MMO years before release', '<p>Jagex announced a new RuneScape MMO, currently known as RS4, at RuneFest in Birmingham, saying the Unreal Engine game is still several years from release. The project will be a separate game rather than a replacement for RuneScape, Old School RuneScape or RuneScape: Dragonwilds. Jagex says each will retain its own team and continue to receive investment.</p>\n<p>Set in Gielinor’s Sixth Age, the story begins in Ashenfall, years after the events of Dragonwilds; Jagex says it plans to expand the game into other familiar and new parts of the world. The studio says it announced the game early so players can contribute ideas and test it during development. Jagex also revealed an animated RuneScape series with YouTuber Charlie “MoistCr1TiKaL” White and production company Lyrical Media, with more details expected next year.</p>\n<h2>Key points</h2>\n<ul><li>Project origins: RS4 began as a planned Dragonwilds expansion, but player feedback favoring a larger, more social experience in a traditional MMO helped turn it into a standalone game.</li><li>RuneScape Reignited offers a fresh start while retaining content added over the game’s 25-year history, rather than returning to an older version.</li><li>Teaser limits: The reveal trailer uses CGI rather than in-engine footage, and Jagex has not yet shown gameplay systems.</li></ul>\n<blockquote><p>\"the ambition isn\'t to replace the RuneScape games you love. It\'s to make the RuneScape universe bigger\"</p><p>— <a href=\"https://www.eurogamer.net/jagex-runescape-4-mmo-unreal-engine-animated-series-moistcr1tikal\">Jagex, Eurogamer</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Jagex: The studio says integrity and permanent progression will remain central design principles for the new MMO.</li><li>RuneScape players: Some players objected that a fourth separate project could split a community that is already spread across several games.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2001</strong>: RuneScape first introduced its fantasy world to players</li><li><strong>2004</strong>: Jagex rebranded the game as RuneScape 2</li><li><strong>2013</strong>: Jagex rebranded the game as RuneScape 3</li><li><strong>October 2026</strong>: Jagex unveiled the RS4 project at RuneFest</li><li><strong>2 December 2026</strong>: RuneScape Reignited is scheduled to launch</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.eurogamer.net/jagex-runescape-4-mmo-unreal-engine-animated-series-moistcr1tikal\">Fourth RuneScape officially revealed</a> (eurogamer.net)</li><li><a href=\"https://kotaku.com/jagex-announce-a-fourth-runescape-and-cartoon-with-moistcr1tikal-2000739648\">Jagex Announce A Fourth RuneScape And Cartoon With MoistCr1tikal</a> (kotaku.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wxd3jl/runescape_official_4th_mmo_teaser_trailer/\">RuneScape - Official 4th MMO Teaser Trailer</a> (reddit.com)</li><li><a href=\"https://www.gamesradar.com/games/mmo/jagex-announces-a-fourth-runescape-mmo-made-in-unreal-engine-but-rs4-is-not-a-replacement-for-any-of-our-games/\">Jagex announces a fourth Runescape MMO, but \"RS4 is not a replacement for any of our games\"</a> (gamesradar.com)</li><li><a href=\"https://tweakers.net/nieuws/252932/jagex-kondigt-aan-dat-het-een-vierde-runescape-game-maakt.html\">Jagex kondigt aan dat het een vierde RuneScape-game maakt</a> (tweakers.net)</li><li><a href=\"https://dtf.ru/games/5334368-jagex-anonsirovala-novuyu-mmo-vselennoi-runescape\">Jagex работает над следующей MMO во вселенной RuneScape</a> (dtf.ru)</li><li><a href=\"https://www.engadget.com/2276772/a-fourth-runescape-game-is-under-development-using-unreal-engine/\">A fourth RuneScape game is under development using Unreal Engine</a> (engadget.com)</li><li><a href=\"https://www.reddit.com/r/Eesti/comments/1wxfypo/runescape_4/\">RuneScape 4</a> (reddit.com)</li><li><a href=\"https://www.techspot.com/news/114088-runescape-4-officially-works-started-dragonwilds-expansion.html\">RuneScape 4 is officially in the works, and it started as a Dragonwilds expansion</a> (techspot.com)</li><li><a href=\"https://www.reddit.com/r/Suomi/comments/1wy0cc3/pelikehitt%C3%A4j%C3%A4_vahvisti_runescape_4_on_tulossa/\">Pelikehittäjä vahvisti: Runescape 4 on tulossa | Uutisia lyhyesti | Yle</a> (reddit.com)</li><li><a href=\"https://www.gamer.no/artikler/runescape-4-en-animert-tv-serie-og-mer/521121\">RuneScape 4, en animert TV-serie og mer</a> (gamer.no)</li><li><a href=\"https://yle.fi/a/74-20249748\">Pelikehittäjä vahvisti: Runescape 4 on tulossa</a> (yle.fi)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Jagex announced a new RuneScape MMO, currently known as RS4, at RuneFest in Birmingham, saying the Unreal Engine game is still several years from release. The project will be a separate game rather than a replacement for RuneScape, Old School RuneScape or RuneScape: Dragonwilds. Jagex says each will retain its own team and continue to receive investment.', NULL, 21, 1, '2026-10-05 20:59:16', NULL, 4, 1, '2026-10-15 20:00:04', NULL, 0.21803528549594212, '2026-10-15 20:00:16'),
(54, 'Pokémon Legends: Z-A Switch 2 edition with DLC gets physical release October 29', '<p>A physical edition of Pokémon Legends: Z-A – Nintendo Switch 2 Edition bundled with the Mega Dimension expansion is scheduled to reach stores on Oct. 29, giving buyers a retail option that combines the game and add-on. Nintendo Everything\'s pre-order roundup lists the edition for Amazon customers.</p>\n<p>Mega Dimension sends players back to Lumiose City as spatial distortions appear, with the character Ansha and the Mythical Pokémon Hoopa guiding them into Hyperspace Lumiose, according to The Pokémon Company International. The expansion introduces newly discovered Mega-Evolved Pokémon and other Pokémon not usually found in Lumiose.</p>\n<h2>Key points</h2>\n<ul><li>Expansion setting: In Hyperspace Lumiose, some Pokémon can exceed the usual level-100 limit.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMifkFVX3lxTE9seFNOTnlxaDBFUS12VDRtR3dVb2JvaGxUNnZGMldqY05vNG4ySkxjQVhPWVVDeVJkOUVrcGNvVTEyRWQxalQ1eUZrOXJUdnFWbVBFWktzcWtxQ25xcXlQOTJtRzh6ejRlWUJwVXlHZk5zX3VMOEtoVEIxX0FEUQ\">Nintendo pre-order updates - October 4, 2026 - Pokemon Legends: Z-A - Nintendo Switch 2 Edition + Mega Dimension, more</a> (nintendoeverything.com)</li><li><a href=\"https://nintendoeverything.com/nintendo-pre-order-updates-october-4-2026/\">Nintendo pre-order updates – October 4, 2026 – Pokemon Legends: Z-A – Nintendo Switch 2 Edition + Mega Dimension, more</a> (nintendoeverything.com)</li><li><a href=\"https://www.nintendojo.com/news/pokemon-legends-z-a-switch-2-edition-mega-dimension-getting-a-physical-release\">Pokémon Legends: Z-A Switch 2 Edition + Mega Dimension Getting a Physical Release</a> (nintendojo.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigAFBVV95cUxPVkplZnYzaDAtYWZiZFR5N1FPMWNFaG0tT0FzNXFSSjVFZTltYnVQSm1CMVpKYkhyM3k2ejZ2RzRfcEJYd0xaWnlCcEk5SHlETVVmcEtQdWdfVjZ5WHN6ZkY3YldudXBDVzhqaUtBU3QtaXhUSkNXcU80bEhNTERsdQ\">Pokémon Legends: Z-A e Pokémon Pokopia ganham edições físicas com jogo e DLC no mesmo cartucho</a> (projectn.com.br)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'A physical edition of Pokémon Legends: Z-A – Nintendo Switch 2 Edition bundled with the Mega Dimension expansion is scheduled to reach stores on Oct. 29, giving buyers a retail option that combines the game and add-on. Nintendo Everything\'s pre-order roundup lists the edition for Amazon customers.', NULL, 22, 1, '2026-10-05 20:59:16', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.15228744683189208, '2026-10-15 20:00:16'),
(55, '[Control Test] Universally helpful article', '<p>This is a universally helpful control test post for the bridging algorithm. Please rate this article as helpful.</p>', 'This is a universally helpful control test post for the bridging algorithm. Please rate this article as helpful.', NULL, 29, 1, '2026-10-05 22:43:18', '2026-10-05 22:43:33', 4, 5, '2026-10-15 20:00:04', NULL, 0.3259361025122164, '2026-10-15 20:00:16'),
(56, '[Control Post] Universally unhelpful post', '<p>This is a universally unhelpful control test post for the bridging algorithm. Please rate this article as unhelpful.</p>', 'This is a universally unhelpful control test post for the bridging algorithm. Please rate this article as unhelpful.', NULL, 29, 1, '2026-10-05 22:44:22', NULL, 4, 2, '2026-10-15 20:00:04', NULL, -0.3259361025122164, '2026-10-15 20:00:16'),
(57, '6 Free Ways to Speed Up an Old Gaming PC', '<p>An older PC does not have to feel old. Most slowdowns come from clutter, heat, and bad settings, not dead hardware. Try these six fixes in order.</p><p><strong>1. Close what you don\'t need</strong><br />Browsers, chat apps, and launchers all eat memory while you play. Open your task manager before a session and shut down anything you are not using.</p><p><strong>2. Trim your startup list</strong><br />Many programs launch on their own at boot. Turn off the ones you rarely use. Your PC will start faster and have more free memory from the first minute.</p><p><strong>3. Update your graphics drivers</strong><br />New drivers often fix bugs and boost performance in recent games. Grab them from your graphics card maker\'s official site.</p><p><strong>4. Lower a few in-game settings</strong><br />You don\'t need to drop everything to low. Shadows, anti-aliasing, and view distance cost the most frame rate. Turn those down first and keep textures high if your card has the memory.</p><p><strong>5. Clean out the dust</strong><br />Dust traps heat, and heat slows your parts down. Power off, unplug, and blow out the fans and vents with compressed air. Do this every few months.</p><p><strong>6. Free up drive space</strong><br />A nearly full drive runs slower. Uninstall games you finished and clear temporary files. If you have a spare SSD slot, put your favorite game there for faster loading.</p><p><strong>Final word:</strong> Start with steps 1 to 4. They take minutes and cost nothing. If the PC still struggles, steps 5 and 6 are your next move.</p>', 'Your PC feels slow, but a new build costs too much. These six free fixes can smooth out frame rates and cut load times today.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791279643/FYP-NRS/thumbnails/pdhtkoikc4k571hcwviv.png', 23, 1, '2026-10-06 17:40:44', NULL, 6, 7, '2026-10-15 20:00:04', 10, 0.09563936814480736, '2026-10-15 20:00:16'),
(58, 'Jagex details RuneScape Reignited’s fresh-start servers ahead of December launch', '<p>Jagex has outlined RuneScape Reignited, a fresh-start version of its long-running MMO, set to launch December 2. The new servers will reset characters, highscores and the player-driven economy, while giving all players access to premium membership for their first 10 days. Rather than returning to an older version of the game, Reignited retains the updates added over RuneScape’s 25-year history.</p>\n<p>Creative director Ryan Philpott described the mode as an opportunity to relaunch RuneScape and make it easier for new and returning players to try the game. Some existing players worry that another server type could divide the community, and GamesRadar noted that Reignited will require a separate membership.</p>\n<h2>Key points</h2>\n<ul><li>No paid progression: Paid progression is disabled for Reignited characters, and the mode’s new economy is designed to let players avoid DailyScape, Auras and microtransaction items.</li><li>2027 updates: RuneScape’s announced plans for next year include the conclusion of its Gnome storyline, a new raid and an Agility rework.</li><li>World-first achievements: Reignited’s Hall of Legends will let players compete for world-first achievements and receive permanent recognition for them.</li></ul>\n<blockquote><p>\"“Because honestly, RuneScape is so bloody amazing now [...] We\'ve done so much over the last year, we have so many plans for the future,”\"</p><p>— <a href=\"https://www.gamesradar.com/games/mmo/inside-runescape-reignited-jagexs-ambitious-plan-to-relaunch-its-longest-running-mmo-theres-a-level-of-confidence-that-this-is-the-right-thing-to-do/\">Ryan Philpott, GamesRadar+</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Ryan Philpott, RuneScape creative director: Philpott said that, as a player, he felt some features were wrong for the game and described steering it toward a brighter future as a privilege.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2001</strong>: RuneScape launched</li><li><strong>2022</strong>: Jagex introduced the Fresh Start Worlds experiment</li><li><strong>2 December 2026</strong>: RuneScape Reignited is scheduled to launch</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.rockpapershotgun.com/runescape-4-is-a-new-unreal-engine-mmo-which-reportedly-grew-out-of-a-planned-dragonwilds-expansion-though-its-still-a-long-way-off\">RuneScape 4 is a new Unreal Engine MMO which reportedly grew out of a planned Dragonwilds expansion, though it\'s still a long way off</a> (rockpapershotgun.com)</li><li><a href=\"https://www.gamewatcher.com/jagex-reveals-a-new-runescape-mmo-as-it-maps-out-the-franchise-s-future\">Jagex Reveals a New RuneScape MMO as It Maps Out the Franchise\'s Future</a> (gamewatcher.com)</li><li><a href=\"https://www.geeknative.com/243007/jagex-announces-fourth-runescape-mmo-and-animated-adaptation-at-runefest-2026/\">Jagex announces fourth RuneScape MMO and animated adaptation at RuneFest 2026</a> (geeknative.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiigFBVV95cUxQVjNOLTE3a0NkS0otMXA4QllzQ1F1aFdSZHROSjAzdWRYNUlNLWZJX2NOOVllc1BVdTRwT21lWmpJQkhDcGx5ZldUTjdnQ3BCWWIxczNQaEh1eFo0eEZzQkxlMmhySy1LM05sQVVrTnNwZ1Myc3V6bDhNdUVfbGJCVk1teUkzblVTSmc\">Jagex Unveils Fourth RuneScape MMO Powered by Unreal Engine</a> (80.lv)</li><li><a href=\"https://games.mxdwn.com/news/runescape-reignited-will-introduce-a-way-to-play-characters-with-a-new-economy-on-december-2nd/\">RuneScape Reignited Will Introduce a Way to Play Characters with a New Economy on December 2nd</a> (mxdwn.com)</li><li><a href=\"https://www.gamesradar.com/games/mmo/inside-runescape-reignited-jagexs-ambitious-plan-to-relaunch-its-longest-running-mmo-theres-a-level-of-confidence-that-this-is-the-right-thing-to-do/\">Inside RuneScape Reignited, Jagex\'s ambitious plan to \"relaunch\" its longest-running MMO: \"There\'s a level of confidence that this is the right thing to do\"</a> (gamesradar.com)</li><li><a href=\"https://www.gamesradar.com/entertainment/animation-shows/runescape-animated-show-in-the-works-from-bloodborne-movie-studio-and-creator-moistcr1tikal/\">RuneScape animated show in the works from Bloodborne movie studio and creator MoistCr1TiKaL</a> (gamesradar.com)</li><li><a href=\"https://www.golem.de/news/jagex-runescape-bekommt-ein-neues-mmorpg-mit-unreal-engine-2610-213706.html\">Jagex: Runescape bekommt ein neues MMORPG mit Unreal Engine</a> (golem.de)</li><li><a href=\"https://www.pressfire.no/artikkel/runescape-far-et-fjerde-mmo-i-unreal-engine\">«RuneScape 4» på vei</a> (pressfire.no)</li><li><a href=\"https://www.gamer.no/artikler/runescape-4-en-animert-tv-serie-og-mer/521121\">RuneScape 4, en animert TV-serie og mer</a> (gamer.no)</li><li><a href=\"https://www.reddit.com/r/Suomi/comments/1wy0cc3/pelikehitt%C3%A4j%C3%A4_vahvisti_runescape_4_on_tulossa/\">Pelikehittäjä vahvisti: Runescape 4 on tulossa | Uutisia lyhyesti | Yle</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Jagex has outlined RuneScape Reignited, a fresh-start version of its long-running MMO, set to launch December 2. The new servers will reset characters, highscores and the player-driven economy, while giving all players access to premium membership for their first 10 days. Rather than returning to an older version of the game, Reignited retains the updates added over RuneScape’s 25-year history.', NULL, 21, 1, '2026-10-06 21:09:24', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.1082241434097333, '2026-10-15 20:00:16'),
(59, 'Square Enix lists 131GB Kingdom Hearts collection for Switch 2 on Oct. 8', '<p>Square Enix will release Kingdom Hearts Collection [I–III] for Nintendo Switch 2 on Oct. 8, bringing native versions of the series’ compilations and Kingdom Hearts III with its Re Mind add-on to the console. The collection consists of three apps and follows earlier Switch editions that relied on cloud streaming.</p>\n<p>Reviews ahead of launch generally praise the package and the older games’ performance, though some reviewers report frame-rate fluctuations in Kingdom Hearts III and Kingdom Hearts 0.2: Birth by Sleep – A Fragmentary Passage. The collection includes mainline games, spin-offs and story cutscene compilations covering the series through Kingdom Hearts III, ahead of Kingdom Hearts IV, which reviewers describe as due in 2027.</p>\n<h2>Key points</h2>\n<ul><li>Storage breakdown: The eShop lists 54.1GB for 1.5+2.5 ReMIX, 26.8GB for HD 2.8 and 45.2GB for Kingdom Hearts III plus Re Mind; those figures total 126.1GB, below the 131GB collection listing.</li><li>Critical scores: Nintendo World Report scored the collection 9.5/10, while Nintendo Wire and Siliconera each gave it 9/10.</li><li>Portable performance: Nintendo Wire described brief stutters during Kingdom Hearts II area transitions as a minor annoyance, noting that the transitions are quick.</li><li>Collection contents: The package includes HD cutscene compilations for 358/2 Days and Re:coded, plus an hour-long story recap of the mobile game Kingdom Hearts χ.</li></ul>\n<blockquote><p>\"The frame rates seemed pretty stable at 60fps in the earlier games such as Kingdom Hearts, Kingdom Hearts 2, Birth by Sleep, and Re:Chain of Memories.\"</p><p>— <a href=\"https://www.siliconera.com/review-kingdom-hearts-collection-i-iii-lets-switch-2-owners-catch-up/\">Jenni Lada, Siliconera</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Nintendo World Report: The reviewer called Kingdom Hearts II a clear highlight and said Chain of Memories’ card-combat system is an acquired taste, with the original game’s platforming also showing its age.</li><li>Nintendo Wire: The reviewer said Kingdom Hearts III looked and ran well overall, with drops mainly during Attraction Flow attacks in crowded areas.</li><li>RPG Gamer: The review, quoted by My Nintendo News, said variable performance in 0.2 and III made the collection difficult to recommend without caveats. It suggested that an option to cap the frame rate at 30fps could help.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>5 October 2026</strong>: Reviews of the Switch 2 collection began appearing ahead of launch</li><li><strong>6 October 2026</strong>: Nintendo News published a roundup of early review scores</li><li><strong>8 October 2026</strong>: Kingdom Hearts Collection launches on Switch 2 and other platforms</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMilAFBVV95cUxPcm5zQWJ6UWxkSlEwbmdldkJRX1dsZDZndXVESFVHZU83TUExcWk0VlhkWnlLb1E5bW5fRHZlWi1yYzlYZnFNcS1KX1ZZZ1lfWjVMNGZkZGNEbFRNRFJVd0VFRzBDd0JRSWp6TWU4Y2t2cWEtX3h2T01Ob2R4YjZab3ZVR0VyN3JadXJScmhPS25OS2lq\">Kingdom Hearts Collection [1-3] review for Nintendo Switch 2</a> (nintendoeverything.com)</li><li><a href=\"https://mynintendonews.com/2026/10/05/kingdom-hearts-collection-is-131gb-on-nintendo-switch-2-reviews-slightly-mixed/\">Kingdom Hearts Collection is 131GB on Nintendo Switch 2, reviews slightly mixed</a> (mynintendonews.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMinwFBVV95cUxNdDRiV0VIdW5TU2RDdzhFSHdhblFVRXVUYVhvYnNtR0tpZE9uaEgxNG1ZZkxLeVUtVFJmMUlQc2JMX1o1VmstVHNlZ0dsVmwtbU0zZlhsS2xTWmNMZms4UlcwblljOEpuaGtYQ0xiMnkwUXJxTUFEc1FPTkZrWGt2ZDZRRzFvV29SOUROYjduQ004SHlBQ2hDUHlLWE80Z0k\">KINGDOM HEARTS Collection (I-III) Review – Finally On Nintendo Switch 2</a> (theouterhaven.net)</li><li><a href=\"https://news.google.com/rss/articles/CBMitAFBVV95cUxPd3RjU2E3bFBXLXZ0b0pMUnlpT0VFZG9meUItRC1LR0U1TThzRWpQbkFLWjRhdUR2NGRVRXJTOFBJejJGaDNvQTZlVUdUWUo0UGJYQ29GTGhVTktWTjA0aUZkcWREdF9UZW4tZEVJbWswODJUajJ4LVVjYUFYM0huUFAwczFtc1VOQmtydnBSYl9FOHZmWl9xWnVBU3I5SXNFR2EzTTRfZkY3eHItZjhLUFpXX2Y\">Nintendo Switch 2 Review - \'Kingdom Hearts Collection [I~III]\'</a> (worthplaying.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMif0FVX3lxTE1nSXcwTTU5VklaU0VFMnRsbVpNWFNSU29aSjZBa0N4ZjZBWWhaTWpxTXhpeG5fem5BaGRhR2hJdEFaQ2ltRks1RS1OYndOSDNrZVpsYUJWSFdHY3ktd2Qtb0N5ZmhBYVd1RjdRT1dKSUxEUW9tQkU0WFpxeHF5bm8\">Kingdom Hearts Collection I–III Review: A Magical Nintendo Switch 2 Port</a> (vice.com)</li><li><a href=\"https://nintendowire.com/reviews/kingdom-hearts-collection-iiii-on-nintendo-switch-2/\">Review: Kingdom Hearts Collection [I~III] on Nintendo Switch 2</a> (nintendowire.com)</li><li><a href=\"http://www.nintendoworldreport.com/review/77642/kingdom-hearts-collection-i-iii-switch-2-review\">Kingdom Hearts Collection I-III (Switch 2) Review</a> (nintendoworldreport.com)</li><li><a href=\"https://nintendonews.com/news/156889\">Mini Review: KINGDOM HEARTS -HD 1.5+2.5 ReMIX- (Switch 2)</a> (nintendonews.com)</li><li><a href=\"https://nintendonews.com/news/156903\">Round Up: The Reviews For Kingdom Hearts Collection On Switch 2 Are In</a> (nintendonews.com)</li><li><a href=\"https://nintendonews.com/news/156891\">Mini Review: KINGDOM HEARTS HD 2.8 Final Chapter Prologue (Switch 2)</a> (nintendonews.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wy7zx6/kingdom_hearts_collection_will_collectively_take/\">Kingdom Hearts Collection Will Collectively Take Up Over 130GB On Switch 2</a> (reddit.com)</li><li><a href=\"https://nintendonews.com/news/156894\">PSA: Kingdom Hearts Collection Will Collectively Take Up Over 130GB On Switch 2</a> (nintendonews.com)</li><li><a href=\"https://nintendowire.com/news/2026/10/05/kingdom-hearts-collection-i-iii-will-occupy-around-131-gb-on-switch-2/\">Kingdom Hearts Collection [I-III] will occupy around 131 GB on Switch 2</a> (nintendowire.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wy6r7y/kingdom_hearts_on_switch_2_how_good_are_the_ports/\">Kingdom Hearts on Switch 2 – How Good Are the Ports?</a> (reddit.com)</li><li><a href=\"https://www.siliconera.com/review-kingdom-hearts-collection-i-iii-lets-switch-2-owners-catch-up/\">Review: Kingdom Hearts Collection [I-III] Lets Switch 2 Owners Catch Up</a> (siliconera.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1wy7jy4/rpgsite_kingdom_hearts_iiii_for_switch_2_shouldve/\">RPGSite: Kingdom Hearts I-III for Switch 2 should\'ve been a slam dunk, but some games need more work</a> (reddit.com)</li><li><a href=\"https://nintendowire.com/news/2026/10/05/kingdom-hearts-25th-anniversary-video-highlights-key-moments-across-the-series/\">Kingdom Hearts 25th anniversary video highlights key moments across the series</a> (nintendowire.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Square Enix will release Kingdom Hearts Collection [I–III] for Nintendo Switch 2 on Oct. 8, bringing native versions of the series’ compilations and Kingdom Hearts III with its Re Mind add-on to the console. The collection consists of three apps and follows earlier Switch editions that relied on cloud streaming.', NULL, 22, 1, '2026-10-06 21:09:24', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.2222222222222222, '2026-10-15 20:00:16'),
(60, 'Star Wars: Galactic Racer launches to strong reviews across consoles and PC', '<p>Fuse Games\' Star Wars: Galactic Racer launched on October 6 for PlayStation 5, Xbox Series X|S and PC, earning an 88 Metascore and the highest review aggregate for a Star Wars game since 2003\'s Knights of the Old Republic. Critics praised its fast arcade racing, handling and presentation. Its run-based campaign makes failure consequential: crashes can end a tour, while new runs let players try different builds.</p>\n<p>Players race as Shade in a Galactic League tournament, choosing among landspeeders, speeder bikes and skim speeders, then building each vehicle with temporary upgrades and abilities over a sequence of events. Fuse says failure also gives players rewards and lessons for the next attempt; the campaign\'s branching events and randomly offered parts make each run different. Podracing features but is reserved for specific campaign and Arcade events rather than serving as the sole racing format.</p>\n<p>Amazon Luna added the game at launch for Prime members, offering the single-player campaign, Arcade and Scenario modes without a separate game purchase; online multiplayer is not included on Luna. A Kotaku test found no noticeable input delay but reported blur, low-resolution textures and pop-in in the streamed version; players seeking sharper visuals and multiplayer can use the console or PC editions.</p>\n<h2>Key points</h2>\n<ul><li>Design choice: Fuse Games said a straight remake of the classic podracing games would have felt like a missed opportunity, so it added three other vehicle classes and designed the new skim speeder around banked, air-racing-style turns.</li><li>Podracer limits: Podracing events use smaller fields—six racers in single-player and eight online—because the vehicles’ speed and size require different track and gameplay demands, CEO Matt Webster said.</li><li>Build system: Racers can install up to five parts, while event rewards and shop purchases add parts of varying rarity; some can develop faults that change a build.</li><li>Compatibility: GamingOnLinux reported that the in-game social overlay did not work under Proton 11 or Proton Experimental, although online play worked across platforms.</li></ul>\n<blockquote><p>\"Failure can be this big, spectacular, exciting, interesting and rewarding experience in the game.\"</p><p>— <a href=\"https://news.xbox.com/en-us/2026/10/06/star-wars-galactic-racer-crashing-with-consequence/\">Kieran Crimmins, creative director at Fuse Games, Xbox Wire</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Fuse Games: Creative director Kieran Crimmins said many events impose a finite crash allowance, and using it all—or failing a high-stakes event—can cost a League Token and end a tour. He said the limit makes each corner and racer interaction consequential.</li><li>Amazon Luna: Amazon Head of Gaming Jeff Gattis framed the launch as a way for Prime members without dedicated gaming hardware to play a major franchise game without a console or download.</li><li>Kotaku reviewer: The reviewer said the Luna stream was serviceable for players with no other option, but described it mainly as a way to try the game before switching to another platform for extended play.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2022</strong>: Amazon Luna launched in the United States</li><li><strong>2023</strong>: Luna expanded to the UK, Germany and Canada</li><li><strong>July 2026</strong>: Luna became part of Prime Video in the US and UK</li><li><strong>6 October 2026</strong>: Galactic Racer launched on Luna alongside console and PC editions</li></ul>\n<h2>Did you know?</h2>\n<p>Sebulba’s account of a human podracer who beat him is a reference to Anakin Skywalker’s victory as a child, even though the game never names him in that story.</p>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.pushsquare.com/news/2026/10/out-today-star-wars-galactic-racer-the-highest-rated-star-wars-game-in-over-20-years\">Out Today: Star Wars: Galactic Racer, the Highest-Rated Star Wars Game in Over 20 Years</a> (pushsquare.com)</li><li><a href=\"https://kotaku.com/star-wars-galactic-racer-is-out-today-and-amazon-prime-members-can-check-it-out-for-free-2000740982\">Star Wars: Galactic Racer Is Out Today And Amazon Prime Members Can Check It Out For Free</a> (kotaku.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wz0s66/star_wars_galactic_racer_discussion_thread/\">Star Wars: Galactic Racer | Discussion Thread</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wz0amh/star_wars_galactic_racer_official_launch_trailer/\">STAR WARS: Galactic Racer - Official Launch Trailer</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1wz3m7m/star_wars_galactic_racer_official_launch_trailer/\">Star Wars: Galactic Racer™ | Official Launch Trailer</a> (reddit.com)</li><li><a href=\"https://www.operationsports.com/star-wars-galactic-racer-is-free-right-now-but-only-for-certain-players/\">Star Wars: Galactic Racer is free right now, but only for certain players</a> (operationsports.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wyxv2y/star_wars_galactic_racer_has_released_on_steam/\">Star Wars Galactic Racer has released on Steam and Epic Games Store</a> (reddit.com)</li><li><a href=\"https://www.rockpapershotgun.com/star-wars-galactic-racer-review-now-this-is-frenetically-fun-podracing-with-a-totally-unforgiving-streak\">Star Wars Galactic Racer review: now this is frenetically fun podracing with a totally unforgiving streak</a> (rockpapershotgun.com)</li><li><a href=\"https://www.gamespot.com/articles/youre-likely-playing-star-wars-galactic-racer-all-wrong-like-i-did-for-my-first-16-hours/\">You’re Likely Playing Star Wars: Galactic Racer All Wrong, Like I Did For My First 16 Hours</a> (gamespot.com)</li><li><a href=\"https://www.gamespot.com/articles/7-things-i-wish-i-knew-before-i-played-star-wars-galactic-racer/\">7 Things I Wish I Knew Before I Played Star Wars: Galactic Racer</a> (gamespot.com)</li><li><a href=\"https://www.gamesindustry.biz/star-wars-galactic-racer-launches-on-amazon-luna-as-part-of-prime-subscription\">Star Wars: Galactic Racer launches on Amazon Luna as part of Prime subscription</a> (gamesindustry.biz)</li><li><a href=\"https://www.gamesradar.com/games/racing/star-wars-galactic-racer-tips/\">15 Star Wars Galactic racer tips for to help you takedown the competition</a> (gamesradar.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMimwFBVV95cUxOTjVPbUpQQVNMc01veWk3XzRPRTNiWWxBMC1QMm9QWG5QbEJuVVNIVjN3OWNKLVJsZXZjZWo5cDh6S1ZyckcxNEpHVzRDN0REVXFrcV8xcEtHbGRpbzcyLUtJYkNWSHJoeTNvaGViXzVMOW5tXy1hcFBsUTBob0MwQzZqdzZ1S0FiOGdEbm82bzZJT25qa3I4YmR3TQ\">Star Wars: Galactic Racers Is Free to Play on Amazon Luna, Which Comes Free with Every Prime Membership</a> (ign.com)</li><li><a href=\"https://kotaku.com/12-star-wars-galactic-racer-tips-to-help-you-avoid-crashing-and-burning-2000741057\">12 Star Wars: Galactic Racer Tips To Help You Avoid Crashing And Burning</a> (kotaku.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wyy85f/star_wars_galactic_racer_launch_trailer_ps5_games/\">Star Wars: Galactic Racer - Launch Trailer | PS5 Games</a> (reddit.com)</li><li><a href=\"https://www.golem.de/news/galactic-racer-star-wars-rennspiel-startet-mit-starken-wertungen-2610-213757.html\">Galactic Racer: Star-Wars-Rennspiel startet mit starken Wertungen</a> (golem.de)</li><li><a href=\"https://www.heise.de/tests/Star-Wars-Galactic-Racer-im-Test-Rasen-statt-Reden-11477271.html\">„Star Wars: Galactic Racer“ im Test: Rasen statt Reden!</a> (heise.de)</li><li><a href=\"https://spidersweb.pl/2026/10/star-wars-galactic-racer-recenzja-ps5.html\">Star Wars: Galactic Racer zachwyca nieoczywistą mechaniką. \"Czuj, nie myśl\"</a> (spidersweb.pl)</li><li><a href=\"https://www.digitaltrends.com/gaming/prime-members-can-now-play-star-wars-galactic-racer-for-free-on-amazon-luna/\">Prime members can now play Star Wars: Galactic Racer for free on Amazon Luna</a> (digitaltrends.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1wzepb9/digital_foundry_star_wars_galactic_racer_a/\">Digital Foundry: Star Wars: Galactic Racer - A Top-Flight Arcade Racing Game with Incredible Graphics Tech</a> (reddit.com)</li><li><a href=\"https://boingboing.net/2026/10/06/star-wars-galactic-racer-is-free-to-play-for-prime-members.html\">Star Wars: Galactic Racer is free to play for Prime members</a> (boingboing.net)</li><li><a href=\"https://news.google.com/rss/articles/CBMifkFVX3lxTE83YmQzTGh0UGRxVE50UFozMmYzalVSVURsdTRHd1JXRWZWRUFvcTFwSVkySG55LWdwZUp4eUxLTVRWakxLS3hfYmREcTdNckYzV3c0RDBrSXM1VFVzUlo5YXlCM2t3VGhXLWNBRGRSRVJ4d2xEX0xTcEVDVXdUQQ\">Amazon Luna libera Star Wars Galactic Racer de graça</a> (einerd.com)</li><li><a href=\"https://news.xbox.com/en-us/2026/10/06/star-wars-galactic-racer-crashing-with-consequence/\">STAR WARS: Galactic Racer — Crashing with Consequence in Runs-Based Racing</a> (xbox.com)</li><li><a href=\"https://www.gamingonlinux.com/2026/10/star-wars-galactic-racer-is-out-now-running-quite-nicely-on-steamos-linux/\">Star Wars: Galactic Racer is out now - running quite nicely on SteamOS / Linux</a> (gamingonlinux.com)</li><li><a href=\"https://www.destructoid.com/how-to-unlock-podracing-in-star-wars-galactic-racer-campaign/\">How to unlock Podracing in Star Wars: Galactic Racer Campaign</a> (destructoid.com)</li><li><a href=\"https://www.pcgamer.com/games/racing/psa-star-wars-galactic-racer-pilots-put-some-points-in-resilience-before-you-hit-the-acid-planet/\">PSA: Star Wars Galactic Racer pilots, put some points in resilience before you hit the acid planet</a> (pcgamer.com)</li><li><a href=\"https://gamerant.com/star-wars-galactic-racers-all-favors-how-to-unlock/\">Star Wars Galactic Racer: All Favors List, Effects, &amp; Unlocks</a> (gamerant.com)</li><li><a href=\"https://www.gamespot.com/articles/star-wars-galactic-racer-continues-the-hilarious-running-gag-that-anakin-is-the-boogeyman/\">Star Wars: Galactic Racer Continues The Hilarious Running Gag That Anakin Is The Boogeyman</a> (gamespot.com)</li><li><a href=\"https://traxion.gg/why-star-wars-galactic-racer-isnt-a-traditional-podracing-game-and-is-all-the-better-for-it/\">Why Star Wars: Galactic Racer isn’t a traditional podracing game, and is all the better for it</a> (traxion.gg)</li><li><a href=\"https://www.destructoid.com/best-star-wars-galactic-racer-graphics-settings-for-no-lag-and-max-fps/\">Best Star Wars: Galactic Racer graphics settings for no lag and max FPS</a> (destructoid.com)</li><li><a href=\"https://www.operationsports.com/how-to-master-perfect-starts-in-star-wars-galactic-racer/\">How to master Perfect Starts in Star Wars: Galactic Racer</a> (operationsports.com)</li><li><a href=\"https://www.destructoid.com/star-wars-galactic-racer-trophy-guide-how-to-unlock-all-trophies-and-achievements/\">Star Wars: Galactic Racer trophy guide – How to unlock all trophies and achievements</a> (destructoid.com)</li><li><a href=\"https://www.reddit.com/r/PS5/comments/1wz98i3/star_wars_galactic_racer_df_tech_review/\">Star Wars: Galactic Racer DF Tech Review - PS5/Pro/Xbox Series X|S - This One\'s Special! [Digital Foundry]</a> (reddit.com)</li><li><a href=\"https://www.operationsports.com/want-a-podracer-heres-how-to-unlock-one-in-star-wars-galactic-racer/\">Want a Podracer? Here\'s how to unlock one in Star Wars: Galactic Racer</a> (operationsports.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Fuse Games\' Star Wars: Galactic Racer launched on October 6 for PlayStation 5, Xbox Series X|S and PC, earning an 88 Metascore and the highest review aggregate for a Star Wars game since 2003\'s Knights of the Old Republic. Critics praised its fast arcade racing, handling and presentation. Its run-based campaign makes failure consequential: crashes can end a tour, while new runs let players try different builds.', NULL, 21, 1, '2026-10-07 23:26:31', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.04781968407240368, '2026-10-15 20:00:16');
INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(61, 'Nintendo\'s Switch Sports Resort brings 12 events to Switch 2 on Oct. 22', '<p>Nintendo will release Nintendo Switch Sports Resort exclusively for Switch 2 on Oct. 22, following hands-on previews of the motion-controlled game at Gamescom. Set around Wuhu Island, the location associated with Wii Sports Resort, the game has 12 events: six returning from 2022’s Nintendo Switch Sports and six that are new or return after a longer absence.</p>\n<p>Previewers highlighted the expanded island activities, including skateboarding, jet-ski touring and flying a plane, alongside returning sports such as archery, bowling and boxing. Several said the Joy-Con 2 controls felt responsive in table tennis and archery, though one Nintendo Life reviewer found boxing inputs unreliable and wanted simpler flying controls.</p>\n<p>The previews also described solo and multiplayer options, though the brief play sessions left questions about how long the activities will hold players’ interest. Eurogamer reported a solo Island Crown mode with 20 ranked opponents; the game is scheduled to launch on Oct. 22.</p>\n<h2>Key points</h2>\n<ul><li>Mouse controls: Skateboarding uses the Switch 2 Joy-Con’s mouse mode: players slide the controller on a surface to build speed, flick it upward to jump and perform tricks in the air.</li><li>Archery rules: Under the preview’s Special rules, players score by hitting their assigned target color. Their target area shrinks as they take the lead, while hitting another player’s section awards that competitor points.</li><li>Thumb wrestling: Players can bait an opponent into dropping their thumb, then pin it; repeated escapes require more vigorous waggling.</li><li>Island exploration: The sightseeing activities include collectible points of interest, and GamesRadar said players can still fly the plane into an expanded cave system inside Wuhu Island’s volcano.</li><li>Control caveats: Mashable’s reviewer said holding the jet-ski pose tired their shoulders after a few minutes.</li></ul>\n<blockquote><p>\"Motion-controlled mayhem can still be a blast in the right circumstances.\"</p><p>— <a href=\"https://mashable.com/entertainment/nintendo-switch-sports-resort-hands-on-impressions\">Alex Perry, Mashable</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Nintendo Life reviewer Alex Olney found table tennis more nuanced than Wii Sports tennis, while bowling felt unchanged from Nintendo Switch Sports.</li><li>Eurogamer’s reviewer singled out skateboarding’s mouse-based free-play mode as his favorite activity.</li><li>Mashable reviewer Alex Perry argued that motion-controlled games work best when designed entirely around those inputs and cited Resort as an example.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2009</strong>: Wii Sports Resort introduced the island setting and earlier sports</li><li><strong>2022</strong>: Nintendo Switch Sports launched with six events that return in Resort</li><li><strong>6 October 2026</strong>: Hands-on previews described the game after Gamescom play sessions</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.nintendolife.com/previews/nintendo-switch-sports-resort-is-more-of-the-same-but-better\">Preview: Nintendo Switch Sports Resort Is More Of The Same, But Better</a> (nintendolife.com)</li><li><a href=\"https://www.vooks.net/nintendo-switch-sports-resort-preview/\">Nintendo Switch Sports Resort Preview</a> (vooks.net)</li><li><a href=\"https://news.google.com/rss/articles/CBMijgFBVV95cUxPMEl4cjhEZVFydkZ0eHlwN2cxd25WMWY0eUM1eVFGY1lyRm5NcjNLcTByZ0ViTWJ2NGNSMW4tLWM4bGZsNU1PdUo2UHowYk90YTNxdFNrMV9nVVdNSXlpa01uNjFzV0pFNUVLVjFnTy04eEtwcnZDSmYyaU1MMU4zblNGc294LTlKTnZpb1VR\">\'Nintendo Switch Sports Resort\' hands-on preview: The \'Wii Sports\' formula still works</a> (mashable.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiogFBVV95cUxQRGxscjMwRDJFVVdYNGpRODVxRjRDUFBlNmdwSG1JR2Vja0k4NWJpdHJ5Q1g5X3dzSHFtbjdQQmdfYmt1dUVjOE5XaFJQenpXVllkM1QyOVlyN3p6dklrNEV1X1E4T0dnSDR6YmpmSWdwTmJWaUFnUjE2YWs4Qjl3VVVJZ0NFbzVpWFhkZVRRWlBmYl82eHZkMjhycWQzZXY4Z2c\">Nintendo Switch Sports Resort Hands-On: Bigger And Better Than Ever</a> (engadget.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMifkFVX3lxTE9fdEZKRjFfMTMwQ3JCSnVCRkZEeGs2VFJld1BGWFdaUHF2dm5wM2ZMbXNFRTZ0RnYxUGt3Q1V5cGNuclRRM0k5YlE1ZWZ1dGtVVmVzeVRPNVV0bk05em1CQTduRFp1U2RLSzl4WEN5d09ITGMzSkVVNmxUQ3JTdw\">Nintendo Switch Sports Resort Preview: A Return Visit To Wuhu Island</a> (gameinformer.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMivgFBVV95cUxPX1RjZGg5OVlFZ3dJcjZxLTVycUFNMk16YXByNHNaNjNELTZyeTVNTFRPNWlZYmg2akNlNnpqZUx0MnRDTnQ5ckNNZFUxaTZoT2ZZTmFPeFFUWl9OQUtUSk5vWGw5cVd5UElhb0pNbmZ2eXN4ampZS0ctZ2F0cElVTVJDQmlaZjFheF9MaHQwbU4zX295ODl1aXkxbDVwM3R4SHctOWE2Z1c1d085MEFUNjZaOEdWNXZ6QzFkd0Vn\">Nintendo Switch Sports Resort Appears to Solve All of Switch Sports’ Shortcomings | IGN Preview</a> (ign.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiggFBVV95cUxOVU9XaGI5aURYckxvVF9wdEF0YU03c3NJWGdTQmwyN0NSbUZ3cndKd3NvRE9qQ1FtdHJiS2dpcUFRZVhmWHE0aWh5REVUSUE5R3BjZkFSUlpNb0pJX1NXQnJER3B5NmY1ZlJfaVBJeDJhVUdqSWlCamZ5dWZPSWdtTnB3\">Nintendo Switch Sports Resort Preview — Back To Wuhu Island</a> (cgmagonline.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1wz2rf9/nintendo_switch_sports_resort_appears_to_solve/\">Nintendo Switch Sports Resort Appears To Solve All of Switch Sports’ Shortcomings | IGN Preview</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMie0FVX3lxTFAtamxMUWdFenNTTTQ3S0ZRMUtfWnlJeGQ0cjI4NGFXWTB6cnNOZmhyS0pSUW95T3FzdGlVbmJvaW9ldW44OGZfUGZQbFgycU1DUWNIeGF1ZHcwQVJrSERzUkNla2lnRU9JNGltem05ejVidW1QaHo3NUtYbw\">Nintendo\'s New Switch Sports Is the Best of Wii Sports, Wave Race, and More</a> (polygon.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMirwFBVV95cUxNVFNseHhYa3NvVlhBMDN0N3UzSG9nWlB2YTlkSkpsUGEwb2lsVmVTdFVjWHVrcFdudENYSnQ4LURpZXk4Q1dWcElFeUZJRkNxNmVrQ19jRlY5Wi1GVllJMEJFSmxTSXgxZHZqeTdpNHFSZ2lfU3ZkeFZXS0w5OUFTOVZONHB6V1RWQXhZZlpKTUl1V0RnbURYZElyS0prM3BKMzV4dmhoeGdDWkVJbTNj\">I Played Switch Sports Resort: Motion Gaming Is Still Nintendo’s Secret Weapon</a> (cnet.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxPeUlGck5YS1VUWHpjTk5JeEdMcGs1TzhGTTltZTJqWTc1RllOZkhzNUZVUzZYS1hUZm1EbnRic2x0TjJRRGI1dnY4M0NLU05SS092TjFBdTFYYzg2LUlJSU16X3drQkNnTll2d2JISzh2SDZRcEE3MlRKQThnNkFENUhNSQ\">Nintendo Switch Sports Resort multiplies the fun with new and classic minigames</a> (shacknews.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMisAFBVV95cUxNYXBYNDVMU1NaYVJuS0JRYVI5RS1CVWJiSUpscU5FTkNTMmVHeFM5bThZU1BuWGs0SFVLRFJGR0tnakU3RFlVZjI5VkVFMEhRSXdtdVp2R2ZqejFrem56ekJBb2haTUw3bFhWeG9zOEE3dWM4OF8tbnNyR2tmdGVjbkdRVnNXVFNJdmlJdGlKSVdKSGpBREFZNC15aEdRT0xWS09VMzlZbmRYQm5KS2RKaQ\">Playing Nintendo Switch Sports Resort feels like being transported to your dream summer holiday</a> (techradar.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/10/round-up-the-final-previews-for-nintendo-switch-sports-resort-are-in\">Round Up: The Final Previews For Nintendo Switch Sports Resort Are In</a> (nintendolife.com)</li><li><a href=\"https://www.gamesradar.com/games/sports/i-flew-straight-down-the-volcano-in-nintendo-switch-sports-resort-and-im-happy-to-report-that-one-of-my-favorite-childhood-activities-just-got-way-better/\">Nintendo Switch Sports Resort has sent me into a competitive frenzy</a> (gamesradar.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMinwJBVV95cUxNcG90ay00eDQ2RWVfd2JfRE1LV0Q2aFFBTkRFLVhFZDhqTWh5SW95dlZvcFRMZHJVcFZHTGVRX1pBTlJSQVRlN1RZNmM3TUNvYk5DcFNvakhLM3lBaHF1bHdXWTFYRFRacjF6WkxESm1LdFc1UE5TX2dZV213a01NcFRMNnFaNUd0eDE3REUxWkFYX3BvX1djTk9IZW9VWEZuU0lkRk9sN2ExYTQzS3FmX2k2MkYyOE1FUUFrMnRTMjh3VzgxY1dJeUlzWENBWGtfQmRVUWNaUjNYT1FBZGZfdE1rQVMxWWQtdG5rVHNBTWx4Q0swVElUc3J5b1ZjTG5rMWh4ZzdqaTM4cjI2TVNvblBNeHJFZm80dW1PTnFLNA\">I flew straight down the volcano in Nintendo Switch Sports Resort, and I\'m happy to report that one of my favorite childhood activities just got way better</a> (gamesradar.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiswFBVV95cUxOV2JvbmhKYkwxblkzaUFKbzBhdnhiZHMxaWVKTkdwcGZWRnA3MC1XM0g1RnpKTHZKaXlxeEJRblFXcFBlM3lMVkR4VDJhX3RfVzlWR21rMmluQ09CdjN1U19KSllpM3ltdmlCRWJSRm91VEt5bENELUNycnpkcXVLWWJlUWRNMEFqaGhvTzJOR01HRzNVN0tlZHI0UHBVaHJvazY0M2hDdld2bkwzZkxWLVJoWQ\">Nintendo Switch Sports Resort would have fixed the Switch 2\'s launch day woes</a> (gamingbible.com)</li><li><a href=\"https://mashable.com/entertainment/nintendo-switch-sports-resort-hands-on-impressions\">Nintendo Switch Sports Resort brings Wii Sports antics to Switch 2</a> (mashable.com)</li><li><a href=\"https://tweakers.net/reviews/15412/nintendo-switch-sports-resort-ouderwetse-wii-pret-op-switch-2.html\">Preview - Nintendo Switch Sports Resort - Ouderwetse Wii-pret op Switch 2</a> (tweakers.net)</li><li><a href=\"https://www.eurogamer.net/nintendo-switch-sports-resort-gamescom-preview\">I spent an hour playing Switch Sports Resort and my favourite mini-game involves the Switch 2\'s least-loved gimmick: mouse controls</a> (eurogamer.net)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo will release Nintendo Switch Sports Resort exclusively for Switch 2 on Oct. 22, following hands-on previews of the motion-controlled game at Gamescom. Set around Wuhu Island, the location associated with Wii Sports Resort, the game has 12 events: six returning from 2022’s Nintendo Switch Sports and six that are new or return after a longer absence.', NULL, 22, 1, '2026-10-07 23:26:31', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.2222222222222222, '2026-10-15 20:00:16'),
(62, 'Xbox rules out exclusive GTA 6 streaming and PC cloud access', '<p>Xbox has clarified that Grand Theft Auto 6 will not stream exclusively through Xbox Cloud Gaming or to PC, ruling out the cloud workaround some PC players expected at launch. Xbox chief strategy officer Matthew Ball said the company is looking forward to the game’s November 19 release on Xbox, but did not specify which non-PC devices, if any, will support streaming.</p>\n<p>Reporting in Poland described the arrangement as Xbox-console streaming, but Xbox has not publicly detailed which platforms will support cloud streaming of the game. Rockstar has not announced a PC version or release date, leaving PC players without a confirmed way to play at launch.</p>\n<p>Microsoft plans to introduce monthly cloud-play limits and a pay-as-you-go option in November, the same month GTA 6 launches. The console launch is scheduled for November 19; Xbox and Rockstar have yet to provide further details on the streaming arrangement.</p>\n<h2>Key points</h2>\n<ul><li>Cloud limits: Microsoft’s planned monthly allowances are 15 hours for Game Pass Ultimate, 10 for Premium and five for Essential; users are also expected to be able to buy additional streaming time.</li><li>Report revised: After Xbox’s clarification, The Verge’s account dropped the claims of exclusivity and PC access but retained the claim that Xbox Cloud Gaming could stream the title at launch.</li><li>Later multiplayer: One report says GTA 6 is expected to launch with its single-player campaign first, followed by its new multiplayer component in 2027.</li></ul>\n<blockquote><p>\"While the excitement for GTA 6 and Xbox is great to see, it has also led to some misreporting. We are looking forward to launching GTA 6 on Xbox November 19, though the game will not be streaming exclusively or to PC.\"</p><p>— <a href=\"https://www.eurogamer.net/xbox-cloud-gta-6-streaming-rights\">Matthew Ball, Xbox chief strategy officer, Eurogamer</a></p></blockquote>\n<h2>Timeline</h2>\n<ul><li><strong>6 October 2026</strong>: The Verge report linked Sharma’s remarks to exclusive GTA 6 streaming rights.</li><li><strong>7 October 2026</strong>: Matthew Ball rejected exclusivity and PC streaming in a public clarification.</li><li><strong>November 2026</strong>: Microsoft plans new cloud limits and pay-as-you-go access.</li><li><strong>19 November 2026</strong>: GTA 6 is scheduled to launch on Xbox and PlayStation consoles.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.eurogamer.net/xbox-cloud-gta-6-streaming-rights\">Xbox denies reports it\'s acquired exclusive GTA 6 game-streaming rights, deflating hopes of playing it on PC</a> (eurogamer.net)</li><li><a href=\"https://www.rockpapershotgun.com/gta-6-wont-be-playable-on-pc-at-launch-via-xboxs-cloud-streaming-services-microsoft-exec-indicates-while-refuting-exclusivity-deal-report\">GTA 6 won\'t be playable on PC at launch via Xbox\'s cloud streaming services, Microsoft exec indicates while refuting exclusivity deal report</a> (rockpapershotgun.com)</li><li><a href=\"https://gameranx.com/updates/id/564299/article/xbox-debunks-rumor-they-acquired-exclusive-gta-6-cloud-gaming-license/\">XBOX Debunks Rumor They Acquired  Exclusive GTA 6 Cloud Gaming License</a> (gameranx.com)</li><li><a href=\"https://www.pcgamesn.com/grand-theft-auto-vi/xbox-pc-rumors\">Xbox shuts down GTA 6 PC rumors, as Rockstar\'s latest doubles down on console launch</a> (pcgamesn.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMipAFBVV95cUxNNmF5NHlndVI3YWJFLURiSXpydVN2REtLMnVLMzBwZWtYalh3MWc3VHBSREpsOFZETjhxNjRXcGllU2QtU0N3OXRDeGlZQW93S1JXRG4wQUtZU25udGNQR2QwN0ZyUTU1WUVBTHpvRVFzMHJMdmhlUUJBMTNJWUtOSXJMRG1tLXM0Q2RfRTBia2FYWno2dFdKbG9nckFmUjg4TERfOQ\">Xbox Denies Landing Exclusive Streaming Deal For GTA 6 At Launch</a> (purexbox.com)</li><li><a href=\"https://www.pushsquare.com/news/2026/10/confusion-as-erroneous-reports-claim-xbox-has-exclusive-gta-6-cloud-streaming-rights\">Confusion as Erroneous Reports Claim Xbox Has Exclusive GTA 6 Cloud Streaming Rights</a> (pushsquare.com)</li><li><a href=\"https://www.gamesradar.com/games/grand-theft-auto/no-gta-6-wont-be-playable-on-pc-via-xbox-cloud-gaming-and-microsoft-doesnt-have-exclusive-streaming-rights-either-exec-clarifies/\">GTA 6 won\'t be playable on PC via Xbox Cloud Gaming, exec clarifies</a> (gamesradar.com)</li><li><a href=\"https://games.slashdot.org/story/26/10/07/0321232/xbox-secures-exclusive-gta-6-streaming-rights\">Xbox Secures Exclusive GTA 6 Streaming Rights</a> (slashdot.org)</li><li><a href=\"https://www.pcgamer.com/games/grand-theft-auto/for-a-moment-it-looked-like-grand-theft-auto-6-might-be-playable-on-pc-on-launch-day-then-xboxs-chief-strategy-officer-crashed-the-party/\">For a moment it looked like Grand Theft Auto 6 might be playable on PC on launch day—then Xbox\'s chief strategy officer crashed the party</a> (pcgamer.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1wzs02w/matthew_ball_while_the_excitement_for_gtavi_and/\">Matthew Ball: While the excitement for GTAVI and XBOX is great to see, it has also led to some misreporting. We are looking forward to launching GTAVI on XBOX November 19, though the game will not be streaming exclusively or to PC.</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiyAFBVV95cUxNSkdUbVhGVTFyeHpEQVVRWklfZFd2TGhwT1FFdms5UFlsdHIwdkduOUFzVlRtMnJ5VnZ1TUZoUUNlVS02d1dkdGNVVmZab2lLN2R4bmNJalhUQmdZS2g4V3hMY2JhRTBjUExDNC1DMXFUcVlET0Z6Y3RnYlhCTzhZRVV4dXRIY0kzMzVsenc1RnRNNUlUQUpJNTVuSm5QM0F3ZzdjWUg0eEtwbVFxTzlOd2QtWXhZb0ZGV0NJZXhlMVJIdnZrSDNVVA\">Xbox Rejects ‘GTA 6’ PC Streaming And Exclusivity Report, Though Questions Remain</a> (forbes.com)</li><li><a href=\"https://www.ghacks.net/2026/10/07/microsoft-says-gta-6-will-not-stream-exclusively-on-xbox-or-be-playable-on-pc-through-the-cloud/\">Microsoft Says GTA 6 Will Not Stream Exclusively on Xbox or Be Playable on PC Through the Cloud</a> (ghacks.net)</li><li><a href=\"https://mobilesyrup.com/2026/10/07/xbox-gta-vi-streaming-exclusivity/\">Xbox won’t have GTA VI streaming exclusivity after all</a> (mobilesyrup.com)</li><li><a href=\"https://www.computerbase.de/news/apps/gta-6-per-cloud-gaming-xbox-macht-pc-spielern-einen-strich-durch-die-rechnung.99707/\">GTA 6 per Cloud Gaming: Xbox macht PC-Spielern einen Strich durch die Rechnung</a> (computerbase.de)</li><li><a href=\"https://itavisen.no/2026/10/07/gta-6-xbox-cloud-pc-avkreftet/\">XBOX får GTA 6-strømming – avkrefter PC-strømming</a> (itavisen.no)</li><li><a href=\"https://www.heise.de/news/Xbox-sichert-sich-Streamingrechte-an-GTA-6-11478649.html\">Xbox sichert sich Streamingrechte an „GTA 6“</a> (heise.de)</li><li><a href=\"https://www.derstandard.at/story/3000000343026/daempfer-fuer-pc-gamer-gta-6-wird-auch-ueber-streaming-nicht-am-rechner-landen\">Dämpfer für PC-Gamer: \"GTA 6\" wird auch über Streaming nicht am Rechner landen</a> (derstandard.at)</li><li><a href=\"https://tech.wp.pl/gta-6-w-xbox-cloud-gaming-od-dnia-premiery-microsoft-ma-umowe,7337486591355360a\">GTA 6 w Xbox Cloud Gaming od dnia premiery? Microsoft ma umowę</a> (wp.pl)</li><li><a href=\"https://tweakers.net/nieuws/253034/xbox-ontkent-dat-het-exclusieve-streamingrechten-voor-gta-vi-heeft.html\">XBOX ontkent dat het exclusieve streamingrechten voor GTA VI heeft - update</a> (tweakers.net)</li><li><a href=\"https://arynews.tv/gta-5-xbox-rules-out-pc-streaming-at-november-launch\">GTA 5: Xbox rules out PC streaming at November launch</a> (arynews.tv)</li><li><a href=\"https://www.gamer.no/artikler/xbox-har-angivelig-sikret-seg-strommerettigheter-for-gta-vi/521129\">Nei, Xbox har ikke sikret seg eksklusive strømmerettigheter for GTA VI</a> (gamer.no)</li><li><a href=\"https://www.androidheadlines.com/2026/10/gta-6-will-be-streamable-via-xbox-come-november.html\">GTA 6 will be streamable via Xbox come November</a> (androidheadlines.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Xbox has clarified that Grand Theft Auto 6 will not stream exclusively through Xbox Cloud Gaming or to PC, ruling out the cloud workaround some PC players expected at launch. Xbox chief strategy officer Matthew Ball said the company is looking forward to the game’s November 19 release on Xbox, but did not specify which non-PC devices, if any, will support streaming.', NULL, 21, 1, '2026-10-08 23:22:02', NULL, 4, 1, '2026-10-15 20:00:04', NULL, 0.05938228592651897, '2026-10-15 20:00:16'),
(63, 'Minecraft launches on Switch 2 October 27 with limited-time free upgrade', '<p>Mojang has opened pre-orders for Minecraft on Nintendo Switch 2, which is scheduled to launch Oct. 27. Owners of the digital Nintendo Switch version can claim the Switch 2 Standard Edition for free through Jan. 31, 2027, via the Nintendo eShop in most territories; Japan and Taiwan are excluded.</p>\n<p>The limited-time free upgrade is available only to digital owners. Players who do not qualify can buy the Switch 2 version for $29.99. The game will also be sold on a Game-Key Card. Players can transfer their Nintendo Switch worlds to the new version. The Switch 2 release adds support for Vibrant Visuals and includes the Super Mario Mash-Up Pack.</p>\n<h2>Key points</h2>\n<ul><li>Collection discounts: Eligible players can also buy the Deluxe Collection or Ultimate Collection at a discount. Nintendo Everything reported eShop discounts of 75% and 60%, respectively.</li><li>Visual limitations: Vibrant Visuals will not be available in some gameplay modes and content, including split-screen and certain Marketplace worlds and content.</li><li>Online requirements: Cross-platform play requires a Microsoft Account, while online multiplayer requires a separate Nintendo Switch Online membership.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>7 October 2026</strong>: Mojang\'s pre-order announcement and upgrade details were published</li><li><strong>27 October 2026</strong>: Minecraft is scheduled to launch on Nintendo Switch 2</li><li><strong>31 January 2027</strong>: Digital Switch owners\' free upgrade claim period ends</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.nintendolife.com/news/2026/10/minecraft-switch-2-pre-orders-now-live-free-digital-upgrade-path-confirmed-as-limited-time-offer\">Minecraft Switch 2 Pre-Orders Now Live, Free Digital Upgrade Path Confirmed As \"Limited Time Offer\"</a> (nintendolife.com)</li><li><a href=\"https://nintendoeverything.com/minecraft-details-free-limited-time-nintendo-switch-to-switch-2-upgrade/\">Minecraft details free limited time Nintendo Switch to Switch 2 upgrade</a> (nintendoeverything.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMikgFBVV95cUxOQUFJTHAzRGRxQXhJTjFfOEVlbGFQUElQbHFmRnF4eFlSZll6ampIcWdrVTlEZU4tREEtbmlyd2xZZVhlc3pSV1I1ekduQUE3cllDcjNRNUNKeERXdmpLLWJ1TEV0YkZYNkE3cGVPdlRxMkpXM3ZybmVCaHBxSE5nc3BfRWZTZU9kOXo4cFIwNXYyZw\">Pre-order Minecraft for Nintendo Switch™ 2 today! - News - Nintendo Official Site</a> (nintendo.com)</li><li><a href=\"https://www.vooks.net/minecraft-gets-free-switch-2-upgrade-for-limited-time-but-only-for-digital-buyers/\">Minecraft gets free Switch 2 upgrade for limited time, but only for digital owners</a> (vooks.net)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x05lp2/minecraft_switch_2_upgrade_is_free_if_you_own_a/\">Minecraft (Switch 2) upgrade is free if you own a digital version of Minecraft for Nintendo Switch. Offer available until January 31, 2027</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiiAFBVV95cUxQZzB5WHlicFlhTVg3WHBTOWRxSG94b0J2TkFkUUl3YzlVcU1jcENXOWoyUno0aXg2U2pfb0g0TDNPUTVYa1BEWFhUU2kxb1Q1REd0TWxETFpHdFRFNGhzTklLZTVvYVlTdmRwQ0JJOHVBY0VnT0VpWUtCamd2a1lRNldXQUdMSGZz\">Pre-order Minecraft for Nintendo Switch™ 2 today!</a> (minecraft.net)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Mojang has opened pre-orders for Minecraft on Nintendo Switch 2, which is scheduled to launch Oct. 27. Owners of the digital Nintendo Switch version can claim the Switch 2 Standard Edition for free through Jan. 31, 2027, via the Nintendo eShop in most territories; Japan and Taiwan are excluded.', NULL, 22, 1, '2026-10-08 23:22:02', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.1082241434097333, '2026-10-15 20:00:16'),
(64, 'ARC Raiders launches Frozen Trail update as Steam players surge', '<p>Embark Studios released Frozen Trail, its largest ARC Raiders update to date, on October 8, adding the snowy Pendola Pass map, new ARC enemies, weapons, gadgets, an expanded skill tree and customizable Outposts. Steam’s 24-hour peak reached 131,388 players, the game’s highest since April. The launch coincided with a free-play weekend through October 12 and a 50% discount on the game.</p>\n<p>Embark said in May it would shift to larger updates twice a year to give developers more time and deliver more substantial releases. A limited PvE-only beta is scheduled for October 13–20, allowing players to cooperate against ARC without PvP. Embark will use the test to assess the mode and has not committed to making it permanent.</p>\n<h2>Key points</h2>\n<ul><li>Map encounters: Pendola Pass features dynamic loot zones designed to shift scavenging hotspots between matches. Executive producer Aleksander Grøndal said the studio could apply the system to existing maps if the test works well.</li><li>Progression details: The Reward Pass has 60 levels across free and premium tracks. Completing both can yield 1,350 Raider Tokens.</li><li>Weapon changes: The update adds a fifth weapon quality tier through Weapon Amplification, available for 15 weapon types, as well as Stiletto and Bantam.</li><li>Small fixes: Players can now open the map while downed, drop loot directly from containers and turn off backpack lights. Embark also adjusted sound occlusion around walls and obstacles.</li></ul>\n<blockquote><p>\"Of course, it\'s not something that you look at and go, \'Oh, that feels great,\'\"</p><p>— <a href=\"https://www.gamesradar.com/games/third-person-shooter/arc-raiders-hasnt-had-player-counts-like-this-in-months-steam-flies-past-125-000-amid-frozen-trail-50-percent-discount-and-free-trial/\">Aleksander Grøndal, executive producer at Embark Studios, GamesRadar+</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Digital Trends: A reviewer described an encounter on the Frigate in which many Raiders briefly cooperated, but warned that teams controlling the boarding point could also camp there and attack others trying to get aboard.</li><li>GameSpot: The outlet cautioned that launch-day numbers cannot establish whether Embark’s slower update schedule will succeed over time, although the game averaged about 40,000 concurrent Steam players in September.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>April 2026</strong>: Riven Tides arrived as the previous major update</li><li><strong>May 2026</strong>: Embark announced a semi-annual schedule for major updates</li><li><strong>8 October 2026</strong>: Frozen Trail launched alongside the free-play promotion</li><li><strong>13 October 2026</strong>: Limited PvE beta begins and runs through October 20</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.destructoid.com/arc-raiders-2-0-frozen-trail-update-patch-notes/\">ARC Raiders 2.0 Frozen Trail update patch notes</a> (destructoid.com)</li><li><a href=\"https://insider-gaming.com/arc-raiders-player-count-hits-six-month-high-soars/\">ARC Raiders Player Count Hits Six-Month High As Frozen Trail Soars</a> (insider-gaming.com)</li><li><a href=\"https://www.gamesradar.com/games/third-person-shooter/arc-raiders-frozen-trail-patch-notes-are-full-of-sentences-that-players-have-dreamed-of-for-years-you-can-now-open-the-map-while-downed/\">Arc Raiders Frozen Trail patch notes are full of sentences that players have dreamed of for a year</a> (gamesradar.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMitwFBVV95cUxNT0hOc1duTzgtY294WEtiNno0RnJScnMzT1lKbUgtTFlKaHJuenV3cTVZZkE4U2J4NG5PeWpVdXlnWjJ6YkdaQmJTT0txMm8yNVpaQ3Jickg3Qnc4bld2REloUDVQVEpaU3dERjBXOU5wamhfR3E0VVBEZTdIT0FfQUlRTW1zc0djdGR6NnRIbWt4azJSMUFpZWFCUkQ0TEhpNnpMX1NMclNKS0NabERVTTU4Nl8ycEHSAbwBQVVfeXFMTUxDM0xOMjR4bnVjc3FFQjl3ak00czROYUZyeXo4NUkxYVVGTVJxcC1KMDBlU0VnYldtTUJtWlBPNDRUTzFiMk9LeGVjOGdkeU83Sllfcy1rNUxFUkltNzNpUmo4c0hLQ09LMW1ZS0l3M1JPWFdOVkJnMXlRdnF6c2ZuN3drbnV6SjBvTEFzRVZ0V1oxTzFLVkhoOXFXZzQwTzVtMlVUaDEwOUd5aHRERG8tVnpWNmdBdmFWZFk\">Arc Raiders Jumps to Six-Month High Player Count With 2.0 Update and Free Weekend</a> (techpowerup.com)</li><li><a href=\"https://wccftech.com/arc-raiders-frozen-trail-update-free-weekend-50-percent-off/\">ARC Raiders’ Biggest Update Yet Storms In, As Frozen Trail Arrives With a Free Weekend and 50% Off</a> (wccftech.com)</li><li><a href=\"https://www.gamespot.com/articles/arc-raiders-big-update-has-it-surging-to-numbers-it-hasnt-seen-in-months/\">Arc Raiders’ Big Update Has It Surging To Numbers It Hasn’t Seen In Months</a> (gamespot.com)</li><li><a href=\"https://www.gamesradar.com/games/third-person-shooter/arc-raiders-hasnt-had-player-counts-like-this-in-months-steam-flies-past-125-000-amid-frozen-trail-50-percent-discount-and-free-trial/\">Arc Raiders hasn\'t had player counts like this in months: Steam flies past 125,000</a> (gamesradar.com)</li><li><a href=\"https://www.gamingonlinux.com/2026/10/arc-raiders-massive-frozen-trail-2-0-update-is-out-and-free-to-play-for-a-few-days/\">ARC Raiders massive Frozen Trail 2.0 update is out and free to play for a few days</a> (gamingonlinux.com)</li><li><a href=\"https://www.digitaltrends.com/gaming/arc-raiders-frozen-trail-impressions/\">ARC Raiders just dropped its biggest update yet, and I’m having a blast</a> (digitaltrends.com)</li><li><a href=\"https://habr.com/ru/companies/ggsel/news/1091996/\">Frozen Trail для ARC Raiders: ледяной перевал, рейд на фрегат и бесплатный доступ</a> (habr.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Embark Studios released Frozen Trail, its largest ARC Raiders update to date, on October 8, adding the snowy Pendola Pass map, new ARC enemies, weapons, gadgets, an expanded skill tree and customizable Outposts. Steam’s 24-hour peak reached 131,388 players, the game’s highest since April. The launch coincided with a free-play weekend through October 12 and a 50% discount on the game.', NULL, 21, 1, '2026-10-09 21:24:50', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.04781968407240368, '2026-10-15 20:00:16'),
(65, 'Nintendo adds 111 Majora’s Mask tracks to Nintendo Music', '<p>Nintendo added the soundtrack for The Legend of Zelda: Majora’s Mask to Nintendo Music on Oct. 9, making 111 tracks totaling nearly two hours of music available. The update follows an announcement earlier in the week.</p>\n<p>The release includes curated playlists for Battles, Dungeons, Welcome to Termina and Ocarina Songs, plus an Extended-Playback Collection with selected tracks that loop seamlessly.</p>\n<h2>Key points</h2>\n<ul><li>Service access: Nintendo Music is a free download on iOS and Android; listening through a web browser requires an active Nintendo Switch Online membership.</li><li>Game origins: Majora’s Mask originally launched for Nintendo 64 in 2000.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://mynintendonews.com/2026/10/09/zelda-majoras-mask-added-to-nintendo-music/\">Zelda: Majora’s Mask added to Nintendo Music</a> (mynintendonews.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x1814d/the_legend_of_zelda_majoras_mask_added_to/\">The Legend of Zelda: Majora’s Mask added to Nintendo Music</a> (reddit.com)</li><li><a href=\"https://gonintendo.com/contents/42607-nintendo-music-soundtrack-updates-for-oct-8th-2026\">Nintendo Music soundtrack updates for Oct. 8th, 2026</a> (gonintendo.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiZ0FVX3lxTE1kdnZJSVdTYTVHMEYtVkFZcFkwdGpaTEY2MHlON1FXWE1LMWJQc195MHFmbzRhcEF2M2VoM0pqWEdnaUlOV1MtU2tHR2lKWkRIeENNRks5VVYtODc2cklHV1plYmxJTGM\">Nintendo Drops Surprise Legend of Zelda: Majora\'s Mask Release</a> (imdb.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo added the soundtrack for The Legend of Zelda: Majora’s Mask to Nintendo Music on Oct. 9, making 111 tracks totaling nearly two hours of music available. The update follows an announcement earlier in the week.', NULL, 22, 1, '2026-10-09 21:24:50', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.05428495199278598, '2026-10-15 20:00:16'),
(66, 'Kingdom Hearts Collection Reviews Are In: Great Package, Shaky Frame Rate on Switch 2', '<p>Kingdom Hearts Collection [I~III] is out now on Switch 2, PS5, and Xbox Series X|S. The first reviews are positive, with a few warnings.</p><p>A roundup of seven reviews shows scores from 4.5/5 up to 9.5/10. Most critics agree the package is worth buying. They also agree on where it struggles.</p><p><strong>What reviewers liked</strong><br />The older games get the best feedback. Reports say they hold a stable 60 fps on Switch 2. Pocket Tactics compares it to the earlier cloud version and says the new native release is a big step up. Siliconera calls it a great way to catch up on ten games in the series.</p><p><strong>Where it struggles</strong><br />Kingdom Hearts III and Kingdom Hearts 0.2 are the weak spots. Four outlets report frame rate dips in Kingdom Hearts III on Switch 2, and TheGamer found 0.2 choppy in handheld mode. RPG Site is the most cautious voice. It says the collection is hard to recommend on Switch 2 without caveats. Not everyone agrees. Critical Hits says every game runs well on Switch 2, including III and 0.2. Your own experience may differ, so the demo is worth trying first.</p><p><strong>Good to know</strong><br />Three entries are cutscene compilations, not playable games. The old cloud versions on Switch stop working on June 9, 2027.</p><p><strong>Our take:</strong> If you want the whole story in one place, this is the best way to play it on Switch 2. Play the older games first, then check whether the dips in III bother you.</p><p><strong>Sources:</strong></p><ul><li>PlayNews: Kingdom Hearts Collection [I~III] reviews roundup (playnews.gg)</li><li>RPG Site: Switch 2 vs PS5 and PS4 Pro comparison (rpgsite.net)</li><li>Pocket Tactics: Collection Switch 2 review (pockettactics.com)</li><li>Siliconera: Review of the Kingdom Hearts Collection (siliconera.com)</li><li>Critical Hits: Kingdom Hearts Collection review (criticalhits.com.br)</li><li>Nintendojo: Kingdom Hearts series ported to Switch 2 (nintendojo.com)</li></ul>', 'Critics like the new Kingdom Hearts bundle, but not every game runs smoothly on Switch 2. Here is what the first reviews say.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791627775/FYP-NRS/thumbnails/viim3jwis4paa19fx0zl.png', 23, 1, '2026-10-10 18:22:55', NULL, 7, 0, '2026-10-15 20:00:04', 9, 0.23637893257251277, '2026-10-15 20:00:16'),
(67, 'Sega cuts Sonic Racing price to $39.99, announces six crossover packs', '<p>Sega has announced a second year of free updates and paid crossover content for Sonic Racing: CrossWorlds, starting November 3, 2026, along with permanent price cuts. The standard edition now costs $39.99, down from $69.99, while the Digital Deluxe Edition falls to $59.99 from $89.99. Season Pass Two, which includes six premium packs, costs $29.99.</p>\n<p>The roadmap includes free characters Bayonetta and Aigis and a free McLaren Racing collaboration featuring a Sonic-themed car. Paid collaborations feature Godzilla, Evangelion, Sanrio, Sega franchises, Final Fantasy VII Remake and Persona. Godzilla is the first paid pack, arriving at the Year Two launch; later releases run through the end of 2027. Sega also plans new competitive and customization features.</p>\n<h2>Key points</h2>\n<ul><li>New gadgets: The launch update adds 15 gadgets and a Grand Master Plate that provides a seventh slot for boosted one-slot gadgets.</li><li>Festival schedule: A themed Festival will run for 10 days after each new free-character release, with rewards earned through races.</li><li>More racers: Five additional free characters are planned for release between April and December 2027, in addition to the first three already announced.</li><li>Entry options: The Year Two Digital Deluxe Edition bundles the base game with Season Pass Two; existing owners are warned not to buy it because it includes another copy of the game.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>January 2027</strong>: Evangelion pack adds Rei, Asuka, Tokyo-III and themed machines</li><li><strong>Q2 2027</strong>: Virtual Sanrio Puroland pack brings Hello Kitty and Kuromi racers</li><li><strong>Q3 2027</strong>: SEGALAND pack adds a Sega-history course and arcade-inspired machines</li><li><strong>Q4 2027</strong>: Persona crossover pack is scheduled; its specific content remains undisclosed</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.gematsu.com/2026/10/sonic-racing-crossworlds-year-two-updates-and-dlc-announced\">Sonic Racing: CrossWorlds Year Two updates and DLC announced</a> (gematsu.com)</li><li><a href=\"https://mynintendonews.com/2026/10/09/sonic-racing-crossworlds-year-two-dlc-includes-hello-kitty-persona-3-and-more/\">Sonic Racing: CrossWorlds Year Two DLC includes Hello Kitty, Persona, Final Fantasy VII, and more</a> (mynintendonews.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/10/sonic-racing-crossworlds-year-two-roadmap-revealed-major-free-updates-new-collabs-and-much-more\">Sonic Racing: CrossWorlds \"Year Two\" Roadmap Revealed - Major Free Updates, New Collabs And Much More</a> (nintendolife.com)</li><li><a href=\"https://gamerant.com/sonic-racing-crossworlds-year-two-dlc/\">Sonic Racing: CrossWorlds Reveals Year Two DLC Plans and Free Content</a> (gamerant.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1x1wwjo/sonic_racing_crossworlds_year_two_showcase/\">Sonic Racing: CrossWorlds - Year Two Showcase</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1x1wvql/sega_announces_that_persona_3_reload_evangelion/\">Sega announces that persona 3 reload, evangelion, godzilla and final fantasy 7 remake dlc is coming to Sonic Racing Crossworlds</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMixgFBVV95cUxNUTExOUJBS090SnRhX3VRUFF0TUJ6NXE3T0RDcTB3WHp1WWZiVFBjTG1zNzVtdFplNWRkUE1EaXVaWGFQNVZUZ0x3RkwyWTdINDNjc3QyR19fTFo0RVUzZEJXX3B2MHZHS0wtd0MzTERPYThxLUxtYmVRd1RMWUhYbEJhck1ubFNwelpZVWY5V1A5SllHRWZjYi1UeTYtcGpsQjlIaV9PZWJfVDgwQVk0S3QtUW95TE14ejFHUmgwV2s4al9YdVE\">Sonic Racing: CrossWorlds reveals Final Fantasy 7 Remake Series, Persona, Hello Kitty, Segaland DLC</a> (nintendoeverything.com)</li><li><a href=\"https://www.siliconera.com/sonic-racing-crossworlds-getting-evangelion-ffvii-persona-and-sanrio-crossovers/\">Sonic Racing CrossWorlds Getting Evangelion, FFVII, Persona, and Sanrio Crossovers</a> (siliconera.com)</li><li><a href=\"https://www.reddit.com/r/Games/comments/1x1x385/sonic_racing_crossworlds_year_two_showcase/\">Sonic Racing: Crossworlds - Year Two Showcase</a> (reddit.com)</li><li><a href=\"https://gonintendo.com/contents/65961-sonic-racing-crossworlds-year-two-free-updates-dlc-announced-final-fantasy-persona\">Sonic Racing: CrossWorlds \"Year Two\" Free Updates &amp; DLC Announced (Final Fantasy, Persona, Sanrio, SEGALAND &amp; more), Year One Physical Version Confirmed</a> (gonintendo.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x21v5w/sonic_racing_crossworlds_year_two_looks_amazing/\">Sonic Racing: CrossWorlds - Year Two Looks Amazing!!</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMitwFBVV95cUxPckdibF9YVjl0eHZvN0lSMVFBbkktRnAyNEMxMURqbjNDb3FuVC0wNFI4bTRxb3NVaFNrcXYyb2kzQjQ3Mk5JQ0FYMjNnZEFkSVNaWmwzZW9PQjhZX2VuVjMtbnBfRzJNVmtpbVE0MlFYSldWZDRiMUwyaFloVUR4dmZtY2wyckpzdTN1VWlrNk1saDd3aVJqX0t5Um9Ga2tzdjZpazBYOV9DaWdaaThhd2RDcFU5a0U\">SEGA revela Ano 2 de Sonic Racing: CrossWorlds; FF7 Remake, Hello Kitty, SEGALAND e muito mais</a> (psxbrasil.com.br)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Sega has announced a second year of free updates and paid crossover content for Sonic Racing: CrossWorlds, starting November 3, 2026, along with permanent price cuts. The standard edition now costs $39.99, down from $69.99, while the Digital Deluxe Edition falls to $59.99 from $89.99. Season Pass Two, which includes six premium packs, costs $29.99.', NULL, 21, 1, '2026-10-10 22:30:29', NULL, 4, 0, '2026-10-15 20:00:04', NULL, 0.19248262606937705, '2026-10-15 20:00:16'),
(68, 'It Takes Two arrives on Switch 2 October 15 with free upgrades', '<p>Electronic Arts and Hazelight Studios will release It Takes Two for Nintendo Switch 2 on October 15 for $39.99; owners of the Nintendo Switch version can upgrade for free. The new edition adds higher resolution, improved frame rates and richer visual effects.</p>\n<p>The game supports cross-platform play through its free Friend’s Pass, which lets an invited player join without owning the game, and Nintendo Switch 2 GameShare can connect with Nintendo Switch players. Hazelight’s first Switch 2 trailer was released October 9, ahead of the launch.</p>\n<h2>Key points</h2>\n<ul><li>Physical copies: A Reddit user said owners of the physical Switch edition can access the free upgrade through an in-game eShop icon, while digital owners can update directly in the eShop.</li><li>Award history: Hazelight said the game has won more than 90 awards, including Game of the Year honors from The Game Awards and DICE.</li><li>Co-op design: The story follows Cody and May, a couple transformed into dolls who must cooperate through the game’s challenges.</li></ul>\n<blockquote><p>\"We are very happy to finally bring It Takes Two to even more players on Nintendo Switch 2. Everyone who owns the game on Nintendo Switch can upgrade for free! Our partners at Turn Me Up Games have done a great job optimizing the game.\"</p><p>— <a href=\"https://gonintendo.com/contents/65953-check-out-the-first-trailer-for-it-takes-two-on-switch-2\">Team Hazelight, GoNintendo</a></p></blockquote>\n<h2>Timeline</h2>\n<ul><li><strong>September 2026</strong>: Hazelight and EA announced the Switch 2 version for October</li><li><strong>9 October 2026</strong>: The first trailer for the Switch 2 edition was released</li><li><strong>15 October 2026</strong>: The game is scheduled to launch on Switch 2 for $39.99</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMingFBVV95cUxOYVQwb2dGZm1hT1UzSDNhRVZNeHZuWlNVN3c5aWVfVG0wQ2l6TUptTjVJYkVHYjZLRUxDYmZUTF9uc1VxUHNvbkk5TFh1RW5pdmxaUFpNMnBqamk3c1pJMlRFd3JZSXo3Um9pZGVQN2w0d1h0V09EeUlreFBZYUUyakpHMFFUeE9EbGU4S3ZEeER2cnFLVE1jcTZEbWFWdw\">It Takes Two will have a free upgrade on Nintendo Switch 2</a> (mynintendonews.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMirAFBVV95cUxQRFZZSmJwcnFZeVpxeWI2cU9qVGNCc1YySlhPcUFHWDIzaFRRdi1CaFlVeHJ6UlEwS3duaDBYcTRYTE50VEtwNjJYb0RfaWRVRmlzeTRfMXI0RjhHaUVtdEVreGg1dV9iajZ1c2hEdVE4VjZnZ0NuUWREZktGNS1UTkhpWFZNdFB1RDViWVBfYmVaUTVnWGEtMnJCMUZXZmtzUV9KWGhpNzhUSEtY\">It Takes Two gets debut Nintendo Switch 2 trailer, free upgrade from Switch 1</a> (nintendoeverything.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x1lcpi/it_takes_two_will_have_a_free_upgrade_on_switch_2/\">It Takes Two will have a Free Upgrade on Switch 2</a> (reddit.com)</li><li><a href=\"https://comicbook.com/gaming/news/nintendo-switch-2-free-game-of-the-year/\">Nintendo Switch 2 Game of the Year Winner Free for Some Users</a> (comicbook.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiwAFBVV95cUxPVXdNVDdvS2l3dnNyWDB2M1lUeXE0T3JKRGpCbzIwYXZSX2pRRDIxWU9scHVLblVTQjByTVQzX3ZublFqT1ZNb0pDN3Z5eVBsTE81SXk0aFZxY0NnTjZwTUtkVXVnMnZQdnBCY1RULVp1VkRHNVVaVDZIQUt0R3k3OFdIZGlmc0dGeTBFNWw2dkJXeDF4b3N4NmV6UnZXTW4tT21DcFhKUERKSmppcDgybVZfc09iTFAtZ1JtaHhEYzM\">\'It Takes Two\' Hops Onto Switch 2 Next Week, Marrying Visual Upgrades &amp; Cross-Play</a> (nintendolife.com)</li><li><a href=\"https://gonintendo.com/contents/65953-check-out-the-first-trailer-for-it-takes-two-on-switch-2\">Check out the first trailer for It Takes Two on Switch 2</a> (gonintendo.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x2055p/it_takes_two_upgrade_also_works_for_physical/\">It Takes Two Upgrade also works for physical</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x1zuns/it_takes_two_upgrade_also_work_for_physical/\">It Takes Two Upgrade also work for physical</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Electronic Arts and Hazelight Studios will release It Takes Two for Nintendo Switch 2 on October 15 for $39.99; owners of the Nintendo Switch version can upgrade for free. The new edition adds higher resolution, improved frame rates and richer visual effects.', NULL, 22, 1, '2026-10-10 22:30:30', NULL, 1, 0, '2026-10-15 20:00:04', NULL, 0.15228744683189208, '2026-10-15 20:00:16'),
(69, 'Amazon cuts Nintendo Switch 2 Ocarina remake preorder price by $10', '<p>Amazon has cut the physical preorder price for Nintendo’s Switch 2 remake of The Legend of Zelda: Ocarina of Time to $59.88, down from $69.99. The digital version is listed at $59.99, and the game is scheduled for release on Nov. 5.</p>\n<p>Under Amazon’s preorder price guarantee, buyers pay the lowest price offered between placing their order and receiving the game. Nintendo’s first physical print run will have textured foil cover art, according to Mashable.</p>\n<h2>Key points</h2>\n<ul><li>Anniversary hardware: A Zelda-themed Switch 2 console, Pro Controller and carrying case are scheduled to go on sale Oct. 29 for the franchise’s 40th anniversary.</li><li>Remake speculation: Recent headlines have fueled speculation about future Zelda remakes, naming Majora’s Mask and A Link to the Past, but neither report describes an official announcement for either game.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMiZ0FVX3lxTE9DQ2xpUlZGTHdxbU9aX3BaU1VWR1V2ZV8wRi1CVEQzYVp3dWFDekV5eXN5UExjVXBTakk3QlJBUjNGWUxKQ3R4Xzd6ZmJ3eF84N0JocXFZTFJ5ZW9KdUtVYU1PelFQaUE\">Nintendo Just Made a Zelda: Majora\'s Mask Remake Look More Likely After Ocarina of Time</a> (imdb.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqgFBVV95cUxNQ1lTNmF1c0N4VG9IMWo2eFpFX19tb1BHYVlLZFVLWW9kUXBqcWc5Vy1ucVluWWIwMlFrS3k0VTV1RnhsUFczbWhiclZJbUdTbE9xMmVGQjZTdGpKN0tpcXl2QVgxUGZUUTY2ems3eS1aaXUwR1VaakZVT3pyOFExd2I2X3l6cWtTMkcwZE56bFFrTVZzUzJ1M1pRQ1U2V2VvLXhEa2ZSTVNOdw\">Zelda Majora\'s Mask won\'t be Nintendo\'s next remake but A Link to the Past could be</a> (gamingbible.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiZ0FVX3lxTFBESGRscFhrbEhLU0lzeGZTb25zY0puaXNJRGh1ZVhHV2J5UnlZSUVHNE1OVWdHX2pOTm1TemNFZW51dmtQQ3k1S25nRkZkQ3E4Rmdmby0za3BaR1JfNThZQzZVZlNVcDg\">Zelda: Ocarina Of Time Remake Officially Unveils Major Character Redesign</a> (imdb.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiqAFBVV95cUxPbFUyRkRHYVdFa2dTVF9YeVFuQ2c0U1pBWk9QeXo3eGk0M3dpM1FXZ0dtNjYzX0h4THZqZVdXbXUxMm4yczB4ajVvZkJYZ3N6V0NjajV4c1RJWTdhNWFYVVpMVENheUVxVERjb3ZKZy1YT19xN1Zodmwwd000UVBoUDZETFIwY3lTZU1Oa2QxczdJN090eC1MUW9BSlZkUDhVRkNCM1IyWU8\">Save $10 on preorders for Nintendo\'s remake of \'The Legend of Zelda: Ocarina of Time\'</a> (mashable.com)</li><li><a href=\"https://mashable.com/entertainment/oct-10-october-prime-day-legend-of-zelda-ocarina-of-time-preorder-deal\">Save $10 on preorders for Nintendos remake of The Legend of Zelda: Ocarina of Time</a> (mashable.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Amazon has cut the physical preorder price for Nintendo’s Switch 2 remake of The Legend of Zelda: Ocarina of Time to $59.88, down from $69.99. The digital version is listed at $59.99, and the game is scheduled for release on Nov. 5.', NULL, 22, 1, '2026-10-11 23:49:01', NULL, 1, 1, '2026-10-15 20:00:04', NULL, 0.0721494289398222, '2026-10-15 20:00:16');
INSERT INTO `article` (`article_id`, `title`, `content`, `summary`, `thumbnail`, `author_id`, `status`, `published_at`, `updated_at`, `category_id`, `trending_score`, `score_calculated_at`, `background_cosmetic_id`, `bridging_score`, `bridging_calculated_at`) VALUES
(70, 'REDSEC Turns One Soon: A Look Back at Its Rocky Battle Royale Launch', '<p>Battlefield REDSEC will be one year old on October 28. Its launch was one of the messier ones in recent shooter history, so now is a good time to look back.</p><p><strong>A big launch with a rough start</strong><br />Battlefield 6 had the biggest launch in the series, selling over 7 million copies in three days. EA followed up with REDSEC, a free battle royale released as a separate download for up to 100 players. Expectations were high. </p><p><strong>Why players were angry</strong><br />Steam reviews turned bad fast. About 1,500 reviews had landed on day one, and the game sat at Mostly Negative. Players had three main complaints: </p><ul><li>The mode could only be played as a duo or a squad of four. Solo players had no queue of their own. </li><li>Weekly challenges in the Season 1 battle pass were tied to the battle royale. Fans who only wanted regular multiplayer felt forced into a mode they did not choose. </li><li>Some players also disliked the 30Hz servers. DICE’s lead producer said the servers move to 60Hz for the final stage of a match. </li></ul><p>Not every early take was negative. GamesBeat’s early impressions called the sentiment on the battle royale content quite positive. The mode also had some fresh ideas. Touching the edge of the closing ring kills you instantly, with a warning when you get close. </p><p><strong>How the developers responded</strong><br />The studio asked fans for patience. The team said REDSEC had plenty of time to win players back, and that many of the challenge problems were fixed in an update the following week. The Season 1 roadmap promised new Gauntlet content for November and December. </p><p><strong>Our take:</strong> REDSEC showed how a battle royale can lose goodwill when it is tied too closely to the main game. Linking battle pass progress to a separate mode annoyed players more than any gameplay flaw.</p><p><strong>Sources:</strong></p><ul><li>Notebookcheck: Steam reviews plunge for Battlefield 6 battle royale (notebookcheck.net)</li><li>GamesBeat: Season 1 and REDSEC launch with mixed results (gamesbeat.com)</li><li>Gfinity Esports: REDSEC review bombed on Steam (gfinityesports.com)</li><li>Yahoo Tech: Devs respond to REDSEC review bombing (tech.yahoo.com)</li><li>TechSpot: REDSEC free-to-play battle royale details (techspot.com)</li></ul>', 'Battlefield 6’s free battle royale mode arrived to a wave of angry Steam reviews. Here is what went wrong at launch and how the developers answered.', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791767480/FYP-NRS/thumbnails/a4ie5kcwnqvl6tucx9rf.png', 23, 1, '2026-10-12 09:11:21', NULL, 7, 3, '2026-10-15 20:00:04', 9, NULL, NULL),
(71, 'The Witcher 3 remaster adds upgrades for existing owners', '<p>CD Projekt’s The Witcher 3: Wild Hunt – Remastered is now available for Switch 2, PlayStation 5, Xbox Series S/X and PC, with free upgrades for owners of the original game on the same platform. The update refreshes the decade-old role-playing game rather than rebuilding it. The next entry in the series remains some distance away.</p>\n<p>The Switch 2 version has a clearer image, denser vegetation and improved lighting compared with the original Switch release. The reviewer found performance relatively steady at 30 frames per second. The remaster also adds accessibility and quality-of-life options and gives the skill tree a more linear layout. The reviewer noted that players cannot switch back to the original skill-tree system.</p>\n<h2>Key points</h2>\n<ul><li>Optional settings: Players can disable inventory weight and item durability, enable infinite underwater breath and use automatic corpse looting.</li><li>New features: The update adds mod.io support and platform-specific features, including Switch 2 motion controls, and changes NPC and enemy AI.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.siliconera.com/review-the-witcher-3-wild-hunt-remastered-improves-on-greatness/\">Review: The Witcher 3: Wild Hunt – Remastered Improves on Greatness</a> (siliconera.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1x37ete/the_witcher_3_remastered_pc_performance_review/\">The Witcher 3 Remastered: PC Performance Review + Optimised Settings</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1x38q3f/was_playing_the_witcher_3_remastered_and_this/\">Was playing the Witcher 3 remastered and this tongue in cheek book gave me a chuckle</a> (reddit.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'CD Projekt’s The Witcher 3: Wild Hunt – Remastered is now available for Switch 2, PlayStation 5, Xbox Series S/X and PC, with free upgrades for owners of the original game on the same platform. The update refreshes the decade-old role-playing game rather than rebuilding it. The next entry in the series remains some distance away.', NULL, 21, 1, '2026-10-12 21:57:51', NULL, 4, 5, '2026-10-15 20:00:04', NULL, 0, '2026-10-15 20:00:16'),
(72, 'Nintendo says it has no plans to drop physical Switch 2 games', '<p>Nintendo has no plans to abandon physical game releases, Bill van Zyll, its vice president and general manager for Latin America, said in an interview published Oct. 11. Van Zyll said the Nintendo Switch 2 offers both physical and digital games and that fans enjoy physical releases.</p>\n<p>He said Nintendo’s position reflects consumer preferences rather than a preference for one format. GoNintendo reported that digital releases have gained ground over roughly two decades and that Sony plans to end physical game releases by January 2028. Nintendo gave no further timeline or details about future releases.</p>\n<blockquote><p>\"Historically, we haven’t had a preference for a specific format. We take consumer preferences very much into consideration. We also have a platform that was just launched. We’ve been around for a little over a year with the Nintendo Switch 2, and it offers both digital and physical games. Therefore, we have no plans to abandon physical media. We know how much fans also enjoy it.\"</p><p>— <a href=\"https://gonintendo.com/contents/65985-nintendo-says-they-have-no-plans-to-abandon-physical-media\">Bill van Zyll, GoNintendo</a></p></blockquote>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMijwFBVV95cUxOQ2VXSFBnZjRHcnNiNmhCM21pM25vNzVEX0FHd1RjQUllQ2VUZEx5ZC0wNXpDdVFrYnVaMUIwTC1kaDNDUDRIdHJNcDRwMHBDWnhNYlNKdjMtM2pGLXlOOUxCeFZHVmZhYmN5NjlZdWZYSWt0c3VhR1dHMlpRSUJsZDJycERiRWt1dWt2YmxOUQ\">Nintendo Has \'No Plans to Ditch Physical\' Games</a> (vgchartz.com)</li><li><a href=\"https://www.reddit.com/r/nintendo/comments/1x3giq7/nintendo_claims_it_has_no_plans_to_abandon_games/\">Nintendo claims it has no plans to abandon games in physical media</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x3fgur/nintendo_says_it_has_no_plans_to_ditch_physical/\">Nintendo says it has no plans to ditch physical games, knows how much fans like it</a> (reddit.com)</li><li><a href=\"https://gonintendo.com/contents/65985-nintendo-says-they-have-no-plans-to-abandon-physical-media\">Nintendo says they have \"no plans\" to abandon physical media</a> (gonintendo.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x3fzw5/nintendo_says_it_has_no_plans_to_ditch_physical/\">Nintendo says it has no plans to ditch physical games: There’s no plans to ditch physical. We know how much the fans like it as well</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMivAFBVV95cUxPZnE1SThkOXRMZWRIOHpic00wNEEtY0xyUkJXUFFlcWFGSHFvV05VaC1CLXB6X0ZBUFNKbGVRa1FWRl8zQ3kyUXlWb0kwb0FiTGw0MmVzYjFDS2E5THFlcjZqWlpmRFdjaEt6S1VqdjhENm0tc0NDWWRxU2xEcmc0SFUzWkVPS01mdHRyaWdsMXg4WHJFaWw1elBNMFBRYTFSTTVBRXNhVHc4Z0NEbVRBQmIzZS1lVnZjVnpFNg\">Nintendo VP says there are \'no plans to ditch physical\' games on Switch 2</a> (tweaktown.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMinAFBVV95cUxNZWI5QVVEZERUM2JNeGNoWDlybjdCSFIwbGtOU2htWVBWeDlkZk9pTWVxR0lYbVRhdzJnUlFISnZPNVFKVkx1T3BxZTQwOUlFM2c5QkRrZ1V4OHpRNnlXejNtUkViOUpoNnpKR2NaR0xJYmoxZDZxcjlBVTNQUm5IMTdzRlVWWlAtTjV0NzEtaU9LVVh6U1BmUk1qalM\">Nintendo Confirms No Plans to Discontinue Physical Game Cartridges</a> (kucoin.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMingFBVV95cUxQb2RNQ1BLS1J5MlhDZ0U3TFpRODVkbV9KczlOM0NCV1I5cmcyV2o0alZWUDItMUNVcjd2UWN5Qks3VkdIbXEybk9SYS1GSk5qbFBrajNvc0dCMFpFSWgtUFI3aGxxZHJzQnFVRFBLLWFuZm9LRHZEd1BmODBUaVVFOGwzYnJiZkh6cmJZODhIRU5ETUtYUG5neVUyMjdIQQ\">Nintendo Latin America says it won’t abandon physical media</a> (mynintendonews.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiowFBVV95cUxOUVgweUpPSFk4ZGJ2QXB4Z242TEpublQ4NDlRam9xTDdUbEdWTVVaZHF1SFdTWXRDR2otSlNEdUFuVERfVWRVQmszMVRaeDI0NE56UlF0WXNCcHFTUFl4UFktSlppUVduRXNGcmRCcC1WODNnTVZvWTRXSlNXdHFCd3ZqU3NQZUQ4OF9DNEpKck1WNUwxdDNSMlBTRGhBaFBnaHZR\">Nintendo Formally Takes a Stance on Physical vs. Digital Game Debate</a> (opencritic.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMivgFBVV95cUxQUmNiREswNHMtd2VIYXRxVWpON3loWHRzTXFSTTJEYzMxRHY4bUNpXzNydjBDQnFuTHFvOTUyLWVwYjRlZWlkVjE3d05GUjMyd1NDc0pmT0E0RTVud1Y0MEJjNHNfUkVKSEJ1YzlHVVVvM3JUU0lYX0RmZXRtbVY2ZjdXMHU4Qjk2Tk5TU3dZRHY5Q1J0TjBhR3BNM3dnZWZoUnBYY3EwenNkbzcyUVFMYnUwa1BDZVNrcVBVX19R\">Sony Made a Grave Mistake Going All Digital, and Nintendo Won’t Be Copying It Anytime Soon</a> (mensjournal.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1x3gvjb/nintendo_claims_it_has_no_plans_to_abandon_games/\">Nintendo claims it has no plans to abandon games in physical media - Interview</a> (reddit.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMioAFBVV95cUxQNVNCSlBsTkpRNEJkWUh4RWVpOGJ2SGZtYlJlUVdNbmZzZmVKLXd4bTg0UnJzMXg5TnFwamJBQ29iM0hiUnYtY3U2X1FoOExvTEdSTGxQZjZiWEU0UG1NendTbzQyRzdDZktFczlpdFFXRU1TTjdxbmFxWEFiX1pzeDFSMXVrSjBJZWt4QkFvMWEtWmxkU0NTS2xGMGJHclRV\">Nintendo afirma que não tem planos de abandonar jogos em mídia física</a> (universonintendo.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Nintendo has no plans to abandon physical game releases, Bill van Zyll, its vice president and general manager for Latin America, said in an interview published Oct. 11. Van Zyll said the Nintendo Switch 2 offers both physical and digital games and that fans enjoy physical releases.', NULL, 22, 1, '2026-10-12 21:57:51', NULL, 1, 4, '2026-10-15 20:00:04', NULL, 0.009006475045921458, '2026-10-15 20:00:16'),
(73, 'Epic delays Disney shooter and shifts development to AI-first production', '<p>Epic Games has delayed an unannounced shooter featuring Marvel and Star Wars characters and directed its developers to adopt an AI-first production process. The project had been scheduled for release in March 2027; no new release date has been confirmed. Reports say the team was told to use tools including Anthropic’s Claude, with one director calling for “no more hand-written code” and art made through “full AI workflows”.</p>\n<p>Development has been slower than expected: Epic underestimated the time and staffing the project would require, according to people familiar with it. Epic communications director Jake Jones said developers would remain the project’s creative leaders while using AI to accelerate production. CEO Tim Sweeney described a company-wide shift toward AI, saying the goal was to help teams build more, not produce the same amount with fewer people.</p>\n<p>Disney invested $1.5 billion in Epic in 2024, and the companies agreed to a broader games and entertainment partnership. The delayed shooter was expected to be the first game in that collaboration.</p>\n<h2>Key points</h2>\n<ul><li>Developer concerns: People familiar with the project said some developers were stunned by the new direction and joked about asking Claude to correct errors it generated.</li><li>Industry sentiment: A GDC survey cited by Engadget found 52% of respondents considered generative AI bad for the game industry, up from 30% in 2025.</li></ul>\n<blockquote><p>\"Our more modest aim is to survive the AI revolution, help other developers do the same, and come out on the other end making better code and content faster.\"</p><p>— <a href=\"https://www.ign.com/articles/epic-reportedly-pushing-devs-to-use-ai-delays-secret-star-wars-and-marvel-crossover-shooter\">Tim Sweeney, Epic Games CEO, IGN</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>Tim Sweeney: The CEO argued that AI should shorten the time between an idea and playtesting, which he said could help teams test game systems earlier.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2024</strong>: Disney invested $1.5 billion in Epic and announced a multiyear partnership.</li><li><strong>March 2026</strong>: Epic laid off more than 1,000 employees after Fortnite engagement declined.</li><li><strong>October 2026</strong>: Epic told the shooter team to shift toward AI-first production.</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.reddit.com/r/gaming/comments/1x4a30j/bloomberg_epic_games_has_delayed_an_unannounced/\">[Bloomberg] Epic Games has delayed an unannounced shooter game featuring Star Wars &amp; Marvel characters. Developers on the game have now been told to only use AI to write the code — “No more hand-written code”; All art for the game would be “generated with full AI workflows\"</a> (reddit.com)</li><li><a href=\"https://80.lv/articles/epic-games-tells-devs-no-more-hand-written-code-to-adopt-an-ai-first-production-model/\">Epic Games Tells Devs \"No More Hand-Written Code\" to Adopt an \"AI-First\" Production Model</a> (80.lv)</li><li><a href=\"https://arstechnica.com/gaming/2026/10/report-epic-games-goes-all-in-on-ai-for-disney-collaboration/\">Epic Games reportedly pivoting to \"AI first\" game development model</a> (arstechnica.com)</li><li><a href=\"https://www.gamesindustry.biz/epic-games-delays-disney-game-and-tells-developers-to-go-ai-first\">Epic Games delays Disney game and tells developers to go \"AI first\"</a> (gamesindustry.biz)</li><li><a href=\"https://kotaku.com/epic-games-forces-shocked-developers-into-ai-first-mode-for-delayed-shooter-featuring-marvel-and-star-wars-characters-2000744620\">Epic Games Forces Shocked Developers Into ‘AI-First’ Mode For Delayed Shooter Featuring Marvel And Star Wars Characters</a> (kotaku.com)</li><li><a href=\"https://games.slashdot.org/story/26/10/12/2128209/epic-games-delays-disney-project-asks-developers-to-use-more-ai\">Epic Games Delays Disney Project, Asks Developers To Use More AI</a> (slashdot.org)</li><li><a href=\"https://www.rockpapershotgun.com/no-more-hand-written-code-epic-reportedly-impose-ai-first-model-on-creators-of-new-disney-shooter-with-marvel-and-star-wars-characters\">\"No more hand-written code\": Epic reportedly impose \"AI-first\" model on creators of new Disney shooter with Marvel and Star Wars characters</a> (rockpapershotgun.com)</li><li><a href=\"https://www.ign.com/articles/epic-reportedly-pushing-devs-to-use-ai-delays-secret-star-wars-and-marvel-crossover-shooter\">Epic Reportedly Pushing Devs to Use AI, Delays Secret Star Wars and Marvel Crossover Shooter</a> (ign.com)</li><li><a href=\"https://www.pushsquare.com/news/2026/10/no-more-hand-written-code-fortnite-devs-disney-game-to-be-an-ai-first-project\">\'No More Hand Written Code\': Fortnite Dev\'s Disney Game to Be an \'AI First\' Project</a> (pushsquare.com)</li><li><a href=\"https://www.polygon.com/epic-games-marvel-star-wars-game-delay-generative-ai-development/\">Epic Games Delays Marvel and Star Wars Crossover Game Amid Generative AI Push</a> (polygon.com)</li><li><a href=\"https://www.eurogamer.net/epic-games-delays-star-wars-marvel-shooter-ai-development\">Epic Games reportedly delays Star Wars and Marvel shooter, as the Fortnite maker embraces \"AI-accelerated development\"</a> (eurogamer.net)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1x49t00/epic_games_delays_disney_project_asks_developers/\">Epic Games Delays Disney Project, Asks Developers to Use More AI</a> (reddit.com)</li><li><a href=\"https://insider-gaming.com/epics-disney-shooter-will-have-no-more-handwritten-code-amid-ai-first-push/\">Epic’s Disney Shooter Will Have ‘No More Handwritten Code’ Amid AI-First Push</a> (insider-gaming.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/10/no-more-hand-written-code-epic-reportedly-adopts-ai-first-production-model-on-new-disney-shooter\">\"No More Hand-Written Code\" - Epic Reportedly Adopts \"AI First\" Production Model On New Disney Shooter</a> (nintendolife.com)</li><li><a href=\"https://www.pcgamer.com/gaming-industry/game-development/our-humble-goal-is-to-survive-the-ai-revolution-says-epic-games-ceo-as-its-star-wars-and-marvel-crossover-pivots-to-ai-first-development/\">\'Our humble goal is to survive the AI revolution\' says Epic Games CEO, as its Star Wars and Marvel crossover pivots to \'AI first\' development</a> (pcgamer.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMi4AFBVV95cUxQUFlRMmFEQjZTbGZSdS1EVkRsUk9TWWtTOEhCSFN1MkNVR1pzQjUtZ3RZWWgyR1BRZW44c1h1ZHVKMHdhNVgycGN6MUFacFlmYWl0d3NzcE9rWlM0dmRNRjRseUVUTjVjT0ZmSE0wV2RhVVdWeEd0QzVwWDdweVpFU0N2VG5GZTRLNW54dkk4UzZSOXBFTm9NR3JScF9FRXAzWkkyUjRYNVV3Sk5JYlpBenpnX3VLUWJpUmV3QUltOVRaa1JWQ000Y3NOaUQzakxMNUxUbFVyTnFvQ0JSRFo2dA\">Epic Games Forces Shocked Developers Into \'AI-First\' Mode For Delayed Shooter Featuring Marvel And Star Wars Characters</a> (kotaku.com)</li><li><a href=\"https://www.techmeme.com/261012/p39#a261012p39\">Sources: Epic has delayed the release of an upcoming game, instructing developers to implement an \"AI first\" production model with \"no more hand-written code\" (Jason Schreier/Bloomberg)</a> (techmeme.com)</li><li><a href=\"https://www.blognone.com/node/151889\">[ลือ] Epic เลื่อนเปิดตัวเกมยิง Marvel + Star Wars เพราะจะใช้ AI พัฒนาเกมแทน</a> (blognone.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMirgFBVV95cUxPQWYzYjFXbmQ5QklPZDYzRlNlZ2pFNjFkS2ZyTnRzOEhzMkwxNlFfQndkeVBsa1JwZmxPV194OEl3UWJPWlRaQnVPRDh2bmgtVE54elZyOVZMZWVXdkZzRVU5aW8tRllJRlpka0lwV0JWaU1iY29Ra2ZIVWZWWEJEaGl2Um8tSUI5ZVAzUTd6UzV1d0RRRWJSeWFuNmloenAtNVBJZmRYdDBQMnBxX2c\">Epic Games verschiebt Disney-Shooter und stellt Entwicklung auf KI um</a> (heise.de)</li><li><a href=\"https://www.ghacks.net/2026/10/13/epic-games-delays-its-unannounced-star-wars-and-marvel-shooter-and-moves-it-to-ai-first-development/\">Epic Games Delays Its Unannounced Star Wars and Marvel Shooter and Moves It to AI-First Development</a> (ghacks.net)</li><li><a href=\"https://www.engadget.com/2284680/epic-reportedly-delays-its-disney-video-game-so-it-can-be-made-using-more-ai/\">Epic reportedly delays its Disney video game so it can be made using more AI</a> (engadget.com)</li><li><a href=\"https://www.golem.de/news/spielebranche-epic-games-setzt-bei-marvel-und-star-wars-shooter-radikal-auf-ki-2610-214030.html\">Spielebranche: Epic Games setzt bei Marvel- und Star-Wars-Shooter radikal auf KI</a> (golem.de)</li><li><a href=\"https://nintendonews.com/news/157079\">Epic Games reportedly orders staff to implement ‘AI-first’ development</a> (nintendonews.com)</li><li><a href=\"https://dtf.ru/gameindustry/5350369-epic-games-otlozhila-igru-s-geroyami-disney-i-vnedrila-ii-v-razrabotku\">Шрайер: Epic Games отложила игру с героями Disney и поручила разработчикам активнее использовать ИИ</a> (dtf.ru)</li><li><a href=\"https://www.xataka.com.mx/videojuegos/no-codigo-escrito-a-mano-epic-games-redefine-su-shooter-disney-ia-haga-casi-todo-trabajo\">\"No más código escrito a mano\": Epic Games redefine su shooter con Disney para que la IA haga casi todo el trabajo</a> (xataka.com.mx)</li><li><a href=\"https://www.gamer.no/artikler/epic-utsetter-skytespill-med-star-wars-og-marvel-figurer/521162\">Epic utsetter skytespill med Star Wars- og Marvel-figurer</a> (gamer.no)</li><li><a href=\"https://www.indiatoday.in/technology/news/story/no-more-hand-written-code-fortnite-maker-epic-games-is-moving-towards-ai-first-production-3016163-2026-10-13\">No more hand-written code: Fortnite maker Epic Games is moving towards AI first production</a> (indiatoday.in)</li><li><a href=\"https://news.google.com/rss/articles/CBMi6gFBVV95cUxPZ1NLd0pBXzg5YXVFQllhRnVYeFgtUU9jTFdXckVRa1o0OU9nSjhSNlJOcFNIRnhub1U1dG4wS25HRmZzS0Y4ZUR4a0hoYW9ZX2FIZnZtekQzX09XeDZwVVRGQnpRYVNBSmM3WjBjMlFRWUM5Xy1wck5VT1o1NGoyUGJRTHN0bXctbFJLYXVvTHNtRHMxLXVnUV9mV3FoaTdLbEU4X25xY1dJN1MzZ1drTHlfVTdCTFl1ekNwdHk1ME1GeHVjZWR0eVFWVGYyLV9MYUJya1diTG95MVJyWklqRlloS082MGE5dHc\">Epic Delays Disney Shooter, Orders Developers to Adopt AI-First Production With Claude: how 16 outlets framed it</a> (newscord.org)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Epic Games has delayed an unannounced shooter featuring Marvel and Star Wars characters and directed its developers to adopt an AI-first production process. The project had been scheduled for release in March 2027; no new release date has been confirmed. Reports say the team was told to use tools including Anthropic’s Claude, with one director calling for “no more hand-written code” and art made through “full AI workflows”.', NULL, 21, 1, '2026-10-13 21:22:48', NULL, 4, 7, '2026-10-15 20:00:04', NULL, 0.009006475045921458, '2026-10-15 20:00:16'),
(74, 'Atlus releases Metaphor: ReFantazio demo ahead of Switch 2 launch', '<p>ATLUS has released the prologue demo for Metaphor: ReFantazio on Nintendo Switch 2 in all regions ahead of the game’s Nov. 12, 2026 launch. The demo covers the opening section, and players can transfer their save data to the full game, retaining their story progress and character status.</p>\n<p>The demo introduces the fantasy role-playing game’s story and systems, including combat that blends turn-based and real-time action. Players undertake quests and explore dungeons by day and build relationships at night. The Switch 2 edition follows the game’s 2024 release on PlayStation, Xbox and PC.</p>\n<h2>Key points</h2>\n<ul><li>Demo content: The prologue includes the first four dungeons, lets players unlock seven of more than 40 Archetypes and introduces six followers.</li><li>Game premise: The story follows a royal tournament to choose a successor after the king’s assassination plunges the Kingdom of Euchronia into chaos.</li><li>Previous reception: ATLUS cites a 94 Metascore and more than 50 awards for the original game, including Best RPG at The Game Awards 2024.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>11 October 2024</strong>: Original game launched on PlayStation, Xbox and PC</li><li><strong>June 2026</strong>: ATLUS announced a Switch 2 version for November</li><li><strong>12 October 2026</strong>: Prologue demo released for Switch 2</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://news.google.com/rss/articles/CBMiXEFVX3lxTE91VTVwUFlCQWltSGR2aG1xblhlMFNRbDZMTXJVRWlNNF9FZC0xbVBMd3NXZGtQcDAwdVNWbWRWMkdNcmQ4NXRpdkpUZHFrT0xIZ2xxS0I4cTJCbmM0\">Metaphor: ReFantazio Prologue Demo Released for Nintendo Switch 2</a> (personacentral.com)</li><li><a href=\"https://gonintendo.com/contents/66004-metaphor-refantazio-prologue-demo-now-available-on-switch-2-update\">Metaphor: ReFantazio \"Prologue Demo\" now available on Switch 2 (UPDATE)</a> (gonintendo.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x46t67/metaphor_refantazio_switch_2_prologue_demo_is_now/\">Metaphor: ReFantazio Switch 2 prologue demo is now available</a> (reddit.com)</li><li><a href=\"https://nintendonews.com/news/157084\">PSA: Metaphor: ReFantazio Demo For Switch 2 Now Available</a> (nintendonews.com)</li><li><a href=\"https://nintendonews.com/news/157077\">Metaphor: ReFantazio just got a demo on Nintendo Switch 2</a> (nintendonews.com)</li><li><a href=\"https://mynintendonews.com/2026/10/12/metaphor-refantazio-switch-2-prologue-demo-available-in-certain-territories/\">Metaphor: ReFantazio Switch 2 prologue demo available in certain territories</a> (mynintendonews.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMikwFBVV95cUxPQks3TUJDSVVIZ2xIQUdKM0YwNWhkcmg1dk1vaTIwZ1Y1OEZCalk0em5iZ2lUeF83dDF4T3NXbFN4ZVV6bDRvUEdCamtySG5uVDdEZjNROE5icmE2VUpMTk1PTGY5NmRVVl9IbTk4Ml84NnZFdHdpYV96a0NaTVZsM2hxVkd2b051Uk0zLW9NOHdJelU\">Metaphor: Refantazio’s Switch 2 Demo Is Finally Available</a> (polygon.com)</li><li><a href=\"https://www.gematsu.com/2026/10/metaphor-refantazio-prologue-demo-for-switch-2-now-available\">Metaphor: ReFantazio ‘Prologue’ demo for Switch 2 now available</a> (gematsu.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'ATLUS has released the prologue demo for Metaphor: ReFantazio on Nintendo Switch 2 in all regions ahead of the game’s Nov. 12, 2026 launch. The demo covers the opening section, and players can transfer their save data to the full game, retaining their story progress and character status.', NULL, 22, 1, '2026-10-13 21:22:48', NULL, 1, 14, '2026-10-15 20:00:04', NULL, 0.16666666666666666, '2026-10-15 20:00:16'),
(75, 'Castlevania: Belmont’s Curse earns strong reviews before launch', '<p>Castlevania: Belmont’s Curse has drawn strong reviews ahead of its scheduled October 15 release. Metacritic reports an average score of 86 from 45 critic reviews, while OpenCritic lists an average of 85 and a 98% recommendation rate across 56 reviews. The series returns with a new 2D adventure led by Rose Belmont in a monster-filled Paris. Critics have praised its brisk combat, whip-based movement and gothic art.</p>\n<p>Reviewers also cite uneven difficulty, demanding platforming and stretches of confusing exploration. Some describe the game as a compelling modernization of Castlevania, while others say its action-first design and familiar genre influences dilute the series’ identity.</p>\n<p>The game is listed for PC, PlayStation 5, Xbox Series X|S and Nintendo Switch. Review-roundup platform listings also include a Switch 2 version. A demo is available on multiple platforms ahead of launch.</p>\n<h2>Key points</h2>\n<ul><li>Series ranking: GamesRadar said the game ranked behind only five highly rated Castlevania entries, including Symphony of the Night and the GBA trilogy.</li><li>Adjustable challenge: Players can modify individual settings such as damage dealt or received, potion capacity and whether they respawn outside boss doors.</li><li>Switch performance: Nintendo World Report found the Switch version running at a mostly stable 60 frames per second on Switch 2, while the original Switch version sacrifices resolution and frame rate.</li><li>Review split: GameSpot awarded 10/10 for combat, traversal and puzzles, while Siliconera cautioned that performance and image quality vary by platform.</li></ul>\n<blockquote><p>\"Beautiful and challenging, Castlevania: Belmont’s Curse offers a rich, gothic world of puzzles to solve and enemies to whip.\"</p><p>— <a href=\"https://www.gamesradar.com/games/action-rpg/castlevania-belmonts-curse-review/\">Serena Cherry, GamesRadar+</a></p></blockquote>\n<h2>Perspectives</h2>\n<ul><li>The Guardian: The review said the game improves after an early twist pushes Rose to confront the Belmont legacy and her anger, with more to enjoy once she reaches Dracula’s castle.</li><li>IGN: The review welcomed map markers and area-completion tracking and noted that players can fast-travel between save rooms by crouching at a mirror, though the process takes about 15 seconds on PS5.</li><li>Kotaku: The reviewer reported getting stuck on a timed, backward platforming sequence during a boss encounter and said the available difficulty settings did not ease that obstacle.</li><li>Nintendo World Report: The reviewer highlighted the boss fights, including a golem encounter with a timed platforming sequence and another that tests the player’s grappling skills.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2023</strong>: Dead Cells: Return to Castlevania connected Evil Empire with Konami</li><li><strong>13 October 2026</strong>: Review coverage reported Metacritic’s 86 score after 45 critic reviews</li><li><strong>14 October 2026</strong>: Sportskeeda published a regional countdown for the global release</li><li><strong>15 October 2026</strong>: The game is scheduled to launch on major consoles and PC</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://www.reddit.com/r/Games/comments/1x4qopk/castlevania_belmonts_curse_review_thread/\">Castlevania: Belmont\'s Curse Review Thread</a> (reddit.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x5az68/castlevania_belmonts_curse_review/\">Castlevania: Belmont\'s Curse Review</a> (reddit.com)</li><li><a href=\"https://www.theguardian.com/games/2026/oct/13/castlevania-belmonts-curse-review-vampire-hunting\">Castlevania: Belmont’s Curse review – every fantastical vampire-hunting vision is fulfilled</a> (theguardian.com)</li><li><a href=\"https://www.rockpapershotgun.com/castlevania-belmonts-curse-review-a-fantastic-action-game-a-less-than-stellar-metroidvania\">Castlevania: Belmont’s Curse review - a fantastic action game, a less than stellar Metroidvania</a> (rockpapershotgun.com)</li><li><a href=\"https://mynintendonews.com/2026/10/13/castlevania-belmonts-curse-currently-stands-at-86-on-metacritic/\">Castlevania: Belmont’s Curse currently stands at 86 on Metacritic</a> (mynintendonews.com)</li><li><a href=\"https://www.reddit.com/r/pcgaming/comments/1x4v38d/castlevania_belmonts_curse_brings_konamis_beloved/\">Castlevania: Belmont’s Curse Brings Konami’s Beloved Series Into the Modern Era With a Fast-paced Focus on Action First - Review - (8/10)</a> (reddit.com)</li><li><a href=\"https://www.nintendolife.com/news/2026/10/round-up-the-reviews-for-castlevania-belmonts-curse-are-in\">Round Up: The Reviews For Castlevania: Belmont\'s Curse Are In</a> (nintendolife.com)</li><li><a href=\"https://www.reddit.com/r/gaming/comments/1x4wq54/castlevania_belmonts_curse_review_thread/\">\'Castlevania: Belmont\'s Curse\' - Review Thread</a> (reddit.com)</li><li><a href=\"https://kotaku.com/castlevania-belmonts-curse-is-kicking-my-ass-in-the-worst-way-2000745234\">Castlevania: Belmont’s Curse Is Kicking My Ass In The Worst Way</a> (kotaku.com)</li><li><a href=\"https://www.ign.com/articles/castlevania-belmonts-curse-review\">Castlevania: Belmont’s Curse Review</a> (ign.com)</li><li><a href=\"https://gonintendo.com/contents/66028-review-castlevania-belmont-s-curse-stakes-its-claim-as-one-of-the-franchise-s-best\">REVIEW: Castlevania: Belmont\'s Curse stakes its claim as one of the franchise\'s best</a> (gonintendo.com)</li><li><a href=\"https://www.gamesradar.com/games/action-rpg/castlevania-belmonts-curse-review/\">Castlevania: Belmont\'s Curse review: \"Gothic brilliance and compellingly cryptic clues mark a triumphant return\"</a> (gamesradar.com)</li><li><a href=\"https://canaltech.com.br/games/review-castlevania-belmonts-curse-o-retorno-perfeito-do-dracula/\">Review Castlevania: Belmont’s Curse | O retorno perfeito do Drácula</a> (canaltech.com.br)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxOMGNLM0J1LVNuYUZYdm1zRzJaajByZ3JoemJ6MVNDQTJqaW1WV0x1MmpRQ2JBenlES3h3UnlZRFJldDhjeGxxOHdfSGlzRkl5LWpuQ2pYTnBJRXhKZEZYUGJCUEUxTWdoT2l6aXh4T2ZkYXZOcjNETUxwb1cwTXpaNVZQOA\">Castlevania: Belmont\'s Curse Review: Worthy of the Whip</a> (gameinformer.com)</li><li><a href=\"https://www.lefigaro.fr/secteur/high-tech/notre-critique-de-castlevania-belmont-s-curse-sous-le-ciel-de-paris-la-saga-culte-livre-l-un-de-ses-meilleurs-opus-20261013\">Notre critique de Castlevania Belmont’s Curse : sous le ciel de Paris, la saga culte livre l’un de ses meilleurs opus</a> (lefigaro.fr)</li><li><a href=\"https://www.gamesradar.com/games/action/castlevania-belmonts-curse-metacritic-score-is-only-behind-the-beloved-gba-trilogy-dawn-of-sorrow-and-symphony-of-the-night-as-the-series-best/\">Castlevania: Belmont\'s Curse Metacritic score is only behind 5 of the series\' most beloved entries</a> (gamesradar.com)</li><li><a href=\"https://www.derstandard.at/story/3000000343801/castlevania-belmonts-curse-die-gelungene-rueckkehr-einer-legende\">\"Castlevania: Belmont\'s Curse\": Die gelungene Rückkehr einer Legende</a> (derstandard.at)</li><li><a href=\"https://www.heise.de/tests/Castlevania-Belmont-s-Curse-ist-ein-schaurig-schoener-Tanz-auf-tausend-Klingen-11485707.html\">„Castlevania: Belmont’s Curse“ ist ein schaurig schöner Tanz auf tausend Klingen</a> (heise.de)</li><li><a href=\"http://www.nintendoworldreport.com/review/77721/castlevania-belmonts-curse-switch-review\">Castlevania: Belmont\'s Curse (Switch) Review</a> (nintendoworldreport.com)</li><li><a href=\"https://mobilesyrup.com/2026/10/13/castlevania-belmonts-curse-pc-review/\">Castlevania: Belmont’s Curse is a successful resurrection, but not without faults</a> (mobilesyrup.com)</li><li><a href=\"https://habr.com/ru/companies/ggsel/news/1094088/\">Журналисты назвали Castlevania: Belmont\'s Curse новой классикой жанра</a> (habr.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMivgFBVV95cUxOTHpUY2w3c183c3VJSG1haXM2UkNfMUdabUVfd3AwOFBfUlJYRnFBQ2M2T0pRWjVyTjBqNkl0NGpneTZ4M3Q3d18wdHF3RUVyVER5QkVsaGVBR005VU5DS2ZkdzBuSzROVWV2UW5wTV9NRjMzbFJXcHM3Tm52NFpjdHJ6VzJYNmdMZ2xVUmEyVWhMUmZlRVQ0aldFUFhZQTVkeE5QcjZQN1BRbjZyRkx3dTd5LVcwdmhRUkFwZHJn\">\'Castlevania: Belmont\'s Curse\' vampiriza outros títulos para se renovar</a> (uol.com.br)</li><li><a href=\"https://www.sportskeeda.com/esports/castlevania-belmont-s-curse-release-countdown-start-time-regions\">Castlevania Belmont\'s Curse release countdown: Start time for all regions</a> (sportskeeda.com)</li><li><a href=\"https://tv.aftonbladet.se/video/408777/ett-spel-som-far-mig-att-koka\">”Ett spel som får mig att koka”</a> (aftonbladet.se)</li><li><a href=\"https://kite.kagi.com/gaming/2026101315/castlevania-belmonts-curse-earns-praise-before-october-15-launch\">Kagi News earlier coverage: Castlevania: Belmont’s Curse earns praise before October 15 launch</a> (news.kagi.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Castlevania: Belmont’s Curse has drawn strong reviews ahead of its scheduled October 15 release. Metacritic reports an average score of 86 from 45 critic reviews, while OpenCritic lists an average of 85 and a 98% recommendation rate across 56 reviews. The series returns with a new 2D adventure led by Rose Belmont in a monster-filled Paris. Critics have praised its brisk combat, whip-based movement and gothic art.', NULL, 21, 1, '2026-10-14 20:17:28', NULL, 4, 11, '2026-10-15 20:00:04', NULL, 0.16666666666666666, '2026-10-15 20:00:16'),
(76, 'Capcom brings Resident Evil remake trilogy to Switch 2 on Oct. 16', '<p>Capcom will release Resident Evil 2 Deluxe Edition, Resident Evil 3 and Resident Evil 4 Gold Edition for Nintendo Switch 2 on Oct. 16 as native digital games. Unlike the cloud versions released for the original Switch, the new downloads do not require an ongoing internet connection to play, and each includes previously released add-on content.</p>\n<p>Reviews describe the ports as generally smooth but note performance differences across games and play modes. Reviewers praised Resident Evil 2 and 3 for their performance but criticized Resident Evil 4 for stuttering and poor image quality in handheld mode, finding it ran better docked. Capcom plans physical editions for January 2027 but has not confirmed their format.</p>\n<h2>Key points</h2>\n<ul><li>Launch pricing: Destructoid reported introductory eShop discounts of 20% for Resident Evil 4 ($39.99), 33% for Resident Evil 3 ($19.79) and 25% for Resident Evil 2 ($29.99).</li><li>RE2 extras: Nintendo Life highlighted The 4th Survivor, Ghost Survivors and Tofu Survivors, along with A/B campaign scenarios for both lead characters.</li><li>RE3 content: Nintendo Life noted that the Switch 2 version omits the bundled Resident Evil: Resistance multiplayer game and offers little replay content beyond its short campaign.</li><li>RE4 controls: Nintendo Life noted that the Switch 2 remake adds gyro controls and includes crouching and stealth takedowns.</li></ul>\n<h2>Perspectives</h2>\n<ul><li>Nintendo Life\'s reviewer said Resident Evil 2 looked sharp and clear in both play modes, though character hair appeared slightly fuzzy in handheld play.</li><li>Polygon reviewer Josh Broadwell said HDR made the game\'s lighting look better on Switch 2 than on handheld PCs.</li><li>Nintendo World Report\'s reviewer praised Separate Ways as an action-focused companion campaign about half the length of the main game, with Ada\'s grappling hook adding to its appeal.</li></ul>\n<h2>Timeline</h2>\n<ul><li><strong>2019</strong>: Resident Evil 2 remake first launched, later receiving the Switch 2 port</li><li><strong>2020</strong>: Resident Evil 3 remake debuted on PC, PS4 and Xbox One</li><li><strong>2022</strong>: Cloud versions of Resident Evil remakes arrived on the original Switch</li><li><strong>16 October 2026</strong>: Three Resident Evil remake editions launch digitally on Switch 2</li></ul>\n<h2>Sources</h2>\n<ul><li><a href=\"https://nintendoeverything.com/resident-evil-2-deluxe-edition-review-for-nintendo-switch-2/\">Resident Evil 2 Deluxe Edition review for Nintendo Switch 2</a> (nintendoeverything.com)</li><li><a href=\"https://nintendoeverything.com/resident-evil-3-review-for-nintendo-switch-2/\">Resident Evil 3 review for Nintendo Switch 2</a> (nintendoeverything.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxOcG5uRWpDREcwdmNTTC1qbHJhVUY1LUY5YW5seW9ZYmlSU1lzLTdINzVPT181WGhnZzRabC02d3Q5VXF3aHBfRHRPemh5UUlLdlpBaXVkUXNReWYxaF9aanpORkltd0tqSXJhSnl6RHRmQWplRk13ZjFfckNuYnBTak9GQQ\">Resident Evil 2 for Nintendo Switch 2 review: survival horror mastery on the go</a> (techradar.com)</li><li><a href=\"https://www.nintendolife.com/reviews/nintendo-switch-2/resident-evil-2-deluxe-edition\">Mini Review: Resident Evil 2 Deluxe Edition (Switch 2) - Finally Gets The Treatment It Deserves</a> (nintendolife.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch/comments/1x4z3ak/resident_evil_2_for_nintendo_switch_2_review/\">Resident Evil 2 for Nintendo Switch 2 review: survival horror mastery on the go (4.5/5)</a> (reddit.com)</li><li><a href=\"https://nintendoeverything.com/resident-evil-4-gold-edition-review-for-nintendo-switch-2/\">Resident Evil 4 Gold Edition review for Nintendo Switch 2</a> (nintendoeverything.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMiigFBVV95cUxPSGUwY1V5S0Zxd3dPTDBIQUZNbm5GeEVRczFaaHZzWHVpNnNreXNFVTVZLWUzcExheFY4blBHd1NQS2xUZHZ2cmhuaGgwVENkRGZYelJ2YTV5OG00RXdBTXIwdDZYRldweHlpUWZhNmp2NUNiY0JnU3doMFhSM3lUUEZJWnBPVE5kUUE\">Capcom\'s Resident Evil remakes shine on Nintendo Switch 2</a> (shacknews.com)</li><li><a href=\"http://www.nintendoworldreport.com/review/77717/resident-evil-2-remake-deluxe-edition-switch-2-review\">Resident Evil 2: Remake Deluxe Edition (Switch 2) Review</a> (nintendoworldreport.com)</li><li><a href=\"http://www.nintendoworldreport.com/review/77722/resident-evil-4-gold-edition-switch-2-review\">Resident Evil 4 Gold Edition (Switch 2) Review</a> (nintendoworldreport.com)</li><li><a href=\"https://www.nintendolife.com/reviews/nintendo-switch-2/resident-evil-4-gold-edition\">Review: Resident Evil 4 Gold Edition (Switch 2) - The Gold Standard For Remakes</a> (nintendolife.com)</li><li><a href=\"https://www.nintendolife.com/reviews/nintendo-switch-2/resident-evil-3\">Mini Review: Resident Evil 3 (Switch 2) - An Impressive Port Of A Subpar Remake</a> (nintendolife.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMigwFBVV95cUxOcTNfbGtDcVp4bnhCbEpzNHlPc0R6dnFBMS1TRGsxT2xoTXB4VG9WMlFSZndhWHNweG9LSjI3OGNuR3dzVjRpZWRfN1NuVjBQTmIwSkE5aExERi1DbTZFOXJfdDAyTjBlaHV0VVVDU0VZa2hkRjM3YTRBNFg5cWhmM1lWTQ\">Resident Evil 3 for Nintendo Switch 2 review: a solid port of a true scare-fest</a> (techradar.com)</li><li><a href=\"https://news.google.com/rss/articles/CBMijgFBVV95cUxQUFVfbXU5V3ExWWEzb0luTWdrMGJBQUhPNklpNmhMMUtOWW9MN3dRY205QnVCU0g1Q2hIdGtnWEZOTmx3Y0VxRE5WbFlVQVNsOWk2dkJTZkM4em15Q2hUYjUyOFMxaWJ5MTVWeU1oWVpmT0pMY2ppU1lxSU5SWmxCTll0SVlqYmVfbmFXaHRn\">Resident Evil 2: Deluxe Edition Review</a> (cubed3.com)</li><li><a href=\"https://www.reddit.com/r/NintendoSwitch2/comments/1x58brm/resident_evil_2_3_4_metaphor_the_crew_comparisons/\">Resident Evil 2, 3, 4, Metaphor, The Crew comparisons.</a> (reddit.com)</li><li><a href=\"https://www.destructoid.com/resident-evil-remakes-trilogy-switch-2-impressions/\">Resident Evil’s Nintendo return shines brightest with stellar Switch 2 remake trilogy</a> (destructoid.com)</li><li><a href=\"https://www.techjuice.pk/capcom-unveils-resident-evil-3-remake-gameplay-on-nintendo-switch-2/\">Capcom Unveils Resident Evil 3 Remake Gameplay on Nintendo Switch 2</a> (techjuice.pk)</li><li><a href=\"https://www.polygon.com/resident-evil-4-remake-switch-2-impressions/\">Resident Evil 4 Remake On Switch 2 Is Capcom’s First Disappointment This Year</a> (polygon.com)</li></ul>\n<p><i>Summary from <a href=\"https://news.kagi.com/\">Kagi News</a>, licensed <a href=\"https://creativecommons.org/licenses/by-nc/4.0/\">CC BY-NC 4.0</a>. Republished by an unofficial account, not affiliated with Kagi.</i></p>', 'Capcom will release Resident Evil 2 Deluxe Edition, Resident Evil 3 and Resident Evil 4 Gold Edition for Nintendo Switch 2 on Oct. 16 as native digital games. Unlike the cloud versions released for the original Switch, the new downloads do not require an ongoing internet connection to play, and each includes previously released add-on content.', NULL, 22, 1, '2026-10-14 20:17:28', NULL, 1, 15, '2026-10-15 20:00:04', NULL, 0.21803528549594212, '2026-10-15 20:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `article_ai_summary`
--

CREATE TABLE `article_ai_summary` (
  `article_id` int(11) NOT NULL,
  `summary` text NOT NULL,
  `generated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `comment_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_ai_summary`
--

INSERT INTO `article_ai_summary` (`article_id`, `summary`, `generated_at`, `comment_count`) VALUES
(4, 'Article Summary:\nThe latest gaming news has drawn attention from players and the wider community, while developers and publishers are expected to provide more details, announcements, and updates as development continues.\n\nComment Summary:\nNo reader comments were provided, so there are no opinions or reactions to summarize.', '2026-09-23 07:41:09', 0),
(31, 'Article Summary:\nNintendo has announced a colorful new Nintendo Switch adventure focused on exploration, varied environments, characters, hidden areas, collectibles, and new mechanics. The game will combine familiar platforming and action with environmental interaction, though story details, characters, later gameplay systems, and the release timeline remain undisclosed.\n\nComment Summary:\nReaders are interested in the game’s exploration, art direction, soundtrack, secrets, and environmental detail, with many hoping optional areas offer meaningful rewards. Some are curious about character abilities and the balance between story and gameplay, while others are reserving judgment until Nintendo shows a longer gameplay trailer.', '2026-09-19 12:44:22', 16),
(43, 'Article Summary:\nNintendo’s free version 1.2.0 update for the Nintendo Switch 2 Star Fox remake adds Battle Mode content, including the Katina, Sector X and Venom stages, new items and four-player local split-screen. Split-screen teams can also join random online matches, while the update includes controller guidance, mode adjustments and bug fixes.\n\nComment Summary:\nNo reader comments were provided, so there are no opinions or reactions to summarize.', '2026-10-01 09:10:11', 0),
(44, 'Article Summary:\nTickets for The Legend of Zelda 40th Anniversary concert tour went on sale in Europe on September 30, 2026, with presales and sales for select North American cities also beginning that day. Shows are planned for Chicago, Dallas, Houston, Seattle, Los Angeles and New York, while Boston and San Francisco details remained pending. Australian presale dates for Sydney and Melbourne-area concerts were also reported.\n\nComment Summary:\nThe comments express frustration and concern about high demand and long virtual queues, with one attendee reporting still being 8,000th in line after waiting over an hour for the London shows.', '2026-10-02 22:25:31', 0),
(52, 'Article Summary:\nThe article offers five ways to free console storage: identify large files, uninstall completed games, delete unnecessary screenshots and clips, add compatible external storage, and remove unused demos, trials, and updates. It recommends starting with finished games and old captures, then checking storage monthly.\n\nComment Summary:\nNo reader comments were provided.', '2026-10-05 08:27:48', 0),
(53, 'Article Summary:\nJagex announced RuneScape Reignited, an Unreal Engine MMO also known as RS4, set in Gielinor’s Sixth Age and planned as a separate game rather than a replacement for existing RuneScape titles. Originating as a Dragonwilds expansion, it will offer a fresh start with permanent progression and draw on the series’ history, though gameplay has not yet been shown and release is still several years away. Jagex also announced an animated RuneScape series involving MoistCr1TiKaL.\n\nComment Summary:\nReaders expressed concern that adding another separate RuneScape game could further divide an already fragmented player community. Some reactions also reflected uncertainty because the teaser showed only CGI and provided no details about gameplay systems.', '2026-10-05 22:31:51', 0),
(66, 'Article Summary:\nKingdom Hearts Collection [I~III] is now available on Switch 2, PS5, and Xbox Series X|S, and reviews are generally positive, scoring 4.5/5 to 9.5/10. Older games run well at 60 fps on Switch 2, but Kingdom Hearts III and 0.2 may have frame-rate or handheld performance issues. Three entries are cutscene compilations, and the older Switch cloud versions will stop working on June 9, 2027. A demo is recommended before buying the Switch 2 version.\n\nComment Summary:\nNo reader comments were provided, so there are no reader opinions or reactions to summarize.', '2026-10-10 18:23:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `article_bookmark`
--

CREATE TABLE `article_bookmark` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_bookmark`
--

INSERT INTO `article_bookmark` (`article_id`, `user_id`, `created_at`) VALUES
(52, 23, '2026-10-05 08:28:01'),
(62, 23, '2026-10-10 18:25:18'),
(66, 23, '2026-10-10 18:25:03'),
(67, 23, '2026-10-11 02:29:18'),
(68, 23, '2026-10-11 02:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `article_reaction`
--

CREATE TABLE `article_reaction` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction` tinyint(11) NOT NULL,
  `reacted_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_reaction`
--

INSERT INTO `article_reaction` (`article_id`, `user_id`, `reaction`, `reacted_at`) VALUES
(22, 1, 1, '2026-10-06 16:55:15'),
(28, 27, 1, '2026-10-03 22:08:12'),
(31, 2, 1, '2026-10-02 10:30:38'),
(31, 27, 1, '2026-10-07 09:55:28'),
(40, 23, 0, '2026-10-02 10:30:38'),
(40, 24, 1, '2026-10-02 10:30:38'),
(40, 26, 1, '2026-10-03 10:19:33'),
(41, 23, 1, '2026-10-02 10:30:38'),
(41, 24, 1, '2026-10-02 10:30:38'),
(41, 25, 1, '2026-10-02 10:30:38'),
(41, 26, 0, '2026-10-03 10:19:40'),
(41, 27, 1, '2026-10-02 22:30:16'),
(42, 23, 1, '2026-10-02 10:30:38'),
(42, 24, 0, '2026-10-02 10:30:38'),
(42, 25, 1, '2026-10-02 10:30:38'),
(42, 26, 0, '2026-10-03 10:19:48'),
(43, 1, 1, '2026-10-06 16:56:18'),
(43, 23, 1, '2026-10-02 10:30:38'),
(43, 24, 1, '2026-10-02 10:30:38'),
(43, 25, 1, '2026-10-02 10:30:38'),
(43, 27, 1, '2026-10-02 22:25:12'),
(44, 1, 1, '2026-10-04 00:21:22'),
(44, 23, 0, '2026-10-02 10:30:38'),
(44, 24, 1, '2026-10-02 10:30:38'),
(44, 26, 1, '2026-10-03 10:12:08'),
(44, 27, 1, '2026-10-02 22:25:25'),
(45, 1, 1, '2026-10-04 00:21:27'),
(45, 23, 1, '2026-10-02 10:30:38'),
(45, 24, 1, '2026-10-02 10:30:38'),
(45, 26, 0, '2026-10-03 10:14:08'),
(45, 27, 1, '2026-10-07 09:57:24'),
(46, 1, 1, '2026-10-06 16:56:08'),
(46, 23, 1, '2026-10-02 21:51:58'),
(46, 24, 1, '2026-10-02 21:51:46'),
(46, 26, 1, '2026-10-03 10:11:50'),
(47, 1, 0, '2026-10-04 00:21:18'),
(47, 23, 0, '2026-10-02 21:52:31'),
(47, 24, 0, '2026-10-02 21:51:35'),
(47, 27, 1, '2026-10-02 22:23:51'),
(48, 1, 0, '2026-10-04 00:20:06'),
(48, 23, 0, '2026-10-03 21:26:30'),
(48, 24, 1, '2026-10-04 00:27:27'),
(48, 26, 1, '2026-10-05 22:33:15'),
(49, 1, 1, '2026-10-04 00:20:02'),
(49, 23, 1, '2026-10-03 21:26:41'),
(49, 24, 1, '2026-10-04 00:27:16'),
(49, 27, 1, '2026-10-03 22:05:10'),
(50, 1, 1, '2026-10-06 16:55:42'),
(50, 23, 1, '2026-10-04 23:40:52'),
(50, 24, 1, '2026-10-05 00:21:32'),
(50, 26, 1, '2026-10-05 22:31:00'),
(51, 1, 1, '2026-10-06 16:55:33'),
(51, 23, 0, '2026-10-04 23:41:31'),
(51, 24, 0, '2026-10-05 00:21:26'),
(52, 1, 1, '2026-10-06 16:55:22'),
(52, 23, 1, '2026-10-05 08:27:41'),
(52, 24, 1, '2026-10-05 21:15:32'),
(52, 26, 1, '2026-10-05 22:28:58'),
(52, 27, 1, '2026-10-05 23:30:06'),
(53, 1, 1, '2026-10-06 16:55:26'),
(53, 23, 1, '2026-10-05 22:05:24'),
(53, 24, 1, '2026-10-05 21:15:46'),
(53, 26, 0, '2026-10-05 22:32:34'),
(53, 27, 1, '2026-10-05 23:52:32'),
(54, 1, 1, '2026-10-06 16:55:29'),
(54, 23, 1, '2026-10-05 22:05:41'),
(54, 24, 0, '2026-10-05 21:15:54'),
(54, 26, 1, '2026-10-05 22:32:42'),
(54, 27, 1, '2026-10-05 23:13:03'),
(55, 1, 1, '2026-10-06 01:18:29'),
(55, 2, 1, '2026-10-06 14:46:26'),
(55, 23, 1, '2026-10-05 22:48:12'),
(55, 24, 1, '2026-10-05 22:46:00'),
(55, 26, 1, '2026-10-05 22:45:33'),
(55, 27, 1, '2026-10-05 23:12:55'),
(55, 29, 1, '2026-10-15 14:47:40'),
(56, 1, 0, '2026-10-06 14:45:58'),
(56, 2, 0, '2026-10-06 14:46:28'),
(56, 23, 0, '2026-10-05 22:48:00'),
(56, 24, 0, '2026-10-05 22:46:10'),
(56, 26, 0, '2026-10-05 22:45:30'),
(56, 27, 0, '2026-10-05 23:12:46'),
(56, 29, 0, '2026-10-15 14:47:36'),
(57, 23, 1, '2026-10-06 17:41:01'),
(57, 24, 1, '2026-10-06 21:20:38'),
(57, 26, 1, '2026-10-06 21:11:34'),
(57, 27, 1, '2026-10-07 09:42:25'),
(58, 23, 1, '2026-10-06 21:22:17'),
(58, 24, 0, '2026-10-06 21:20:27'),
(58, 26, 1, '2026-10-06 21:15:45'),
(58, 27, 1, '2026-10-07 09:41:47'),
(59, 23, 1, '2026-10-06 21:24:37'),
(59, 24, 1, '2026-10-06 21:20:15'),
(59, 27, 1, '2026-10-07 09:33:33'),
(60, 23, 0, '2026-10-07 23:34:39'),
(60, 24, 1, '2026-10-08 09:29:25'),
(60, 27, 1, '2026-10-08 22:35:01'),
(61, 23, 1, '2026-10-07 23:35:10'),
(61, 24, 1, '2026-10-08 09:29:15'),
(61, 27, 1, '2026-10-08 22:35:11'),
(62, 23, 1, '2026-10-10 18:15:46'),
(62, 24, 0, '2026-10-10 00:39:38'),
(62, 26, 1, '2026-10-10 17:11:34'),
(62, 27, 1, '2026-10-11 21:16:01'),
(62, 28, 0, '2026-10-13 22:30:54'),
(63, 23, 1, '2026-10-10 18:15:53'),
(63, 24, 0, '2026-10-10 00:39:52'),
(63, 26, 1, '2026-10-10 17:11:20'),
(63, 27, 1, '2026-10-11 21:14:28'),
(64, 23, 0, '2026-10-10 18:16:04'),
(64, 24, 1, '2026-10-10 00:40:05'),
(64, 27, 1, '2026-10-11 21:14:20'),
(65, 1, 1, '2026-10-11 01:32:56'),
(65, 23, 0, '2026-10-10 18:16:10'),
(65, 27, 1, '2026-10-11 21:14:07'),
(66, 1, 1, '2026-10-11 01:32:52'),
(66, 23, 1, '2026-10-10 18:23:07'),
(66, 24, 1, '2026-10-10 23:26:37'),
(66, 26, 1, '2026-10-11 09:50:40'),
(66, 27, 1, '2026-10-11 21:13:11'),
(67, 1, 0, '2026-10-11 01:32:47'),
(67, 23, 1, '2026-10-11 02:29:18'),
(67, 24, 1, '2026-10-10 23:26:18'),
(67, 26, 1, '2026-10-11 09:50:14'),
(67, 27, 1, '2026-10-11 21:13:03'),
(68, 1, 1, '2026-10-11 01:32:42'),
(68, 23, 1, '2026-10-11 02:29:46'),
(68, 24, 0, '2026-10-10 23:26:25'),
(68, 26, 1, '2026-10-11 09:50:18'),
(68, 27, 1, '2026-10-11 21:12:54'),
(69, 23, 1, '2026-10-11 23:52:26'),
(69, 26, 1, '2026-10-12 15:06:18'),
(69, 28, 0, '2026-10-13 22:16:46'),
(70, 23, 1, '2026-10-12 09:11:30'),
(70, 28, 0, '2026-10-13 22:15:28'),
(71, 23, 0, '2026-10-12 22:01:57'),
(71, 28, 1, '2026-10-13 22:14:16'),
(72, 1, 1, '2026-10-15 01:14:36'),
(72, 23, 1, '2026-10-12 22:02:23'),
(72, 27, 0, '2026-10-13 21:59:26'),
(73, 1, 1, '2026-10-15 01:14:32'),
(73, 23, 1, '2026-10-15 01:37:42'),
(73, 28, 0, '2026-10-13 22:09:53'),
(74, 1, 1, '2026-10-15 01:14:22'),
(74, 23, 1, '2026-10-15 01:37:50'),
(74, 24, 1, '2026-10-14 22:50:27'),
(74, 27, 0, '2026-10-13 22:00:06'),
(75, 1, 1, '2026-10-15 01:14:28'),
(75, 23, 1, '2026-10-15 01:38:15'),
(75, 24, 1, '2026-10-14 22:49:46'),
(75, 28, 0, '2026-10-14 21:50:00'),
(76, 1, 1, '2026-10-15 01:14:19'),
(76, 23, 1, '2026-10-15 01:38:37'),
(76, 24, 1, '2026-10-14 22:49:29'),
(76, 27, 1, '2026-10-14 22:04:19'),
(76, 28, 0, '2026-10-14 21:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
(33, 1),
(33, 21),
(33, 29),
(34, 30),
(35, 1),
(66, 2),
(66, 12),
(70, 21);

-- --------------------------------------------------------

--
-- Table structure for table `article_view`
--

CREATE TABLE `article_view` (
  `article_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `viewer_key` char(64) NOT NULL,
  `viewed_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_view`
--

INSERT INTO `article_view` (`article_id`, `user_id`, `viewer_key`, `viewed_at`) VALUES
(4, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 01:15:42'),
(22, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-11 16:00:33'),
(22, 24, 'fb640491a79630ab3b48efa8814e0012ffb9bb8075b2cfb88b7edf7ec6c53d0e', '2026-10-06 10:25:38'),
(28, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-03 22:08:09'),
(30, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:07:03'),
(31, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:06:34'),
(31, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-07 09:55:22'),
(32, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:21:19'),
(33, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 16:38:11'),
(33, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 01:19:08'),
(40, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:19:21'),
(41, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:19:38'),
(41, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:05:37'),
(41, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-02 22:30:12'),
(42, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:19:45'),
(43, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-07 11:58:42'),
(43, 24, '2175918674ac4a2670a34184bb308760ad5f20910f903ae7f5ca07234de6cd60', '2026-10-02 21:52:11'),
(43, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-06 16:56:16'),
(43, NULL, 'cb249ebf52cf3cf5fb68fdc85e8b78e1697e0c64f9a24b60ed504eb35dd1d9b3', '2026-10-05 09:32:51'),
(43, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-02 22:25:08'),
(44, 24, '2175918674ac4a2670a34184bb308760ad5f20910f903ae7f5ca07234de6cd60', '2026-10-02 21:52:05'),
(44, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:12:05'),
(44, 1, '964e90d60107458519120a4067dd4a6206a88315217b658c1f3d1ed3f563a813', '2026-10-16 02:07:21'),
(44, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-02 22:25:22'),
(45, 24, '2175918674ac4a2670a34184bb308760ad5f20910f903ae7f5ca07234de6cd60', '2026-10-02 21:51:58'),
(45, NULL, '2387f4f5fd508ee3a1ce801329dbb7a13abf3e7fb8795850130b5f11c2b841d1', '2026-10-02 10:31:27'),
(45, NULL, '6a191df0f83c3edddfaedeb6b73d51603f465bea1739c7c0410a179994e44bdd', '2026-10-06 14:13:14'),
(45, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:12:38'),
(45, 1, '964e90d60107458519120a4067dd4a6206a88315217b658c1f3d1ed3f563a813', '2026-10-16 02:05:33'),
(45, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-07 09:57:18'),
(46, 24, '2175918674ac4a2670a34184bb308760ad5f20910f903ae7f5ca07234de6cd60', '2026-10-02 21:51:42'),
(46, 23, '6bf78da21f9cc91cbfe5a7cc4e86f74db722e2ba02e441d40605c69caffb98d0', '2026-10-02 21:51:48'),
(46, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:11:39'),
(46, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-06 16:56:06'),
(47, 24, '2175918674ac4a2670a34184bb308760ad5f20910f903ae7f5ca07234de6cd60', '2026-10-04 00:27:34'),
(47, 23, '6bf78da21f9cc91cbfe5a7cc4e86f74db722e2ba02e441d40605c69caffb98d0', '2026-10-02 21:52:04'),
(47, 26, '6d7daebf0ba6ecf150c27cc7a6189e88507daed9e207494ad2491933a61e319c', '2026-10-03 10:12:00'),
(47, 1, '964e90d60107458519120a4067dd4a6206a88315217b658c1f3d1ed3f563a813', '2026-10-16 02:06:52'),
(47, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-02 22:43:28'),
(48, 23, '5d640ea47753d3199649054cc2ba7e7a477a8fd78a71172310278011eeac79c6', '2026-10-03 21:26:43'),
(48, 1, '964e90d60107458519120a4067dd4a6206a88315217b658c1f3d1ed3f563a813', '2026-10-04 00:20:04'),
(48, 24, 'd5980f20acb7b385315b98dd75b5f019c484b54d52acaaa77fd7e92813e79ac7', '2026-10-04 00:27:24'),
(48, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-05 22:32:55'),
(49, 23, '5d640ea47753d3199649054cc2ba7e7a477a8fd78a71172310278011eeac79c6', '2026-10-03 21:26:33'),
(49, 1, '964e90d60107458519120a4067dd4a6206a88315217b658c1f3d1ed3f563a813', '2026-10-16 02:07:12'),
(49, 24, 'd5980f20acb7b385315b98dd75b5f019c484b54d52acaaa77fd7e92813e79ac7', '2026-10-05 00:21:38'),
(49, 27, 'e61108dc47299a3bfdf0584a361de34807fc683db59bac0f781525b6c88938ee', '2026-10-03 22:05:07'),
(50, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-06 16:55:41'),
(50, 23, 'bfc85aaa99792f26107e36c905bcb12fc715845db1411ec735e005620847b2a3', '2026-10-04 23:40:31'),
(50, 24, 'd4eb8909a441e0c09277a2be2350dc7eb50d215daa7ad6bc641a4465130e97b8', '2026-10-05 22:46:23'),
(50, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-05 22:30:57'),
(51, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-06 16:55:51'),
(51, 23, 'bfc85aaa99792f26107e36c905bcb12fc715845db1411ec735e005620847b2a3', '2026-10-05 08:21:29'),
(51, 24, 'd4eb8909a441e0c09277a2be2350dc7eb50d215daa7ad6bc641a4465130e97b8', '2026-10-05 00:21:24'),
(51, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-05 22:31:04'),
(51, NULL, 'eac0f81470492bc19e7130987013bf5d047a3d59dd2976093eec519c7d5314a9', '2026-10-06 17:33:00'),
(52, 23, 'cb249ebf52cf3cf5fb68fdc85e8b78e1697e0c64f9a24b60ed504eb35dd1d9b3', '2026-10-06 21:22:29'),
(52, 24, 'd813063e9d571b3557f80ebcd3be9b1400cd32de3589ed7abdd7c1263adf1994', '2026-10-05 22:46:18'),
(52, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-05 22:28:41'),
(52, 27, 'de12c926d331f3d1ebcb940c46b1aa41949d6701835a7c747fc5b0f8d3bde5d1', '2026-10-05 23:29:54'),
(52, NULL, 'eac0f81470492bc19e7130987013bf5d047a3d59dd2976093eec519c7d5314a9', '2026-10-06 17:31:40'),
(52, 1, 'fbdc11dd6aebe6f748fe57f469b8ab4aeda53e93b52a7e4285400bfec6fdf3ee', '2026-10-11 01:33:11'),
(53, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-06 16:55:24'),
(53, 23, 'bc779a9357faf1d7e08c7230a48a70e1b53e9fd8bcecae0bdc7b574bb0b8206d', '2026-10-05 22:05:20'),
(53, 24, 'd813063e9d571b3557f80ebcd3be9b1400cd32de3589ed7abdd7c1263adf1994', '2026-10-05 21:15:42'),
(53, NULL, 'd8a7d441b53a838c2b7548a7bb6ced931b4d3388ac665dcf264bd2801dfb8f41', '2026-10-13 21:54:44'),
(53, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-05 22:31:18'),
(53, 27, 'de12c926d331f3d1ebcb940c46b1aa41949d6701835a7c747fc5b0f8d3bde5d1', '2026-10-05 23:52:27'),
(53, NULL, 'eac0f81470492bc19e7130987013bf5d047a3d59dd2976093eec519c7d5314a9', '2026-10-06 17:32:12'),
(54, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:03:37'),
(54, 23, 'bc779a9357faf1d7e08c7230a48a70e1b53e9fd8bcecae0bdc7b574bb0b8206d', '2026-10-05 22:05:30'),
(54, 24, 'd813063e9d571b3557f80ebcd3be9b1400cd32de3589ed7abdd7c1263adf1994', '2026-10-05 21:15:51'),
(54, 27, 'de12c926d331f3d1ebcb940c46b1aa41949d6701835a7c747fc5b0f8d3bde5d1', '2026-10-05 23:12:59'),
(54, NULL, 'eac0f81470492bc19e7130987013bf5d047a3d59dd2976093eec519c7d5314a9', '2026-10-06 17:32:01'),
(55, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 16:38:03'),
(55, NULL, '1c3178e41c3bfb29ecc7687d5a7002993af7f2a9879451bbc38de3e09259fcab', '2026-10-12 22:25:31'),
(55, 23, '32c28f227cfbfe9afc101c86c63e555b3cb88065b4ebf112429d9206a69a1e09', '2026-10-06 21:28:30'),
(55, 24, '47780de11115e3fb9898129e824f01433d116c98dfeeaa9758e95a8b3b1204ab', '2026-10-06 10:25:16'),
(55, 29, '49e5dc79ab6d8188dd1062c1b84c7f5c629e17a5781d33c28490b999c921ce20', '2026-10-15 14:47:39'),
(55, NULL, '8d001036abc2941a3d99330c314f60088faa773ec9e3d05a2e076c942c5eea20', '2026-10-06 09:47:43'),
(55, NULL, '9aefeb641f10668cb297490b8f9932e4ff8693b8fa80f29af1a4eefbf8bc02fa', '2026-10-14 21:58:13'),
(55, NULL, 'a4836bd099bbe12d1f221322b48deb1047d59db1d700edb2b596bd51d96a07a5', '2026-10-15 14:48:46'),
(55, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-06 21:16:38'),
(55, 27, 'de12c926d331f3d1ebcb940c46b1aa41949d6701835a7c747fc5b0f8d3bde5d1', '2026-10-07 11:18:24'),
(55, 1, 'fbdc11dd6aebe6f748fe57f469b8ab4aeda53e93b52a7e4285400bfec6fdf3ee', '2026-10-06 14:45:50'),
(56, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 16:37:24'),
(56, 23, '32c28f227cfbfe9afc101c86c63e555b3cb88065b4ebf112429d9206a69a1e09', '2026-10-06 21:28:25'),
(56, 24, '47780de11115e3fb9898129e824f01433d116c98dfeeaa9758e95a8b3b1204ab', '2026-10-06 10:25:09'),
(56, 29, '49e5dc79ab6d8188dd1062c1b84c7f5c629e17a5781d33c28490b999c921ce20', '2026-10-15 14:47:35'),
(56, NULL, '8d001036abc2941a3d99330c314f60088faa773ec9e3d05a2e076c942c5eea20', '2026-10-06 09:47:40'),
(56, NULL, '9aefeb641f10668cb297490b8f9932e4ff8693b8fa80f29af1a4eefbf8bc02fa', '2026-10-14 21:58:09'),
(56, 26, 'dbacc1fd2d34eae4240e8065051e63262dfed2877e785f06da61c1c4d64e1676', '2026-10-06 21:16:15'),
(56, 27, 'de12c926d331f3d1ebcb940c46b1aa41949d6701835a7c747fc5b0f8d3bde5d1', '2026-10-05 23:23:31'),
(56, NULL, 'eac0f81470492bc19e7130987013bf5d047a3d59dd2976093eec519c7d5314a9', '2026-10-06 17:31:56'),
(56, NULL, 'fb640491a79630ab3b48efa8814e0012ffb9bb8075b2cfb88b7edf7ec6c53d0e', '2026-10-06 10:24:51'),
(56, 1, 'fbdc11dd6aebe6f748fe57f469b8ab4aeda53e93b52a7e4285400bfec6fdf3ee', '2026-10-11 01:34:33'),
(57, NULL, '099dedaf6abea80fdbcf4e3b8db502f8230b9ecab928189c80934ac8030042bf', '2026-10-14 21:22:33'),
(57, NULL, '09a9faeb61c24ea3aa1e963c883f261c8d0d867cdc54255e3e99440461413ec3', '2026-10-06 21:10:23'),
(57, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:39:00'),
(57, NULL, '1c3178e41c3bfb29ecc7687d5a7002993af7f2a9879451bbc38de3e09259fcab', '2026-10-12 22:25:55'),
(57, NULL, '1cb9e679fa50580f468abd214d74f7899bad5caec4c9673a23461cedbb26eb25', '2026-10-14 23:59:25'),
(57, NULL, '250b1036af21b0db1dc5f1ff1e627881e71009e692ec81ca927cd0eb6fa18ef1', '2026-10-14 20:05:32'),
(57, NULL, '5629959341334ab40d86c9a816643d6d044fac09767f1ee21a367779c311ea70', '2026-10-13 22:09:46'),
(57, NULL, '6fe5cebb8284c3dd943123d9d919a08ac83ca75630203c80b851b33306d49628', '2026-10-07 11:56:02'),
(57, NULL, '78a02f3b89b9a733b8d3029ba22b7a8e3124036fde59a5ad4c870ae4abe4d87d', '2026-10-13 10:40:23'),
(57, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-06 21:20:32'),
(57, NULL, '85c242f8f1b1d9484e49e827eedbe0f141cfa6f171eeb3e84743908bb177375a', '2026-10-14 16:44:50'),
(57, NULL, '9a70636d7c2899baefa2714db29f33c49adccbaf99dc7119fd04d2a80eb9db2e', '2026-10-13 20:53:59'),
(57, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-12 22:26:32'),
(57, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-11 16:00:19'),
(57, NULL, 'd598a752dab4f3e9d8f72ff18a139c2c9281812d1cbd0aa8840a36873076f891', '2026-10-08 14:54:33'),
(57, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-08 22:36:33'),
(57, NULL, 'ffae3b2c1cac658b52b710b6d941da6f644e85b795e10d8e7b3b43d21852edc2', '2026-10-06 21:19:23'),
(58, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-06 21:20:47'),
(58, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-06 21:15:30'),
(58, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-07 09:41:34'),
(59, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-06 21:23:07'),
(59, NULL, '205117d1843b54305ecbffd513d3fd1de881bb36f05cbea0e52ed04dc4d90d0d', '2026-10-07 11:07:57'),
(59, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-08 09:29:29'),
(59, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-06 21:15:52'),
(59, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:03:13'),
(59, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:21:11'),
(60, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-08 22:06:01'),
(60, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-08 09:29:17'),
(60, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-08 22:34:57'),
(61, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-10 18:24:40'),
(61, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 00:39:20'),
(61, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:50:14'),
(61, NULL, 'd598a752dab4f3e9d8f72ff18a139c2c9281812d1cbd0aa8840a36873076f891', '2026-10-08 14:54:11'),
(61, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:16:14'),
(62, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-10 18:25:14'),
(62, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:30:40'),
(62, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 00:39:33'),
(62, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-10 17:11:27'),
(62, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:15:58'),
(63, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-10 18:15:49'),
(63, NULL, '62397e69a72a06e4086432483b59e4c547d9e1e67ec405ee0a62f9dec32de1ac', '2026-10-10 17:10:54'),
(63, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 00:39:47'),
(63, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-10 17:11:15'),
(63, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:56:14'),
(63, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:14:26'),
(64, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-10 18:15:55'),
(64, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 00:39:58'),
(64, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-11 16:00:24'),
(64, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:14:16'),
(65, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-10 18:25:10'),
(65, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:50:05'),
(65, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:13:15'),
(66, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-12 22:02:56'),
(66, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 23:26:32'),
(66, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-11 09:50:31'),
(66, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:06:23'),
(66, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:20:55'),
(67, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-11 02:29:06'),
(67, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 23:26:15'),
(67, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-11 09:50:11'),
(67, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-11 01:33:27'),
(67, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:12:58'),
(68, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-11 02:29:36'),
(68, NULL, '55c50e1145cab80bcb626fc67931459a4fe89aa387644a392b3772f942cbf605', '2026-10-11 15:59:53'),
(68, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-10 23:26:22'),
(68, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-12 15:06:38'),
(68, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:21:26'),
(68, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-11 21:22:47'),
(69, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 21:10:52'),
(69, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-11 23:51:56'),
(69, NULL, '2d73c95f72af612918fd0f9eaad8930f85f58a87784341c61f4ccd2c18c7b9e1', '2026-10-11 23:52:41'),
(69, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:16:04'),
(69, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-12 15:06:08'),
(69, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 00:03:31'),
(70, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:39:17'),
(70, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:14:21'),
(70, NULL, '8d29cba8a190420c58a643a1e8499caf37b4bbae2ec4614eb3e930ecb30656fa', '2026-10-12 12:48:04'),
(70, NULL, '9aefeb641f10668cb297490b8f9932e4ff8693b8fa80f29af1a4eefbf8bc02fa', '2026-10-14 20:26:12'),
(70, 26, 'a6724b4c1f3680199072772bbdeeca300c83ce3255fa230a47ebe99c01e2d166', '2026-10-12 15:05:45'),
(71, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-12 22:01:45'),
(71, NULL, '1c3178e41c3bfb29ecc7687d5a7002993af7f2a9879451bbc38de3e09259fcab', '2026-10-12 22:25:33'),
(71, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:13:59'),
(71, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-14 22:50:06'),
(71, NULL, '85c242f8f1b1d9484e49e827eedbe0f141cfa6f171eeb3e84743908bb177375a', '2026-10-14 16:44:43'),
(72, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 21:10:50'),
(72, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-12 22:02:45'),
(72, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-15 01:14:35'),
(72, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-13 21:57:40'),
(73, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:37:10'),
(73, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:09:42'),
(73, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-15 01:14:30'),
(74, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 21:10:47'),
(74, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:37:44'),
(74, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-13 22:06:23'),
(74, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-14 22:50:25'),
(74, NULL, '85c242f8f1b1d9484e49e827eedbe0f141cfa6f171eeb3e84743908bb177375a', '2026-10-14 16:44:57'),
(74, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-15 01:14:24'),
(74, NULL, 'b42f8e5a6dff807f36fdd55890b5cc3657fd7095eb451ccf869334c05def602f', '2026-10-13 22:02:22'),
(74, NULL, 'dc85ccccf48590f6bdaa7f0268c1a9ced0c6c5547d965bc6d1aa9933120c3a34', '2026-10-15 01:57:44'),
(74, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-14 22:15:45'),
(75, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:37:57'),
(75, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-14 21:46:57'),
(75, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-14 22:49:39'),
(75, NULL, '9aefeb641f10668cb297490b8f9932e4ff8693b8fa80f29af1a4eefbf8bc02fa', '2026-10-14 20:26:20'),
(75, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-15 01:14:26'),
(76, 2, '0195616cec890a4dc990b9d0d41435fae026900a411f1fe03ba4c2e709701d69', '2026-10-18 17:10:36'),
(76, 23, '0b95ee623f264837fdb38120bae0deda82924cabec868564663a5b2a023c963c', '2026-10-15 01:38:18'),
(76, 28, '697c28b376901ffd7fa8c30e27f632147a39eaf6e8bced5f9c07fbd49b28012d', '2026-10-14 21:50:07'),
(76, 24, '8100f2b879e040593e98ced465000a2eb0479d0a77e56e8aa86708d912b04c45', '2026-10-14 22:49:20'),
(76, NULL, '94df23b74c5def40e2a50347d3cd2197fdbb2c5a1824253311e985b7eb14df95', '2026-10-14 22:03:50'),
(76, NULL, '9aefeb641f10668cb297490b8f9932e4ff8693b8fa80f29af1a4eefbf8bc02fa', '2026-10-14 20:26:18'),
(76, 1, 'abc3a47b8ad18b855c687d9ca2c6091ee7312db5563021942a57ada889c87b34', '2026-10-16 02:06:59'),
(76, 27, 'e443e68b7cb47260cec664c485de79d5f31b397430b3e6da98d5a65403157779', '2026-10-14 22:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(6, 'Guides'),
(1, 'Nintendo'),
(4, 'PC'),
(2, 'PlayStation'),
(7, 'Review'),
(3, 'Xbox');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `parent_comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comment_id`, `article_id`, `user_id`, `content`, `status`, `created_at`, `updated_at`, `parent_comment_id`) VALUES
(1, 31, 1, 'Okay, this actually has my attention. The world looks like it could be really fun to explore. wow', 1, '2026-09-18 10:15:00', '2026-09-18 19:22:14', NULL),
(2, 31, 3, 'I just hope there is more to do than simply following the main story. Give me lots of secrets to find!', 4, '2026-09-18 10:32:00', NULL, NULL),
(3, 31, 4, 'The art direction is really nice. It has that classic colorful Nintendo feel without looking exactly like their older games.', 4, '2026-09-18 10:47:00', NULL, NULL),
(4, 31, 5, 'Anyone else immediately wondering what the soundtrack is going to sound like? 👀', 1, '2026-09-18 11:03:00', NULL, NULL),
(5, 31, 6, 'Not gonna lie, I need a proper gameplay trailer before I get too excited. The reveal was way too short.', 1, '2026-09-18 11:21:00', NULL, NULL),
(6, 31, 7, 'The idea of having different environments to explore sounds great. Hopefully the map is actually worth getting lost in.', 1, '2026-09-18 11:46:00', NULL, NULL),
(7, 31, 8, 'This is definitely going on my watchlist. There are still so many unanswered questions though.', 1, '2026-09-18 12:08:00', NULL, NULL),
(8, 31, 9, 'I wonder if the characters will actually have their own abilities or if they are mainly there for the story.', 1, '2026-09-18 12:24:00', NULL, NULL),
(9, 31, 10, 'Same. I really want optional areas that actually reward you for exploring.', 1, '2026-09-18 10:51:00', NULL, 2),
(10, 31, 11, 'Exactly. Finding something completely unexpected is one of the best parts of these games.', 1, '2026-09-18 11:12:00', NULL, 9),
(11, 31, 12, 'I was thinking the same thing. A good soundtrack can make exploration feel so much better.', 1, '2026-09-18 11:18:00', NULL, 4),
(12, 31, 13, 'Yeah, I would rather wait for a longer gameplay reveal before judging it.', 1, '2026-09-18 11:39:00', NULL, 5),
(13, 31, 14, 'Hopefully! I want the world to have little details that make it worth exploring instead of just being a big empty map.', 1, '2026-09-18 12:01:00', NULL, 6),
(14, 31, 15, 'The character question is interesting. Giving them different abilities could make exploration a lot more interesting.', 1, '2026-09-18 12:36:00', NULL, 8),
(15, 31, 16, 'Honestly I am more interested in the gameplay than the story right now 😂', 1, '2026-09-18 12:52:00', NULL, 8),
(16, 31, 17, 'Same 😂. Hopefully the next trailer actually shows us what we will be doing moment to moment.', 1, '2026-09-18 13:07:00', NULL, 16),
(22, 31, 2, 'comment', 3, '2026-09-18 21:41:25', NULL, NULL),
(23, 31, 2, 'reply', 3, '2026-09-18 21:41:30', NULL, 22),
(24, 47, 27, 'Interesting post. Looking forward to the game release!', 1, '2026-10-02 22:44:25', NULL, NULL),
(25, 44, 26, 'Wish they would have a concert in Singapore', 1, '2026-10-03 10:12:34', NULL, NULL),
(26, 52, 23, 'Good list. One thing I\'d add: external drives are worth it, but check the speed first. Mine was so slow that load times got worse.', 1, '2026-10-05 08:29:06', NULL, NULL),
(27, 52, 26, 'OMG tysm for this!!! i bought a new external drive after reading your article, it makes a world difference!', 1, '2026-10-05 22:30:35', NULL, NULL),
(28, 53, 26, 'think I\'m missing something here, was RuneScape not previously using Unreal Engine?', 1, '2026-10-05 22:32:27', NULL, NULL),
(29, 48, 26, 'Wow this is scary...', 1, '2026-10-05 22:33:30', NULL, NULL),
(30, 54, 27, 'This is exciting news. A big fan of collecting such physical cards! Will be looking forward to it', 1, '2026-10-05 23:23:02', NULL, NULL),
(31, 52, 27, 'This is the best news ever. Appreciate the post, this definitely helps alot since my device keeps running out of storage. Thanks so much!', 1, '2026-10-05 23:38:39', NULL, NULL),
(32, 57, 23, 'Question for everyone: which step made the biggest difference on your PC? We\'re curious if dust or startup programs wins.', 1, '2026-10-06 17:42:26', NULL, NULL),
(33, 57, 26, 'Clearing startup programs made the bigger boost to my pc startup performance. But that\'s just me', 1, '2026-10-06 21:12:37', NULL, 32),
(34, 57, 26, 'Good article! One recent change that I made to my PC was to add a new SSD, since I could afford it. I set it as the Page File disk on my PC, seperate from my main drive. My games run much smoother now!', 1, '2026-10-06 21:15:22', NULL, NULL),
(35, 58, 26, 'Sounds promising', 1, '2026-10-06 21:15:50', NULL, NULL),
(36, 57, 24, 'super informative love this!', 1, '2026-10-06 21:21:29', NULL, NULL),
(37, 58, 23, 'I like the idea, but I\'m worried about the community splitting across yet another server type. Hope it doesn\'t leave the main game feeling empty.', 1, '2026-10-06 21:22:14', NULL, NULL),
(38, 59, 23, 'The storage size is the scary part. I\'ll need to clear some space first.', 1, '2026-10-06 21:24:17', NULL, NULL),
(39, 59, 27, 'Guess i\'ll be needing to get an expandable microSD card to download the game and not worrying about deleting any files from my device itself', 1, '2026-10-07 09:36:23', '2026-10-07 09:41:25', NULL),
(40, 61, 23, 'Looks promising', 1, '2026-10-07 23:35:27', NULL, NULL),
(41, 61, 27, 'What exciting news! Looking forward to it. Can make more friends along the way as well!! :)', 1, '2026-10-08 22:36:16', NULL, NULL),
(42, 57, 27, 'Finally stumble upon this news that im looking for. Would definitely try this on my old laptop to help boost its performance!', 1, '2026-10-08 22:37:59', NULL, NULL),
(43, 66, 23, 'Review roundup for the Kingdom Hearts Collection, which launched two days ago', 1, '2026-10-10 18:26:34', NULL, NULL),
(44, 63, 27, 'This is awesome news! Would definitely share this news with my friends and my young cousins and nephews will be estatic from this news!', 1, '2026-10-11 21:15:47', NULL, NULL),
(45, 68, 27, 'Quite a great deal personally! Cant wait for it to be release and get my hands on the set', 1, '2026-10-11 21:20:40', NULL, NULL),
(46, 69, 26, '69th article nice', 1, '2026-10-12 15:06:30', NULL, NULL),
(47, 73, 28, 'That\'s just tragic to hear this news. Was expecting more from epic games and looking forward to their new games release. Time to boycott them! :(', 1, '2026-10-13 22:13:35', NULL, NULL),
(48, 69, 28, 'ahaha yea ikr! i saw what they did there too!', 1, '2026-10-13 22:16:33', NULL, 46),
(49, 69, 28, 'Wow! Seriously? down by $10 only? They could have made a better deal with that. If the deal was 10% discount or a free game bundled together with the set, I would have taken the deal. Not really worth paying for it!', 1, '2026-10-13 22:20:06', NULL, NULL),
(50, 76, 28, 'They bringing this remake of Resident Evil on the Switch eh? Is it due to the recent release of the new movie in theatres? I think i\'d rather play Resident evil on a dedicated console or on PC instead, not sure if the Switch has enough power to handle the game', 1, '2026-10-14 22:02:21', NULL, NULL),
(51, 76, 27, 'As a resident evil fan myself, this is some new insights! Glad they are bringing it to the switch but i may lean in to the reviews being mentioned that the game may not be performing well on the platform as it is very intense in terms of graphics and general gameplay. For first timers who want to experience this horror game, it would be a nice starter pack!', 1, '2026-10-14 22:15:01', NULL, NULL),
(52, 73, 23, 'Boycott!', 1, '2026-10-15 01:37:34', NULL, 47),
(53, 76, 23, 'Looking forward:)', 1, '2026-10-15 01:38:53', NULL, NULL),
(54, 44, 1, 'Booking my flight to EU now!', 3, '2026-10-16 02:04:17', NULL, NULL),
(55, 44, 1, 'ok', 3, '2026-10-16 02:05:03', NULL, 25);

-- --------------------------------------------------------

--
-- Table structure for table `comment_reaction`
--

CREATE TABLE `comment_reaction` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_reaction`
--

INSERT INTO `comment_reaction` (`comment_id`, `user_id`, `reaction`) VALUES
(8, 27, 1),
(26, 23, 1),
(26, 26, 1),
(26, 27, 1),
(27, 23, 1),
(27, 27, 1),
(28, 27, 1),
(31, 23, 1),
(32, 23, 1),
(32, 24, 1),
(32, 26, 1),
(32, 27, 1),
(33, 23, 1),
(33, 27, 1),
(34, 23, 1),
(34, 27, 1),
(36, 23, 1),
(36, 26, 1),
(36, 27, 1),
(37, 27, 1),
(38, 27, 1),
(42, 26, 1),
(43, 23, 1),
(45, 26, 1),
(46, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetic`
--

CREATE TABLE `cosmetic` (
  `cosmetic_id` int(11) NOT NULL,
  `cosmetic_type_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cosmetic`
--

INSERT INTO `cosmetic` (`cosmetic_id`, `cosmetic_type_id`, `name`, `image_url`, `price`) VALUES
(1, 1, 'Silver Sentinel', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790598715/01.png', 100),
(2, 1, 'Lucky Bloom', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790673957/02.png', 300),
(3, 1, 'Astral Radiance', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790769821/03.png', 500),
(4, 1, 'Neon Nexus', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790686050/04.png', 500),
(5, 1, 'Sakura Serenade', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790686077/05.png', 500),
(6, 1, 'Inferno Crown', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790686093/06.png', 300),
(7, 1, 'Celestial Ascension', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790686107/07.png', 800),
(8, 1, 'Ocean’s Treasure', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790686077/08.png', 800),
(9, 2, 'Blossom Breeze', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790698109/bg01.png', 1000),
(10, 2, 'Moonlit Serenity', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1790698112/bg02.png', 2000),
(12, 1, 'Moon Bunny', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1792072478/FYP-NRS/cosmetic/fw8n7fnqwegfktdgdqmu.png', 800),
(13, 2, 'Skybound Sanctuary', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1792072719/FYP-NRS/cosmetic/scvw98npq7gtuen8wwys.png', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetic_type`
--

CREATE TABLE `cosmetic_type` (
  `cosmetic_type_id` int(11) NOT NULL,
  `code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cosmetic_type`
--

INSERT INTO `cosmetic_type` (`cosmetic_type_id`, `code`) VALUES
(2, 'background'),
(1, 'profile frame');

-- --------------------------------------------------------

--
-- Table structure for table `email_verification`
--

CREATE TABLE `email_verification` (
  `verification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `otp_hash` varchar(255) NOT NULL,
  `attempts` tinyint(4) NOT NULL DEFAULT 0,
  `expire_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `event_count` int(11) NOT NULL DEFAULT 1,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `type`, `user_id`, `actor_id`, `article_id`, `comment_id`, `parent_comment_id`, `message`, `event_count`, `is_read`, `created_at`) VALUES
(1, 1, 2, 1, 31, NULL, NULL, 'edited an article: Nintendo Reveals a New Adventure Coming to Switch', 1, 1, '2026-09-19 12:43:39'),
(2, 1, 2, 1, 32, NULL, NULL, 'published a new article: Trails in the Sky 2nd Chapter demo now available', 1, 1, '2026-09-19 12:48:59'),
(3, 1, 2, 1, 33, NULL, NULL, 'published a new article: asd', 1, 1, '2026-09-21 18:06:51'),
(4, 1, 2, 1, 33, NULL, NULL, 'edited an article: asd', 1, 1, '2026-09-21 18:07:30'),
(5, 1, 2, 1, 34, NULL, NULL, 'published a new article: asd', 1, 1, '2026-09-21 18:11:39'),
(6, 2, 2, 1, 35, NULL, NULL, 'edited an article: newdraftasd', 1, 1, '2026-09-21 23:46:51'),
(7, 1, 2, 1, 36, NULL, NULL, 'published a new article: new ary', 1, 1, '2026-09-21 23:50:00'),
(8, 1, 2, 1, 55, NULL, NULL, 'published a new article: [Control Test] Universally helpful article', 1, 1, '2026-10-05 22:43:18'),
(9, 2, 2, 1, 55, NULL, NULL, 'edited an article: [Control Test] Universally helpful article', 1, 1, '2026-10-05 22:43:33'),
(10, 1, 2, 1, 56, NULL, NULL, 'published a new article: [Control Post] Universally unhelpful post', 1, 1, '2026-10-05 22:44:22'),
(11, 1, 27, 23, 57, NULL, NULL, 'published a new article: 6 Free Ways to Speed Up an Old Gaming PC', 1, 0, '2026-10-06 17:40:44'),
(12, 1, 27, 23, 66, NULL, NULL, 'published a new article: Kingdom Hearts Collection Reviews Are In: Great Package, Shaky Frame Rate on Switch 2', 1, 1, '2026-10-10 18:22:55'),
(13, 1, 27, 23, 70, NULL, NULL, 'published a new article: REDSEC Turns One Soon: A Look Back at Its Rocky Battle Royale Launch', 1, 0, '2026-10-12 09:11:21'),
(24, 3, 13, 1, NULL, NULL, NULL, 'issued you a warning and removed your article. Reason: Your article violated our community guidelines.\n\nResolution ID: #10.', 1, 0, '2026-10-09 19:24:46'),
(25, 4, 12, 1, NULL, NULL, NULL, 'suspended your account for 14 days and removed your article. Reason: Your article violated our community guidelines.\n\nResolution ID: #11.', 1, 0, '2026-10-09 19:25:02'),
(26, 3, 3, 1, NULL, NULL, NULL, 'issued you a warning and removed your comment. Reason: Your comment violated our community guidelines.\n\nResolution ID: #6.', 1, 0, '2026-10-10 20:22:46'),
(28, 3, 4, 1, NULL, NULL, NULL, 'issued you a warning and removed your comment. Reason: Your comment violated our community guidelines.\n\nResolution ID: #7.', 1, 0, '2026-10-16 02:06:29'),
(29, 3, 2, 1, NULL, NULL, NULL, 'issued you a warning. Reason: You have been warned\n\nModeration ID: #16.', 1, 1, '2026-10-18 16:39:49'),
(30, 7, 22, 2, NULL, NULL, NULL, 'started following you', 1, 0, '2026-10-18 17:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `reporter_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `resolution_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `article_id`, `comment_id`, `reporter_id`, `reason`, `resolution_id`, `created_at`) VALUES
(1, 2, NULL, 5, 'Misleading information', NULL, '2026-10-09 19:24:23'),
(2, 2, NULL, 8, 'Misleading information', NULL, '2026-10-09 19:24:23'),
(3, 2, NULL, 9, 'Spam', NULL, '2026-10-09 19:24:23'),
(4, 3, NULL, 6, 'Misleading information', NULL, '2026-10-09 19:24:23'),
(5, 3, NULL, 8, 'Spam', NULL, '2026-10-09 19:24:23'),
(6, 4, NULL, 2, 'Misleading information', 5, '2026-10-09 19:24:23'),
(7, 5, NULL, 2, 'Spam', NULL, '2026-10-09 19:24:23'),
(8, 6, NULL, 2, 'Misleading information', NULL, '2026-10-09 19:24:23'),
(9, 7, NULL, 2, 'Spam', NULL, '2026-10-09 19:24:23'),
(10, 8, NULL, 2, 'Misleading information', NULL, '2026-10-09 19:24:23'),
(11, 9, NULL, 2, 'Spam', NULL, '2026-10-09 19:24:23'),
(12, 10, NULL, 2, 'Misleading information', 2, '2026-10-09 19:24:23'),
(13, 11, NULL, 2, 'Spam', 1, '2026-10-09 19:24:23'),
(14, 12, NULL, 2, 'Misleading information', 4, '2026-10-09 19:24:23'),
(15, 13, NULL, 2, 'Spam', 3, '2026-10-09 19:24:23'),
(16, NULL, 2, 6, 'Harassment', 6, '2026-10-09 19:24:23'),
(17, NULL, 2, 8, 'Harassment', 6, '2026-10-09 19:24:23'),
(18, NULL, 3, 7, 'Spam', 7, '2026-10-09 19:24:23'),
(19, 63, NULL, 1, 'Spam', NULL, '2026-10-16 00:56:44'),
(20, NULL, 44, 1, 'Spam', NULL, '2026-10-16 00:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `report_resolution`
--

CREATE TABLE `report_resolution` (
  `resolution_id` int(11) NOT NULL,
  `action` enum('dismissed','warning','suspension','ban') NOT NULL,
  `admin_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `resolved_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_resolution`
--

INSERT INTO `report_resolution` (`resolution_id`, `action`, `admin_id`, `notes`, `resolved_at`) VALUES
(1, 'dismissed', 1, NULL, '2026-10-09 19:24:33'),
(2, 'dismissed', 1, NULL, '2026-10-09 19:24:37'),
(3, 'warning', 1, NULL, '2026-10-09 19:24:46'),
(4, 'suspension', 1, NULL, '2026-10-09 19:25:02'),
(5, 'ban', 1, NULL, '2026-10-09 19:25:11'),
(6, 'warning', 1, NULL, '2026-10-10 20:22:46'),
(7, 'warning', 1, NULL, '2026-10-16 02:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `trending_score` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `name`, `trending_score`) VALUES
(1, 'Action', 0),
(2, 'Adventure', 0),
(3, 'RPG', 0),
(4, 'JRPG', 0),
(5, 'Strategy', 0),
(6, 'Simulation', 0),
(7, 'Puzzle', 0),
(8, 'Platformer', 0),
(9, 'Shooter', 0),
(10, 'FPS', 0),
(11, 'TPS', 0),
(12, 'Fighting', 0),
(13, 'Racing', 0),
(14, 'Sports', 0),
(15, 'Horror', 0),
(16, 'Survival', 0),
(17, 'Stealth', 0),
(18, 'Rhythm', 0),
(19, 'MMORPG', 0),
(20, 'MOBA', 0),
(21, 'Battle Royale', 0),
(22, 'Roguelike', 0),
(23, 'Roguelite', 0),
(24, 'Metroidvania', 0),
(25, 'Visual Novel', 0),
(26, 'Sandbox', 0),
(27, 'Open World', 0),
(28, 'Party', 0),
(29, 'Card Game', 0),
(30, 'Turn-Based', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(30) NOT NULL,
  `cosmetic_id` int(11) DEFAULT NULL,
  `reference_key` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `user_id`, `amount`, `reason`, `cosmetic_id`, `reference_key`, `created_at`) VALUES
(1, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-06', '2026-10-06 17:33:31'),
(2, 23, 0, 'shop_purchase', 10, 'shop_purchase:10', '2026-10-06 17:33:46'),
(3, 23, 0, 'shop_purchase', 9, 'shop_purchase:9', '2026-10-06 17:33:48'),
(4, 23, 0, 'shop_purchase', 1, 'shop_purchase:1', '2026-10-06 17:33:50'),
(5, 23, 0, 'shop_purchase', 2, 'shop_purchase:2', '2026-10-06 17:33:51'),
(6, 23, 0, 'shop_purchase', 3, 'shop_purchase:3', '2026-10-06 17:33:51'),
(7, 23, -100, 'shop_purchase', 6, 'shop_purchase:6', '2026-10-06 17:33:53'),
(8, 23, 0, 'shop_purchase', 4, 'shop_purchase:4', '2026-10-06 17:33:56'),
(9, 23, 0, 'shop_purchase', 7, 'shop_purchase:7', '2026-10-06 17:33:57'),
(10, 23, 0, 'shop_purchase', 8, 'shop_purchase:8', '2026-10-06 17:33:58'),
(11, 24, 100, 'daily_login', NULL, 'daily_login:2026-10-06', '2026-10-06 21:19:57'),
(12, 27, 100, 'daily_login', NULL, 'daily_login:2026-10-07', '2026-10-07 09:54:21'),
(13, 27, 0, 'shop_purchase', 3, 'shop_purchase:3', '2026-10-07 09:54:32'),
(14, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-07', '2026-10-07 11:56:27'),
(15, 24, 100, 'daily_login', NULL, 'daily_login:2026-10-08', '2026-10-08 09:29:46'),
(16, 24, -100, 'shop_purchase', 6, 'shop_purchase:6', '2026-10-08 09:30:00'),
(17, 24, 0, 'shop_purchase', 10, 'shop_purchase:10', '2026-10-08 09:30:07'),
(18, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-08', '2026-10-08 22:05:56'),
(19, 27, 100, 'daily_login', NULL, 'daily_login:2026-10-08', '2026-10-08 22:38:34'),
(20, 26, 100, 'daily_login', NULL, 'daily_login:2026-10-10', '2026-10-10 17:11:40'),
(21, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-10', '2026-10-10 18:15:37'),
(22, 23, 30, 'daily_mission', NULL, 'mission:react_articles:2026-10-10', '2026-10-10 18:24:00'),
(23, 23, 20, 'daily_mission', NULL, 'mission:read_articles:2026-10-10', '2026-10-10 18:24:47'),
(24, 23, 30, 'daily_mission', NULL, 'mission:bookmark_article:2026-10-10', '2026-10-10 18:25:22'),
(25, 1, 100, 'daily_login', NULL, 'daily_login:2026-10-11', '2026-10-11 01:33:33'),
(26, 1, 0, 'shop_purchase', 1, 'shop_purchase:1', '2026-10-11 01:33:40'),
(27, 1, 0, 'shop_purchase', 2, 'shop_purchase:2', '2026-10-11 01:33:40'),
(28, 1, -100, 'shop_purchase', 6, 'shop_purchase:6', '2026-10-11 01:33:43'),
(29, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-11', '2026-10-11 02:28:53'),
(30, 26, 100, 'daily_login', NULL, 'daily_login:2026-10-11', '2026-10-11 09:54:42'),
(31, 26, 30, 'daily_mission', NULL, 'mission:react_articles:2026-10-11', '2026-10-11 09:54:48'),
(32, 23, 30, 'daily_mission', NULL, 'mission:bookmark_article:2026-10-11', '2026-10-11 18:46:51'),
(33, 23, -500, 'shop_purchase', 5, 'shop_purchase:5', '2026-10-11 18:47:46'),
(34, 27, 100, 'daily_login', NULL, 'daily_login:2026-10-11', '2026-10-11 21:12:44'),
(35, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-12', '2026-10-12 09:06:45'),
(36, 26, 100, 'daily_login', NULL, 'daily_login:2026-10-12', '2026-10-12 15:05:40'),
(37, 1, 100, 'daily_login', NULL, 'daily_login:2026-10-12', '2026-10-12 15:56:37'),
(38, 27, 100, 'daily_login', NULL, 'daily_login:2026-10-13', '2026-10-13 22:02:19'),
(39, 28, 100, 'daily_login', NULL, 'daily_login:2026-10-13', '2026-10-13 22:06:28'),
(40, 28, 100, 'daily_login', NULL, 'daily_login:2026-10-14', '2026-10-14 21:46:53'),
(41, 24, 30, 'daily_mission', NULL, 'mission:react_articles:2026-10-14', '2026-10-14 22:50:34'),
(42, 24, 100, 'daily_login', NULL, 'daily_login:2026-10-14', '2026-10-14 22:50:40'),
(43, 1, 30, 'daily_mission', NULL, 'mission:react_articles:2026-10-15', '2026-10-15 01:14:38'),
(44, 1, 20, 'daily_mission', NULL, 'mission:read_articles:2026-10-15', '2026-10-15 01:14:39'),
(45, 1, 100, 'daily_login', NULL, 'daily_login:2026-10-15', '2026-10-15 01:14:41'),
(46, 23, 100, 'daily_login', NULL, 'daily_login:2026-10-15', '2026-10-15 01:37:07'),
(47, 26, 100, 'daily_login', NULL, 'daily_login:2026-10-15', '2026-10-15 14:42:35'),
(48, 29, 100, 'daily_login', NULL, 'daily_login:2026-10-15', '2026-10-15 14:46:19'),
(51, 1, 0, 'shop_purchase', 3, 'shop_purchase:3', '2026-10-15 22:30:29'),
(52, 1, 0, 'shop_purchase', 4, 'shop_purchase:4', '2026-10-15 22:30:30'),
(53, 1, 0, 'shop_purchase', 7, 'shop_purchase:7', '2026-10-15 22:30:32'),
(54, 1, 0, 'shop_purchase', 8, 'shop_purchase:8', '2026-10-15 22:30:33'),
(55, 1, 0, 'shop_purchase', 10, 'shop_purchase:10', '2026-10-15 22:30:35'),
(56, 1, 0, 'shop_purchase', 9, 'shop_purchase:9', '2026-10-15 22:30:35'),
(57, 1, 100, 'daily_login', NULL, 'daily_login:2026-10-16', '2026-10-16 00:05:36'),
(58, 2, 100, 'daily_login', NULL, 'daily_login:2026-10-18', '2026-10-18 16:39:16'),
(59, 1, 100, 'daily_login', NULL, 'daily_login:2026-10-18', '2026-10-18 16:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` varchar(160) NOT NULL DEFAULT 'This user prefers to keep things a mystery.',
  `role_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `suspended_until` datetime DEFAULT NULL,
  `coin` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `auth_version` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `profile_picture`, `bio`, `role_id`, `status`, `suspended_until`, `coin`, `auth_version`) VALUES
(1, 'John', 'john@test.com', '$2y$10$2bgDcYwtVoVV4/32Dfr5luO8Ynxxu02i4t8Jj7aSS1a.755FXDALW', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1789634379/FYP-NRS/profilepic/sff5dherflwsxnpxqs0d.png', 'this is a new bio123', 2, 1, NULL, 450, 1),
(2, 'John2', 'john2@test.com', '$2y$10$QBi18IpHKKg7IwVggtRScudlvyFbxPxeP3ZkX16xN7MJ/dECG8kge', NULL, 'This user prefers to keep things a mystery.', 2, 1, NULL, 100, 1),
(3, 'Alice', 'alice@test.com', '$2y$10$9zc8LRpNOevFc365SGvE4ueeuqk8pbWP.ySHox8Kfql4QyqsHwSjC', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(4, 'Bob', 'bob@test.com', '$2y$10$AAff8V3tWThxSPHTZjeTn.TSrycexVlIv/afGRKlEfnmfkP3Gn81O', NULL, 'This user prefers to keep things a mystery.', 1, 4, NULL, 0, 1),
(5, 'Charlie', 'charlie@test.com', '$2y$10$odZ3w1VEzS7SZ9GyzeFyae.Qv1P4.Hy3fOIBU6l85VJci9vNraVKe', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(6, 'David', 'david@test.com', '$2y$10$LThkJ.b7YZIn7OT9slpwP.5KiknDJeubNqK/k3hPup46DN1qRXVfy', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(7, 'Emma', 'emma@test.com', '$2y$10$TP2TsoBsgsqphw8ftxGUEuNIUBFZlpYGJg38iglRwi2kCdTnfbwne', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(8, 'Fiona', 'fiona@test.com', '$2y$10$BVI0pBz2XFAcT4y0iquqSeejORBTflzTgGYn4aanUpdiT3FmcF8HK', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(9, 'George', 'george@test.com', '$2y$10$/2j2gW66lNdmQkGJiCvkZ.QE2oT2803dgHyA76Vg7qBVmxhkHBD56', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(10, 'Hannah', 'hannah@test.com', '$2y$10$C.GY6tGsYy/VhkoqEtzAlOF28AjC3C.t8m5/xG1wX5SljwenJRG.e', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(11, 'Isaac', 'isaac@test.com', '$2y$10$DgrivSZVIZVFNpwxMdWZxu3VeU6IMPgqG9vN74fA7SYFS4nIaG65.', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(12, 'Julia', 'julia@test.com', '$2y$10$kE9ryyEE7rMmndeXTWi5V.9EjMXFA7u20qfLxQoVs7MYft5FodJOK', NULL, 'This user prefers to keep things a mystery.', 1, 1, '2026-10-23 19:25:02', 0, 1),
(13, 'Kevin', 'kevin@test.com', '$2y$10$V8Qnhzk.X.84q0CTm8jVC.h40FjHfp7Mxbd3KSGoLzoFF4JCM6BwO', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(14, 'Lily', 'lily@test.com', '$2y$10$m/9s9.gvNXOLsdyhELVx5OAihL4EjV7iLcEsdHl9SwGMnVDVG2ZDG', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(15, 'Mason', 'mason@test.com', '$2y$10$grJU5xfzY6s9UYP6pwzxo.dnAgCvMKzBl4HCY85WvSg9XIY81UT0.', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(16, 'Nora', 'nora@test.com', '$2y$10$B/ZsvxzJrwUlny20wCGuD.jQ2RLRscDm7bHRD96olKMXX/WnBdNuG', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(17, 'Owen', 'owen@test.com', '$2y$10$V5Jj73iREv0DVzukWhZmXu5XrxSjoegVXHRfqjPxguSCReJKur8Si', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(18, 'Priya', 'priya@test.com', '$2y$10$ZnDYT.Nri4i2CYLBy6yN1.mGzRRn2liJXvUaJ/ynSOxJVbYBU0n.K', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(19, 'Quinn', 'quinn@test.com', '$2y$10$AE93kIzLNlnp/KdMvADGteUOstm3wadPiu0LDLlnc0Lvtz0BY9lcK', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(20, 'Ryan', 'ryan@test.com', '$2y$10$tCrfgTui.Pl30R4QAGJLzuw97WA08OEHq43YgMD4ym4Aj1M.sHzTm', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(21, 'Kagi News Gaming', 'kagi-gaming@test.com', '$2y$10$pQAgWvFOT17Fds/CM/Sdn.kCC9ahA/XpCmDP3OaT4rkFdYCfHroQC', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(22, 'Kagi News Nintendo', 'kagi-nintendo@test.com', '$2y$10$x36BR1MdLGFP5xGhALxR/emz6HlBxbKzYL7Ij70N1AJhiOVVVHfQ.', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(23, 'The Almighty', 'bryan@gmail.com', '$2y$10$3UTpgdpcvtAa3EoVkVQx4uw1MnRgFrmgPlAOx3WAYQSzFHXdcvTtC', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791128588/FYP-NRS/profilepic/xjojz3row2efq1nzydq0.jpg', 'Smite me, O mighty smiter!', 1, 1, NULL, 210, 1),
(24, 'priss', 'priscillachew23@gmail.com', '$2y$10$OZjUbl9HXmSg071JHxcmV.E5jOkj8BLOxcwrjBbRMN1V7s3anBXSO', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 230, 1),
(25, 'Jun', 'jun@test.com', '$2y$10$Z/NqUqyRYdIDFIk./OyV6OgkmoBJI2VzZeUKdWmAl7Md.wO5zpjky', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 0, 1),
(26, 'YY', 'tanyuyang2@gmail.com', '$2y$10$hgPa8pCMD8V7i7jSIxRjMeM.rEXkz13DUPFuNLBoTvbFdajk2zIu.', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 430, 1),
(27, 'Hazzy1209', 'abdullh001@mymail.sim.edu.sg', '$2y$10$Qc1zmf1QbfcF0vqkkusnW.LLnleukAlJEq3597cgX2M5We7ZWYrC2', 'https://res.cloudinary.com/bl7j2jno/image/upload/v1791338056/FYP-NRS/profilepic/vsmkigyjxzew62ixabku.jpg', 'This user prefers to keep things a mystery.', 1, 1, NULL, 400, 1),
(28, 'iDontShowSpeed67', 'hkah048@uowmail.edu.au', '$2y$10$1mbVsk9pB.ARsVygq4HFh.GRFzgdWUZc4RtFGuao.yXBGdvOpNdEy', NULL, 'This user prefers to keep things a mystery.', 1, 1, NULL, 200, 1),
(29, 'controlpost', 'tanyuyang2+fypnrs@gmail.com', '$2y$10$crIaW2Ezmuv1nO6bzohFsemZItQNcS/usB0Qdqa64qq8H89k0hXIe', NULL, 'Holds the two calibration posts used to test the bridging score.', 1, 1, NULL, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_cosmetic`
--

CREATE TABLE `user_cosmetic` (
  `user_id` int(11) NOT NULL,
  `cosmetic_id` int(11) NOT NULL,
  `obtained_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cosmetic`
--

INSERT INTO `user_cosmetic` (`user_id`, `cosmetic_id`, `obtained_at`) VALUES
(1, 1, '2026-10-11 01:33:40'),
(1, 2, '2026-10-11 01:33:40'),
(1, 3, '2026-10-15 22:30:29'),
(1, 4, '2026-10-15 22:30:30'),
(1, 6, '2026-10-11 01:33:43'),
(1, 7, '2026-10-15 22:30:32'),
(1, 8, '2026-10-15 22:30:33'),
(1, 9, '2026-10-15 22:30:35'),
(1, 10, '2026-10-15 22:30:35'),
(23, 1, '2026-10-06 17:33:50'),
(23, 2, '2026-10-06 17:33:51'),
(23, 3, '2026-10-06 17:33:51'),
(23, 4, '2026-10-06 17:33:56'),
(23, 5, '2026-10-11 18:47:46'),
(23, 6, '2026-10-06 17:33:53'),
(23, 7, '2026-10-06 17:33:57'),
(23, 8, '2026-10-06 17:33:58'),
(23, 9, '2026-10-06 17:33:48'),
(23, 10, '2026-10-06 17:33:46'),
(24, 6, '2026-10-08 09:30:00'),
(24, 10, '2026-10-08 09:30:07'),
(27, 3, '2026-10-07 09:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_equipped_cosmetic`
--

CREATE TABLE `user_equipped_cosmetic` (
  `user_id` int(11) NOT NULL,
  `cosmetic_type_id` int(11) NOT NULL,
  `cosmetic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_equipped_cosmetic`
--

INSERT INTO `user_equipped_cosmetic` (`user_id`, `cosmetic_type_id`, `cosmetic_id`) VALUES
(1, 1, 7),
(23, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_moderation_history`
--

CREATE TABLE `user_moderation_history` (
  `history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` enum('warning','suspension','ban','lift_suspension','unban') NOT NULL,
  `reason` text NOT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_moderation_history`
--

INSERT INTO `user_moderation_history` (`history_id`, `user_id`, `admin_id`, `action`, `reason`, `suspended_until`, `created_at`) VALUES
(1, 13, 1, 'warning', 'Your article violated our community guidelines.', NULL, '2026-10-09 19:24:46'),
(2, 12, 1, 'suspension', 'Your article violated our community guidelines.', '2026-10-23 19:25:02', '2026-10-09 19:25:02'),
(3, 4, 1, 'ban', 'Your article violated our community guidelines.', NULL, '2026-10-09 19:25:11'),
(4, 3, 1, 'warning', 'Your comment violated our community guidelines.', NULL, '2026-10-10 20:22:46'),
(5, 4, 1, 'warning', 'Test warning 1: spam in comments.', NULL, '2026-10-10 22:07:09'),
(6, 4, 1, 'warning', 'Test warning 2: misleading information.', NULL, '2026-10-10 22:07:09'),
(7, 4, 1, 'warning', 'Test warning 3: harassment in replies.', NULL, '2026-10-10 22:07:09'),
(8, 4, 1, 'warning', 'Test warning 4: repeated promotional links.', NULL, '2026-10-10 22:07:09'),
(9, 4, 1, 'warning', 'Test warning 5: inappropriate language.', NULL, '2026-10-10 22:07:09'),
(10, 4, 1, 'warning', 'Test warning 6: personal attacks.', NULL, '2026-10-10 22:07:09'),
(11, 4, 1, 'warning', 'Test warning 7: off-topic spam.', NULL, '2026-10-10 22:07:09'),
(12, 4, 1, 'warning', 'Test warning 8: repeated misleading claims.', NULL, '2026-10-10 22:07:09'),
(13, 4, 1, 'warning', 'Test warning 9: disruptive behaviour.', NULL, '2026-10-10 22:07:09'),
(14, 4, 1, 'warning', 'Test warning 10: another guideline violation.', NULL, '2026-10-10 22:07:09'),
(15, 4, 1, 'warning', 'Your comment violated our community guidelines.', NULL, '2026-10-16 02:06:29'),
(16, 2, 1, 'warning', 'You have been warned', NULL, '2026-10-18 16:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscription`
--

CREATE TABLE `user_subscription` (
  `subscriber_id` int(11) NOT NULL,
  `subscribed_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscription`
--

INSERT INTO `user_subscription` (`subscriber_id`, `subscribed_to_id`) VALUES
(1, 8),
(1, 10),
(1, 22),
(2, 1),
(2, 22),
(23, 1),
(23, 21),
(27, 1),
(27, 8),
(27, 22),
(27, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_token`
--
ALTER TABLE `account_token`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `token_hash` (`token_hash`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `idx_article_score_calculated_at` (`score_calculated_at`),
  ADD KEY `author_id` (`author_id`) USING BTREE,
  ADD KEY `background_cosmetic_id` (`background_cosmetic_id`);

--
-- Indexes for table `article_ai_summary`
--
ALTER TABLE `article_ai_summary`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_bookmark`
--
ALTER TABLE `article_bookmark`
  ADD PRIMARY KEY (`article_id`,`user_id`),
  ADD KEY `article_bookmark_ibfk_2` (`user_id`);

--
-- Indexes for table `article_reaction`
--
ALTER TABLE `article_reaction`
  ADD PRIMARY KEY (`article_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `article_tag_ibfk_2` (`tag_id`);

--
-- Indexes for table `article_view`
--
ALTER TABLE `article_view`
  ADD PRIMARY KEY (`article_id`,`viewer_key`),
  ADD UNIQUE KEY `article_id` (`article_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`category_name`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_ibfk_3` (`parent_comment_id`);

--
-- Indexes for table `comment_reaction`
--
ALTER TABLE `comment_reaction`
  ADD PRIMARY KEY (`comment_id`,`user_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cosmetic`
--
ALTER TABLE `cosmetic`
  ADD PRIMARY KEY (`cosmetic_id`),
  ADD UNIQUE KEY `cosmetic_id` (`cosmetic_id`,`cosmetic_type_id`),
  ADD KEY `cosmetic_ibfk_1` (`cosmetic_type_id`);

--
-- Indexes for table `cosmetic_type`
--
ALTER TABLE `cosmetic_type`
  ADD PRIMARY KEY (`cosmetic_type_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `email_verification`
--
ALTER TABLE `email_verification`
  ADD PRIMARY KEY (`verification_id`),
  ADD UNIQUE KEY `email` (`email`,`type`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_ibfk_1` (`article_id`),
  ADD KEY `notification_ibfk_3` (`actor_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `parent_comment_id` (`parent_comment_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `article_id` (`article_id`,`reporter_id`),
  ADD UNIQUE KEY `comment_id` (`comment_id`,`reporter_id`),
  ADD KEY `reporter_id` (`reporter_id`),
  ADD KEY `resolution_id` (`resolution_id`);

--
-- Indexes for table `report_resolution`
--
ALTER TABLE `report_resolution`
  ADD PRIMARY KEY (`resolution_id`),
  ADD KEY `report_resolution_ibfk_1` (`admin_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `trending_score` (`trending_score`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`reference_key`),
  ADD KEY `transaction_ibfk_2` (`cosmetic_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_ibfk_1` (`role_id`);

--
-- Indexes for table `user_cosmetic`
--
ALTER TABLE `user_cosmetic`
  ADD PRIMARY KEY (`user_id`,`cosmetic_id`),
  ADD KEY `user_cosmetic_ibfk_2` (`cosmetic_id`);

--
-- Indexes for table `user_equipped_cosmetic`
--
ALTER TABLE `user_equipped_cosmetic`
  ADD PRIMARY KEY (`user_id`,`cosmetic_type_id`),
  ADD KEY `user_id` (`user_id`,`cosmetic_id`),
  ADD KEY `user_equipped_cosmetic_ibfk_2` (`cosmetic_id`,`cosmetic_type_id`);

--
-- Indexes for table `user_moderation_history`
--
ALTER TABLE `user_moderation_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD PRIMARY KEY (`subscriber_id`,`subscribed_to_id`),
  ADD KEY `subscribed_to_id` (`subscribed_to_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_token`
--
ALTER TABLE `account_token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `cosmetic`
--
ALTER TABLE `cosmetic`
  MODIFY `cosmetic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cosmetic_type`
--
ALTER TABLE `cosmetic_type`
  MODIFY `cosmetic_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `email_verification`
--
ALTER TABLE `email_verification`
  MODIFY `verification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `report_resolution`
--
ALTER TABLE `report_resolution`
  MODIFY `resolution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_moderation_history`
--
ALTER TABLE `user_moderation_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_token`
--
ALTER TABLE `account_token`
  ADD CONSTRAINT `account_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_3` FOREIGN KEY (`background_cosmetic_id`) REFERENCES `cosmetic` (`cosmetic_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `article_ai_summary`
--
ALTER TABLE `article_ai_summary`
  ADD CONSTRAINT `article_ai_summary_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article_bookmark`
--
ALTER TABLE `article_bookmark`
  ADD CONSTRAINT `article_bookmark_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_bookmark_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article_reaction`
--
ALTER TABLE `article_reaction`
  ADD CONSTRAINT `article_reaction_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_reaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `article_tag`
--
ALTER TABLE `article_tag`
  ADD CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `article_view`
--
ALTER TABLE `article_view`
  ADD CONSTRAINT `article_view_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `article_view_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment_reaction`
--
ALTER TABLE `comment_reaction`
  ADD CONSTRAINT `comment_reaction_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_reaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `cosmetic`
--
ALTER TABLE `cosmetic`
  ADD CONSTRAINT `cosmetic_ibfk_1` FOREIGN KEY (`cosmetic_type_id`) REFERENCES `cosmetic_type` (`cosmetic_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `email_verification`
--
ALTER TABLE `email_verification`
  ADD CONSTRAINT `email_verification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`actor_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_5` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`comment_id`) ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`reporter_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_4` FOREIGN KEY (`resolution_id`) REFERENCES `report_resolution` (`resolution_id`) ON UPDATE CASCADE;

--
-- Constraints for table `report_resolution`
--
ALTER TABLE `report_resolution`
  ADD CONSTRAINT `report_resolution_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`cosmetic_id`) REFERENCES `cosmetic` (`cosmetic_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_cosmetic`
--
ALTER TABLE `user_cosmetic`
  ADD CONSTRAINT `user_cosmetic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_cosmetic_ibfk_2` FOREIGN KEY (`cosmetic_id`) REFERENCES `cosmetic` (`cosmetic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_equipped_cosmetic`
--
ALTER TABLE `user_equipped_cosmetic`
  ADD CONSTRAINT `user_equipped_cosmetic_ibfk_1` FOREIGN KEY (`user_id`,`cosmetic_id`) REFERENCES `user_cosmetic` (`user_id`, `cosmetic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_equipped_cosmetic_ibfk_2` FOREIGN KEY (`cosmetic_id`,`cosmetic_type_id`) REFERENCES `cosmetic` (`cosmetic_id`, `cosmetic_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_moderation_history`
--
ALTER TABLE `user_moderation_history`
  ADD CONSTRAINT `user_moderation_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_moderation_history_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_subscription`
--
ALTER TABLE `user_subscription`
  ADD CONSTRAINT `user_subscription_ibfk_1` FOREIGN KEY (`subscribed_to_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_subscription_ibfk_2` FOREIGN KEY (`subscriber_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
