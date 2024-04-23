-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2024 at 10:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamespace`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `cart_view`
-- (See below for the actual view)
--
CREATE TABLE `cart_view` (
`cart_id` int(11)
,`user_id` int(11)
,`product_id` int(11)
,`quantity` int(11)
,`product_name` varchar(255)
,`platform_name` varchar(100)
,`product_thumbnail` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `game_platform_view`
-- (See below for the actual view)
--
CREATE TABLE `game_platform_view` (
`product_id` int(11)
,`platform_id` int(11)
,`platform_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_view`
-- (See below for the actual view)
--
CREATE TABLE `order_view` (
`id` int(11)
,`customer_id` int(11)
,`quantity` int(11)
,`receipient_name` varchar(100)
,`order_status` varchar(100)
,`order_address` varchar(300)
,`order_total` float
,`order_completed` date
,`product_name` varchar(255)
,`product_thumbnail` text
,`platform_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `popular_categories`
-- (See below for the actual view)
--
CREATE TABLE `popular_categories` (
`products_sold` decimal(32,0)
,`category_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_view`
-- (See below for the actual view)
--
CREATE TABLE `product_view` (
`id` int(11)
,`product_name` varchar(255)
,`product_description` text
,`product_thumbnail` text
,`snapshots` text
,`price` float
,`deleted_at` date
,`sold_count` int(11)
,`category_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`id`, `product_id`, `platform_id`, `quantity`, `user_id`) VALUES
(1, 1, 3, 3, 1),
(2, 37, 4, 1, 1),
(4, 3, 4, 1, 1),
(5, 1, 4, 14, 1),
(6, 2, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `background_image` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `category_name`, `background_image`, `description`) VALUES
(1, 'Racing', 'https://media.rawg.io/media/games/640/6409857596fe6553d3bb5af9a17f6160.jpg', '<p>Racing games is the video game genre with a high focus on driving competition. Such games are usually presented from the first-person or a third-person perspective. It is noted that gamepads are generally more suited to control the vehicle than keyboard/mouse pair. Although car avatars may render real-life examples, there are many instances where spaceships, formless mechanisms and other fantastical entities take the role of the avatar. Grand Prix released in 1969 is considered to be the first racing game ever made. Racings is a defining genre of a video game which is, in turn, can be divided into a lot of sub-genres: for instance, a primary focus may be made on destroying enemies&#39; vehicles (FlatOut, Twisted Metal) or crushing as many environments as possible (Split/Second). Those mechanics can alternatively be mixed with open world structure or set in the defined assortment of separate racing events.</p>'),
(2, 'Shooter', 'https://media.rawg.io/media/games/120/1201a40e4364557b124392ee50317b99.jpg', '<p>A shooter is a sub-genre of action video games the gameplay of which is thoroughly centered around shooting targets. Such games can be presented from first and the third perspectives with the latter being mostly twin-stick platforming shooters. Mouse and keyboard are widely regarded as the best controllers for shooters, as the firing demands high precision achieved only with manual aiming. The primary goal of shooters is to defeat enemies by discharging loads of bullets into them. Shooters are the most discussable video game genre when it comes to judging violence in games, as the gunfire process involves realistic scenes of killing quite often. Sub-genre of shooters is also divided by sub-subgenres such as shoot&#39;em ups, tactical shooters, and hero shooters.  The former involves changing a direction of movement and shooting forward while the latter focuses on wiping out tons of enemies by one protagonist. Notable games of the genre are Resogun, Bulletstorm and Call of Duty.</p>'),
(3, 'Adventure', 'https://media.rawg.io/media/games/b6b/b6b20bfc4b34e312dbc8aac53c95a348.jpg', '<p>An adventure game is a genre in which the player performs as a protagonist. It is usually supported by puzzle-solving, gathering items, dialogues, and intervening goals. Adventure focus on story, many of them are designed for a single player. Colossal Cave Adventure is known as the first of the genre, released in 1976. They rocketed in the 1980s; later it led to the appearance of independent video game developers. The Walking Dead by TellTale Games is considered as the game which renewed the whole genre. It has a revolutionary mechanics which change the gameplay as the players make their choices. These games are still favorite among the users; independent developers start crowd-funding companies to raise money; the genre is celebrated on practically any platform.</p>'),
(4, 'Action', 'https://media.rawg.io/media/games/b8c/b8c243eaa0fbac8115e0cdccac3f91dc.jpg', '<p>The action game is a genre that includes fights, puzzles, and strategies emphasizing coordination and reaction. It includes a large variety of sub-genres like fighting, beat &#39;em ups, shooters, survivals, mazes, and platforms; sometimes even multiplayer online battles and real-time strategies. Usually, the player performs as the protagonist with its unique abilities; some games add power-ups along the way. The character aims to complete levels, collect items, avoid obstacles, and battle against antagonists. It&#39;s necessary to avoid severe injuries during fights; if the health bar goes low, the player loses. Some games have an unbeatable number of enemies, and the only goal is to maximize score and survive for as long as possible. There might be a boss enemy who appears at the last level; he has unique abilities and a longer health bar. Pong is one of the first action games, released in 1972; the latest include Battlefield, Assasin&#39;s Creed, Fortnite and Dark Souls.</p>'),
(5, 'RPG', 'https://media.rawg.io/media/games/095/0953bf01cd4e4dd204aba85489ac9868.jpg', '<p>Role-playing games use protagonists as the leading figures in the occurring events. The player performs as a protagonist; his moves affect the setting and the possible outcome. Some RPGs are created in the form of trading card games; some relate to wargames. Except for the video RPGs, the genre is divided into two primary forms; the original tabletop role-playing, handled through discussion, and live-action role-playing, conducted through the characters&#39; actions. Each of them has a game master who&#39;s in charge of the rules and settings. The video RPGs include sandboxes, like GTA; tactical games, like Dragonfall; and roguelikes, like Mystery Dungeon. Usually, the primary purpose is to save the world or other characters. That includes taking part in collaborative storytelling, fighting, collecting items and solving puzzles if needed. The plot tends to develop in a fantasy or science fiction universe.</p>'),
(6, 'Fighting', 'https://media.rawg.io/media/games/684/684ecc08397479de72c5f89ef6f16f4f.jpg', '<p>Fighting games are a genre based on combat between several characters in which they fight until defeating each other or until the timer expires. Usually, there are numerous rounds set in an arena. Each personality has its abilities which are relatively free and limited to choose. During combats, the players master fighting techniques and learn how to chain attacks into combos. The first release of the genre was Heavyweight Champ in 1976. From the 1990s, developers spawned dozens of other fighting games, including Street Fighter, Mortal Kombat, and Super Smash Bros. Each protagonist has its health bar and special attacks. Typically, usage of combos, infliction of massive wounds, and, finally, winning gives several points.<br />\nSometimes the player can apply them for particular weapons or avatars. This genre can be mixed with others — for example, there are various indie fighting games like Blade Strangers. Every platform supports it.</p>'),
(7, 'Puzzle', 'https://media.rawg.io/media/games/a5a/a5abaa1b5cc1567b026fa3aa9fbd828e.jpg', '<p>Puzzle games are a broad genre that maintains logical and conceptual challenges; it may include concentration, logic, pattern recognition, word completion, and sequence searching. The games have either infinite attempts to solve puzzles and an unlimited amount of time or involve restricted timing and limited tries. They typically offer related puzzles for each theme, using the same colors, shapes, and numbers; however, the game design might be quite simple. There is also a set of rules which form the mechanics, and various outcomes leading to next levels. Sometimes they are tied into a whole story developing throughout the play. Minesweeper is one of the first puzzles developed in the 1980s. The gameplay and mechanics are very easy, and the game itself is cheap. At the time, it led to tremendous success which made puzzles one of the most favored genres ever since. It is now divided into various types and is available via the majority of platforms.</p>'),
(10, 'Strategy', 'https://media.rawg.io/media/games/e4a/e4ab7f784bdc38c76ce6e4cef9715d18.jpg', '<p>A strategy is a broad genre, its main feature lies in letting players be autonomous, they claim decision-making and high situational awareness, require private decision tree-style thinking as each action can determine the possible outcome. There are all sorts of strategies such as team plays, simulation games, and wargames. Many actions and adventure games need strategic thinking, but they can be hardly seen as ones. A strategy usually is extensive in range of sub-genres, its primary emphasis is on the player&#39;s ability to outthink opponents. It rarely involves a physical challenge, focusing on puzzles.<br />\nThere might be no enemy at all, which makes strategies very different from other genres. Resources, actions, powers, and gaps of each side of competitors are generally balanced. The last strategies released are Total War: Warhammer II, Mutant Year Zero: Road to Eden, and Into the Breach.</p>'),
(11, 'Arcade', 'https://media.rawg.io/media/games/363/36306deef81e7955a5d0f5c3b43fccee.jpg', '<p>Arcades are the most common and preferred genre of video games. Starting with the arcade machines which were activated by inserting a coin, the history of the genre backtracks to 1978&#39;s Space Invaders. Due to the limited time of gameplay, arcades often have short levels and structured as platformers with simple mechanics including jumping, shooting or moving around the screen space. There are little-to-none puzzles in such video games, and a lot of in-game situations are incredibly skill-dependent which is also very much reminiscent of arcade machines past — the leaderboard was an essential element awaking the competitive and exciting element in players. The primary feature to early arcades is their unbeatable nature — most of them focus the attention on an infinite amount of levels making the title practically unbeatable. The most significant examples of the arcades are Pac-Man, Donkey Kong Jr., and Mario Bros.</p>'),
(14, 'Simulation', 'https://media.rawg.io/media/games/179/179245a3693049a11a25b900ab18f8f7.jpg', '<p>Simulation games are a diverse and broad genre, commonly created for imitating real-life activities. There are no strict goals, the player is allowed to perform freely; he can play for one or more characters, dabbling into occupations, building towers, making relationships, and doing sports. This genre is divided into sub-genres, such as sports, construction and management, strategies, and wars. Each one has its famous games. Life simulators are known for the Sims series; sports simulators - for the NBA series; city-buildings for the SimCity series. The first simulations ever developed are BMX Simulator, Pro Boxing Simulator, and Grand Prix Simulator; each released in the 1980s. Among recently released, the most famous are Jurassic World Revolution, F1 2018, and Cities: Skylines.</p>'),
(15, 'Sports', 'https://media.rawg.io/media/games/b59/b59560a7277b16b53e4786b4abe45baa.jpg', '<p>Sports games are a genre that simulates competitive and single-player sports like arcades, management, simulation, multisport, and fighting. The primary goal is to compete with other players, either online or via consoles, upgrade clubs and buy new players, maintain a team&#39;s strategy. The genre was released in the 1970s, and the sales rocketed right away. The games recreate track and field, needed equipment, teams. Some of them maintain playing while others emphasize strategy and sports management. Games like Need for Speed and Punch-Out!!, mock sports for a subtle effect. It can be performed on every platform; some of them, like the Wii console, specialize in featuring sports games. EA and 2K dominate sports and hold licenses for developing games based on official leagues such as the Madden NFL series, the NBA series, the WWE 2K series, the NBA 2K series.</p>'),
(17, 'Card', 'https://media.rawg.io/media/games/431/4317e294e88e4c9d77327693b15f499a.jpg', '<p>Card video games is the wide genre of titles using cards as main gameplay units. There is a common division between games derived originally from tabletop and card games and ones initially created for computer medium. The first type covers a large variety of traditional card games such as poker, monopoly, go and many others. There are no definite mechanics to such games except the &quot;imperfect information&quot; gamble meaning that there is always unknown elements to the game which spice it up. The titles of that sort are often hard to transfer to video games because the cooperative action takes place within one screen so the most popular games are played remotely. Finally, the second type features a similar variety in sub-genres, however, collectible card games prevail in quantity — games like Gwent, Hearthstone with their vast audience and many alike illustrate that turn-based combats with the cards collected can be popular within the medium.</p>'),
(19, 'Family', 'https://media.rawg.io/media/games/793/79307648580a262f6cac402c3007efe0.jpg', '<p>Family games are the genre of casual video games appropriate for the whole family in difficulty and censorship. Nintendo is often considered to be the most efficient family games producer as this company&#39;s titles are usually rated 10+ for mild cartoonish violence. Not only the gameplay must not include any forms of sexuality and violent scenes, but also the graphics should be appropriately gentle and fancy as nice visuals define the replayable value of the game. Finally, it is utterly essential for a title not to be too hardcore as it may inflict stress on the player who is not accustomed to such types of games. The story is set to be interesting featuring; however, no complicated twisted for a player to master. The most recognizable examples of family games are as follows: Rayman Origins, Day of the Tentacle Remastered, Flower and many others. Some games belong to various genres simultaneously — Uno, for instance, is both card and family game.</p>'),
(28, 'Board Games', 'https://media.rawg.io/media/screenshots/8ff/8ffe8f19d2e764867c8ed625ddf4e368.jpg', '<p>The board game is a small genre based on tabletop games. Mechanics consist of moving pieces on a board and placing them according to a set of rules. Some platforms provide online matches with thousands of users playing all at once. Board games can function as virtual tabletop programs that allow trying multiple types of boards. There are generalized programs like Vassal, Tabletop Simulator and Tabletopia; programs like Roll20 and Fantasy Grounds are more specialized for role-playing games. The players can add extra content through user modifications.<br />\nThe usual goal is to defeat opponents in counters, gain points and win a position. Their representation and design differ, sometimes they have an inherent theme, like checkers, or even a particular theme and narrative, like Cluedo. Rules can stay the same throughout the game or change little by little, like Tic-tac-toe.</p>'),
(34, 'Educational', 'https://media.rawg.io/media/games/60a/60a0b8f88184f25621b498c2ee1ebb05.jpg', '<p>Educational games are the video games genre centered around useful information throughout a playthrough. It is the secondary characteristic in the game&#39;s description because it denotes the value a player can make out of the gameplay and say little to nothing about the actual game itself. So, platformers, shooters, puzzles, and card games can be didactic. The ability to educate is utterly mean that playing given title may replace the textbook or a lesson experience due to the procedural nature of a video game medium as it can persuade the players to learn information in a more efficient way than just reading or watching. The most popular genres within the sub-genre are strategies as they teach one to think forward strategically; simulators as they mimic the real working experience and point-and-click adventures as they train logic, teach how to solve puzzles and guide the player through the variety of tricky situations.</p>'),
(40, 'Casual', 'https://media.rawg.io/media/games/4ea/4ea507ceebeabb43edbc09468f5aaac6.jpg', '<p>Casual games are a sub-genre, they can exhibit any gameplay. They are typically identified by simple rules and low requirements for timing and skills. Usually, casual games impose low production and distribution costs, which is why developers widely produce them. Casual games can perform at any platform; they do not require any individual peripherals. Usually, there&#39;s no need to save to continue later, mechanics include a one-button mouse or cellphone keypad, but the gameplay is still puzzling and elegant. They also have simple gameplay and allow to take breaks between rounds without losing interest in it. The first well-known game of the genre is an arcade Pac-Man released in 1980. However, actions, graphics, and sounds are often quite limited but can display additional features in multiplayer modes. Simplicity along with elegance aren&#39;t the only traits making the genre popular; these games are also quite cheap.</p>'),
(51, 'Indie', 'https://media.rawg.io/media/games/35b/35b47c4d85cd6e08f3e2ca43ea5ce7bb.jpg', '<p>Indie is one of the vaguest categories in video games. Generally, it describes any title developed by independent (thus the name) studio which means that game&#39;s launch was not powered with publisher&#39;s funds or any financial support other than crowdfunding. The genre is kickstarted mainly because of the variety of crowd-funding policies and many early-access platforms like Steam Greenlight. A corporation does not develop indies, so primarily the genre is associated with single developers or small studios. Lacking the budget, indie games are mostly shorter and lesser than their publisher-financed competitors. Such titles, therefore, bear no attachment to censorship regulations and can express whatever authors wish. It is worth to mention that a large portion of adult games is indie. The rules above can be applied to the most games; however, not all. Some titles may feature publisher, but it cannot affect the final product. Some specific examples of indie are World of Goo, Undertale, and Braid.</p>'),
(59, 'Massively Multiplayer', 'https://media.rawg.io/media/games/4e0/4e0e7b6d6906a131307c94266e5c9a1c.jpg', '<p>Massively-multiplayer games is an online sub-genre is an online game which includes large numbers of players performing on the same server. The aim is to explore the universe, collect items, complete tasks and participate in battles. Usually, this is pretty much the gameplay; some multiplayer follow a specific plot. They suit every network-capable platform. MMs enable users to cooperate and battle with each other and represent many genres. The most popular type is RPG multiplayer such as World of Warcraft and Final Fantasy XIV.<br />\nTo upgrade avatars or equipment, one should buy it with real money accumulated in the virtual economy; the first game which implemented the system is Ultima Online. This often leads to cheating or pirating. One of the most famous among the recent MMs is SCUM, Battlerite Royale, The Elder Scrolls, and DayZ.</p>'),
(83, 'Platformer', 'https://media.rawg.io/media/games/226/2262cea0b385db6cf399f4be831603b0.jpg', '<p>Platformer is a sub-genre of action games. Normally, the player aims to perform as a protagonist and complete levels and tasks while exploring areas. It often requires solely jumping and climbing, but more complex games also include puzzle solving and fighting enemies. One of the distinctive elements is the jump button, swiping or touchscreen. The players have control over the height and distance of jumps; they have to avoid falling as it leads to either losing points and health bars or their death. However, in some platformers like The Legend of Zelda series, jumps are done automatically. They originated in the 1980s, back then the main mechanics were to climb ladders as much as jumping. Recent developments changed the design a bit; now platformers typically exist in a 3D environment. The last released are Super Mario Galaxy and Ratchet &amp; Clank Future: Tools of Destruction.</p>'),
(85, 'Mobile', 'category_image_264.jpeg', 'lkajsdlkasjda');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `username`, `password`, `user_id`) VALUES
(1, 'Valtern', '$2y$10$UYxbA/azdGQU3nyRZ2fxqepT9QatP9ZsOjghrlOMgwoUzKHF.jnLG', 1),
(2, 'Testing', '$2y$10$MSf6Fe6XZlYiFDgktjmFz.b0kbH/usHDKfL3i7/psFhwV92PmeQkG', 2),
(3, 'auth', '$2y$10$q8qcMMNkc0l.USStWCmejexmp7GIe/Svwne0QY15gHjjarz.ecNN2', 3),
(4, 'Oscianent', '$2y$10$Nw4bjJoAoJPPCFq2aWNhbesstiyDbvsfpp7ZHRKmKGZs4ATWLStUu', 4),
(6, 'Oscianent', '$2y$10$PBbkQ/jU6nGo9U90UsGeJOJ4vQMvjbupmEZ01JUFTQ.l6TMzGEnqC', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_messages`
--

CREATE TABLE `tbl_messages` (
  `id` int(11) NOT NULL,
  `concern_header` varchar(100) NOT NULL,
  `concern_body` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_messages`
--

INSERT INTO `tbl_messages` (`id`, `concern_header`, `concern_body`, `user_id`) VALUES
(1, 'Can&#039;t add item to cart', '', 1),
(3, 'Can&#039;t add item to cart', '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `receipient_name` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_total` float NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(100) NOT NULL DEFAULT 'Preparing to ship',
  `order_address` varchar(300) DEFAULT NULL,
  `order_completed` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`id`, `customer_id`, `receipient_name`, `product_id`, `platform_id`, `quantity`, `order_total`, `order_date`, `order_status`, `order_address`, `order_completed`) VALUES
(1, 4, 'Lezy Jie', 2, 4, 4, 51.96, '2024-04-22', 'Shipped', 'Somewhere in neverland', NULL),
(2, 1, 'Lorenz Bocatot', 5, 3, 1, 12.99, '2024-04-22', 'Preparing to ship', 'Somewhere in neverland', NULL),
(3, 1, 'a', 2, 4, 1, 12.99, '2024-04-23', 'Delivered', 'a', '2024-04-23'),
(5, 1, 'Lorenz Bocatot', 1, 3, 3, 38.97, '2024-04-23', 'Delivered', 'Somewhere in neverland', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_platforms`
--

CREATE TABLE `tbl_platforms` (
  `id` int(11) NOT NULL,
  `platform_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_platforms`
--

INSERT INTO `tbl_platforms` (`id`, `platform_name`) VALUES
(1, 'PC'),
(2, 'PlayStation 5'),
(3, 'PlayStation 4'),
(4, 'Xbox One'),
(5, 'Xbox Series S/X'),
(6, 'Nintendo Switch'),
(7, 'iOS'),
(8, 'Android'),
(9, 'Nintendo 3DS'),
(10, 'Nintendo DS'),
(11, 'Nintendo DSi'),
(12, 'macOS'),
(13, 'Linux'),
(14, 'Xbox 360'),
(15, 'Xbox'),
(16, 'PlayStation 3'),
(17, 'PlayStation 2'),
(18, 'PlayStation'),
(19, 'PS Vita'),
(20, 'PSP'),
(21, 'Wii U'),
(22, 'Wii'),
(23, 'GameCube'),
(24, 'Nintendo 64'),
(25, 'Game Boy Advance'),
(26, 'Game Boy Color'),
(27, 'Game Boy'),
(28, 'SNES'),
(29, 'NES'),
(30, 'Classic Macintosh'),
(31, 'Apple II'),
(32, 'Commodore / Amiga'),
(33, 'Atari 7800'),
(34, 'Atari 5200'),
(35, 'Atari 2600'),
(36, 'Atari Flashback'),
(37, 'Atari 8-bit'),
(38, 'Atari ST'),
(39, 'Atari Lynx'),
(40, 'Atari XEGS'),
(41, 'Genesis'),
(42, 'SEGA Saturn'),
(43, 'SEGA CD'),
(44, 'SEGA 32X'),
(45, 'SEGA Master System'),
(46, 'Dreamcast'),
(47, '3DO'),
(48, 'Jaguar'),
(49, 'Game Gear'),
(50, 'Neo Geo'),
(51, 'Web');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `product_thumbnail` text DEFAULT NULL,
  `snapshots` text DEFAULT NULL,
  `price` float NOT NULL,
  `sold_count` int(11) NOT NULL DEFAULT 0,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(1, 'Cuphead', '<p>Hand-drawn 2D platformer in the style of 30s cartoons. 2D Dark Souls as the fans refer to the difficulty of this one. It took developers 6 years to create and polish their magnum opus. Cuphead is a classic run and gun adventure that heavily emphasizes on boss battles.</p>\n<p>Play as Cuphead or his brother Mugman that signed a deal with the devil and know needs to bring the master souls of its debtors. Players can go through the campaign single-handedly or with a friend using built-in co-op capabilities. </p>\n<p>The backgrounds, characters and other miscellaneous staff were painstakingly created using the methods from the era it mimics; Every character and every scene were hand-drawn to mimic vintage American cartoons. Each note in the orchestral soundtrack was composed with unparalleled attention to detail. Cuphead is an addictive mix of bone-crushing difficulty, fun and audiovisual feast that instantly makes you crave for more.</p>', 'https://media.rawg.io/media/games/226/2262cea0b385db6cf399f4be831603b0.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f07/f07f356b4d50a0035efcb6abf3834e4e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/bf8/bf8dd4951e4dbd0c608881c367a60a24.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/344/344d6cb35e3dbc0faba8659a5a78e67a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ade/ade103b6a1ce035f5e7f25c65b6bbe42.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5c1/5c19e99a6d4a2fcd8037587ff1505b11.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/dc5/dc5d251100154f7502b4b8510591cc5d.jpg\";}', 12.99, 14, NULL),
(2, 'Lara Croft and the Temple of Osiris', '<p>The sequel to Lara Croft and the Guardian of Light, and a spin-off to the larger Tomb Raider franchise. This time, our famous adventurer Lara Croft and her rival tomb raider Carter Bell travel to Egypt to search for the ancient temple, where a magical artifact, Stuff of Osiris, is hidden. The game is set in the temple and its dungeons, designed in Ancient Egyptian aesthetics. Besides shooting monsters, Lara and her partners have to avoid all kind of traps that will immediately remind you of Indiana Jones films. Completing specific missions will grant the player rings and amulets that enhance characters&#39; skills and abilities.</p>\n<p>Just like the previous game, The Guardian of Light uses the isometric view. The game allows for a cooperative mode for up to four players. All puzzles are automatically adjusted to the number of players. You can play not only as Lara but also as her friendly rival Carter Bell and two Egyptian gods, Isis and Horus, who were imprisoned in the temple for millenniums by the evil god Set. Their goal is to gather together and revive Osiris, the god who was dismembered by Set, and who can save the Earth from Set&#39;s evil. While human characters use firearms and grappling hooks, the gods are armed with the magic Stuff of Osiris.</p>', 'https://media.rawg.io/media/games/1fb/1fb1c5f7a71d771f440b27ce7f71e7eb.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2da/2daae705502e68568eac6379e21e22ea.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1da/1da2ebdc8b8b0e87ed6d4cf5c9b70a6c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/4c7/4c7f3c8d4b0d332e7aa8820004c95640.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/aa8/aa8616476cae2a3c6dbbd7312d7fed35.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f5d/f5d99cdebfd081c56b2838bfa997273f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3c6/3c6a8a8ec5dafe4d3235f6f9383b43fd.jpg\";}', 12.99, 7, NULL),
(3, 'Kingdom Come: Deliverance', '<p>You&#39;re Henry, the son of a blacksmith. Thrust into a raging civil war, you watch helplessly as invaders storm your village and slaughter your friends and family. Narrowly escaping the brutal attack, you grab your sword to fight back. Avenge the death of your parents and help repel the invading forces!</p>', 'https://media.rawg.io/media/games/d8f/d8f3b28fc747ed6f92943cdd33fb91b5.jpeg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/57a/57a10b6c897bc2c21666f4a9bcfdefcc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/8bc/8bc2d7c3039918e39c0d0e35f2abbe93.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/cdd/cdd3304a7c3507d221ff475eb50358c8.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c48/c48e46fe5bbe9573acd34b42d955eef8.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/1ad/1adaff50796645d8914156a69449b6c1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a1e/a1e908e8b1ec42434fc9c4d0fcf6484c.jpg\";}', 12.99, 4, NULL),
(4, 'SEGA Mega Drive and Genesis Classics', '<p>Today it is not so hard to play old games. Emulators are available to anyone with almost any computer. And old memories are filling our minds with those amazing games we played in the past.</p>\n<p>With this collection, you can relive your experiences with those games and play them all over again. The controls are now completely adapt for PC and still look very authentic despite new generation platforms. Some of the titles still support cooperative gameplay through Steam and in the workshop you can find new improvements to the old titles made by players for players. In this bundle, you can find any title you remember from Sega Mega Drive and Genesis - Sonic, Phantasy, Golden Axe, Virtua Fighter and Streets of Rage. Controls are now adapt not only for gamepads but also for the keyboard which means anyone can play it.</p>', 'https://media.rawg.io/media/games/0fd/0fd84d36596a83ef2e5a35f63a072218.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a98/a98a26bc099f56ad0f89fa7f51b7e839.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/8c5/8c5a93e3103406ad15f9030d3262d79b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/041/04196ceb413c23c824054897a2d9ce96.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/018/018f00f6e05f18b901d4dec3e289f0f0.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f5e/f5e32500f6fb16aae8622f0beb115fe9.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/052/05295a43cd5274c6e8b74752fd51dfcb.jpg\";}', 12.99, 0, NULL),
(5, 'Far Cry 4', '<p>Far Cry 4 is a first-person shooter, which inherits traditions of the original Far Cry franchise. However, the plot of the fourth chapter is unique and has no direct references to the previous games of the series. The story is now set in the Far East, where the new main character Ajay Gale joins the opposition fighting the dictatorship. The open world lets players explore the entire environment of Kyrat – a tiny fictional region hidden in towering Himalayas. Ajay as a Kyrati-American travels to Kyrat to scatter the ashes of his mother in her motherland, but suddenly things go the wrong way, and he finds himself in the middle of the civil war between the powerful dictator Pagan Min and rebels from the Golden Path founded by his father. As the story progresses, players get new weaponry and equipment or customize the ones they have. From the very beginning, the whole map is not available, so to progress and to complete the story players have to open all the game areas by “activating” bell towers (traditional Far Cry mechanic) for establishing the Golden Path’s radio propaganda and defeating enemies’ fortresses.</p>', 'https://media.rawg.io/media/games/b39/b396dac1f3e0f538841aa0355dd066d3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/62c/62c6f076bfb258f12e925ff12e56dad4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/a6e/a6e31bb99bdd48ee3e6cef291a053e6a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/8a1/8a160808e4bc188df008a6a6ac12ce22.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f83/f8382bf9f3c4777f6883f0b1fff3f43a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/796/7969e6a5c9c626960eb380de01a9c2ae.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/54f/54fcf6fc80548fe8baec46823097dc57.jpg\";}', 12.99, 2, NULL),
(6, ' Grand Theft Auto V', '<p>Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. <br />\nSimultaneous storytelling from three unique perspectives: <br />\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. <br />\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.</p>\n<p>Español<br />\nRockstar Games se hizo más grande desde su entrega anterior de la serie. Obtienes la construcción del mundo complicada y realista de Liberty City de GTA4 en el escenario de Los Santos, un viejo favorito de los fans, GTA San Andreas. 561 vehículos diferentes (incluidos todos los transportes que puede operar) y la cantidad aumenta con cada actualización.<br />\nNarración simultánea desde tres perspectivas únicas:<br />\nSigue a Michael, ex-criminal que vive su vida de ocio lejos del pasado, Franklin, un niño que busca un futuro mejor, y Trevor, el pasado exacto del que Michael está tratando de huir.<br />\nGTA Online proporcionará muchos desafíos adicionales incluso para los jugadores experimentados, recién llegados del modo historia. Ahora tendrás otros jugadores cerca que pueden ayudarte con la misma probabilidad que arruinar tu misión. Los jugadores pueden experimentar todas las mecánicas de GTA actualizadas a través del personaje personalizable único, y el contenido de la comunidad combinado con el sistema de nivelación tiende a mantener a todos ocupados y comprometidos.</p>', 'https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a7c/a7c43871a54bed6573a6a429451564ef.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/cf4/cf4367daf6a1e33684bf19adb02d16d6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/f95/f9518b1d99210c0cae21fc09e95b4e31.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a5c/a5c95ea539c87d5f538763e16e18fb99.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a7e/a7e990bc574f4d34e03b5926361d1ee7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/592/592e2501d8734b802b2a34fee2df59fa.jpg\";}', 12.99, 15, NULL),
(7, 'XCOM 2', '<p>The game continues the previous game line: XCOM Enemy Unknown. In XCOM 2 we see the Earth under the rule of aliens. The order established by them is based on total control but is proclaimed as the realm of prosperity and security. However, on the periphery of large cities, there are those who consider it a dictatorship and are struggling to restore independence to people. Thus the new XCOM, the organisation of freedom fighters, is reborn. The base for the organisation&#39;s soldiers is now the alien ship &quot;The Avenger&quot;, converted to the needs of the defenders of the Earth.<br />\nThe player will have to travel around the global map, contact guerrillas in various places, look for resources and perform partisan attacks on the critical points of the enemies. The tactics of the organisation have changed - now they are in the minority. The factories for the production of weapons and other equipment were closed 20 years ago, so you have to collect any found equipment and resources.<br />\nThe game introduced many new enemies, but there are aliens from the previous game too. The hero of the game has a unique ability to be in contact with the psi-network uniting all the aliens. This ability makes him a turning point in which the enslavement of the Earth can be reversed.</p>', 'https://media.rawg.io/media/games/9bf/9bfac18ff678f41a4674250fa0e04a52.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f14/f14faa0923c79a729317366f862204f2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/d77/d7710eb7fed8912dd231edffebee4a7e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/85b/85bafe497ac953f1551b0d40474d6b4a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8e7/8e71928210b19da54a3fda97647d363d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f42/f42e9f1d9918f47d0696d0bac16b1300.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a75/a759f4e7cfa28a1dadcdfd362b9b9f98.jpg\";}', 12.99, 21, NULL),
(8, 'Journey', '<p>Journey is an indie game placed in a setting of the vast desert. The protagonist is a nameless and speechless figure moving towards the distant mountain. The player gets to know the story without words, but rather through cutscenes. The main character wears a magical scarf, which allows flying for some time, and recharges it with gathered cloth or simply by walking. From time to time the protagonist finds collectible items and discover ruins that can give additional information about the world or the storyline. The only way of interaction with in-game objects is a shout. </p>\n<p>The game transfers the atmosphere of an absolute loneliness. However, during the journey the character can meet other players controlling differently dressed, but generally the same figures. Wandering together can be helpful for both players, as they are able to charge one another’s scarves. The thing is that both players cannot communicate each other in any way, except producing noises. Together players can complete levels and continue moving to their final destination.</p>', 'https://media.rawg.io/media/games/baf/baf9905270314e07e6850cffdb51df41.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/b3f/b3f7f9c7fc81de2417135f758470b806.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/08b/08b24d5b3d2074f37500e938771edafa.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/704/70438c6fad16044c53a67b5c63fda9a6.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/d3c/d3c6674838af8d63f2e8bc1d7da16a9d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f61/f61dc90adfc5796cd1a950f6eb5eb16e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/509/5094aeab0e11682a6792d09a0828154a.jpg\";}', 12.99, 2, NULL),
(9, 'Firewatch', '<p>Firewatch is a mysterious adventure game with beautiful graphics, which tells a story of a fire lookout Henry. From the very beginning, the game sets up a tough atmosphere of loneliness. The main action takes place in Shoshone National Forest of Wyoming in 1989 (a reference to Yellowstone fires of 1988). According to the storyline, right after the appointment to the fire tower in Shoshone forest Henry starts facing strange things. The further gameplay is based on exploring the entire forest and investigating its phenomena. Players’ progress will affect the accessibility of the distant game areas. Sometimes the silence is being interrupted by the protagonist&#39;s walkie-talkie, which connects him with his supervisor Delilah. Gameplay also includes mechanics of choice within the dialogue: each optional phrase reflects on Henry’s relations with Dalilah. In addition to the puzzles of the forest, Henry tries to solve his own experiences while wandering. Playing for Henry and his accomplice gamers will have to clear up the mysteries of the past, connected with the fire tower in Shoshone National Forest.</p>', 'https://media.rawg.io/media/games/0be/0bea0a08a4d954337305391b778a7f37.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/e86/e86b8c787467f28f816eb59c5a7e8799.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5fd/5fd10bf8857d575d25029712eff7a555.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/12a/12a71dc55e86960b7f0185f12c3affe2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/992/9923c31af79cb7a17e24c4ef47d50217.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/2fd/2fde2721efe9480d2ccd7c204649edab.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/d96/d96edb4fac41f4c39871ac750893cdec.jpg\";}', 12.99, 2, NULL),
(10, 'Elden Ring', '<p>The Golden Order has been broken.</p>\n<p>Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.</p>\n<p>In the Lands Between ruled by Queen Marika the Eternal, the Elden Ring, the source of the Erdtree, has been shattered.</p>\n<p>Marika&#39;s offspring, demigods all, claimed the shards of the Elden Ring known as the Great Runes, and the mad taint of their newfound strength triggered a war: The Shattering. A war that meant abandonment by the Greater Will.</p>\n<p>And now the guidance of grace will be brought to the Tarnished who were spurned by the grace of gold and exiled from the Lands Between. Ye dead who yet live, your grace long lost, follow the path to the Lands Between beyond the foggy sea to stand before the Elden Ring.</p>', 'https://media.rawg.io/media/games/b29/b294fdd866dcdb643e7bab370a552855.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/36f/36f941f72e2b2a41629f5fb3bd448688.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/290/29096848622521df7555850000236cb6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/807/807685454ea8fb87363eedd49677f49b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2ee/2eea4d4cce2836f689d9d39d2a4a94d5.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/de9/de9b28bdd0bdb9937c7f82e55f845bb6.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3a2/3a2e5f31e2061bc566bcfd30fda56a17.jpg\";}', 12.99, 3, NULL),
(11, 'Fall Guys: Ultimate Knockout', '<p>Fall Guys: Ultimate Knockout flings hordes of contestants together online in a mad dash through round after round of escalating chaos until one victor remains! Battle bizarre obstacles, shove through unruly competitors, and overcome the unbending laws of physics to avoid both humiliation and elimination. Leave your dignity at the door and prepare for hilarious failure in your quest for the crown!<br />\nMassive Online Pandemonium: Dive into a series of ridiculous challenges and wild obstacle courses with 100 competitors online, all with the hopes of making the cut and advancing to the next round of mayhem.<br />\nCompetitive &amp; Cooperative: Shift between brutally competitive free-for-alls and cooperative challenges where only the winning team advance to the next round!<br />\nComically Physical: Watch in delight as your fellow competitors bend, bounce, and bash their way to hilarious, physics-based failure!<br />\nDelightfully Customizable: Fail in style with everything from fashionable pineapple couture to the latest in bunny hats available to customize your look in Fall Guys.</p>', 'https://media.rawg.io/media/games/5eb/5eb49eb2fa0738fdb5bacea557b1bc57.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1c5/1c5d40d58ac34b04576ffd7072989eea.jpg\";i:1;s:81:\"https://media.rawg.io/media/screenshots/5a7/5a7accdc9cc61aa844b2d4f64f4c94b3.jpeg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/37c/37cecc1f17ad71b26fbbc5a651a4fe9b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/9c7/9c7a057ff1ce9122e66847b0eeedd20f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/af7/af7ccaa5f7c2826d9f41cd0fd5c16d4d.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4b1/4b118c6bc02c21ffcac1cb44717666a9.jpg\";}', 12.99, 1, NULL),
(12, 'Metro Exodus', '<p>Metro Exodus is the third installment in the Metro series. It is based on the series of post-apocalyptic novels by Russian writer Dmitry Glukhovsky. The game is the sequel to Metro: Last Light and is set two years after its ending.</p>\n<h3>Plot</h3>\n<p>Exodus takes place in the year 2036 in post-apocalyptic Russia. According to the Metro universe backstory, in 2013 the planet was devastated by a total nuclear war. The atomic bombing left many parts of the Earth&#39;s surface uninhabitable due to high radiation rates, dangerous mutated monsters, and anomalies abound. The last remnants of humanity survive by hiding in the subway tunnels (hence the name of the series). The main protagonist is Artyom, a former dweller of Moscow Metro. Together with his wife Anna, he escaped the capital to search for survivors in the Russian Far East (thus making the “Redemption” ending of the Last Light the series&#39; canon). </p>\n<h3>Gameplay</h3>\n<p>The player controls Artyom from the first person view. Exodus introduces the sandbox open-world, although the game combines it with the traditional linear levels. Unlike in previous games, Exodus is set mostly outside the subway system. Thus, the game also introduces the weather, the day and night cycle and the change of seasons. The player explores the Russian wilderness during and after the nuclear winter and rides a steam locomotive named Aurora through Siberia.</p>', 'https://media.rawg.io/media/games/152/152e788b7504aa2753c86dae912fb34c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/90e/90ec2c2aadeb403083788066224fa9c7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/dba/dbae2235379fde39c2758004033d1b2a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b37/b377f2607a8298a04e4be00db53f7ee9.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/54c/54cce0b0341719481381ad57e47c2176.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e19/e199c2f6f5a3343ffb277724ed18d5a0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/220/220609ce00e2cd65af0adf2b78039522.jpg\";}', 12.99, 0, NULL),
(13, 'Borderlands: The Pre-Sequel', '<p>The game belongs to the Borderlands game line, its action takes place between the events of Borderlands and Borderlands 2.<br />\nEverything happens on the moon of Pandora - Elpis. The story tells about the formation of Hyperion Corporation and the fate of its head - Handsome Jack, whom we meet while in the role of a simple programmer who dreams to find some valuable artifact. In the game there are various innovations - in the plot, in the characters, in the scenarios of missions and in the setting. For example, on the Pandora satellite, gravity is much weaker, but there is no oxygen at all. Therefore, the task of obtaining oxygen becomes very important for everyone. Moreover, oxygen is needed not only for breathing, but also for the functioning of personal jetpacks and long high jumps. In the game there is another additional story and downloadable content, including new characters and story campaigns.</p>', 'https://media.rawg.io/media/games/530/5302dd22a190e664531236ca724e8726.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ee9/ee9f6de36d4b0bdaf43bd10a2ec56f4a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6bd/6bd501390fb4e78141838c07a1a3580e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/99b/99b2d12cf0c1d4a2492f632465c4cf71.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/579/5792b69c652c9b210122a686e9dd59e1.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/706/7063852169f86cd4e70440de419353e8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/01c/01c6128a0c81ed34efd4433abea32a18.jpg\";}', 12.99, 0, NULL),
(14, 'Rocket League', '<p>Highly competitive soccer game with rocket-cars is the most comprehensive way to describe this game. Technically a sequel to Psyonix’ previous game - Supersonic Acrobatic Rocket-Powered Battle-Cars; Rocket League successfully became a standalone sensation, that can be enjoyed by anyone. Easy to learn, hard to master game mechanics are perfect for the tight controls. Players are invited to maneuver the different fields within several game modes, from arcade to ranked game either 1v1, or in 2v2 and 3v3 teams. Using boosters will not only speed up the car but will allow the car to propel itself into the air.<br />\nRocket League provides several levels of customization, where not only the color of your car can be adjusted, but the colors and form of the booster flame, different hats, and little flags. Or players can pick a completely different car. Collaboration with different franchises brought not only original transport but some famous cars, including Batmobile or Delorian from Back to the Future.</p>', 'https://media.rawg.io/media/games/8cc/8cce7c0e99dcc43d66c8efd42f9d03e3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/6a0/6a0745d9dcd0f7a368d372260baf91aa.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5ea/5ea8ab6a35f189489b2ec8713d4f1619.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/508/5083fd170bf10606afd12afc7d17db04.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/02d/02d36e8e01a9f1063c6431ce09324e24.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/036/036ddade8156ac52ecf8de593123d12c.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/861/8615727f6e52f1632ae38d71e9e4c800.jpg\";}', 12.99, 0, NULL),
(15, 'Alien: Isolation', '<p>Alien: Isolation is an action-survival horror game played from the first-person perspective for a more intense experience. The game is not a sequel to any of Alien games, but it is directly connected to the original 1979 Alien film, so the gameplay includes historical references, and the game itself transfers the unique atmosphere and the old vision of the future. The action is set 15 years after the film events. Young Amanda Ripley accompanied by Nina Taylor and the android Christopher Samuels reaches a distant space station Sevastopol to investigate the case of her mother Ellen Ripley (the protagonist of the 1979 film) disappearance. On the way to the Nostromo’s (Ellen’s spacecraft) flight recorder, Amanda will face plenty of hardships like hostile androids and Aliens because the Sevastopol station is wholly abandoned. Players have to explore the entire station inhabited with Aliens. Due to the crafting system, players can create the necessary gear to prevent contacts with countless enemies.</p>', 'https://media.rawg.io/media/games/daa/daaee07fcb40744d90cf8142f94a241f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/df3/df311b578fbaa587c8ba2d768bcf18d7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b46/b46d5ddcbf7650df4d7eedf1e886bcdb.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/37a/37a8f38809062d7e68d32c537e23862d.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/89c/89c46fe1576b925f4c00cc9b6620877a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d06/d0612058778cdf798a747c80a491b55f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e12/e12d1635f074c536a16bc50a6b3f56cc.jpg\";}', 12.99, 0, NULL),
(16, 'Wolfenstein II: The New Colossus', '<p>Wolfenstein 2: The New Colossus is a singleplayer FPS developed by MachineGames. It is the third installment in the rebooted series.</p>\n<p>Set in the alternate 1961 where Nazi Germany won World War II, the game picks up right at the end of Wolfenstein: The New Order. After sustaining heavy injuries in the battle with Wilhelm &quot;Deathshead&quot; Strasse, BJ Blaskowicz orders a nuclear strike on Deathshead&#39;s compound in order to cripple the Nazi war machine, but he is evacuated by his comrades before the rocket launch. Blaskowicz falls unconscious for 5 months and is woken up by a Nazi attack. The player has to repel the attack and end the Nazi reign over America once and for all.</p>\n<p>The New Colossus features several stealth-action elements, just like the previous title in the series. There are some major differences in the mechanics: now BJ can modify his weaponry on-the-go, dual wield two different weapons at the same time. The cover system makes a comeback. The Protagonist doesn&#39;t stick to cover, leaning out of it instead.</p>\n<p>The game offers a linear storyline, but the player is free to complete side-missions in any order they like. Completing these missions is rewarded with new weapon upgrades.</p>', 'https://media.rawg.io/media/games/a0e/a0ef08621301a1eab5e04fa5c96978fa.jpeg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/46f/46fd3ba7b2ff7539af8d58181c455dd8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/a59/a59057a832fec0b2d31701ec4679f93c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/f8a/f8ac9fd590b7eacdfc7157357b887af0.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c6e/c6e99ef6cbf97ab5beafc0b2754bad3e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ae4/ae4e4e0fe6fccf191dcd683d80d4d3cd.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4f5/4f5a646bfe8fbcdbfd3a0472788dfa5c.jpg\";}', 12.99, 0, NULL),
(17, 'Among Us', '<p>Join your crewmates in a multiplayer game of teamwork and betrayal!</p>\n<p>Play online or over local wifi with 4-10 players as you attempt to hold your spaceship together and return back to civilization. But beware...as there may be an alien impostor aboard!</p>\n<p>One crewmate has been replaced by a parasitic shapeshifter. Their goal is to eliminate the rest of the crew before the ship reaches home. The Impostor will sabotage the ship, sneak through vents, deceive, and frame others to remain anonymous and kill off the crew.</p>\n<p>While everyone is fixing up the ship, no one can talk to maintain anonymity. Once a body is reported, the surviving crew will openly debate who they think The Impostor is. The Impostor&#39;s goal is to pretend that they are a member of the crew. If The Impostor is not voted off, everyone goes back to maintaining the ship until another body is found. If The Impostor is voted off, the crew wins!</p>', 'https://media.rawg.io/media/games/e74/e74458058b35e01c1ae3feeb39a3f724.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/699/699ee5bb2a05aa3a806603728db02a5e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1c8/1c8190719f443f09aea5ea0e1f2d42a9.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/037/037b52100b1bca8c1e09a92fe0655c69.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/14e/14e6b9ad2ad73f234a382a597fd5abbb.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/36b/36b940cb0479d789854b5c85a1009a90.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e74/e74557f11f74763c41ba8d112a33c7c7.jpg\";}', 12.99, 0, NULL),
(18, 'Batman: Arkham Knight', '<p>Batman: Arkham Knight is the final instalment for the Arkham series by now. Joining forces with Bruce Wayne for the last time, we have to oppose Scarecrow and other iconic villains such as The Riddler, Harleen Quinzel a.k.a. Harley Quinn, Penguin and others.</p>\n<p>The story continued after events in Arkham City when Joker died due to infection in his blood. Now, Scarecrow tries to release a new fear toxin, meanwhile new mysterious Arkham Knight plots against Batman as well. Still having consequences after being poisoned by the Joker and seeing visions with him, Bruce has to prevail the death of Gotham City.</p>\n<p>The gameplay mechanics stays the same to the Arkham series. Melee combat system, use of the detective skills to find clues and gadgets still play a major role in Batman&#39;s fight against evil. Although now you can travel around not only by your grappling hook but a legendary Batmobile as well. Iconic voices of the characters, Kevin Conroy and Mark Hammil once again return to give their voices for the last game in Arkham series.</p>', 'https://media.rawg.io/media/games/310/3106b0e012271c5ffb16497b070be739.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1ed/1ed7f33789fdb79dbe7ae346f7b24fdf.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/c19/c19a4d55f1fa9661b32d43e110a5dbff.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b87/b873d09e51115514cb1445a954dbca9e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/cbe/cbee51d83cafbe75224336859ddfc27e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d2a/d2ab2d0f10e778c1a867c999515c3f9a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/172/172a4d61d4b6d3b77f19f5826de439f2.jpg\";}', 12.99, 0, NULL),
(19, 'Dead Island', '<p>Dead Island is a zombie fighting game with the open world. Fictional island Banoi is filled with tourist. But suddenly, everyone disappears from every hotel room, and every corner of the island is filled with zombies. Four survivors - Sam, Xian, Logan and Purna must escape the hordes of zombies and try to find any survivors on the island and get out of this God forgotten place.</p>\n<p>The gameplay is based around experience. Killing zombies and completing quests will provide with EXP points which you can waste for new traits and perks for better and easier killing. Every character has his advantages with different types of weapon. For example, Purna is a former police officer, and she is quite familiar with firearms when Sam is very good with blunt weaponry. Having different styles of gameplay adds a very good variety to the gameplay, as you can play alone or with your friends. Quests will provide experience to every player on the map as you share it with your partner and you are free to do your quests as you want since the game has an open world system integrated into it.</p>', 'https://media.rawg.io/media/games/56e/56ed40948bebaf1968234aa6e3c74771.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/486/486a42d5b4a456ff7043671ca0e1d146.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/606/606d1f6b854b9edab64df1b43e456663.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c9d/c9dcf809a18c229c82676e8f2b81d35e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/4c1/4c15bc2a60c0ce4e90909390eb802410.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/64d/64dce99763374e3ab406ff3f6217334f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e52/e520fdc5065b6637cd4032e59e5678c3.jpg\";}', 12.99, 0, NULL),
(20, 'The Elder Scrolls V: Skyrim Special Edition', '<p>The Elder Scrolls V: Skyrim Special Edition is the 2016 reinstallment of the open world fantasy RPG, developed by Bethesda Game Studios. Following the original release of 2011, Special Edition focuses on reshaping every sword and ax, polishing every stone in the high castles and the suburbs of the low, overall bringing a renewed experience to its fans and newcomer players.<br />\nAfter 5 years of the original’s glory, this collection of all the content, available with the game itself, offers to once again set foot on the snowy mountains of the Skyrim province of Tamriel. The magnificent open world, full of breathtaking environments and landscapes, welcomes all its players to embark on another journey. Explore the even more beautiful flora of Skyrim, fight the most dangerous fauna, and many more.<br />\nThe Elder Scrolls V: Skyrim Special Edition now includes full support of community-made and developer-approved mods, allowing for even more exploration and experiments with the in-game contents. Continually expanding, the database of various new quests, characters, and locations not disappointing any player, while some modifications try to focus on enhancing the vanilla experience to the maximum.</p>', 'https://media.rawg.io/media/games/62c/62c7c8b28a27b83680b22fb9d33fc619.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/e38/e387d8f781c00520eccb5934b95f1720.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/d48/d48ce46dd0dfd32c374c4e8c09dd370c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/8d4/8d4ad7d58d614d82e3933f69095e6b23.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/dd3/dd340c1c2c146f41d48f505a58dada09.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ae1/ae167fabd67a73cac9ef8c99690572bf.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e8b/e8b57630f5924da6633a07777f1a8c7a.jpg\";}', 12.99, 2, NULL),
(21, 'Darksiders Warmastered Edition', '<p>Darksiders Warmastered Edition is a third person slasher/RPG. A remaster of the original release of 2010. The game features a fictional world, where mythical creatures exist in something resembling our reality.<br />\nThe game’s protagonist is called War, the first Rider of Apocalypse from the biblical stories. His story is tied to his own mistakes, and the player has to restore order and the main character’s good name. Coincidentally, the actions that can be performed by the player include masterful executions, implementation of a wide variety of weapons, and many more brutal exercises of power. The role-playing elements will help the main character progress through the game and add more flavor to the gameplay.<br />\nThe Warmastered Edition, compared to the original game, improves in graphics, performance, and overall quality-of-life features, making the player’s experience most smooth, and allowing to be run on the most powerful gaming rigs.</p>', 'https://media.rawg.io/media/games/1f1/1f1888e1308959dfd3be4c144a81d19c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/4c2/4c228a8e5c8c1965e98f9b449277f65d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/acf/acff7948771222dcd9cf42ac6ca9d1a5.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/6a0/6a0ba9fc17733469c50937d26c603581.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c68/c689a3759a5409711e3259d4e6bce4d4.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/057/057c2eb728b5ba7c5fe4cdf622dd04b3.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/48a/48a28e4260dd61aad5ac78e01f007fa2.jpg\";}', 12.99, 0, NULL),
(22, 'Assassin\'s Creed II', '<p>Assassin&#39;s Creed II is the second installment in the AC series, the center of which is stealths kills, exploring the world and enemy encounters. It is the straight sequel to the first part of the series and the beginning of the Ezio — the protagonist — trilogy, followed by &#39;Brotherhood&#39; and &#39;Revelation.&#39;<br />\nThe events take place in Rome, during the Italian Renaissance (1476-1499), we play as Ezio Auditore and are fighting against Knight Templar, being the Assassins. At the same time, all of the installments within a series are connected with each other by the Desmond storyline: all of the enchanted worlds he travels to are just simulations achieved through using &quot;Animus&quot; — a particular device which gets in the DNA and allows its user to drive around their memories. <br />\nThe game involves following mechanics — presuming the player to chase around some target, not moving to close, but not getting far at the same time; exploring quests — the heart of movement mechanics is parkour, and fighting — hero&#39;s arsenal involves swords, spears, and other melee weapons as well as ranged ones: bows, crossbows, and javelins.</p>', 'https://media.rawg.io/media/games/1be/1bed7fae69d1004c09dfe1101d5a3a94.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/e73/e731183e3f545daa3283ca29f4f254cc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/fe9/fe9db29056872c1699dde43155c16329.jpg\";i:2;s:88:\"https://media.rawg.io/media/screenshots/65b/65bced397e2946d6880238c6f9ffddb4_ai30aa1.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/96e/96e16a1458f1606b2df4d1a623f62b61.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/447/4470e0dace64fe81b0e1a8bafc0f4686.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/02b/02bfb9bd79a284db6c9acf5fd30fb8d3.jpg\";}', 12.99, 0, NULL),
(23, 'Metro 2033 Redux', '<p>Metro 2033 Redux is a rebuilt extended version of the original post-apocalyptic first-person action shooter Metro 2033. The game saved its pace and atmosphere of the gone world and except numerous technical issues, added several survival elements to the gameplay. The main plot is based on Dmitry Glukhovsky’s book Metro 2033. According to the storyline, the Earth was devastated by the nuclear war, and only a few people were able to survive hiding in the underground warehouses. Players assume the role of Artem, 20-year-old inhabitant of Moscow underground, whose aim is to learn more about the anomalies called the Dark Ones. With the remastered version of the game developers added some visual effects: new high-quality textures, shaders, dynamic light and weather (on the surface) systems. The gameplay was also extended with various realistic features like bots’ intelligence and collectible resources count. Within the game, players face two new difficulty settings (Survival and Spartan), which are expected to improve the gaming experience.</p>', 'https://media.rawg.io/media/games/4fb/4fb548e4816c84d1d70f1a228fb167cc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/432/432cf94eb1f25d7415f05def5d18cedc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/82c/82cb9461b5ad0ebdb6edc4b3acdfb731.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b95/b957aad3c646822893fe084ae6bf7652.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8f5/8f5ebd97e68dd1e16d008c7be452afd7.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/dd5/dd59314b82f1d7eb3631a6fa54af3072.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/19b/19b46c6f0cb02c9e3791d15d8da4bbf1.jpg\";}', 12.99, 0, NULL),
(24, 'Metro: Last Light Redux', '<p>It is the sequel to the game Metro 2033. Both games are based on the world of Dmitry Glukhovsky&#39;s novel Metro 2033 - in post-apocalyptic Moscow, in the tunnels of subway lines groups of very different people survive. And not only people. There are mutated people there, and mutated animals. They are distinguished by unusual abilities, but even more - behaviour strategies. In the struggle for the remnants of resources, all these beings spend their gloomy days.<br />\nAll characters use unusual and unexpected means for life and war. Something is created from the remnants of a past, normal life, something has already appeared in a new, changed world.<br />\nLocations are struck by an unusual synthesis of the ruins of a known world and traces of a catastrophe.<br />\nFrom the previous game Metro: Last Light differs, according to general opinion, by careful work on the remarks and shortcomings of the previous game. The set of weapons is significantly expanded, the technologies of Metro 2033 have become more developed.<br />\nThe game has two fundamentally different endings and five additions.</p>', 'https://media.rawg.io/media/games/7a4/7a45e4cdc5b07f316d49cf147b083b27.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/111/11118bdcf7cd62d35f63826c79983e16.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/11b/11b420a51d555aad055e37916b112fd1.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/7ba/7ba241860b68b0a5fe0cda616bde2596.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/9d3/9d3b567749527447580bcb9df1c894bb.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/97d/97dd78e4e9051b1529313480789b63ab.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0d2/0d26738855784b7997b1569fa4979400.jpg\";}', 12.99, 0, NULL),
(25, 'Middle-earth: Shadow of Mordor', '<p>Lord of the rings franchise brought a new title to the collection, an open world action-adventure game, that follows Talion, Gondor captain, that survived the sacrifice that was meant to bring the Elf Lord Celebrimbor as a wraith. Losing his wife and his son, Talion is merged with Celebrimor, escaping death.  Players will have to gain EXP in order to upgrade abilities through completing various missions and defeating Uruk warlords. Some missions might require special conditions for the greater reward.<br />\nShadow of Mordor implemented the Nemesis System. It tracks the progress of every special Uruk warrior. Each special Uruk has a set of strengths and weaknesses, and players can assassinate higher ranked officers in order to promote easy to defeat Uruk to defeat them at a higher rank, weakening the Sauron’s army. This planning allows players to adapt, and use mechanics of stealth kills, ranged combat, wraith skills and head-on melee more effective.</p>', 'https://media.rawg.io/media/games/d1a/d1a2e99ade53494c6330a0ed945fe823.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/123/1239cbfc3e25664170e8c1d5049a6d91.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/47c/47cf2d5a0c37a6262a431a490a57d58d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9e7/9e7f6fad3ee317a7edf7f3bc6001ba9d.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/97f/97fdbb526196705e25ee503bc248b63f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/770/77011e668d64fe192691d56f364fb561.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/1f2/1f2851c47112ca8e1edf7c2c377632a9.jpg\";}', 12.99, 0, NULL),
(26, 'Hotline Miami', '<p>Several chapters of top-down shooter action, Hotline Miami is a violent game, where the player takes control of the unnamed man, that receives orders to clear out stages from bandits and mobsters, using every weapon he can get. Over the course of the game, the player will be able to collect the masks that provide buffs and abilities. Fluid and tight combat includes various melee and ranged weapons, that can be used as intended or just thrown at the enemy. Once Jacket, dubbed so for his distinct letterman jacket by fans, arrives at the mission, players will have to clear out every floor from the enemies, using rooms and doors for cover or ambushes. As the story moves on, Jackets mental health will visibly deteriorate, and he will be shown to suffer from hallucinations, which is in tone with acid 80’s theme.</p>', 'https://media.rawg.io/media/games/9fa/9fa63622543e5d4f6d99aa9d73b043de.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/38b/38b9bb0de0a380434b78587e132b2e21.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e7a/e7a11a669aa609b9b3b0c7aeab2dc804.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/88b/88b907144995e57c45ee043c59dd6810.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/53f/53fd44fd759bc571b1445898c50b418e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ddd/dddc7151559716c7c0dddb05874496da.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b2a/b2a25c20510e3111a13d56a9751cadd7.jpg\";}', 12.99, 0, NULL),
(27, 'Metro 2033', '<p>Not all post-apocalyptic stories begin in the burned wastelands, this time nuclear and chemical locked up survivors in the Moscow Subway, and player will take the place of Artyom, one of the survivors from the VDNKh, adoptive son of the station commander, and taking upon himself the task to deliver information about the Dark Ones to the Polis, the capital of subway, after the special operative from Spartans named Hunter went missing, after he ventured to gather information on the Hive – living space of the Dark Ones.<br />\nDark tunnels of broken subway create a claustrophobic atmosphere, where good and bad people alike are forced to bond. Closely following original book, Metro 2033 introducing bullets as currency. Players can exchange one type of bullets for another one, but it’s still ammo and will be wasted with inaccurate aim. It’s a first person shooter that will allow players not only see how broken apart can society become but to explore such society and ruins of the city above the underground settlement. Various monsters and mutants are not the only threat to the players, but humans as well. FPS with some stealth sections, Metro 2033 will show you every historical enemy type: bandits, Communists, and Nazis.</p>', 'https://media.rawg.io/media/games/120/1201a40e4364557b124392ee50317b99.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/e79/e7946cab379370fdef03c2e2c9dfcce3.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/ad4/ad433938bd2377b1beaa8a184bb67405.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/28e/28e63b7f13e9ec24ad64ef5ae75e258c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b99/b99a0bf0f09991d76ad13c65f7e64562.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/df1/df1aa556c727ad4f4753dbb9e43875c0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/94b/94bcd09e75c34712fa85ea6b4945a57c.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(28, ' The Witcher 3: Wild Hunt', '<p>The third game in a series, it holds nothing back from the player. Open world adventures of the renowned monster slayer Geralt of Rivia are now even on a larger scale. Following the source material more accurately, this time Geralt is trying to find the child of the prophecy, Ciri while making a quick coin from various contracts on the side. Great attention to the world building above all creates an immersive story, where your decisions will shape the world around you.</p>\n<p>CD Project Red are infamous for the amount of work they put into their games, and it shows, because aside from classic third-person action RPG base game they provided 2 massive DLCs with unique questlines and 16 smaller DLCs, containing extra quests and items.</p>\n<p>Players praise the game for its atmosphere and a wide open world that finds the balance between fantasy elements and realistic and believable mechanics, and the game deserved numerous awards for every aspect of the game, from music to direction.</p>', 'https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1ac/1ac19f31974314855ad7be266adeb500.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6a0/6a08afca95261a2fe221ea9e01d28762.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/cdd/cdd31b6b4a687425a87b5ce231ac89d7.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/862/862397b153221a625922d3bb66337834.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/166/166787c442a45f52f4f230c33fd7d605.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/f63/f6373ee614046d81503d63f167181803.jpg\";}', 12.99, 0, NULL),
(29, 'The Last Of Us Remastered', '<p>The Last of Us is a post-apocalypse 3rd person adventure with a distinct focus on naturalness and photorealistic graphics. It is the first title in the IP, followed by the second part, coming out in 2019 by Naughty Dog, mostly known for &#39;Crash Bandicoot&#39; and &#39;Uncharted&#39; series.<br />\nYou play as Joel, delivering small requests in America, the year 2033, precisely 20 years after Cordyceps fungus catastrophe which have turned human hosts into infected shrooms. Your next quest is to deliver 14 years-old Ellie, immune to the virus to the hospital in the other end of a state. It is a usual story of two characters getting along throughout their journey.<br />\nYou need to fight fungus infected and usual soldiers, patrolling the territory — ammo and health are of the essence here, because it is post-apocalypse and everyone is short of resources. You face multiple encounters with bosses, various traps, and numerous puzzles. Let alone the number of collectibles telling a complete story of an epidemic world.</p>', 'https://media.rawg.io/media/games/364/3642d850efb217c58feab80b8affaa89.jpg', 'a:6:{i:0;s:81:\"https://media.rawg.io/media/screenshots/5a7/5a74e852355169e1767f3b59d5488829.jpeg\";i:1;s:81:\"https://media.rawg.io/media/screenshots/a4b/a4b8e8d4d56d1889f76872da7364e406.jpeg\";i:2;s:81:\"https://media.rawg.io/media/screenshots/1ba/1babd5640e3eed7646b6f2834daab303.jpeg\";i:3;s:81:\"https://media.rawg.io/media/screenshots/9ce/9ce9018611e2931782b87ef8b4bcd012.jpeg\";i:4;s:81:\"https://media.rawg.io/media/screenshots/5c9/5c9c1f58a945bb06f5467587a9d6d0e4.jpeg\";i:5;s:81:\"https://media.rawg.io/media/screenshots/6ea/6ea8e1f3d812f7218f9205c1dd658147.jpeg\";}', 12.99, 0, NULL),
(30, 'Apex Legends', '<p>Conquer with character in Apex Legends, a free-to-play* Battle Royale shooter where legendary characters with powerful abilities team up to battle for fame and fortune on the fringes of the Frontier. Master an ever-growing roster of diverse legends, deep tactical squad play, and bold new innovations that level-up the Battle Royale experience—all within a rugged world where anything goes. Welcome to the next evolution of Battle Royale.</p>\n<p>Characters you can play as: Caustic, Bangalore, Bloodhound, Crypto, Gibraltar, Lifeline, Loba, Mirage, Octane, Pathfinder, Rampart, Revenant.</p>', 'https://media.rawg.io/media/games/737/737ea5662211d2e0bbd6f5989189e4f1.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a59/a593423f503eae7f29cd642827cda18d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e7a/e7a1e5ec1b9861c340cdbef43bb47678.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/76e/76e5b435f9ba8ed79da0e5dd25762075.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b4b/b4b3c320a4a3965d5da85406dcd05b77.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/52a/52a0266fde34d2a24f4ad6aee3da5051.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/05a/05a9a772ede23255689d1218b3b9a728.jpg\";}', 12.99, 0, NULL),
(31, 'Detroit: Become Human', '<p>In the future world, androids do almost everything that people do - they even start to think and feel. Although no one taught them this.</p>\n<p>The plot of &quot;Become Human&quot; is built around three characters, each with a separate storyline, but they eventually merge into a single picture.</p>\n<p>Connor is a police investigator and android. He has a simple task - to find androids, deviated from the path given by humans. He has a special vision, it allows him to see events as they happened. And the more information he collects, the higher his chances of acting correctly.</p>\n<p>Kara is an android-housekeeper which spontaneously develops self-consciousness. As a result, Kara assumes responsibility for the fate of the little girl whom she worked as a sitter for. She, along with the girl, escapes from the house as a result of a conflict with her father, the owner of Kara.</p>\n<p>Markus is a caretaker android. He also acquired self-consciousness and came to the idea that androids need freedom. He has the ability to grant androids free will and to calculate the consequences of some actions.</p>\n<p>The story develops depending on the decisions taken by the characters. Some decisions have to be made quickly. Sometimes a player can return to the moment of making a choice and replay the situation.</p>', 'https://media.rawg.io/media/games/951/951572a3dd1e42544bd39a5d5b42d234.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fb7/fb7490f7764ba05e7984a970ee1918d5.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/586/586a30aeef1b41a80d781c742ab4fe68.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5e2/5e2affea5ffc1a5c1ae8c5cc0c0c3ce1.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/631/6319d4cc8955831dfa50dcc4f231dc9b.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9c3/9c33b6424ced85f84271a62356b74950.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2d3/2d36bd87554caba0ae7462c6d17e605a.jpg\";}', 12.99, 0, NULL),
(32, 'Cities: Skylines', '<p>Cities: Skylines is a traditional city-building game, which allows players to experience urban planning in all aspects including zoning, road placement, transportation, taxation, and improvement of welfare. Therefore, within the game players are able to assume roles of city’s principal architect and mayor. The history of the city, in control of the player, begins with the 2-by-2 kilometers plot of land and a sum of money to start with. Players have to zone the city, build roads, explore the surroundings, provide infrastructure and jobs to attract new citizens. Once the newcomers settle down, the immediate reaction is expected to establish public services and to set proper taxes. Progressing within the game and developing the city will unlock new upgrades of the urban environment and lead to the territorial expansion. The gameplay also requires the control of several city’s parameter scales like budget, health, employment, and pollution. The game also features a creative sandbox mode, where the architect’s imagination is not restricted in any way.</p>', 'https://media.rawg.io/media/games/25c/25c4776ab5723d5d735d8bf617ca12d9.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c0c/c0c098666e5ee532a8b1459fce1b3a01.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/702/7021e966d68ab8ccc76f859d30d925fe.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/15d/15dc7309784c53b75ae05ec95c347d9e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2e7/2e7924d7f3bf1a61498ece6e89edd26c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/030/0308db992eac77d507240ae7d6874dd1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e03/e03e7124d4aea8276a6281fb760fb5ce.jpg\";}', 12.99, 0, NULL),
(33, 'Path of Exile', '<p>Path of Exile is inspired by Diablo II and follows it basically in most of the aspects. Randomly filled pre-set of locations, heavy grind and a possibility of replaying most of the areas leaves us with only one possible outcome. </p>\n<p>Players wake up on grim shores of Wraeclast. Without any knowledge who we are or what have we done, players must start to explore an aggressive and cruel fantasy world of criminals, bandits and murderers. Discover the mystery of a long forgotten the Eternal Empire, and survive.</p>\n<p>Mechanics are pretty simple. Choose one of six different classes, gather gems for more skills to use and grind good and synergising equipment. Due to replaying, you can grind any needed equipment or resources to buy it from vendors. Infinite loop of gameplay will still be challenging. The cooperative mode allows beating the game with a party of friends up to six people at the same time.</p>', 'https://media.rawg.io/media/games/d0f/d0f91fe1d92332147e5db74e207cfc7a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a5d/a5d0fcbe81728387c396d1643480c8b9.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/756/7567039877f95cf47333503925c62aa2.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/4db/4dbb68a20d12cc5667a88430b3e47bdf.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/77a/77af4e7670499a9d637e4cb8a0312d09.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c95/c958615c946d6c865bf697afdf7cd995.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e87/e87093d3b9d8866c9b3d759ee5435f0c.jpg\";}', 12.99, 4, NULL),
(34, 'War Thunder', '<p>War Thunder is a free-to-play cross-platform vehicular combat MMO with more than 1000 playable aircraft, helicopters, tanks or ships sprawled over huge maps that feature real-life locations and battles that transpired over the course of 20th century, most notably during WWII. </p>\n<h3>Gameplay</h3>\n<p>Air and land warfare pits 2 sides against each other up to 32 players who must battle over points or achieving total elimination against enemy forces across huge maps. There are also PVE missions including dynamic historical campaigns and solo missions plus the custom events that add limitations or put certain victory conditions.</p>\n<h3>Changes</h3>\n<p>Back in 2013 War Thunder featured 50 vehicles from the German and Russian trees of air forces and a small selection of maps to choose from. Over the course of the open beta and up to the original release in December 2016, the developers have added over 800 land and air vehicles spawning from British, Japanese, American and other vehicle trees, expanded the map selection, upgraded the interface and tweaked out the graphics and sound for better optimization.</p>\n<h3>Recent updates</h3>\n<p>Now War Thunder also has naval battles and with the latest update added helicopters to the mix. All the while constantly maintaining the game’s balance, polishing the visuals and the impeccable sound design, fixing bugs and implementing new features.</p>', 'https://media.rawg.io/media/games/d07/d0790809a13027251b6d0f4dc7538c58.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/7c7/7c7758e4b3683403ef125281787ee5c2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/0f9/0f9f9c1a1ae5d5cc9527d7ec01168fcc.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/89e/89e8bf4807f88a40e930b755d01939cb.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/334/334c86f83ca567ce7b5da169c013fa25.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b65/b6506bf5ae9aa6b73ff095cc4c01ec79.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/f96/f96760353d0ff6ac946e470519d27efb.jpg\";}', 12.99, 0, NULL),
(35, 'SOMA', '<p>SOMA is a sci-fi survival horror that makes you rethink the description of death. You play as Simon Jarrett who was injured in a crash accident and agreed for an experimental operation on his brain. He wakes up at an abandoned underwater facility full of mutants. Trying to figure out what’s going on, Simon finds Catherine Chun, a scientist, who tells him about the technology of copying the human personality.<br />\nThe gameplay is based on exploration and puzzle solving. There&#39;s no combat, and you are meant to avoid enemies and act stealthily. To progress through the story, you need to search for clues, read multiple notes and solve puzzles.   <br />\nThough there are monsters in SOMA, it frightens with its atmosphere in the first place. A dark, abandoned station with dead people, uncertainty and the lack of any understanding of what is waiting for you is scarier than screamers and blood rivers. Moral choices you have to make don’t affect the story much: instead, they change your attitude to the events, so it’s you who develops through the game.</p>', 'https://media.rawg.io/media/games/149/149bbed9d90dc09328ba79bbacfda3c8.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/716/716d7f6375deacddb2a8a02d5bb250cc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/643/6437df18ef17b933be91eb8b39616733.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/93f/93fbfbff4c667caa9abb49fe8b481267.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/025/025aaed5d4cf059a2fef33b1b79c624b.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/de8/de8441ed1d270cb0bb802a98556d6288.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/982/98290cf4aa121cda5e3988b71442f61d.jpg\";}', 12.99, 0, NULL),
(36, 'Watch Dogs', '<p>In WATCH_DOGS you play as Aiden Pierce. A professional hacker that can do anything that he pleases with the city due to a new electronic system that now controls almost every aspect of the city - ctOS. By using Aiden&#39;s phone, you are able to penetrate any device in the whole city and do whatever you want it. For example, you can hack through someone phone and rob his bank account, or gain control camera system and observe things around you. </p>\n<p>But after one heist that goes wrong, Pierce must hide his family. But while riding to safety, his car is shot by a mercenary called Maurice Vega, and Pierce&#39;s niece dies. Interrogating Maurice did not lead to any clue who hired him, and when he returns in the city, he falls into a whole war between the hackers, involving his former partner Damien Brenks, hacking syndicate DedSec and other characters in the game. By blackmailing Aiden, he is forced to help the hackers in order to save his family.</p>', 'https://media.rawg.io/media/games/879/879c930f9c6787c920153fa2df452eb3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/6f0/6f072ce2d5d33350bfb2554e58e8a41b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/8f4/8f47d4bfd8599ec9c3d0e81191ecd7c6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c87/c87c3e6fac1ceed68605f6da0bf40b30.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2bd/2bd61fd5bad2458417e55f373a3097a2.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a64/a64cf2b3fcfd721cd244a853549781a8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/75d/75d8c7a73df54bc579ffde1662354791.jpg\";}', 12.99, 0, NULL),
(37, 'Just Cause 3', '<p>Just Cause 3 is an open-world action adventure with the large locus on freedom of exploring. It is the thirds title in the Just Cause series produced by Avalanche Studios, preceded by the first two numerical parts and having the 4th part not yet released as its successor.<br />\nRico Rodriguez is the protagonist of the game, who is continually being forced to deal with bandits and dictators somewhere in the Mediterranean. The events of the third game in the series take place 6 years after the second installment. <br />\nAny game of this category is strongly associated with complete freedom of roaming, and the third part pushes all the metrics up: you now have 1 000 square kilometers of space to wander around and upgraded hook which has allowed you continuously to overcome any obstacle. The grappling hook works like a universal tool: you may drag your enemies closer Skorpion-style, climb mountains and cling to foe&#39;s cars. <br />\nNot only tools but physics provide unique exploring experience — the key word for them is an exaggeration for any event in the game looks like it was cut straight out of an action movie.</p>', 'https://media.rawg.io/media/games/5bb/5bb55ccb8205aadbb6a144cf6d8963f1.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/0dd/0dd5106115ca80c3af4f4901b25a2b47.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/777/77712cd02b54765cd0c5e4f7d054e150.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ce6/ce6e57483d44cee91d1962d7775b8e0d.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/dc4/dc419a4605ff9a1b227c50a74838e3ac.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/59e/59e389b494a7cbd1ab5f23a3bf243f67.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/bd0/bd0b533f3e3de4f1ea3e1a059d26ba1f.jpg\";}', 12.99, 0, NULL),
(38, 'Wolfenstein: The New Order', '<p>Wolfenstein: The New Order is the ninth instalment in the Wolfenstein franchise. A first-person shooter with a primary target - killings Nazis. You play as Captain William Blazkowicz in an alternative universe in 1946. You and your friend Fergus Reid are attacking the castle of General Wilhelm &quot;Deathshead&quot; Strasse, who&#39;s the main villain of the game. When the attack goes completely wrong, you have to help Captain Blazkowicz in getting rid of the Nazis in the USA. The games core mechanic is the ability to use two weapons in both hands, making every single encounter unique. Also, the game has a skill tree, which gives Captain Blazkowicz new ways of killing Nazis. This game will try to push you off limits, will provide you with a significant challenge and give you a decent story with memorable characters. Adrenaline, laughing and even some dramatic moments stuns the player as he travels through the world of Wolfenstein.</p>', 'https://media.rawg.io/media/games/c80/c80bcf321da44d69b18a06c04d942662.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/23a/23af906d70f57be798bbd83da986c6db.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b71/b716cf4d51be00d9561df3d1588383c4.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/439/4395d5364559ca15ac8e1becb100daea.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/0de/0de321f22cd1f5a7d0fb6b471f63c2d8.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/900/900e962d31b5ace3fb66bfd388d352cf.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a1d/a1d6bd9f3617e0787da4b0f8389fe1f0.jpg\";}', 12.99, 0, NULL),
(39, 'Amnesia: A Machine for Pigs', '<p>Amnesia: A Machine for Pigs is a first-person survival horror, an indirect sequel to 2010 title Amnesia: The Dark Descent. The gameplay is most parts identical to that of previous game and consist of exploring surroundings, solving puzzles, and avoiding monsters. Like in the previous game, your character is practically unable to confront monsters and has to hide from them to survive. However, there is no more sanity meter, and inventory in Machine for Pigs and puzzles are more physics-based than in The Dark Descent. <br />\nIn Machine for Pigs, you play as Oswald Mandus, a first game protagonist’s descendant, and successful industrialist. He recovers after a fever which lasted for a few months after a disastrous expedition in Mexico. Not remembering anything about it, later he finds out that he build a mysterious machine in the basement of his mansion and his house is full of swine-like monsters. The player must restore Oswald’s lost memories and reveal the secret of the machine.</p>', 'https://media.rawg.io/media/games/d9f/d9f982e042df6263684ba1fdea3efc1c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/082/082d4e88394d6b1d4905a4583c8034f8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/a28/a286bc5199fbc9f30a167037650fabc6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ff1/ff1155c15b92e30833dfacffb8fa5fa3.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b73/b73f332ac30b4b5ae93a461fdded98a1.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/7a7/7a79ab092b3db5aafe822d164c80c718.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/407/407e2d685e79cce6786c3baf58057ad2.jpg\";}', 12.99, 0, NULL),
(40, 'Bloodborne', '<p>Bloodborne is an action-RPG and another member of souls-like title series. The game has no predecessors or successors, making it the only entry with one add-on: “The Old Hunters.” The Bloodborne universe, however, also includes a comics and a board game.</p>\n<p>Generally resembling the Dark Souls series, Bloodborne, however, has some different mechanics and the pace of combat is increased thanks to the risk-rewarding battle system. Another difference is multiplayer, which comes in two kinds: you can summon other players into your game and fight bosses side by side or you can fight impostors, who are other players invading your playthrough.</p>\n<p>Throughout the game, you are forced to explore an enormous open world of Yharnam, which looks like alternate universe Lovecraft-inspired Victorian-era England, as The Hunter. You meet horrific bosses, explore vast areas, houses and open spaces while continually dodging, attacking and trying not to get killed by a massive number of hostile NPCs.</p>', 'https://media.rawg.io/media/games/214/214b29aeff13a0ae6a70fc4426e85991.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/75a/75a67f69575ebfc412a70cdde7fb8923.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/280/280b0e8492a247b718a3c14c41052a16.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/d8e/d8e17e4899561a0a25e0728541b1cac9.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/48c/48cfa5b44c1a6787971889bc7646ca47.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/472/472f9b7dfb71ac5d6880e94dd1c1a77c.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c6d/c6de8c602de1cf1798353aa83a830948.jpg\";}', 12.99, 0, NULL),
(41, ' Fallout 4', '<p>The fourth game in the post-apocalyptic action RPG series from Bethesda studious brings players back to the retro-future. After customizing the facial features of the character, players will be admitted to the Vault 111 with their family, and tricked into entering the cryogenic capsule. After the rude awakening after the unknown amount of time has passed, the child is separated from the parents and the loving partner is killed in front of them – the main quest is settled. Now there’s only the giant open world to explore. Fallout 4 introduces the mechanics of settlement building, where players can build their own little town. Gathering material for crafting and building brings more “survival” elements into the old formula. Within their own settlements, players will be able to build all needed utilities, from storage spaces to power armor stations. Visual upgrade from the previous game brings life to what used to be brown wastelands, now filled with details and color.</p>', 'https://media.rawg.io/media/games/d82/d82990b9c67ba0d2d09d4e6fa88885a7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f55/f5598897e0e418c67521f2213dceb459.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/37c/37ce90b25d84e531743917165115d24c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fd3/fd3a97519e6d1b73f429f6bfcfb3bcf5.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/069/0691b4c1b839e55531d8c3206cd83dd7.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/cc0/cc0b3e29b579faae8d8585fd9ecff142.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/99c/99c81029aeace339293753186246099f.jpg\";}', 12.99, 0, NULL),
(42, 'Hellblade: Senua\'s Sacrifice', '<p>A dark fantasy game that takes inspiration from Scandinavian and Celtic folklore, Hellblade is set in a gritty barbarian world full of weird wooden structures and creepily masked enemies. </p>\n<p>The player assumes the role of Senua, a traumatized female warrior from the Pict tribe. She suffers from a growing psychosis after her lover Dillion was brutally murdered by Vikings. Carrying his severed head, Senua sets out to Helheim, the underworld of the dead, to bring her lover&#39;s soul back. Her grim and bloody journey mirrors her descent into madness. It becomes increasingly difficult for her (and, thus, the player) to tell fact from fantasy, as she hears voices in her head and sees hallucinations. </p>\n<p>When not fighting her enemies, Senua has to solve puzzles to move forward. This is where her distorted perception actually comes out handy, enabling her to &quot;focus&quot; and see what regular people can not. The ghostly voices, recorded using the binaural method to create an eery effect, also help to guide Senua or to warn her about dangers. All of Senua movements, expressions and reactions were recorded through motion capture to make them more realistic and emotional.</p>', 'https://media.rawg.io/media/games/63f/63f0e68688cad279ed38cde931dbfcdb.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/662/66282cb9d0c743ca5d8cb8a1585c8207.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/ab2/ab28d353366cb9ed674758a25a3763e7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e43/e4362535f3d105d23315c5780ed67f8b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/567/567f1353c4163e59236450ea29136b51.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d83/d83116e14bfdfeb89a530334072c3051.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/261/2616c962157e03b5adae8686427aaa18.jpg\";}', 12.99, 0, NULL),
(43, ' Left 4 Dead 2', '<p>Cooperative survival continues with a different set of characters. New survivors are making their way through 5 campaigns with an added ability to play through the story of the first game as well, using not only expanded arsenal of 20 ranged and 10 melee weapons but improved AI Director. Your surroundings and weather will change; enemy and item placement will differ from map to map, from difficulty to difficulty. New unique special zombies, placed in the unlucky for the player spot, can end your run.<br />\nHigh compatibility with community mods will allow you not only to add user-created maps but player models, enemy models, and even in-game music, which will help any player to create the unique experience on top of solid game mechanics.<br />\nCompetitive multiplayer mods from arena survival to a head-on competition with another team of survivors are addictive and, in addition to the campaign, will provide you with hundreds of hours of game content.</p>', 'https://media.rawg.io/media/games/d58/d588947d4286e7b5e0e12e1bea7d9844.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/4c0/4c043fd1a5ff78900483f2e82580fea0.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/c90/c9071628c238fbc20b366e2413dd8b4a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e29/e293b0f98092b8c0dbe24d66846088bb.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/168/16867bc76b385eb0fb749e41f7ada93d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/fb9/fb917e562f311f48ff8d27632bd29a80.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/5f2/5f2ca569912add2a211b20ba3f576b97.jpg\";}', 12.99, 0, NULL),
(44, 'Mad Max', '<p>Although Mad Max is not related to the film series, it is based on its universe. Max Rockatansky is trying to reach the &quot;Plains Of Silence&quot;, place in which he believes he will finally find peace. He is confronted by a group of War Boys led by Scabrous Scrotus. Beating Max up and stealing everything from him, they leave him in the desert to face his death. Recovering from his injuries, he chases Scrotus in a duel but fails to defeat him. Wandering in the desert, he meets a technic named Chumbucket that helps him to build a new machine and revenge Scrotus. </p>\n<p>Being in such esthetics, Max is able to travel in an open world post-apocalyptic universe of Mad Max. Utilizing driving as a primary mechanic, you are able to confront and battle your way out on the car while armed with different weapons. Flamethrowers, turbo-boosts, basically anything that may come handy. You can have your preference for playing stealthy or aggressive. To drive, you need gasoline and to customise your car you need experience which you will get over time. Experience all the consequences of being a survivor by driving through the wasteland.</p>', 'https://media.rawg.io/media/games/d7d/d7d33daa1892e2468cd0263d5dfc957e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ca7/ca7933771fe1efbdc7f97b9f301dc7d8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/246/24670375d95895cf3e3b5de57f41900e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fb6/fb67103d3b044e202a96b2e08853861f.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/261/26141dec80cd1933390597e3a4eac780.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d8d/d8da5b7bae3c8084d30745ba6e17f1ef.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/793/7939b2e64a9520894c51696c2eed1c34.jpg\";}', 12.99, 0, NULL),
(45, 'FEZ', '<p>FEZ is a 2D and 3D game at the same time. Even though it is a platformer game in which you solve puzzles in the dimension your looking at, you can manipulate with the world itself by rotating it all around. Because of that very interesting mechanic that is not so popular in the industry, the game is actually is a 2D in a 3D world. In order to proceed from one level to another, you have to collect cubes or fragments of it. However, by rotating the world, you can actually gain access to some places that wouldn&#39;t be available without this mechanic. </p>\n<p>Gomez, our protagonist, must restore the order in his universe by passing through the levels and collecting little fragments of it. But he will face no threat at all. Your only challenge is to actually beat these quite peculiar puzzles, basically without any guidelines at all. As stated by a developer himself, this game is about &quot;stop and smell the flower&quot;, which makes it a brilliant stress-relief or a relaxing sort of the game with slow gameplay and nice atmosphere.</p>', 'https://media.rawg.io/media/games/4cb/4cb855e8ef1578415a928e53c9f51867.png', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f08/f083ed9be5ed890834ef0815f001d577.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/88c/88cb946b60c3d5d884607e38f20272b7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/abf/abf6ece1162a4776d043ef3eb90dec80.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e0c/e0cdab50bf9d971c3151324afdd3898c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e47/e47af843e11dd4640d55fe099f6acf15.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/f49/f49f3b47f9fff5ca5643d64ef81a4dbb.jpg\";}', 12.99, 0, NULL),
(46, 'Metal Gear Solid V: Ground Zeroes', '<p>Metal Gear Solid V: Ground Zeroes is a standalone prologue for the main entry of the series, Phantom Pain. As Snake now is the Big Boss, Ground Zeroes follows Peace Walker entry some little time after it. Considering that Paz Ortega Andrade has died, MSF starts to work in different ways when suddenly there is information that Paz is being detained by Camp Omega on Cuba. The situation becomes even worse when Ricardo &quot;Chico&quot; Libre is sent for rescue and being captured as well. Snake is now headed to Cuba to save them or confirm their deaths. </p>\n<p>Still being a stealth action game, spotting system has been changed in Ground Zeroes, as now there is now meters, and the player must navigate through his eyes and ears to understand if he&#39;s been spotted. Reflex Mode is also added to the game. When the player is spotted, there is a little gap of time in slow-motion to kill the enemy before he alarms everyone around him. As well now the iDroid system in the game can be connected to your phones in order to have a look at an in-game map.</p>', 'https://media.rawg.io/media/games/7ac/7aca7ccf0e70cd0974cb899ab9e5158e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d09/d095258c73a70e6c5089b9af2c64b2f6.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/351/351157b8573878821cf3ac0ea00175ae.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/512/5129df7049bc270ba6381fc06f48ab75.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f9f/f9fb16022e1ee4d892a80ce1086d21db.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a1f/a1fdda760d8aaadbc2adbf788e5a28f7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/05f/05f060b6adada26f48ec632562650883.jpg\";}', 12.99, 0, NULL),
(47, 'Metal Gear Solid V: The Phantom Pain', '<p>Metal Gear Solid 5 continues the story of MGS: Peace Walker and MGS V: Ground Zeroes. Snake seeks revenge for the attack on the MSF group 9 years ago, that placed Big Boss into a coma. After the failed assassination attempt, Big Boss takes the code name Venom Snake, delving back into the world of superhumans and espionage.<br />\nA large-scale story that includes 5 hours of cinematic cutscenes compliments open world exploration with hundreds of audio logs and side missions, forming the atmosphere of military drama with sci-fi elements. MGS5: Phantom Pain has an advanced AI system that will allow enemy soldiers constantly call for reinforcements if they see that something is wrong, forcing players to take down communications and fight or retreat and try again. <br />\nPlayers will manage the base by gathering and managing staff, weaponry, and resources, in order to upgrade their personal arsenal and companions.</p>', 'https://media.rawg.io/media/games/490/49016e06ae2103881ff6373248843069.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fa0/fa0cb095629729fb990079d0ec135dae.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/768/768087f6fbfae3b1fa7533c38bda35a0.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/40b/40bf3a64adc8e3b6ffadd1420b1bd250.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/344/3447022b021fb337970aaa16e9adfa1f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/410/41074cb7d1a80e15b16e5166f121c0e0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/535/5358bcad9e3c51816ffb923fcdd9938a.jpg\";}', 12.99, 0, NULL),
(48, 'Insurgency', '<p>Insurgency is a first-person shooter, which provides players with both PvP and co-op multiplayer experience. Unlike other shooters, Insurgency features a hardcore gameplay lacking the on-screen crosshair, health and armor indications, and mini-maps. For the more, each weapon instantly kills other players with one shot in the head and with the maximum of 4 shots in the body, which is quite realistic. As far as the action is set in the timeframes of the Iraq War, the two opposing sides are U.S. troops and Iraqi rebels. The gameplay is divided into 9 PvP modes (Push, Firefight, Skirmish, Ambush, Occupy, Infiltrate, Flashpoint, and Elimination) and 5 co-op modes (Checkpoint, Hunt, Survival, Outpost, and Conquer). PvP matches are held according to 9 various scenarios (depending on the chosen game mode) with the maximum of 32 player count (16 for both sides). To start a match, players have to select a character class and proper equipment. In the co-op game mode, players are offered to compete with AI during the completion of a specific game objective.</p>', 'https://media.rawg.io/media/games/1a1/1a17e9b6286edb7e1f1e510110ccb0c0.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/922/922e471de5fe1486b0fc54b260b2e2a2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/ac2/ac24fe8735ad0738ae7a4beaf293135f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c28/c28dc60beeb0b40e0c17470216d2ad07.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/fad/fad7a2fd1c84d7af4f9dd547ec5d2a3e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f15/f15776ddb8d0dce97bf659f16d714d00.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/8e1/8e1fc59e237432a1126d315fee628b80.jpg\";}', 12.99, 0, NULL),
(49, 'Thief', '<p>Thief is a stealth-action game, the 4th installment in the Thief series and the first game since 2004 Thief: Deadly Shadows. The game was made as an attempt to reboot the franchise. <br />\nJust as previous entries, the game takes place in the dark fantasy world with notable steampunk and Victorian era influence. You play as Garrett, the master thief who awakens after one-year slumber caused by accident in one of his missions. He finds out that his hometown is plagued by a mysterious disease “The Gloom.” <br />\nThe gameplay can be described as first-person stealth-action with the heavy emphasis on the variability of completing missions. Sneaking behind the enemies is usually a more effective way of performing tasks than openly fighting with them. Garrett possesses several different tools and weapons like lockpicks, prybar, etc. One of Garrett’s few weapons is bow which has 8 types of arrows and the full range of application from killing and poisoning enemies to putting out torches and distracting guards.</p>', 'https://media.rawg.io/media/games/59a/59a3ebcba3d08c51532c6ca877aff256.jpg', 'a:6:{i:0;s:88:\"https://media.rawg.io/media/screenshots/444/444174b321c5f80bd25b031175d02281_H4Bs5Sz.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/a97/a97a71a4e707f2b14edb7172675c3a05.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5f6/5f662ad51da15e9a9c975db6e44942f5.jpg\";i:3;s:88:\"https://media.rawg.io/media/screenshots/817/8175805712e56a8455ace4c7d11f47e1_EqhB1g9.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/030/030770a0631f7a5f7c0f342de15a3b8f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e14/e146fbe4c8c66dd568ebb7e6f1ea6b12.jpg\";}', 12.99, 0, NULL),
(50, ' Life is Strange', '<p>Interactive storytelling and plot-heavy games gained popularity, and “Life is Strange” arrived as teen mystery adventure. The plot will go through the life of Maxine, a teenager in possession of curious power, allowing her to stop and rewind time, in order to manipulate her surroundings. Max, after the reunion with her friend Chloe, is on the path to uncovering the secrets of Arcadia Bay. Players will have to deal with puzzle solving through the fetch quests, in order to change the world around them. <br />\nThe game puts players in situations, where they’re forced to make a moral choice, going through the decision which may have short-term or long-term consequences. Every choice made by the player will trigger the butterfly effect, surrounding the first playthrough of the game with a lot of emotional struggle, thoughtfully crafted by the developers at Dontnod Entertainment. Life is Strange is third person adventure game, where players might seem just as an observer of the stories, unfolding in front of them.</p>', 'https://media.rawg.io/media/games/562/562553814dd54e001a541e4ee83a591c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/edf/edfcbdf85f02f871263dabf1b4f0aa87.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/4c6/4c6da2f36396d4ed51f82ba6159fa39b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/6aa/6aa56ef1485c8b287a913fa842883daa.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/cb1/cb148b52fe857f5b0b83ae9c01f56d8e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/aea/aea38b33b90054f8fe4cc8bb05253b1d.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c1d/c1d6333b2da0f920e8de10c14d3c6093.jpg\";}', 12.99, 0, NULL),
(51, 'Super Meat Boy', '<p>Super Meat Boy is a fast-paced 2D platform game that rewards mechanical perfection and accuracy of controls. Meat Boy has to save Bandage Girl from Doctor Fetus, by completing the platforming challenges. The game has 5 main worlds, each consisting of 20 light levels, 20 dark and harder versions of those levels and a boss fight. Meat Boy has only one life and cannot take any damage, but there is no limit on attempts, so players can try and fail the stage until they get it right or collect special bandages. Unique replay system will show the player every try they made at the same time right after they completed the level.<br />\nSuper Meat boy has multiple characters, some of them are a different skin for Meat Boy and in-game adaptations of other indie-game protagonists, that can be unlocked by completing their special challenge levels, hidden somewhere in the campaign; or by collecting set amount of bandages. Players will be able to choose any unlocked character for any level from the main menu. The game gives players access to the community created maps, but even without it – Super Meat Boy offers more than 300 levels.</p>', 'https://media.rawg.io/media/games/e04/e04963f3ac4c4fa83a1dc0b9231e50db.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/b1e/b1e6c4d530035326da66fb85ae57519b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/09f/09f743bc5acc26aba844b3a092cdcddf.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/995/9951726156ed69933ec1eff9a65c0e60.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/db4/db4747c3913bd81e3e6754bb51a34838.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e1d/e1d4006f82564f0d654f2959042a3acc.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/14c/14c8b551343374231fa07987e5a2d9e3.jpg\";}', 12.99, 0, NULL),
(52, 'Half-Life 2: Deathmatch', '<p>Upon the release of Half-Life 2 players were greatly disappointed in one thing, and that’s the lack of multiplayer. Granted, single-player campaign of Half-Life 2 was impressive, but weapons that have been demonstrated in it made players curious. They questioned if the experience was complete because the first Half-Life included multiplayer mode from the beginning. Valve took the criticism and published Half-Life 2: Deathmatch – multiplayer only addition, based on the main game, which was a separate product, distributed on Steam. <br />\nThe game includes two major modes, which are Deathmatch and Team Deathmatch. Both modes have similar rules. Players must kill as many other players as possible, to gain points. Player or team with the most points win, and points are retracted for self-killing and team killing. Players can expect fast-paced matches with instant respawns.</p>', 'https://media.rawg.io/media/games/ec3/ec3a7db7b8ab5a71aad622fe7c62632f.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/8e7/8e7039ef354447c969a9fe82329ca50e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/0d0/0d0ff34c7bef12783cfe7c6dda7284b2.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/853/85349bbb51ad92fc351b61a89b6db19b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/1fc/1fcc71ae3d931406dbc4b33e3446d457.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c11/c11d517937d7261e9d357709ca3c3cc0.jpg\";}', 12.99, 0, NULL),
(53, 'Outlast', '<p>Cinematic gameplay is used to make a stylistic point, and this psychological horror game performs just that. Outlast follows the story of investigative journalist Miles Upshur, that got the lead on the inhuman experiments, performed on the asylum patients. Outlast forces players to run away from danger, simply because there is no combat system. All Miles can do is to document what is happening inside the Mount Massive Asylum. Players do not have a flashlight, only a night vision camera, which constantly requires batteries in order to function. Miles will be pursued through the halls, rooms, yards and enclosed laboratories by distressed and aggressive inhabitants. Over the course of the game, players will have to solve puzzles by locating and collecting items and travel through the Asylum with realistic movement animation and horror sting sound effect, in order to make players sympathize with the protagonists.</p>', 'https://media.rawg.io/media/games/9dd/9ddabb34840ea9227556670606cf8ea3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/83f/83ff600f8e2dd8507e7961d3e9f32126.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/283/283c90039e31e07f99979ccb445cf7b7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/03f/03f4171763bda5824da07fc087cec609.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/37a/37acd5ef186c8e018cbd64751b21f064.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/242/2426226b9eb1a7de43b8bf01ecb2c291.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/d06/d06d3baecb6da0ac9e53b40ade32d5f2.jpg\";}', 12.99, 0, NULL),
(54, 'Assassin’s Creed III', '<p>Assassin&#39;s Creed III is the fifth game of the series, preceded by the first chapter taking place in the time of the Third Crusade and by the Ezio trilogy, positioning itself in the times of the Italian Renaissance (1476-1499). It is the 3rd person action adventure with an accent on exploring and hunting<br />\nDuring the new installment, the player is set to make way through the American Revolution, while being on both side of a conflict — our hero has English father and Mohawk mother, which tears him apart. Such conflicts serve as the leitmotif through the entirety of a game — not only we are choosing sides to fight on in the Civil War, but also we are facing the decisions of choosing Assassins&#39; or Templar&#39;s side.<br />\nAs it is common in the Assasin&#39;s Creed games, the gameplay concentrates profoundly around fighting the multiple enemies all at once, parkouring off walls and micro-management: selling resources, exchanging ships and so on. The Assassin&#39;s Creed III, however, highlights the hunting and simultaneous use of two weapons as the new in-game features.</p>', 'https://media.rawg.io/media/games/275/2759da6fcaa8f81f21800926168c85f6.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/078/0781f8511a92fa31fea44ad56d13f7a7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/044/0442a134b0bd6f703f84ca9905176f0f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/cf7/cf721a31dc4c6187c0715587d9dcaed5.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/edd/edda41d9bd671c9556c392c7c48ff141.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b7b/b7b98bee0fd0ff1f1e79ba8fb94ff864.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b5e/b5e79ea8adddfd6886332fca2c93914d.jpg\";}', 12.99, 0, NULL),
(55, 'Assassin\'s Creed Origins', '<p>Assassin&#39;s Creed Origins is an open-world action game developed by Ubisoft. It further continues the series after Assassin&#39;s Creed Syndicate.</p>\n<p>The story is set in two time periods simultaneously. In 2017, the order of Templars has recovered an ancient artifact that will allow them to seize control over humanity. Assassins plan to get the artifact back in their hands. Layla Hassan relieves the memories of two ancient Egyptians named Bayek and Aya who create the Assassins order.</p>\n<p>Levels are open-ended which allows both stealth or open combat approaches. Players are put in an open world in which they can complete quests in order to either progress through the story, level their character up or upgrade their equipment. The &quot;eagle vision&quot; mode was replaced by an eagle by the name of Senu. Players can use Senu to scout the area ahead and highlight enemies.</p>\n<p>The game features a heavily revised combat system that relies on hit-box mechanics rather than pre-determined animations as it did in the previous titles. Origins focuses on introducing various types of enemies that the players will have to learn about in order to defeat them.</p>', 'https://media.rawg.io/media/games/336/336c6bd63d83cf8e59937ab8895d1240.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5c8/5c8c5889c81eb226b182e6df4018a29a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/0cf/0cf5ed35a3906f32967cb476c11c5d49.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/313/3132876284966c4d055d752e7edc5509.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b3f/b3fe4ade2ed930cbd8253269ff38ba28.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/2d7/2d7a5c1b08e5cc5bc7c371094376637c.jpg\";i:5;s:81:\"https://media.rawg.io/media/screenshots/0a2/0a24d82ed3f2d35726d17e4c73593721.jpeg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(56, 'Middle-earth: Shadow of War', '<p>Middle-earth: Shadow of War is a continuation of Middle-earth: Shadow of Mordor<br />\nThe game operates on the world and the characters of the books of JRR Tolkien. However, it will be more accurate to say that the game is closer to the cinematic version of this story, created by director Peter Jackson. This is noticeable both in the visual solutions of some locations, and in the events themselves and their location in time relative to each other.</p>\n<p>Judging by the events, the game takes place between the events of the books &quot;The Hobbit&quot; and &quot;The Lord of the Rings&quot;. However, in the game there are also such events as the fall of the city-fortress of Minas Ithil and its transformation into Minas Morgul - in books these events occur several thousand years earlier.</p>\n<p>As in Middle-earth: Shadow of Mordor, in the game Middle-earth: Shadow of War, the Nemesis system operates. This system provides a change in the world of the game and its inhabitants from the actions of the player. Therefore, each passage differs from other passages. For the game Middle-earth: Shadow of War, the Nemesis system has been improved.</p>\n<p>If the player has the game Middle-earth: Shadow of Mordor, he can transfer to Middle-earth: Shadow of War some characters from the previous game - one enemy and one ally.</p>\n<p>The player controls Talion. Taleon is obsessed with the spirit of the elven ruler of Celebrimbor. Taleon tries to use one of the rings of power to build an army of orcs and trolls and fight with Sauron and his generals.</p>', 'https://media.rawg.io/media/games/21a/21ad672cedee9b4378abb6c2d2e626ee.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c2a/c2ac323d687f1f07fc1a98ee30139b17.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/37a/37a9ac78cbaf36661d1bcf5f9f799cf0.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5bc/5bcdd5a3cfeba374a2d6c4a7ba79e684.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2f6/2f6461df4db6815f7e9fa848a290d522.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a93/a93ee6ee0035b636b512adfe26b3b2d3.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/80a/80a7e781dfc09d7f54078e3381b65e99.jpg\";}', 12.99, 0, NULL),
(57, ' Red Dead Redemption 2', '<p>America, 1899. The end of the wild west era has begun as lawmen hunt down the last remaining outlaw gangs. Those who will not surrender or succumb are killed. </p>\n<p>After a robbery goes badly wrong in the western town of Blackwater, Arthur Morgan and the Van der Linde gang are forced to flee. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him.</p>\n<p>From the creators of Grand Theft Auto V and Red Dead Redemption, Red Dead Redemption 2 is an epic tale of life in America at the dawn of the modern age.</p>', 'https://media.rawg.io/media/games/511/5118aff5091cb3efec399c808f8c598f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/7b8/7b8895a23e8ca0dbd9e1ba24696579d9.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b8c/b8cee381079d58b981594ede46a3d6ca.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fd6/fd6e41d4c30c098158568aef32dfed35.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2ed/2ed3b2791b3bbed6b98bf362694aeb73.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/857/8573b9f4f06a0c112d6e39cdf3544881.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/985/985e3e1f1d1af1ab0797d43a95d472cc.jpg\";}', 12.99, 0, NULL),
(58, ' Destiny 2', '<p>Destiny 2 is an online multiplayer first-person shooter. You take on the role of a Guardian that needs to protect the last city on Earth from alien invaders. The game follows its predecessor, Destiny. The goal of the game is to return the Light that was stolen from the Guardians by the aliens.<br />\nDestiny 2 features two main activity types: player versus environment and player versus player. PvE is focused on exploration, story missions interaction with NPCs and side quests. PvP features 4v4 team matches in different modes. The game also allows taking part in group missions, such as three-player strikes and six-player raids.<br />\nDestiny 2 has a strong RPG aspect that includes character customization and development. There are three classes in the game - Warlock, Hunter, and Titan; they provide different playstyles depending on their specialization and unique abilities. To develop the character you can gain experience points completing the story and side missions.</p>', 'https://media.rawg.io/media/games/34b/34b1f1850a1c06fd971bc6ab3ac0ce0e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/818/818cc34134cb22fb18fda8edec7144a3.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/003/003a559bc0b47a4e5f2928f18a8d9142.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/75d/75d8fbb3254f5b06f1a3f9a026d9c122.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ca3/ca3bdc1a51fc90a96c860ab6db8a313c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/575/5751a70c954618a99ec574f32be7ad43.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2e7/2e7304d3b9e670f943d0bd1e4be090f0.jpg\";}', 12.99, 0, NULL),
(59, 'Prey', '<p>Prey (2017) is a single-player sci-fi first-person shooter developed by Arkane Studios Austin and published by Bethesda Softworks. While it is technically a reboot of the 2006 game of the same name developed by Human Head Studios, of which the sequel suffered a fall into development hell before the license was sold to Bethesda Softworks, there is no relation between the stories and universes of the two games.</p>\n<p>The game is set in the near future of an alternate reality. You find yourself stranded on the Talos I space station, invaded by hostile aliens referred to as the Typhon. To survive, you must explore Talos I in search of weapons and resources to fight off the invaders. Along the way, you&#39;ll use neural modification devices to learn skills and psychic abilites.</p>\n<p>Prey&#39;s gameplay loop takes heavy inspiration from System Shock and Bioshock. The game received critical acclaim for its gameplay and its atmosphere. Prey received one paid DLC extension called Mooncrash which introduced a roguelite mode and a free update called Typhon Hunter which introduced a multiplayer mode inspired by classic prop hunt.</p>', 'https://media.rawg.io/media/games/e6d/e6de699bd788497f4b52e2f41f9698f2.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9c6/9c673f6c2437854b3112868e986aba8c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3d7/3d7b9ac75113f6fb3e3ceffbfae03483.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c0c/c0ca4b435c59c3af12b270d03ca565a5.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/efa/efae873b6df0b9371b5bbf5f7dfe3ee7.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/4ba/4baf33e8e47e6750b85942f49d21c427.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b3e/b3e3f695d8d55acdc23904082edd42d6.jpg\";}', 12.99, 0, NULL),
(60, 'Assassin’s Creed IV: Black Flag', '<p>Assasin&#39;s Creed IV: Black Flag is a pirate game. Being the fourth “numbered” instalment in the series, the story follows a new protagonist, Edward Kenway, who tries to build his Pirate Republic. Help legendary pirates like &quot;Blackbeard&quot;, Charles Vane and other well-known pirates establish their empire while fighting the mystery of the Observatory - something very valuable for the Templars. Also, you will have to continue your infiltration in Abstergo and discover some new details about itself.</p>\n<p>Although being in the Assasin&#39;s Creed series, the game provides you with some new mechanics. Giving the player full control of the ship, you will have to cross the open-world sea and fight for your piracy. Ships will be sinking, destroyed and massacred. If you prefer exploring, a whole new underwater world is ready for you with its beauty and danger lurking in the streams of Carribeans. Experience the pirate life at its best. (?) (needs a better ending)</p>', 'https://media.rawg.io/media/games/849/849414b978db37d4563ff9e4b0d3a787.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/46d/46de97777c05efb26597b215735dcd84.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/162/162503bb903edd7cfddf2a49ecdf5b7d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9ad/9ad8aa17d3f2be9545273f895e481280.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b02/b02b168d04889304aac23e47f5314721.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ad8/ad8439bc9ed7d2f88deb836c9cff23d2.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/398/398abeb965880c1c3310a6a4ad9c71b8.jpg\";}', 12.99, 0, NULL),
(61, 'Little Nightmares', '<p>Heavily inspired by Limbo and Inside, Little Nightmares are telling a story of another lost child. Six is a starving little girl in a yellow raincoat, which is trapped in a mysterious vessel named the Maw. Players are taking control of Six’s movement, in order to help her escape the ship and dangerous inhabitants, that’s been kidnaping and preparing children to be served as a feast for the Guests. <br />\nThe control scheme is not including any combat moves, leaving players defenseless against any threat. Six can run, crawl, climb, push or pull, and in rare cases carry an object she can throw to stagger an enemy or solve a puzzle. The game gives players the ability to carry a lighted match at any time, inviting players to explore and search for the collectible statues. <br />\nLittle Nightmares have 3 DLC levels, expanding the game beyond the perspective of Six, where the Runaway Kid, a young boy, who is trying to catch up to Six and having his own adventure, going through the Maw in the extra chapters, named “The Depths”, “The Hideaway” and “The Residence.”</p>', 'https://media.rawg.io/media/games/8a0/8a02f84a5916ede2f923b88d5f8217ba.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/00a/00a53be1dcfba6c63ac6807637c4a45a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/78a/78aa666996cf9d2708f529c18784262f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/96d/96d356977066c0c2159ed7ef3f470cab.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3dc/3dc7c607ff7873eaa84a8d69eac26335.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a83/a83cce4aae86d8ed0b7c8d933231b9bf.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0c6/0c6642fb4a74893a4c950528791fe7dd.jpg\";}', 12.99, 0, NULL),
(62, 'Trine 2: Complete Story', '<p>Trine II takes a few years after the first game. Successfully saving the kingdom, Amadeus seeks the fireball spells. Yet he is summoned to save the homeland with his friends - Zoya and Pontious. Goblins have taken over the land as they are trying to find the mysterious &quot;Witch&quot; deep in the forest. </p>\n<p>Although having more than one playable character, Trine successfully uses all three of them. Amadeus as the mage is able to move objects or create boxes and planks to help overcome some obstacles. Zoya is very agile so she can hook and grapple on some surfaces, or shoot different targets. Pontious is the strongest character in combat, and he can destroy walls in his path or deflect things with his shield. Having this three different characters, it is necessary to use all three of them to solve puzzles and beat the level. Not only you can play alone, but the game supports three players cooperative to make progress even more atmospheric. </p>\n<p>Beautiful design, music and a narrator makes Trine a great story, that feels inspired by J.R.R. Tolkien himself.</p>', 'https://media.rawg.io/media/screenshots/c97/c97b943741f5fbc936fe054d9d58851d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/53f/53fa1f6c3c22cbf8b634562bc64bc5da.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3d7/3d7e3c5d3ffc76f9f1b9c838b1f76f80.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5b1/5b1855e5692c14ab600f45817d8b9331.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b10/b105738e3208e8ca17707576acf36100.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f64/f64412d0dcbbd50aabcc7f5ee6c66fa7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0ba/0ba9b6a2d5aa4247850c028fb2c85107.jpg\";}', 12.99, 0, NULL),
(63, 'Mortal Kombat X', '<p>Mortal Kombat X is a fighting game involving 1x1 encounters. The game is the part of a massive Mortal Kombat franchise which originates in 1992 being one of the first fighting games. The MK universe includes films, literature, and TV-shows, let alone dozens of games. <br />\nThe game features unique abilities throughout all of the series&#39; titles. Fatality — the final death blow was introduced in the first section and have made its way to the Mortal Kombat X. The new piece of a franchise, nevertheless, implements newer mechanics such as X-Ray — a sharp blow delivered when the respective scale is fulfilled and breaking combos, utilizing the same bar but allowing a player to defend themselves. <br />\nThe storyline of a game lists is superb, and every new title brings enrichment into it.  Mortal Kombat X tells a story of a self-titled tournament in the NetherRealm — a place somewhere between the land of the living and dead. The victor was supposed to become a NetherRealm&#39;s curator up until the next round of a championship. The MK X features 24 fighters with expending the list up to 33 playable characters thanks to two DLCs.</p>', 'https://media.rawg.io/media/games/aa3/aa36ba4b486a03ddfaef274fb4f5afd4.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/446/44613a8909c81372bab11ed2f19ca0e8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/53f/53f3f083f075e4ee20176ec6139495ca.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/949/949d5ef2043538d263fc8eabaa4e4f62.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/cac/cac440239e1c42c69f4dd3d69b97a0b4.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/533/533d3b571a1699ab1c275a2a99181ff2.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/138/1388b5d9f91dbe27823f3be2cee11105.jpg\";}', 12.99, 0, NULL),
(64, 'Horizon Zero Dawn', '<p>Horizon Zero Dawn is an experiment. A very impressive experiment that actually succeeded. <br />\nHaving a very curious mix of cyberpunk and prehistorical styles and esthetic, the game provides us with quite a unique experience. We need to arm ourselves with arrows and a bow, with a spear or any other prehistorical-ish weapon in order to defeat out enemies - dinosaur-mechanisms that are spread around the world. If that wasn&#39;t enough, Aloy our main protagonist can control an AI named GAIA. What we&#39;re having here is an exciting connection with &quot;very old times&quot; and &quot;near future&quot;, even though the game is set up in the 31st century. <br />\nBeing an outcast with her father Rost, Aloy must restore her position in the tribe and save the world by stopping the Eclipse, a cult that wants to rule the world. Join her on that journey, exploring the world and people that live in such hard surroundings.</p>', 'https://media.rawg.io/media/games/b7d/b7d3f1715fa8381a4e780173a197a615.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9cc/9cc79c34d70e437f3931f8476c384f43.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/898/898c2b3a6985f964cd65d55d9d323dbd.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c44/c44b7da5fcbf57d740a7bafe435d555e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c8c/c8cbefacf83746eadc23f19531676304.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e53/e534a3e2c61f57b41ad1d1389d5b126f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/120/12094e8cdcdc97a607d711e9c923ab64.jpg\";}', 12.99, 0, NULL),
(65, 'Deus Ex: Human Revolution - Director\'s Cut', '<p>The future is now and the year is 2027. You play Adam Jensen, an ex-SWAT specialist hired to oversee the security needs of Sarif Industries one of America’s most experimental biotechnology firms. When a team of black ops mercenaries attack Sarif&#39;s headquarters killing the very scientists you were hired to protect, everything you thought you knew about your job changes. After being mortally wounded during the attack, you have no choice but to undergo radical life-saving surgeries that transform you into a mechanically enhanced being. Now hot on the trail of those responsible for the attack, you soon find yourself chasing down leads all over the world, never knowing who you can trust. The men pulling the strings will stop at nothing to ensure mankind&#39;s evolution follows a particular path. You need to discover where that path lies. Because when all is said and done, the decisions you take, and the choices you make, will be the only things that can change it.</p>', 'https://media.rawg.io/media/games/a12/a12f806432cb385bc286f0935c49cd14.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/3e2/3e2b3388b8e54e8e0c19ff1c1d4de6e5.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/070/070ab0b7ddf6316c5c6e343137dafb77.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b6a/b6a98b0ad3b1d798a34e9897c4196c80.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/25a/25a851708fa44ba10b8387b64153bc16.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5cf/5cf27961533e2b16b7d9c893edb2dc04.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/910/91075d1c39ca838e7e37ff908be49bec.jpg\";}', 12.99, 0, NULL),
(66, 'For Honor', '<p>For Honor is an action game developed by Ubisoft Montreal. The game mixes the element of fighting and hacks and slashes with a heavy focus on multiplayer. </p>\n<h3>Plot and setting</h3>\n<p>The game takes place in the medieval fantasy world and follows the conflict between three factions: the Iron Legion, the Chosen, and the Warborn. Each fraction represents a specific medieval culture: knights, samurai, and Vikings respectively. </p>\n<h3>Gameplay</h3>\n<p>The gameplay incorporates elements of the hack-and-slash and fighting game. The player can choose from more than 12 different characters from each of the fractions. The all have their unique moves, weapons, characteristics, abilities, and executions. The fighting system is based on the duel between players. It incorporates the variety of moves such as attacks from different angles, blocks, dodges, stuns, counterattacks, unblockable attacks, and faints. <br />\nEach character has its progression system which allows one to gain new perks, upgrade weapons, armor as well as the increase in rank that affects matchmaking process. <br />\nThere are six multiplayer modes: they primarily differ from each other by the number of the players involved in the conflict. The multiplayer modes do not feature any PvE battles — the leftovers are team elimination, flag capture and one on one battles.</p>', 'https://media.rawg.io/media/games/4e0/4e0e7b6d6906a131307c94266e5c9a1c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/94a/94a1434ca101d9e0de78752df2f9c164.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/238/2388ad0c8587adfe37c0a95eec893b67.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/46f/46f57d204df589000ae2ebb6d567f3cb.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/150/1500590c3239c6732ce00c42cac105ca.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/60c/60c7557e75c1cecdb153818ff01890fa.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/135/1350c3eef2f346d70717f462469a3178.jpg\";}', 12.99, 0, NULL),
(67, 'Grand Theft Auto: San Andreas', '<p>Grand Theft Auto - San Andreas is the seventh entry in the series in the GTA franchise, but only second big title after GTA - Vice City. Setting up in fictional state San Andreas, you follow the story of CJ, a member of one of the multiple gangs in the city. CJ&#39;s family is being attacked in drive shooting which resulted in the death of CJ&#39;s mother, so he returns to home from Liberty City. Meeting the rest of the family at his mom&#39;s funeral, he decides to rebuild the gang and gain control of the state.</p>\n<p>The game makes a brilliant connection with missions and open world actions that you are able to do around the cities. You can steal cars, buy guns, hunt for collectables and do some side quests, while different characters give you specific missions in order to push the plot forward. Streets are filled with people as well as plenty of vehicles to steal. Fictional brands of cars, tanks, bikes are available to be stolen from any place around the city. Armoury contains pistols, rifles, hand-machine guns or a rocket launcher as well as melee weapons giving player freedom in anything he&#39;s doing in GTA.</p>', 'https://media.rawg.io/media/games/960/960b601d9541cec776c5fa42a00bf6c4.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/679/679c267107151f01696d3c8ea71ac650.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/560/560610b498ef079e1f45ec83b039cbc7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c8c/c8cf7ea395e6aa2e46abee36d9d2d699.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/191/191445072d9e85b6ad7ffed5152fc17a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/bfe/bfe3c652960e2b6869c608a58d69d327.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/436/436134f55bd10cfd7a6fd1ded7487355.jpg\";}', 12.99, 0, NULL),
(68, 'Resident Evil 5', '<p>Resident Evil 5 (also known as Biohazard 5 in Japan) is the third-person shooter with elements of a survivor-horror game. This is the fifth main installment in Capcom’s acclaimed franchise Resident Evil.  <br />\nThe story follows Chris Redfield, the protagonist of the original Resident Evil, and his partner Sheva Alomar. As the members of the Bioterrorism Security Assessment Alliance, they are tasked to intercept an illegal bioweapon trade in Kijuju, Africa. Upon arrival, they find out that Kijuju is infected by Las Plagas, parasites that turn its carriers into zombie-like creatures.   <br />\nThe game is notable for being a departure from the series survival horror roots towards more action-oriented gameplay style. The other significant innovation in the series brought with Resident Evil 5 is cooperative multiplayer for two players. There are many situations during the game that requires two players cooperation therefore if in singleplayer the second characters is controlled by AI.</p>', 'https://media.rawg.io/media/games/974/974342a3959981a17bdbbff2fd7f97b0.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/4ad/4adb836eae33db45da2cb9bd919becc4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/673/673c00d710a685e727a6a8b97f1d6c3b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/998/998d87968d7f9a9b9fda30d988b9377b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/992/9926a0cce6aaecd786651932c4d45251.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/443/443208c142882f657df637f6b6b2fcb9.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c9f/c9f66daefb307430670ed514bb5c01c3.jpg\";}', 12.99, 0, NULL),
(69, 'Terraria', '<p>Terraria is a 2D action adventure sandbox game, where players create a character and gather resources in order to gradually craft stronger weapons and armor. Players create randomly generated maps that contain different locations within it, and by gathering specific resources and triggering special events, players will fight one of the many in-game bosses. Created characters can be played on different maps.<br />\nThe game introduces hundreds of unique items that can be found across the entirety of the map, some of which may not even be encountered. <br />\nTerraria have many different Biomes and areas with distinct visuals, containing resources and enemies unique to this biome. After gathering materials, players can craft furniture, and build settlements and houses, since after completing events or finding specific items NPCs will start to arrive, and will require player’s protection. Terraria can be played on three difficulties and has a large modding community.</p>', 'https://media.rawg.io/media/games/f46/f466571d536f2e3ea9e815ad17177501.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/3af/3afd69426804e7162edbe03cd9f8d0f4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/48c/48c7e3e1268467b91b24c7da7c6539df.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/84b/84b447d4df99d42ffe479c7feb438171.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/de0/de053efd6104719567d23fb0dad58b92.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/490/4907be07a7771c8a7f0eb30c3a1fadc0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/485/485ce1d6c733357664be153777097af1.jpg\";}', 12.99, 0, NULL),
(70, 'Grand Theft Auto: Vice City', '<p>Grand Theft Auto: Vice City is a third-person shooter with an open world. The game is set in a fictional city during the 1980’s and exhibits a unique design of locations, people, and objects, resembling the real world’s counterparts of Vice City, mainly Miami, FL. GTA: Vice City is a fourth game of the series, following Grand Theft Auto III.</p>\n<p>The main character is introduced as Tommy Vercetti, an Italian-American mobster who works for a wealthy crime family. Throughout the story, the player will observe as the protagonist rises the ranks, sometimes making decisions of questionable nobility or profit. Our goal as a player is to ensure that Vercetti becomes the boss of all of Vice City’s mafia, and various story characters will help us or prevent us from achieving this goal.</p>\n<p>The worlds of Grand Theft Auto series have long been worked upon and have been done in much detail, and Vice City is no different. The people on the sidewalks, the stylish cars and neon light clubs, the sky-high buildings and lively piers and beaches, everything will bring nostalgic feelings to those of players, whose eyes have seen the glory of this time. The gameplay, however, bears little difference from its predecessor, continuing the trend of big guns, explosions, and cop chases.</p>', 'https://media.rawg.io/media/games/13a/13a528ac9cf48bbb6be5d35fe029336d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/dfd/dfd73edec49df98ca9cd6736eeba1049.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/41b/41bab662e69407ebdea4f9c2620ea964.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/866/8669e298a904fce58ba84ab0a9205c01.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/579/57946b3f520595bf96c77e9c36ea5a9a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/8d8/8d84dcd621ea9cc54ffec9ab6040f799.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/bd2/bd2b4586b6acabf7ee39400d3ad5fa66.jpg\";}', 12.99, 0, NULL),
(71, 'Grand Theft Auto III', '<p>Grand Theft Auto III is an open-world action game, a part of the criminal franchise GTA. As the first in the series 3D game with high-quality textures, GTA III became exemplary in its genre. </p>\n<p>The action is located in fictional Liberty City. Its map is divided into three parts – each becomes available gradually, depending on the storyline progress. The player takes control of the character from the third-person view. </p>\n<p>The classic feature of GTA III is the ability to interact with the world: explore the map either on foot or by car, contact with other characters, visit weapon stores and shoot everywhere. Although GTA III is another chapter of the franchise, its plot is unique. </p>\n<p>The story begins with the dynamic bank robbery. During the heist scene, the main character (silent and unnamed for the whole game) gets betrayed by his accomplice Catalina. By good fortune, the protagonist escapes from imprisonment and starts making both ends meet in Liberty City after being deceived. Therefore, his only wish – also the main idea of the storyline – to take the revenge on the former partner.</p>', 'https://media.rawg.io/media/games/5fa/5fae5fec3c943179e09da67a4427d68f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/eda/eda58fc81f11086dd2c2bb0c49175a31.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/199/199398979a6ded0298638549666fffe9.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e8a/e8a098b2a7f9ce400330b14110bacf03.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/15d/15d04a0a27192157c45df62c1d9cd89f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/1a8/1a8cadda5edfe81178534adf691ebf41.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/d0d/d0d4789a8aefd1722f3786a41391182b.jpg\";}', 12.99, 0, NULL),
(72, 'Resident Evil 7: Biohazard', '<p>Resident Evil 7: Biohazard is the latest installment in the Resident Evil series. For 13 long years, Resident Evil series were rejecting the survival-horror aspect and atmosphere of first original games in the series mainly released in nineties on PlayStation one system. From the famous Resident Evil 4 until Resident Evil 6, the series went full-force into action genre leaving horror elements behind and hard-core fans disappointed. Finally, Capcom realized that Resident Evil needs a change and Resident Evil 7: Biohazard delivers those changes at its fullest. First of all, the camera angle changed from over the shoulder view into first-person mode. Another change is that survival-horror elements are back together with light puzzle solving, inventory management and maze-like mansion in which the main story of the game happens. The player controls Ethan Winters who is searching for his lost wife in a dark mansion filled with horrible creatures and insane family. <br />\nResident Evil 7: Biohazard can also be played with virtual reality setup and it’s known as one of the best games which supports VR.</p>', 'https://media.rawg.io/media/games/cee/cee577e2097a59b77193fe2bce94667d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9c7/9c7016a1d1a8f66d67266e35452a3cf4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/315/3152c8a5165faaefc5429ab54399e3a6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/753/753c32daa8a2685f6aecc052e85197f7.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3f9/3f916c888d9e135adb456399550fd03e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9bd/9bd7368147200c3e1e615950c4f3fc73.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/804/804d33ab33db680543a6df814c15c8e3.jpg\";}', 12.99, 0, NULL),
(73, 'Saints Row IV', '<p>Saints Row IV is the fourth and the last main entry for the Saints Row franchise. Almost right after stating Steelport as the independent nation in the third game, The Boss (player) is being contacted by MI6 with a mission to eliminate STAG leader Cyrus Temple and prevent him from launching a nuclear attack. And by doing so The Boss earns complete respect and love from America. Five years after, The Boss is being elected as a President of The United States. But sudden alien invasion by Zinyak in the lead destroys everything, while they capture whole crew from the third game and main protagonist as well, putting him in the simulation world.</p>\n<p>With traditional gameplay of the Saints Row franchise being kept untouched, the developers added new features that can be understood as a reference to the Matrix franchise. While The Boss is in simulation, he can some extraordinary powers such as enormously high jumping, super running speed and amazing force which affects the gameplay with different side missions, collectables and walkthrough of the game. And a dubstep gun.</p>', 'https://media.rawg.io/media/games/e3d/e3ddc524c6292a435d01d97cc5f42ea7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/aa1/aa1d57309779e9ad7abcde1dd042305f.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/641/64161143c49291cd617ab899e932e93d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a63/a6399d85d923e0ca0e23991b1fcc78dc.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ad7/ad7111f5bc7e199a60daddafc3fe3d44.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/3c7/3c7bcf78505f5c273e5514d296a6499e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/745/745e20f00ca4753803ada13c3d7a475a.jpg\";}', 12.99, 0, NULL),
(74, ' PAYDAY 2', '<p>The gang is back, and they have bigger and better plans. Objective based cooperative FPS became more complicated. The classic group of Hoxton, Dallas, Chains and Wolf got reinforcement, and now Payday Gang consists of 21 heisters, some of which are based on movie characters or even Youtubers. Players will be able to customize their own private arsenal, their masks, and skills, to complete the missions in their own way, be it stealthy sneak-in or full frontal assault. After completing missions, players will receive EXP points, money and a chance to get a special item that can be a gun modification, mask or a safe containing weapon skins.<br />\nPayday 2 is a multiplayer game, meaning, that even during offline missions players will be followed by AI characters, whose loadouts, masks and perks can be customized as well. This game has been supported by the developers for many years, and amount of DLC speaks plenty of their dedication to the player base.</p>', 'https://media.rawg.io/media/games/73e/73eecb8909e0c39fb246f457b5d6cbbe.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c38/c38f5aa479eebab20cedcdae370e6e18.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/442/442be5656b314e3289ecd1486b5282f1.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c2c/c2ccfeaeda357f932d1899a91f298850.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a18/a18da938def6ce6e5b571f1c20272ab0.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a5d/a5da0d01195f01cdedec974d52892128.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4ee/4ee5c3c8b850ab4ba8e04b9f5d5ab060.jpg\";}', 12.99, 0, NULL),
(75, 'Bastion', '<p>After the Calamity, most of the world was destroyed and seemingly everyone was turned to stone, except the Kid. As the Kid, players will have to flee collapsing city, in order to reach the Bastion, where the game’s narrator Rucks, will instruct players to collect the Cores. Most of the story will be told through the narration and music. </p>\n<p>Bastion is an action role-playing game with an isometric overview of the map. As players progress across the levels they will find and unlock collectible items and weapons. After completing said levels the Kid will find Cores, that are used to upgrade the Hub are of Bastion and unlock more features, like a blacksmith, arsenal or an item shop. Any level can be replayed if players missed any items or if they’re short on currency, called fragments. The Kid will also encounter challenge levels, where players will have to successfully use collected weapons under a time limit.</p>\n<p><strong>Key Features</strong>:<br />\n• Action-packed combat rewards playing with finesse<br />\n• Hours of reactive narration delivers a deep story<br />\n• Stunning hand-painted artwork in full 1080p resolution<br />\n• Critically-acclaimed original music score<br />\n• Controls custom-tailored to PC plus gamepad support<br />\n• 10+ unique upgradeable weapons to be used<br />\n• 6 powerful Bastion structures to be discovered<br />\n• &#39;New Game Plus&#39; and &#39;Score Attack&#39; modes unlocked after finishing the story<br />\n• &#39;No-Sweat Mode&#39; lets players of any skill level enjoy the story</p>', 'https://media.rawg.io/media/games/f99/f9979698c43fd84c3ab69280576dd3af.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/24c/24c8d0fb4059edb73e8ee2157a17b1c1.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/2f1/2f18e80782d107945b11b6d02a16ab8d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/7de/7ded4f413b6670b37b8047a0565b5a6c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/d36/d36f5867baf7af7506765702b9ff7c84.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c0b/c0b36461930db0284a10635c9776daf7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4c5/4c5996a474a68ae141a2fb9247a2cdac.jpg\";}', 12.99, 0, NULL),
(76, 'Stardew Valley', '<p>The hero (in the beginning you can choose gender, name and appearance) - an office worker who inherited an abandoned farm. The landscape of the farm can also be selected. For example, you can decide whether there will be a river nearby for fishing.<br />\nThe farm area needs to be cleared, and it will take time.<br />\nThe hero has many different activities: plant and care for plants, raise livestock, practice crafts, extract ore, and also enter into relationships with residents of the neighbouring town to earn game money. Relationships with characters include communication, performing tasks for money, exchanging, searching for fossils and even military actions and marrying. The character is limited by the reserve of strength and health - both parameters are visible on the screen, and the game automatically puts the hero to rest if the limit of his capabilities is close. The game does not set any ultimate or primary goal, its many possibilities are designed for an unlimited time.</p>', 'https://media.rawg.io/media/games/713/713269608dc8f2f40f5a670a14b2de94.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/b72/b722b1746256f64ce5e15558d1ac7613.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/733/7330aea66ef9de06bb201e1d3f10ff70.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/0a6/0a6dfc3ef9ac018b737427405e686e23.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/366/3668bbdd41a682c76370fc81691150bc.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e25/e25137cf398c743153d64993160487f1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b64/b6419e71b81f36ab7bc62a6614cb5b85.jpg\";}', 12.99, 0, NULL),
(77, 'Warframe', '<p>Warframe is an online free-to-play cooperative third-person looter shooter. In the far future the Orokin had absolute control over the solar system but have since disappeared, now the militaristic Grineer, the money-worshipping Corpus, and the Infested fight for what they left behind. You are a Tenno - a master of gun and blade and user of the Warframes, it is up to you to bring back balance to the system from within, while also fighting a new threat from without: the Sentients.<br />\nOver 40 unique Warframes to build, hundreds of guns and melee weapons to utilize, and various pet companions to help you along the way - all of which can be crafted for free and enhanced by an in-depth modding system.<br />\nWith constant updates by Digital Extremes, the game now has over six years of updates including new open-world landscapes (Plains of Eidolon-2017, Orb Vallis-2018) and cinematic story expansions (The Second Dream-2015, The War Within-2016, The The Sacrifice-2018) with more content being added every year.</p>', 'https://media.rawg.io/media/games/f87/f87457e8347484033cb34cde6101d08d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2e1/2e15c9f4cca692ebca67b7652e559f6d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/70d/70de629465e39f8108aa533df9cff554.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b3a/b3a368123558e7f4010e8b68518d6412.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/fd2/fd2225327c9dca60c9acea0edca8c5fc.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/34e/34e3c0d71551f07c3bb709fe12f18ca2.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/977/977735a2fad2bc47917424e20e9dff56.jpg\";}', 12.99, 0, NULL),
(78, ' Borderlands 2', '<p>Sequel to the 4-player cooperative FPS RPG Borderlands, where the new team of Vault Hunters arrives on the infamous planet Pandora in order to get the riches, hidden inside the Vault, and help to free the planet from the Handsome Jack, President of Hyperion. Clear out the endless waves and groups and marauders with various weapon types and character abilities.<br />\nUnlike the first game, Borderlands 2 provided DLC not only expanding the world of Pandora with stand-alone story campaigns but adding 2 more characters. Now the main cast consists of Gunzerker Salvador(dual-wields guns at command), Siren Maya (holds and paralyzes the enemy), Commando Axton (summons turrets) and Zer0 the Assasin (invisible sniper ninja). But with the DLC players can try out summoning giant flying robots with Gaige the Mechromancer and Krieg the Psycho. <br />\nMost of the game charm and popularity of Borderlands 2 comes from the supporting cast and the personalities of the NPC, making this fast-paced shooter with optional cover stand out.</p>', 'https://media.rawg.io/media/games/49c/49c3dfa4ce2f6f140cc4825868e858cb.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/adb/adbbb37113618ee107459cd5c344f2a8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/616/61643dd96e936d29eb68cf53b2334e53.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/864/8644946ba14a03ab69f0766c42a03f80.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f87/f87ad2b8f02b56e36c57b25cf8eac042.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/194/194e0962afa272604300001718a07793.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/297/29716964351ecd82545f1de3a50dfc4e.jpg\";}', 12.99, 0, NULL),
(79, 'Dishonored 2', '<p>Dishonored 2 is an action-adventure game based on players’ stealth skill. The game is played from the first-person perspective and includes several RPG elements. It is a sequel to the original Dishonored game, so the story takes place in Dunwall and mostly in Karnaca 12 years after the ending of the previous part. To start the action, the player has to decide whether he wants to assume the role of deposed Empress Emily or the role of her father and the Royal Protector Corvo, the protagonist of the first Dishonored game. Both characters have their own bunch of special abilities so the choice will influence the way of returning to the throne. In the course of the game, both equipment and abilities can be upgraded. The storyline is divided into several main missions and includes various side quests that let protagonists get acquainted with the useful new skills. Although the gameplay is initially focused on the stealth, actually there is a multitude of ways to complete all the missions and to return the lost honor.</p>', 'https://media.rawg.io/media/games/f6b/f6bed028b02369d4cab548f4f9337e81.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/236/2365eaea84505996adbe4aca614d0c4f.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/85f/85f8c2dc0586003913c5924add0ca0b7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/597/59749ba429e176f45abee6ced14de963.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ce3/ce3f8d7fc8b1973ea41efa8f69ee8074.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/cad/cad513106134c55e71ec4a62a217287f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/d94/d9402537f42b3a273468b72e662d13df.jpg\";}', 12.99, 0, NULL),
(80, 'Call of Duty: Black Ops III', '<p>Call of Duty Black Ops III is a science fiction first-person shooter, the twelfth game in the whole Call of Duty franchise and the third chapter in the Black Ops series. The action begins in 2065, 40 years after the events of the second part, so the game has several historical references. However, the game is not a direct sequel to the previous Black Ops game. Players are offered to assume the role of a CIA special unit trooper trying to get along with the new artificial intelligence DNI (Direct Neural Interface) system and to solve mysteries hidden in it. The whole gameplay is divided into three usual for Black Ops series game modes: Campaign, Multiplayer, and Zombies. The single-player campaign can be also completed in a squad (up to four members). Players are able to choose proper equipment and even customize the character before starting another mission. After the completion, each level could be replayed in a “realistic” difficulty or in a “Nightmares” mode (regular enemies are replaced with zombies).</p>', 'https://media.rawg.io/media/games/fd6/fd6a1eecd3ec0f875f1924f3656b7dd9.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/320/32019fd3760123a5ded9937f43ad0318.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/000/000880b0f1eeabbdf8a86779f75f25ac.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/bc1/bc1ab01319be2e0b7f7ba3dff80fe780.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/80f/80f79bf7e27e69824dc1a7e04bc8e766.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ca8/ca89a641e6362e800d96da99b8ac93e0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/aa0/aa08b684dca3f104305c92002b9ce5da.jpg\";}', 12.99, 0, NULL),
(81, 'Transistor', '<p>Transistor is a cyberpunk game that uses isometric point-of-view as its primary mechanic. Following the story of Red, she discovers a body of an unknown man with a sword in his chest called Transistor. Sword has possessed the mind and voice of its previous owner and now able to speak with Red, navigating her in a city called Cloudbank, as the Process attacked the city and still searches for Red to kill her and return the sword back to them for unknown reasons. </p>\n<p>Despite having real-time battles, Red can freeze the time with her ability called Turn that draws her action bar. Until it is fully restored, no abilities can be used if only you don&#39;t have the upgrades. As an addition, Red can retrieve Functions from her fallen enemies - new powers for her weapon with a passive, persistent effect or other. Beautiful design and interesting lore give this game a unique atmosphere being doubled by the soundtrack, done by Darren Korb.</p>\n<p><strong>Key Features</strong>:<br />\n• An all-new world from the team that created Bastion<br />\n• Configure the powerful Transistor with thousands of possible Function combinations<br />\n• Action-packed real-time combat fused with a robust strategic planning mode<br />\n• Vibrant hand-painted artwork in full 1080p resolution<br />\n• Original soundtrack changes dynamically as the action unfolds<br />\n• Hours of reactive voiceover create a deep and atmospheric story<br />\n• &#39;Recursion&#39; option introduces procedural battles after finishing the story<br />\n• Fully customizable controls custom-tailored for PC</p>', 'https://media.rawg.io/media/games/d1f/d1f872a48286b6b751670817d5c1e1be.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f0a/f0a310733a1dfb627cb644500bc93b92.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/bde/bde16c903e447143a15b033e243fcbc9.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fdb/fdb05fd470393914ba8e7fe0bddeb4c3.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e5a/e5af082ef1e00959cdf38f943dbbdc82.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/7dd/7ddfa5a4ca3c9f9017db1924272a0c89.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/725/725cc23324af2629f046ec82aa6e2ca0.jpg\";}', 12.99, 0, NULL),
(82, 'Left 4 Dead', '<p>Left 4 Dead is set in a zombie apocalypse situation. You play as one of four different characters - Louis, Zoe, Bill or Francis - and try to go to safety zones at each of the levels or leaving the infected areas. The main story follows four protagonists in their attempts to escape the hordes of zombies and other infected mutants. Every single time though something goes wrong. </p>\n<p>At every single chapter, players must defend themselves from a horde of zombies as well as completing different tasks in order to leave the location - power up the generator, contact military service via radio or some other objects. Every level you start in a safe room with melee and firearms weapon, like UZI, Katana, AK-47, supplies and medicaments like the first-aid kit which will heal you or your partner and painkillers which will give you some amount of health that you will lose over time. Ordinary zombies are not the only enemies you are going to face, as Smokers, Hunters, Tanks and other mutated monsters are about to stop you from getting to the end of the level.</p>', 'https://media.rawg.io/media/games/476/476178ef18ab0534771d099f51cdc694.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/570/5706e81cef6e3974795d9d92ad503ce7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e4f/e4fa138927a69d378f162801fee9245e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/44c/44c688a8122f4e31cf85c219ab790075.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/4b3/4b347aa08324581b9be4333e4e0ea8a3.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/27c/27cee268a53a710821a499044d929b87.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e50/e50c0f7e266bb87e8d7b29597923e717.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(83, 'Titanfall 2', '<p>Now Titanfall 2 has a full-scale story campaign. The main plot is the confrontation of the people&#39;s Militia against the IMC Corporation, which seeks to destroy the rebels of the Frontier, a region of star systems that will allow them to get control over their resources.</p>\n<p>You play as Jack Cooper, a soldier who dreams of becoming an elite pilot with advanced technology and a personal Titan - a fighting machine. Captain Tai Lastimosa trained Cooper and prepared for his candidacy. During the task of finding the missing Major Anderson, who had the information about the plans of the IMC. The entire squad of Cooper, including Lastimosa, dies in the attack of IMC mercenaries. The Captain gives his Titan to Cooper.</p>\n<p>As the first part of the game, it is a first-person shooter in which you can control the pilot and exoskeleton &quot;Titan&quot;. The pilot has a diverse arsenal of abilities that allow you to jump and run on steep walls with the help of the &quot;jump pilot module&quot;. These abilities can be used with each other to move through the game locations quickly.</p>\n<p>With enough points, the player can call the Titan, landing from the sky. They are much slower than pilots but have more powerful weapons.</p>', 'https://media.rawg.io/media/games/569/56978b5a77f13aa2ec5d09ec81d01cad.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/84e/84e29493c294e80fb0311c8381001f77.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6b5/6b5e173d4ed40f90aa40e685f11288ef.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9f4/9f44676b8807fd78f44711fa842ec685.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ac0/ac00a4d622919baafe096060e5c5f838.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/3cf/3cf20e1cc6f9dfa47b44bd9398dc026f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/677/677d773bd606dd7a386bdd1930658ba7.jpg\";}', 12.99, 0, NULL),
(84, 'GRID 2', '<p>GRID 2 is a racing game, the sequel to Race Driver: GRID. </p>\n<p>In the centre of the &quot;story&quot; GRID 2 is a racing championship, which we gradually promote around the world. Money is not needed, the main thing is to conquer the audience. The race will be held in such places as Paris, Hong Kong, Chicago, Dubai, etc. All the tracks, drivers, teams, cars and sponsors in the game are real.</p>\n<p>Compared to GRID (the first part of the series), there are more modes. There were races on the so-called &quot;Checkpoint&quot;,  endurance race and other several options. And the significant thing now that there is no driving on the rails, sudden acceleration of rivals and unpunished wiping of bumpers (also, damage to the machine is not displayed on the screen, it is necessary to focus on its behaviour and the replica of racing engineer).</p>\n<p>The main feature of GRID is time rewinding. The number of rewinds is limited, but with this, you can save yourself from a fatal outcome.</p>', 'https://media.rawg.io/media/games/27b/27b02ffaab6b250cc31bf43baca1fc34.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/239/239b8ea092f580063a3063837a5d66db.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3a3/3a34ca7c5188dbd90cef896a2161cf96.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/eed/eed60d9303c5601cfc84e2784abf8191.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/6fc/6fc98ed27cea1282bdfef2fd0cbddf91.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/966/96667e75197bc34897a4d56461f00807.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/450/450a36fe9279d2369e472bfe984a1e37.jpg\";}', 12.99, 0, NULL),
(85, ' BioShock Infinite', '<p>The third game in the series, Bioshock takes the story of the underwater confinement within the lost city of Rapture and takes it in the sky-city of Columbia. Players will follow Booker DeWitt, a private eye with a military past; as he will attempt to wipe his debts with the only skill he’s good at – finding people. Aside from obvious story and style differences, this time Bioshock protagonist has a personality, character, and voice, no longer the protagonist is a silent man, trying to survive.<br />\nOpen and bright level design of Columbia shows industrial colonial America in a seemingly endless carnival. But Bioshock is not famous for its visuals, but for its story.  Mystery and creative vision of Irrational Games invite players to uncover the secrets of Columbia’s leader - Zachary Comstock and save Elizabeth, the girl, that’s been locked up in the flying city since her birth.<br />\nUnique weapons and mechanics of Vigor will make encounters different, helping players to adjust to the new found mobility and hook shot, making fights fast-paced and imaginative.</p>', 'https://media.rawg.io/media/games/fc1/fc1307a2774506b5bd65d7e8424664a7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/bf0/bf07e2c6d2c888d372917d9ef453c8a4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/9d3/9d38833952812ad7888a6dc21699934f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/595/59572d257b6797986e4eabcd1ee023fd.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f71/f71c23eb76f050d6180490e82d58d799.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/871/8713411d5332ceb2b4092073a6f5f3f2.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/985/985b56daa78e0a23133518d4226e9f97.jpg\";}', 12.99, 0, NULL),
(86, ' Portal', '<p>Every single time you click your mouse while holding a gun, you expect bullets to fly and enemies to fall. But here you will try out the FPS game filled with environmental puzzles and engaging story. <br />\nSilent template for your adventures, Chell, wakes up in a testing facility. She’s a subject of experiments on instant travel device, supervised by snarky and hostile GLaDOS.<br />\nPlayers will have to complete the tests, room by room, expecting either reward, freedom or more tests. By using the gun, that shoots portals (Portal-Gun™), players will move blocks, travel great distance quickly and learn about your current situation, which is unraveled through environmental storytelling. What you will be told might be different from what you will see.<br />\nWhite environments will guide the player’s portal placement, forcing them to pay attention to the surroundings.  Portal creates tension, allowing either solving puzzles at your own leisure or moving quickly, due to the time limit or threats.</p>', 'https://media.rawg.io/media/games/7fa/7fa0b586293c5861ee32490e953a4996.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/99e/99e94bd55eb75fa6e75c3dcbb1a570b2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/2f0/2f0297a46934d9fa914c626902b1ce20.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/3b3/3b3713fbca6194dfc4d6e8a8d006d354.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c6f/c6f9afc3e4dd51068b22f04acbc6ca99.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/748/74841207eec76ebc7fc03210168bfb7e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e72/e7256b4caedf099bcb8ebd332f892334.jpg\";}', 12.99, 0, NULL),
(87, 'Cyberpunk 2077', '<p>Cyberpunk 2077 is a science fiction game loosely based on the role-playing game Cyberpunk 2020.</p>\n<h3>Setting</h3>\n<p>The game is set in the year 2077 in a fictional futuristic metropolis Night City in California. In the world of the game, there are developed cybernetic augmentations that enhance people&#39;s strength, agility, and memory. The city is governed by corporations. Many jobs are taken over by the robots, leaving a lot of people poor and homeless. Night City has a roaring underworld, with black markets, underground surgeons, drug dealers, and street gangs abound.</p>\n<h3>Characters</h3>\n<p>The main protagonist is fully customizable, including his or her sex and appearance, and goes by the nickname V. He or she is an underground mercenary who does “dirty business” for the various contractors. An NPC companion named Jackie joins the protagonist early at the game, and various other companions may join the player on certain missions as the plot demands. However, the game has no parties and no companion system.</p>\n<h3>Gameplay</h3>\n<p>The player controls V from the first person view, with the third-person view used for cutscenes only. The protagonist can travel across the city on feet or using various vehicles, in a manner some observers compared to GTA series. There are many options for the character customization, including three character classes, and a variety of augmentations V can install to enhance his or her abilities.</p>', 'https://media.rawg.io/media/games/26d/26d4437715bee60138dab4a7c8c59c92.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/814/814c25d6fd1fd34a4e6dade645a3bda7.jpg\";i:1;s:88:\"https://media.rawg.io/media/screenshots/2ab/2ab0b67e68b6ede6b19d80094b6f7f2a_qTSfS2g.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/cd2/cd22af9d6ac593440defac6082760e4a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/9b5/9b51535beb9d9e416cb9aac874091334.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d84/d84d3a16c1e2cb24dcf73e0108d78455.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a55/a5583c11e4fd11a9eb5d52e8ddd41ac3.jpg\";}', 12.99, 0, NULL),
(88, 'Far Cry 3', '<p>Far Cry 3 is absolute madness. Being the third instalment of the franchise, it has a unique plot. Playing as Jason Brody, you will understand what it is like, to be a Rambo. Vacation on Rook Islands with your friends and family quickly turned into a complete nightmare after Vaas Montenegro kidnapping everyone from the party. Jason manages to escape the cruel pirate lord with a little help from a native supporter called Dennis. Now Brody has to save all his friends and get out of the island.</p>\n<p>To help Jason save his friends, he will need to learn new skills. Hunting animals, crafting new weapons or different abilities in killing pirates. Skill tree has plenty to offer for the player. There are all kinds of firearms for any player, from a knife to a grenade launcher. This mechanic adds pure madness for the game process, making it very fun, fluent and full of adrenaline. Stunning views of the island, excellent surroundings and a great story make Far Cry 3 an absolute fun to play.</p>', 'https://media.rawg.io/media/games/15c/15c95a4915f88a3e89c821526afe05fc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/98e/98e4c2a0c3e84b3d2718f8801bba0fcc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/87e/87e9ca5542b3e8da43d488c9252e20fe.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/0a9/0a9ff8bbfa49024159bcd884ce7128c3.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/971/971d3582a42ede482b9d90b47b50ac32.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/174/174333d080f475d5718219ef6e01d3f4.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/03d/03dcdb4292bcc6ccc2719c88202f4965.jpg\";}', 12.99, 0, NULL),
(89, 'Mass Effect', '<p>Mass Effect was the very start of the trilogy about Commander Shepard in his journey to save the universe from Reapers - an old civilisation that wants to kill every possible rational being in order to prevail any wars. You play as Shepard. With flexible backstory and different classes you travel to Eden Prime with Captain Anderson and Nihlus Kryik, you and your team must discover the mystery behind the attack on the human colony. In the process, it is revealed that another Spectre, Saron, has become rogue and escapes the planet to awoke Reapers and start a full-scale war with the galaxy.</p>\n<p>For BioWare, third-person shooters with tactical elements is a very common genre. Four different weapons - automatic rifle, shotgun, pistol and sniper rifle can be obtained through the game with better characteristics. Also, you can level up your protagonist and his squad to gain better stats and new skills. Dialogue panel is simple yet efficient - you choose the style of your approach and build a reputation of a hero or a renegade. With this options in hand, you can build your own story as Commander Shepard in saving the Milky Way Galaxy.</p>', 'https://media.rawg.io/media/games/a6c/a6ccd34125c594abf1a9c9821b9a715d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2c7/2c710533fe55e02facda408ce681640e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f42/f42d116fcc691213ac11f651e231b214.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5db/5db5afc10fa39739c96c05f455f5d253.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/7af/7af44f9b67fe50d162d630f07ae6900b.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/67e/67e4fa3122553e5ad52b97d0efecf0e1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/196/196268519e753a7d53fbee7040fde318.jpg\";}', 12.99, 0, NULL),
(90, ' Half-Life 2', '<p>Gordon Freeman became the most popular nameless and voiceless protagonist in gaming history. He is painted as the most famous scientist and a hero within the world of Half-Life, and for a good reason. In the first game he saved the planet from alien invasion, this time, when the invasion is already begun, the world needs his help one more time. And you, as a player, will help this world to survive. This time Gordon arrives in City 17, ravaged and occupied by Combines, where he meets his old Black Mesa friends. <br />\nWhat is different, aside from the overall design quality, is the use of Valve’s Source engine that not only expands on the fluidity of character model animations and movement but allows players to interact with a myriad of objects with the advanced and realistic (to an extent) physics. Classic Headcrab Zombies are revamped and have new variants that provide players with different threats. For a story-driven FPS, Half-Life 2 is unique in its plot delivery, and making in-game mechanics feel natural, be it platforming or driving.</p>', 'https://media.rawg.io/media/games/b8c/b8c243eaa0fbac8115e0cdccac3f91dc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/8af/8af6188357426890cbc8c8a34d9e7b75.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3b5/3b542c954ba5bd2f32da067c8122cd80.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/3d6/3d6066e45d259d2e83bf6767e6113d94.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e49/e49327df2404df6c5dafa8eac7990852.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5dd/5dd3e53131bbfe6278bd15b9abe261a0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e99/e995e154d4f9e2df0367adea528a72c5.jpg\";}', 12.99, 0, NULL),
(91, ' Portal 2', '<p>Portal 2 is a first-person puzzle game developed by Valve Corporation and released on April 19, 2011 on Steam, PS3 and Xbox 360. It was published by Valve Corporation in digital form and by Electronic Arts in physical form. </p>\n<p>Its plot directly follows the first game&#39;s, taking place in the Half-Life universe. You play as Chell, a test subject in a research facility formerly ran by the company Aperture Science, but taken over by an evil AI that turned upon its creators, GladOS. After defeating GladOS at the end of the first game but failing to escape the facility, Chell is woken up from a stasis chamber by an AI personality core, Wheatley, as the unkempt complex is falling apart. As the two attempt to navigate through the ruins and escape, they stumble upon GladOS, and accidentally re-activate her...</p>\n<p>Portal 2&#39;s core mechanics are very similar to the first game&#39;s ; the player must make their way through several test chambers which involve puzzles. For this purpose, they possess a Portal Gun, a weapon capable of creating teleportation portals on white surfaces. This seemingly simple mechanic and its subtleties coupled with the many different puzzle elements that can appear in puzzles allows the game to be easy to start playing, yet still feature profound gameplay. The sequel adds several new puzzle elements, such as gel that can render surfaces bouncy or allow you to accelerate when running on them.</p>\n<p>The game is often praised for its gameplay, its memorable dialogue and writing and its aesthetic. Both games in the series are responsible for inspiring most puzzle games succeeding them, particularly first-person puzzle games. The series, its characters and even its items such as the portal gun and the companion cube have become a cultural icon within gaming communities.</p>\n<p>Portal 2 also features a co-op mode where two players take on the roles of robots being led through tests by GladOS, as well as an in-depth level editor.</p>', 'https://media.rawg.io/media/games/2ba/2bac0e87cf45e5b508f227d281c9252a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/221/221a03c11e5ff9f765d62f60d4b4cbf5.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/173/1737ff43c14f40294011a209b1012875.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b11/b11a2ae0664f0e8a1ef2346f99df26e1.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/9b1/9b107a790909b31918ebe2f40547cc85.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d05/d058fc7f7fa6128916c311eb14267fed.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/415/41543dcc12dffc8e97d85a56ad42cda8.jpg\";}', 12.99, 0, NULL),
(92, 'The Darkness II', '<p>With a gap of five years, Darkness II is a sequel for the first part of the franchise following the story of James Estacado. After becoming the don of the Franchetti family, he still fights the fact that his girlfriend Jenny died in the first game and fighting against the Darkness itself. Things turn pretty bad when a group of attackers catch James and his men off guard in a restaurant. Being severely injured he still refuses this powers even if they save them. The attack doesn&#39;t end so fast, and after an explosion, James is left to bleed out and die. James gives up and embraces the Darkness fighting off his attackers and begins his fight with the Brotherhood and his own sanity.</p>\n<p>The core feature of the game is to control the tendrils. Being Darknesses spawns, two tendrils will help the player to fight off his enemies. You can execute people, throw them around and throw things at them. Also, you can use it to merely attack or defend yourself in any fighting situation. In case you will want to do the campaign with your friends, the game gives you Vendetass. The plot of it follows four hitmen from Jackie&#39;s family to stop the mysterious Brotherhood.</p>', 'https://media.rawg.io/media/games/744/744adc36e6573dd67a0cb0e373738d19.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a28/a2893096ad373765032d165ab878e0aa.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/401/401b179d16b0d0e5b79c82f7f5879dc3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/afa/afa84f35f75a9f9da1e6585491abb668.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/bc1/bc13923ae85e585057c7bf5b889ac510.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/953/95390392a29c757bb5990b9f933aeb69.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/fe2/fe24187841ebbf89db288d1b3b6d8b25.jpg\";}', 12.99, 0, NULL),
(93, 'Dishonored', '<p>Dishonored is the game about stealth. Or action and killing people. It is you who will decide what to do with your enemies. You play as Corvo Attano, Empress&#39; bodyguard, a masterful assassin and a combat specialist. All of a sudden, a group of assassins kill the Empress and kidnaps her daughter Emily. Being accused of murder and waiting for execution in a cell, Corvo still manages to escape with the help of the Loyalists and their leader Admiral Havelock. Now it is your duty to return the Empress daughter and restore your name. The main focus of the game is to give the player a choice. You can spare the lives of your enemies by knocking them out or making others do the job for you or brutally murder everyone in the city. Gadgets are given by Piero Joplin, Loyalists engineer and by the Outsider, who gives Corvo magical abilities. The game reacts to your choices - grim atmosphere by itself can be turned even darker by killing people or slightly lighter by not doing so. It is only a player&#39;s choice what to do with his abilities. Basing on these actions the game will give you with two different endings of the story.</p>', 'https://media.rawg.io/media/games/4e6/4e6e8e7f50c237d76f38f3c885dae3d2.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/683/68302a7d6425b77f73b550d74d12c149.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3be/3be77e78cc70a27dd8afe5228a4a4603.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ed4/ed45a4d528eb22d30048654c43ba4854.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/903/903a31cf943126bf46c5db2be9bc8116.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9cb/9cb61afd240b902b943c850ddf5c60c9.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/ad8/ad8a34687cf34713bc59580d568248e8.jpg\";}', 12.99, 0, NULL),
(94, 'Mirror\'s Edge', '<p>Refreshing look of Mirror’s Edge made this first-person action platformer recognizable even by people who have never played it before. The City of the “utopian” society is highly monitored by the totalitarian military groups. <br />\nPlayers will take control of the female protagonist, named Faith, a specially trained Runner, master of parkour that delivers physical documents in the city, where every form of communication is watched. Her sister is framed for murder, and Faith must follow the clues to the identity of the murderer, with only lead being a note saying Icarus.<br />\nDistinct visuals of the game form the bright white city, which Faith has to navigate through, jumping across rooftops, running on walls and climbing scaffolding. Color-coded elements of the environment guiding players as to where they can progress. Special attention to the camera that will bob up in down in accordance with the movement, trying to recreate the actual vision, and not a fixed video feed. Even though Mirror’s Edge has a combat system, it’s not the main focus, which makes it scarce.</p>', 'https://media.rawg.io/media/games/8e4/8e4de3f54ac659e08a7ba6a2b731682a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/38b/38bb5b035c811402248bbc19297d5183.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/4b6/4b6daf2d868abed65984f6ba308eb5f6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b07/b07d46f11697eb8ee5002d37d9ddc696.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ddd/ddde2f1b028ded72097066b504db6f8b.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a8b/a8b9fe7b7e04ff20405e40fb31cfe56e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/741/741957fcdece6895a653bf51786838e9.jpg\";}', 12.99, 0, NULL),
(95, 'Max Payne 3', '<p>In Max Payne III we see Max from a new perspective. Taking place nine years after the second game, Payne left the police department in New York and now serves as a private security contractor in São Paulo, Brazil. Guarding the Branco family - Ricardo, Victor and Marcelo, everything turns into a disaster when a local street gang kidnaps Ricardo&#39;s wife. In attempt saving Ricardo&#39;s wife, another outlaw involves. In the end, Max has to infiltrate the gang to save Fabiana and perform some justice.</p>\n<p>Even if Max is old, he still can put on a hell of a fight. A cover system provides some good tactical advantages and bullet time is now something iconic for the series. Manipulating with time, Max can perform some amazing tricks to kill his opponent. Also, you can shoot from any angle basically, while lying on the ground. If that isn&#39;t enough for you, you can obliterate your enemies with melee attacks or blow them up by using explosives. </p>\n<p>As another feature of the game, no loading screens are involved. Cut-scenes are also interactive, and with that, the process of the game is absolutely smooth which makes the best experience from an intense shooter.</p>', 'https://media.rawg.io/media/games/5bf/5bf88a28de96321c86561a65ee48e6c2.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/05b/05b7b6970c42861b24c97a829135f685.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/770/7706c93f23fef77b8e500eb7ee06eee9.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/898/89879b7064e612c95bf976d6abc2fa0c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/24f/24f3c80cfad97fe119a317dd7f1b3ffb.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/961/96136b0c8c45e4a9df2d2482fb862a8e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/53a/53a90ec4b5ea59a217fd4cc075b877ad.jpg\";}', 12.99, 0, NULL),
(96, ' BioShock', '<p>FPS with RPG elements, Bioshock invites players to experience horrors of underwater isolation in the city of Rapture, the failed project of the better future. After surviving the plane crash, the protagonist has only one way to go – to the giant lighthouse that opens a way to the underwater utopia. Players will have to unravel the complicated history of Rapture, relying only on themselves, their guns and Plasmids, a mystical substance, that allows it’s user to obtain near magical abilities.<br />\nThe atmosphere of isolation and threat is conveyed through the environmental sounds, subtle electrical buzzing and audio logs, telling the story of societal decay and despair. Players will shape the story, making moral choices along their way, saving Little Sisters or extracting ADAM, the mystical fuel for your abilities. While exploring the underwater city, players will complete missions for the last sane inhabitants of Rapture, while fending off the less fortunate ones.</p>', 'https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/01f/01f62d7064838a5c3202acfc61503487.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/7f5/7f517e07e36e4af5a7c0b86a7d42853f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/aca/aca089b963a42ec4cbf56b5e5334af8e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3aa/3aa6f71eba1d64e671bd45826ca96560.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d8e/d8ed29c7c0b41e4013588847944ed446.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/146/146e418797aca19296f90d259207414c.jpg\";}', 12.99, 0, NULL),
(97, ' Counter-Strike: Global Offensive', '<p>Counter-Strike is a multiplayer phenomenon in its simplicity. No complicated narratives to explain the source of the conflict, no futuristic and alien threats, but counter-terrorists against terrorists. Arena shooter at its core, CS:GO provides you with various methods of disposing enemies and reliant on cooperation within the team. During the round of the classical clash mode, you will gradually receive currency to purchase different equipment. Each player can carry a primary weapon, secondary pistol, knife and a set of grenades, which all can change the battle if wielded by the skilled player. <br />\nObjectives are clear and vary from map to map, from game mode to game mode. Stop the terrorists from planting explosives, stop the counter-terrorist from retrieving the hostages, kill everyone who isn’t you and just perform the best with.<br />\nCS:GO is one of the major cybersport discipline, which makes playing it more exciting to some players. Aside from purchasing the game, CS:GO is infamous for its loot case system, that requires players to purchase keys, in order to open said cases. Customization items consist of weapon skins, weapon stickers, and sprays that do not affect gameplay and have purely visual value to the player.</p>', 'https://media.rawg.io/media/games/736/73619bd336c894d6941d926bfd563946.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ff1/ff16661bb15f7969b44f6c4118870e44.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/41b/41bb769d247412eac3336dec934aed72.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/754/754545acdbf71f56e8902a07c7d20696.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/fd8/fd873cab4c66db0b8e85d8a66e940074.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/7db/7db2954f7908b6749c36a5f3c9052f65.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/337/337a3e98b5933f456a2b37b59fab5f39.jpg\";}', 12.99, 0, NULL),
(98, 'Fallout', '<p>Fallout franchise started in a very different way than we all know it by this day. As Bethesda started to develop Fallout franchise only from the third game, original Fallout was completely different.</p>\n<p>The game starts in 2161, 84 years after a nuclear war destroyed most of the planet and turned into Wasteland. You can either create your protagonist or play as three pre-set options - Albert Cole, Max Stone or Natalia Dubrovhsky. When in Vault 13 water supplies start to malfunction via technical reasons, Overseer sends protagonist in a quest to find a replacement and save the Vault. Having Pip-Boy and some standard equipment, the Fallout world is absolutely open for exploration. </p>\n<p>Although being a completely different genre of the game, Fallout still uses the same systems as we know today. S.P.E.C.I.A.L. system of characters stats (strength, perception, endurance, charisma, intelligence, agility and luck) affect your skills in a variety from 0% to 200%, as well as definitive straits that you choose only once for whole gameplay. Known to players as Karma, you can choose how to act in most of the situations and determine your reputation with other characters in the game.</p>', 'https://media.rawg.io/media/games/14a/14a83c56ff668baaced6e8c8704b6391.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fd5/fd547ecaf4ce93b6b92b7e3d6d45003c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/730/730734e8a25cbd4e61ba7e1491edd98b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/39e/39ea98f90b3eec8ef95d47c821dea1f0.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/23f/23ffe371d0207e84938eb0c9e9943cb5.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/fb4/fb4d219d7b3debb818e2b2720eb40a6f.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/180/180adcc8a7f742978ecde0bb4b6c32dd.jpg\";}', 12.99, 0, NULL),
(99, 'Spec Ops: The Line', '<p>The Line is the tenth entry into the Spec Ops series, as well as a modernized reboot. Following the worst recorded sandstorms in Dubai, Captain Martin Walker was sent to investigate the events that took place in the city, after it was cut off from all transport and communication. So now the squad of the elite soldiers has to discover, what was meant by the last message they received from the dense wall of raging sand.<br />\nSpec Ops: The Line places the attention on the squad mechanics, where players can give orders to the NPCs, accompanying the player during the game. Aside from the single-player story campaign, players can join the multiplayer matches, which may vary from the solo/team deathmatch to “King of the Hill” type matches. Cooperative missions for two players have been added shortly after the game release. The single player campaign allows players to experiment with the weapons, carrying two at a time and use the environments to their advantage, using hazardous sandstorm to clear-out the enemies.</p>', 'https://media.rawg.io/media/games/b49/b4912b5dbfc7ed8927b65f05b8507f6c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a17/a17ff71c8774a3b70375a869b3881244.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e5a/e5aaa5d242144ab80ef8264c96516dcc.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/f36/f36e756c36d36fe8ffe73a4b39acbebf.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/437/437ad0efe43adcad4284f5f48d03559f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9e2/9e26af47a676b061f288ff269e91a8f1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2d9/2d9a5dd6a25c04e49accca5358782152.jpg\";}', 12.99, 0, NULL),
(100, 'Saints Row: The Third', 'Welcome to Steelport, a city that’s been torn by the three violent gangs. And seemingly, only another violent gang can stop them. After merging with Ultor Corporation after the events of the second game, Boss and his lieutenants became a corporation of their own. And now, after a run-in with the corrupt police forces, when they’re in the hands of the Syndicate, alone and cut out from the gathered wealth and support, 3rd Street Saints have to start from the bottom. \r\nWhile being a third person action adventure game, Saints Row: the Third is described by developers as the game that has everything in it. While the base game is reminiscent of GTA type of games mechanically, shifting tone and frantic story create the comedic and exciting atmosphere. A long line of DLC adding to the game not only unique missions, even by the Saints Row standards, but customization items, transport, and outfits. Reviews adore the lack of serious tone and gritty realism.', 'https://media.rawg.io/media/games/d69/d69810315bd7e226ea2d21f9156af629.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ac0/ac00b015e9c51f52a24631c44676f81b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/4e8/4e8cb89dc1ac9b3a9b68ad34f1dbc744.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/cc2/cc205478d728ad862c0e9da48df5db05.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/6a4/6a4976a45c96960e72d05362375908e4.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e26/e26e0f29195d3682e6e9e9f5a74f6250.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/215/215fbd506ac8c1a24cb2bf9b9a4d5b92.jpg\";}', 15, 0, NULL),
(101, 'Papers, Please', '<p>The creator of the game often travelled through Asia and made the observation that the work of an immigration officer checking documents for entry is simultaneously very monotonous and very responsible. The game reproduces this work - but scammers and unusual situations occur in it much more often than in reality. The task of the player-officer is not to make a mistake, not to let an unwanted guest into the country. He has power, directories, translucent devices, etc., but experienced masters of deception and fraud act against him. The task of the player is complicated by the fact that his country is like all the paranoid dictatorships at the same time. This country fears a lot, seeks to control everything and periodically generates various rules. The game has a lot of humour, a lot of exciting puzzles and unexpected twists, including shooting. The visual and musical design of the game reflects the bizarre world of stupid rules, constant fear and mutual distrust.</p>', 'https://media.rawg.io/media/games/6d3/6d33014a4ed48a19c30a77ead5a0f62e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/da7/da7cc2dfb913960f33f11c462a45ae24.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/c7e/c7ed47fe23150285d767937fb74a2ce8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/8ce/8ce471df9bbd39106fad1624d39dab41.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e42/e427a9256af3fe78ab327cd4374816ef.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ad9/ad9f6289adaf20ae5f51a615b032aebe.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/889/8899ba796cd7dfa2927a880a27c42365.jpg\";}', 12.99, 0, NULL),
(102, 'BioShock 2', '<p>The second game returns us to the city of Rapture, on the New Year’s Eve, but this time player takes control of Subject Delta, Big Daddy, that’s been separated from his little sister and has been forced to shoot himself 2 years before the events of the first game took place. And after his awakening 10 years later, players will help to save the last sane citizens of Rapture. As seen in the previous game, the player will have access to new weapons, unique to Big Daddies, power drill and a rivet gun, alongside an array of plasmids, Tonics, and guns. Now players will be able not only save Little Sisters from other Big Daddies, and then either harvest ADAM directly, or protect them while they collect ADAM for their new guardian. Bioshock introduces a new enemy type, Big Sisters, which are extremely agile and fast versions of Big Daddies. Newly added multiplayer brings several never seen formats to the series. Aside from expected Deathmatches, the game added story-driven mode Fall of Rapture.</p>', 'https://media.rawg.io/media/games/157/15742f2f67eacff546738e1ab5c19d20.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a13/a130b342c9830f9c56d65c204638fe17.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f38/f38a519f1545ef5cda66676c155cc5b8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/996/996d1459d3f2ec1f03daba488d96c521.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8da/8daab3b2c3d9e355f636e7d408a08315.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f5c/f5c713b706c6b153b6a22ca1b08a1f5a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b7c/b7c32275a6be8134744322f1204ce176.jpg\";}', 12.99, 0, NULL),
(103, 'Grand Theft Auto IV', '<p>Every crime story is a story of a search for success. The player will become Niko Bellic, immigrant arriving at the Liberty City to reunite with his cousin Roman and find the man that betrayed him and his army unit fifteen years prior to the events of the game. While protecting his cousin, Niko has to deal with loan sharks, Russian mobsters, and other gangs. After the third game, GTA brought more realism to the player, in order to make the city and its people look more believable. Street vendors on every corner will sell food that replenishes health, bars with playable dart boards, bowling alleys and even comedy clubs and movie theatres. Open world will allow players not only hang out with important NPC in order to receive bonuses and unlocks but taking girls on the dates as well, to help Niko settle. Multiplayer mode allows up to 32 players to explore the copy of the single-player city and initiate multiplayer activities, like races or Deathmatches.</p>', 'https://media.rawg.io/media/games/4a0/4a0a1316102366260e6f38fd2a9cfdce.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/07f/07f7cf80741ff306e4eca982c3e64ac8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/fef/fefd51ec13aa33acbd796ef79bcef7cb.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b78/b78ffd258d5793be704c380e572748bc.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/17c/17c85ab9dfc4fda8e1e5ba72932ef2bf.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a12/a12ca99cc74c1e7eba7100b0891dd1e0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b25/b254f9729ae3f36a9ccffccaa01d5cf6.jpg\";}', 12.99, 0, NULL),
(104, 'Undertale', '<p>Undertale is an independent role-playing game developed by Toby Fox.</p>\n<p>Once upon a time, there were two races on Earth: monsters and humans, but a war broke out between them and the latter won. Seven greatest mages sealed the monsters underground and left one entrance through a hole in the Ebott mountain. A lot of time passed since the war, but a human child accidentally falls down the mountain. Its goal is to get back out.</p>\n<p>Undertale uses pixelated graphics and traditional mechanics of RPGs such as earning experience points, having an open world, and so on. As the game goes on, the player has to solve several puzzles and interact with NPCs. The battles in the game are represented using the bullet hell mini-games with the player having an option to choose where they want to spare their opponent or hit the enemy back. Monsters behavior depends on the player&#39;s actions: if one decides to use a peaceful approach it will be easier to dodge the enemies attacks and vice versa. </p>\n<p>The game features a branching story and several endings. The ending the player gets depends on whether they spared or killed the monsters they encountered throughout the game.</p>', 'https://media.rawg.io/media/games/ffe/ffed87105b14f5beff72ff44a7793fd5.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f06/f0657f2790937cf09c34f0aa65e81d7d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1af/1af4cbbe6aaaad4661d627f545969a62.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/030/0302c932c7ba686f2674bc48ad0e941c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/33d/33d07448d2df02e23bba54764ca09a18.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/173/17361724f3e371c5ba14b1db9e166bd9.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e19/e19de998e419b52aea601dd83615d060.jpg\";}', 12.99, 0, NULL),
(105, 'Darksiders', '<p>In Darksiders, you play as War - one of the Four Horsemen Of The Apocalypse. Two kingdoms, Heaven and Hell, could never solve their disagreements and battled each other from the beginning of time. &quot;The Charred Council&quot; arose in between two sides forming the brotherhood of Four Horsemen - War, Death, Strife and Fury. With these for horsemen on the watch and all the conflicts end, humanity has been born - a &quot;Kingdom of Man&quot;. Council has created Seven Seals, that must be broken, when &quot;The Kingdom of Man&quot; will be ready for an Endwar. When our protagonist, War arrives on Earth, he sees that the final battle between Good and Evil already emerged without breaking Seven Seals. After fighting a demon called Straga, he is summoned by the council. It accuses him of destroying the balance, and that now the Apocalypse is unstoppable. Convincing the council in his innocence, War now has to stop the Endwar.</p>\n<p>Darksiders is a typical hack-and-slash game that lets you produce comboes with two primary weapons - Chaoseater and Scythe - and various gadgets. While defeating his enemies, War can execute them with brutality. The gameplay is undertoned with dark mythology bound with the present days.</p>', 'https://media.rawg.io/media/games/8d4/8d46786ca86b1d95f3dc7e700e2dc4dd.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5f8/5f81dd045727d7d3df37434051f3e58d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/75e/75e92dea166ed012b13c0f6d21fc8e74.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a12/a12169b5688d52e883c01357ab54498b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f45/f45af019f64f15d1ede88066288f131e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/df5/df58cef5989e5f6ad3ae9a65694e45c3.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/1f2/1f2f13dd3ab8dee76853c78958a729a2.jpg\";}', 12.99, 0, NULL),
(106, 'Just Cause 2', '<p>Just Cause II follows a story of Rico Rodriguez, who arrives yet on another fictional island. Previously being on the Caribbean, now he is coming to Panau - an island in Southeast Asia. This time, Rico has to overthrow the dictatorial regime with its leader, Pandak &quot;Baby&quot; Panay and confront his former mentor, Tom Sheldon. When Rico arrives at the island, he discovers three criminal gangs: The Roaches, The Reapers and the Ular Boys. In order to prevail, Rico has to fight all of the three fractions as well.</p>\n<p>One of the key features of the game is speed. This game is filled with adrenaline and ways of doing things very fastly. A wide variety of vehicles such as planes, boats, cars and other. A grappling hook is also available for the player as he can make his character fly around like Spider-Man or tie enemies to each other. There is a big choice of weaponry as well - you can have a pistol, two pistols, auto-rifles or even a grenade launcher! Having an open world map provides a player with experience do whatever they please - flying around, making missions or just discovering new things on the island.</p>', 'https://media.rawg.io/media/games/a3c/a3c529a12c896c0ef02db5b4741de2ba.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/34a/34a30f4a5a6f0e5c340d3c14456b8fcf.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/118/11867f9fe44372fb65beb2f2e15ae030.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5c1/5c144b4d26fe4c41bb35aa3878498b4f.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/39d/39d23cd38d9f6f9f45bf473c5ec4f49d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/dde/ddef23e3e0f22bc174b757cf69cc5816.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/514/514908623cd01610f3e361887102e549.jpg\";}', 12.99, 0, NULL),
(107, 'L.A. Noire', '<p>After the end of World War 2 long needed peace has been reached and should be protected, so Cole Phelps, a decorated war veteran, returns to Los Angeles, California to his wife and joining the LAPD. Neo-noir action-adventure, L.A. Noire allows players to solve crime cases through collecting clues, collecting witness statements and interrogation. Highly detailed facial animation allows players to detect the exact emotion witness or suspect is expressing, and it can become a leading hint in a case. Slow and meticulous crime solving is broke up by fast-paced action scenes including car chases, gunfights and hand to hand combat.<br />\nAfter every case player’s performance will be graded by 1-5 star rating, depending on how they acted during interrogations and how well they searched for the clues. Aside from the main story cases, detective Cole can be involved into optional side-investigations, known as Street Crimes.</p>', 'https://media.rawg.io/media/games/e2d/e2d3f396b16dded0f841c17c9799a882.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c08/c0823f02236f076a7a36ff5f3571558e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/dee/dee71bfc43834357e15e1d35d2c507c8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/69f/69fdec37afd586f274316a69e92303f1.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/4c0/4c0f154b51525e93ce8f2f18197c82ee.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/87b/87bf0f4ababb76a87b7ac82a282e44c6.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/5e0/5e05bd7135d8e8d8dfb92eb7e3d57181.jpg\";}', 12.99, 0, NULL),
(108, 'Call of Duty: Modern Warfare 2', '<p>Continuation of the sensational first-person shooter from Infinity Ward and Activision. It is rather difficult to maintain a high level of games every year, but it worked out in the sixth part of the series. The game continues the storyline of the previous part.</p>\n<p>The game consists of numerous fast-paced gunfights. Classic hit points are not here anymore - after receiving damage, the player only needs to sit tight in safety waiting for health to come back. There are three game modes: the story campaign, multiplayer and Spec Ops. </p>\n<p>If there are almost no changes in the campaign, and this is the same linear story, the Spec Ops includes 23 new levels for single or cooperative completion. Each level is a new task, a new challenge whether it is the defusing a bomb or the elimination of enemy forces. Levels are divided into tiers by their complexity.</p>\n<p>As in any other game of the series, the multiplayer in Modern Warfare 2 takes a special place. Each match is a mission, for which you need to come up with new strategies to complete. As in the past, new weapons and perks are opened for the execution of tasks.</p>', 'https://media.rawg.io/media/games/9af/9af24c1886e2c7b52a4a2c65aa874638.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/468/468450c797e2388adb27f43a9bfb545f.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1d7/1d72fb0ca12c48ecd67806949bee047e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/560/560b2add9ece92850b7f9913a5825557.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f7e/f7e36079a094e963548b1f4a7bcad862.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/65d/65da9ca595bea8b6984f5e376c8cb6f8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/00a/00a164bde7b8aa7dfc90b3b8a51caac6.jpg\";}', 12.99, 0, NULL),
(109, 'Red Dead Redemption', '<p>Red Dead Redemption is a third-person open-world adventure game which implements the Wild West at its best: it is very much GTA-clone but in bizarre stylistics and the very beginning of the twentieth century. This is the second title of a franchise, being preceded by Red Dead Revolver and followed by Red Dead Redemption 2 coming out in late 2018. <br />\nWe play as John Marston who gradually takes down and take out criminals and those, who crosses his path. Among the combat mechanics, the most interesting one is &quot;Dead Eye&quot; — it allows one to point multiple targets out in slow motion and then shoot them simultaneously. <br />\nThe game features 16-players multiplayer and cooperative and also has zombie DLC — Undead Nightmare. Additional content adds two modes to the original game: undead overrun in which you have to survive an infinite amount of zombie waves, and Land Grab in which player has to defend the particular piece of land to gain control of it.</p>', 'https://media.rawg.io/media/games/686/686909717c3aa01518bc42ae2bf4259e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cf4/cf4ff03cc16bf7ccff78c1fb38bcafc2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/304/304ad0c33748eff98812f057592741b6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ef7/ef743c271d18cf643a47543bf73fcf78.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8f7/8f76b9883f00955461bb4f57cbf64914.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/7aa/7aafdcf2cf8a9863673b767f368a3291.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/495/495b5bc877060900fcad68d5c6fb19b2.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(110, 'Dead Space (2008)', '<p>Dead Space is a third-person shooter with horror elements. Playing as Isaac Clarke, the systems engineer, players will be isolated on the spaceship USG Ishimura after the crew was slaughtered by mindless Necromorphs after the failed investigation of the distress signal. Now Isaac not only has to escape but uncover the dark secrets of Ishimura, while looking for the clues about the whereabouts of his girlfriend Nicole.<br />\nDead Space accents the survival aspect of the game, by keeping minimal UI and keeping HUD on the armor, making sure that the players can see the corners of the screen. Only weapons Isaac has access to are his engineer tools, which can all be upgraded with the limited supplies. Dead Space introduces a new variant of zombies called Necromorphs, that are highly mobile and instead of aiming for the head, players will be asked to attack the limbs, in order to incapacitate and slow them down, eventually killing them.</p>', 'https://media.rawg.io/media/games/ebd/ebdbb7eb52bd58b0e7fa4538d9757b60.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/83d/83db52cdc2646839d7f49bf21209e68c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/74e/74e4acf3288e4aee46bdbc8b3c0981a5.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/4d2/4d2b8d60ae5b9e241a6ab65934709628.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/80d/80dd9ee5711fcdaf374d07cf2a40a014.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/03e/03e73f7b9da0c3bbfe1080434dc8db84.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/552/55293d36d0de5c9adbd02b98031ca5d0.jpg\";}', 12.99, 0, NULL),
(111, 'Warhammer: Vermintide 2', '<p>Warhammer: Vermintide 2 is a first-person action game with heavy emphasis on cooperative multiplayer, a sequel to 2015 game Warhammer: End Times – Vermintide.  </p>\n<h3>Setting</h3>\n<p>The game takes place in Warhammer Fantasy setting during the early days of the cataclysmic event known as The End Times. It continues the story of the original game. The five protagonists – heroes of Ubersreik, must face the evil forces of Skaven clan Fester and chaos warband Rotbloods.  </p>\n<p>###Gameplay <br />\nWarhammer: Vermintide 2 consists of 13 missions divided into three acts. In each mission can choose one of five heroes and have to go from start to finish of the level, slaying hordes of enemies and to complete different tasks.<br />\nEach character has unique abilities, weapons, and progression system and serves a special role in the party. Every character has a melee weapon, ranged weapon, an active ability, several passive abilities and three careers to choose. The careers affect some of the character’s stats, available equipment and set of abilities. From the start of the game, each character has one career, while the other two get unlocked with leveling-up. After completing each mission, each character gains a random piece of equipment such as new weapons or trinkets. The equipment you get becomes better and better during the game.</p>', 'https://media.rawg.io/media/games/5be/5bec14622f6faf804a592176577c1347.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/4ab/4ab6de4d0f9c461d16e93b9c35acdbf9.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/22c/22caf69106bfa1da331b75ee5d9d5b5e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/772/77212bef33383882854b43b20ec1cd9c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/02f/02ffd1919f12ae3b2766b051c38c1f90.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/fc9/fc9a4c0d599267fb7069039c01b33b73.jpg\";}', 12.99, 0, NULL),
(112, 'Saints Row 2', '<p>Saints Row 2 brings true freedom to open-world gaming. Players can play as who they want, how they want, and with whomever they want in this sequel to the much acclaimed and tremendously successful Saints Row.</p>\n<p>Set years after the original, the player finds himself in a Stilwater both familiar and strange and challenged with bringing the Saints back as the rightful kings of Stilwater and bringing vengeance to those who wronged him.</p>\n<p>• Limitless Customization - Play as fully customizable characters that are male, female or something in between.<br />\n - Vehicles can be visually customized as well as performance tuned.<br />\n - Cribs and even gangs all have an amazing degree of detailed customization options.</p>\n<p>• Multiplayer - Co-op full story campaign has seamless integration (for example one player drives while the other shoots).<br />\n - Competitive MP pushes the boundaries of immersion in a living Stillwater environment fully populated with police, innocent bystanders and rival gangs.</p>\n<p>• Killer Combat and Awesome Vehicles - Planes, helicopters, motorcycles, boats and cars can be piloted and used as weapons. On the ground new combat options include melee, fine aim, and human shield.</p>\n<p>• Freedom to Explore - More missions, activities, diversions, races, weapons, vehicles, cribs, city districts, and interiors than ever before. Over 40 story missions with additional bonus missions take place in a transformed Stilwater that is over 50% larger than before.</p>', 'https://media.rawg.io/media/games/10d/10d19e52e5e8415d16a4d344fe711874.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/8b9/8b98c409d0f92eee04a4539813e370a7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/240/240071f110115884b39c4d6095746845.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/6a5/6a5500551128d104dc00d9f7dc4ea2b2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/04c/04ca5c6bffe121f8b2e9fa1310b9f0cb.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/3fe/3fe3813cb01b1c94d9ef332844dda2a9.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/50a/50a4496ceb48e7adee856cf66843e44a.jpg\";}', 12.99, 0, NULL),
(113, 'Sid Meier\'s Civilization V', '<p>Real-time strategy genre has always been about domination over your opponent, and Civilization in general expanded on the concept. Civilization 5 allows players to pick one of the 43 civilizations available in, including DLCs and the expansions. After that players in single player or multiplayer games will place their first cities, which will act as capital, and begin the race. In order to win, players will have to meet one of the following conditions:<br />\n- defeating every other existing nation through combat to get Domination Victory;<br />\n- building and launching a spaceship to get Science victory; <br />\n- completing the Utopia project by filling out 5 trees of social policies, to get Social Victory;<br />\n- winning a vote after establishing the  United Nations, to get the Diplomatic victory;<br />\n- getting the highest score at the end of the time period, if no other win condition was reached, to get Time Victory.<br />\nEvery civilization is represented by one of the most influential historical figures and voiced in the language of that nation. Easy to pick up game mechanics of research, foraging, and building, allow the player to immerse themselves into the game atmosphere of continuous development.</p>', 'https://media.rawg.io/media/games/55e/55ee6432ac2bf224610fa17e4c652107.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/880/880379d04f089c128f51be511c882de1.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/739/73928ce08a6a9a9480faf65bedf8611c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ccc/cccc59229370b01ba6f5bad75702c713.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/03e/03e69844696cb587c06fc058020a7255.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/608/6087a2a1e66102d146021cf10fcb69bd.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a2a/a2a207282454944eba73cbff6c82526e.jpg\";}', 12.99, 0, NULL),
(114, 'Monster Hunter: World', '<p>Monster Hunter: World is the fifth game in the Japanese franchise Monster Hunter, which is about hunting giant beasts. It is set in a medieval fantasy setting, on a continent known as the New World that is being colonized by the humans from the Old World. The plot revolves around a dragon migration called Elder Crossing. Your protagonist is a hunter, whose name and appearance can be customized. You traveled from the Old World to study and hunt the dragons and other local monsters.  <br />\nThe hunter, accompanied by an assistant, starts at the city of Astera, from where they can freely wander the open world. There are six regions in the New World, each with its own base camp. The camps are where you have to thoroughly prepare before every expedition, gathering equipment and provision. Before you can fight monsters, they need to be tracked down using Scout flies and studied to discover their habits, strengths, and weaknesses. There are no character levels, so your hunter’s effectiveness relies on the hunting gear you have equipped. Advanced armor and weapons can be created using a detailed crating system. Many items that you found on missions, including body parts of monsters, can be used for crafting.</p>', 'https://media.rawg.io/media/games/21c/21cc15d233117c6809ec86870559e105.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c1d/c1d2b3eae58a73518d20c040f783563f.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6af/6af12f47d129237cba6e9a533a55f6d7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/800/80059f527ef16e3cf804628968ece842.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c5f/c5f7d748c1a668c5a5789923aadbe60d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c56/c56295d86f5b8b56bca3a6c6398a4c70.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/d48/d4841fe62e5bf082eff19279f191a917.jpg\";}', 12.99, 0, NULL),
(115, 'Amnesia: The Dark Descent', '<p>Carefully constructed horror game relies on positioning, camera work, and shocking content. But Amnesia: The Dark Descent adds psychological elements to it. Players control the young man named Daniel, who wakes up in a seemingly empty castle, alone and with a massive memory loss. Through environmental storytelling, notes, audio logs and even visions, players are invited to uncover the deep-rooted secrets of the castle. <br />\nThroughout the game players will be introduced to the mechanics of Sanity, representing the mental state of Daniel which can be affected by lack of light, visions and even unpleasant encounters with the monsters. When decreased, Sanity will distort the vision of the player to a different and seemingly random effect, in order to depict actual effects of severe anxiety. Most of the game challenges are completed through the item search and physics puzzles, forcing players to be resourceful and courageous.<br />\nThe game supports modding, and allows user-created content alongside the free DLC Justine, telling a story of a female prisoner. Given how short the DLC story is - several possible endings are available.</p>', 'https://media.rawg.io/media/games/b54/b54598d1d5cc31899f4f0a7e3122a7b0.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/32b/32bde7545dff888358a7ce620c7b3063.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f59/f597e6857aab3b1ba098d713524d1690.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5fc/5fce282fa41e7d73d0e8b0c35da74391.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8f8/8f88209c1fdc529c3af746c08a44ba6c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/ff7/ff776252fbd6de18cfd197b57d6e6aac.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/42d/42d3c11b04e589565e5a9d2feae5023c.jpg\";}', 12.99, 0, NULL),
(116, 'XCOM: Enemy Unknown', '<p>Any alien invasion meets resistance in some form, so in this reboot of the series, players will take the mantle of the XCOM commander, and control the elite scientists and soldiers, in order to stop the threat. After successfully neutralizing scout ships, securing the crash site and retrieving civilians, XCOM personnel, and alien corpses, it’s clear that all of them are genetically and cybernetically altered, which starts the beginning of the arms race with the invaders.<br />\nDuring the missions X-COM: Enemy Unknown is a turn-based tactical game, while in the downtime players will direct the organization, form units, oversee the research, expand the base of operations and manage resources. Complex combat consists of units taking turns to perform their actions with a top-down view of the battlefield. XCOM soldiers and aliens can take cover during battles, and miss their shots and attacks if anything affects their accuracy. Over the course of the game, players will be able to gain access to new technology while encountering new varied enemy types.</p>', 'https://media.rawg.io/media/games/238/2383a172b4d50a7b44e07980eb7141ea.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/805/805471a778d484cdd5305b36f68ee1b6.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3da/3dab13378be0dc687857c1899c2db3bd.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/1b9/1b9536d06fdc789caa3f839548178ba0.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/bca/bca4db9d97ced7c3a42b2c7a90d4d28c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5a4/5a43d75d6517163772f492e2a5b278d6.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/77f/77feafcf416de96e61d7a6461b8b29f7.jpg\";}', 12.99, 0, NULL),
(117, 'Mass Effect 2', '<p>Mass Effect II is a sequel to Mass Effect one, following the story of Captain Shepard in his or her journey in saving the Galaxy from Reapers. Just after the fight against Saren, Shepard dies and drifts in open space. Being collected by Cerberus and the lead man, The Illusive Man, Shepard has to investigate attacks on human colonies around the Milky Way, and discover that now the Reapers using some new insectoid called the Collectors. </p>\n<p>You can choose from different classes to play, for example, a Soldier, Adept or Vanguard. A cover system is the main mechanic in the fight, as you have to think about fighting your enemy strategically. Your talents have a global CDR, so choose wisely. With one little addition, now your weapon has a loaded magazine of bullets, and you can run out of ammo if not using your weapon properly. </p>\n<p>BioWare sticks to the tradition of dialogue and reputation system, as your actions still affect your position in the world. If you act like a hero and help everyone you meet, people will like you and your reputation will be Paragon. Do the exact opposite and a Renegade. Whom will you be?</p>', 'https://media.rawg.io/media/games/3cf/3cff89996570cf29a10eb9cd967dcf73.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/3e9/3e987ae85497ded8e4fea09634be9c0a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/be5/be56c7c5c5b0f10644213f99051525f4.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/61c/61c0fb8a92ffdd64e9355202cbf1d3f2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2aa/2aa8bf125cb9c7c20ee1d296a3c4a45e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/90e/90ed4c6bb3c400ea3e825c47a09c41df.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/824/824e85651ba98e8539ef39b205428e88.jpg\";}', 12.99, 0, NULL),
(118, 'Borderlands', '<p>Pandora is a dangerous planet, so it makes sense that the strongest people will dominate it. 4 Vault Hunters arrive to find the legendary Vault found themselves at the Fyrestone, where mysterious girl only known as Angel guides them, helping to build the reputation of problem solvers. Eventually, players will be tasked to find the first piece, of the Vault Key.<br />\nBy being a story-driven first-person shooter with RPG elements, Borderlands allows adjusting the playstyle by finding different weapons, leveling up the character and improving some skills or attributes. Cooperative in nature, Borderlands can be played with up to 3 other players in total, where players can take the roles of 4 different characters: Brick the Berserker, Mordecai the Hunter, Lilith the Siren and Roland the Soldier. Some characters are naturally proficient in specific weapons, but players are not constricted to the skill requirements. When a specific weapon type is used often – the more proficient players are. Borderlands have several story DLCs that either shift the tone of the main game or expand on the existing storyline and characters.</p>', 'https://media.rawg.io/media/games/c6b/c6bfece1daf8d06bc0a60632ac78e5bf.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/153/153b36d06eaa5a3ff45cea30a572a169.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3e8/3e8622a82c5c4fd1b7b33afa6e574fa3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/64e/64e0e5c81cdff075721b8455c34c350c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/669/6693c7ffd9e40cc380ce2dc1c7b2d518.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/47e/47eaf455aded5fe47efc9a5a35dd90a0.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2cf/2cffe85c573b796a8071785a4c4f8847.jpg\";}', 12.99, 0, NULL),
(119, 'Total War: SHOGUN 2', 'In the darkest age of Japan, endless war leaves a country divided. It is the middle of the 16th Century in Feudal Japan. The country, once ruled by a unified government, is now split into many warring clans.  Ten legendary warlords strive for supremacy as conspiracies and conflicts wither the empire.  Only one will rise above all to win the heart of a nation as the new shogun...The others will die by his sword.<br />\nTake on the role of one Daimyo, the clan leader, and use military engagements, economics and diplomacy to achieve the ultimate goal: re-unite Japan under his supreme command and become the new Shogun – the undisputed ruler of a pacified nation.<br />\nGame Features                       Total War: SHOGUN 2 features enhanced full 3D battles via land and sea, which made a name for the series, as well as the tactical campaign map that many refer to as the heart and soul of Total War. Featuring a brand new AI system inspired by the scriptures that influenced Japanese warfare, the millennia old Chinese “Art of War”, the Creative Assembly brings the wisdom of Master Sun Tsu to Total War: SHOGUN 2. Analysing this ancient text enabled the Creative Assembly to implement easy to understand yet deep strategical gameplay.<br />\nCONQUER the islands of Japan in the 16th century.  Lead vast armies of samurai and fleets of giant warships into breathtaking real-time battles.<br />\nBUILD your kingdom on the inviting and turn-based campaign map.  Wield economic, political, and military power to amass wealth, armies, and influence.<br />\nSCHEME according to the &quot;Art of War&quot; by Sun Tzu. Use fire and siege tactics, spies and assassins to adapt to the ever-changing conditions on the battlefield and throughout your kingdom.<br />\nBATTLE ONLINE and experience the main campaign in two-player mode.  Then join epic online battles with up to 8 players and lead your online army to glory in special campaigns.<br />\nNew to Total War in SHOGUN 2                        New RPG skills and experience for your Generals and Agents.<br />\nNew Multi-stage Sieges - scaling the walls is only the beginning!<br />\nNew Hero units inspire your men and carve through the enemy.<br />\nNew rotating 3D campaign map.</p>', 'https://media.rawg.io/media/games/be9/be9cf02720c9326e11d0fda14518554f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5b6/5b68d6dd389bf32bb54f546c075050fc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/c5e/c5ee3d7c2600fab43df14245045cdbc7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/8ba/8ba5590c0290bed3ed490e655d4cd36d.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/eb9/eb9fd7457b8d14f6aa903608503fb7ea.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/076/076368643c9417350fcd09a79c6894cc.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/f98/f9853da557a0f707b1bca59a754dabcf.jpg\";}', 12.99, 0, NULL),
(120, 'NieR:Automata', '<p>NieR: Automata is an action RPG, a sequel to Nier and a spin-off to the Drakenguard series. The story is set in the middle of the war between humans and machines where you take on the role of an android warrior called 2B. The story develops around the theme of androids&#39; ability to feel and make their own decisions.<br />\nThe gameplay of NieR: Automata combines RPG elements, such as character progression,  with action-based combat and some platforming features, including climbing and jumping over obstacles. Except for traditional light and heavy attacks, there are quick time events that if the completed result in a highly damaging counterattack. You can use four weapon types during the battles: short swords, long swords, bracers, and spears. While you play as a robot, you can upgrade your body with special chips that increase your stats. <br />\nThe game is set in an open world and features numerous NPCs and side quests. You can explore it on foot as well as ride a wild animal or pilot a flying mech. There are also shops where you can get useful items including potions to restore health.</p>', 'https://media.rawg.io/media/games/5a4/5a44112251d70a25291cc33757220fce.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/286/28651ead277f96a8b950ded95b617b25.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/818/8186c49e4788cb1a9d346689afeff9e4.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/974/9747126200ff91b7b9515c4484e562a5.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f49/f498382127612aaa8d834e3c3eb2be33.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/667/667f82af0d448aaec6cc119eb7ab6909.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/48f/48fdff19cfe1dc37d86a20af01cc4bb8.jpg\";}', 12.99, 0, NULL),
(121, 'Mafia II', '<p>Mafia II is the second game in the franchise about Italian mafia operating in America after World War II. Vito Scalleta returns from the war in Italy being wounded. As he returns and reunites with his friend Joe, he and Henry Tomassino convince Vito to be apart of an Italian mafia in fictional city Empire Bay. Starting to work for Alberto Clemente, Vito must go through every aspect of being a part of the family and become a big thing in it.</p>\n<p>Even though the game has an open world mechanic, you won&#39;t probably explore it. Travelling to missions give an opportunity to listen to music of this time in America - Chuck Berry, Muddy Waters, Dean Martin and others, providing the game with a great atmosphere of the USA in its 50s. The gameplay has a variety of missions to offer, in which you can confront your enemies in melee combat, shoot them with different guns like M1911 or Thompson, or stealthily engaging your opponents. The game is pretty strict to the player reaching highest of empathy with Vito and every situation he&#39;s in.</p>', 'https://media.rawg.io/media/games/9e5/9e5b274c7e3aa5e30beba31b834b0e7e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fc7/fc7af04e8ec2245f6520eea80a07f27b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/609/609942d823b3f143bd740422e89bc957.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/884/88470240b56fe7e5b26e90855be8549c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c24/c24c38a52e37585e09e4d901f20e86dd.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/fa0/fa0b8f4a7479123c33ed9928a82c49e7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c9a/c9a3142299ef94565cfc72136ef58e4c.jpg\";}', 12.99, 0, NULL),
(122, 'Sekiro: Shadows Die Twice', '<p>Sekiro: Shadows Die Twice is a game about a ninja (or shinobi, as they call it), who is seeking revenge in the Sengoku era Japan.</p>\n<h3>Plot</h3>\n<p>The game is set in the 16th century in a fictionalized version of Japan. The main protagonist is a member of a shinobi clan. A samurai from the rival Ashina clan captured the protagonist&#39;s master, and the protagonist himself lost his arm trying to protect his leader. However, a sculptor of Buddha statues managed to replace the lost limb with an advanced prosthetic arm. The protagonist accepted a new name, Sekiro, meaning “one-armed wolf”. Now his goal is to avenge his clan and to save his leader from the hands of their enemies.</p>\n<h3>Gameplay</h3>\n<p>The player controls Sekiro from the third person view and navigates the character as he fights multiple enemies. Sekiro: Shadows Die Twice features an innovative combat system that doesn&#39;t use hit points. Instead, the opponents can be killed with a single precision strike. However, the player has to fight his or her way through the opponent&#39;s blocks and parries to land the deadly blow. The main character fights with his sword (katana) in the right hand, while his left hand can host a variety of upgrades, such as an ax, a torch, or a shield. The game also emphasizes stealth action. The player has to use a grappling hook to access multiple locations. Sekiro: Shadows Die Twice has no multiplayer.</p>', 'https://media.rawg.io/media/games/67f/67f62d1f062a6164f57575e0604ee9f6.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/198/198257c08163153e72a31bd61a6cd70b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/9b3/9b3add83516f3737b8054c7469be282a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/64d/64d71a80b0033e091b35c3948046605b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/8d7/8d77b08c45b3232961b443677fa06a5f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a96/a96e960d87fc209488ef25da79b92a84.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/8ed/8edc8d65ba1c1ab001a3fb1bd6fdeeb6.jpg\";}', 12.99, 0, NULL),
(123, 'Death Stranding', '<p>Sam Bridges must brave a world utterly transformed by the Death Stranding. Carrying the stranded remnants of the future in his hands, Sam embarks on a journey to reunite the shattered world one step at a time. What is the mystery of the Death Stranding? What will Sam discover on the road ahead? A genre defining gameplay experience holds these answers and more.</p>\n<p>Experience a journey like nothing before it, from legendary game creator Hideo Kojima. Take control of working man Sam Bridges, as he braves a deadly and mysterious world where death’s tide lurks everywhere.</p>\n<p>Featuring an all-star cast, including Norman Reedus, Mads Mikkelsen, Lindsay Wagner, Léa Seydoux and Guillermo del Toro, Death Stranding is a unique and unforgettable game.</p>', 'https://media.rawg.io/media/games/2ad/2ad87a4a69b1104f02435c14c5196095.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9da/9da640f5aa62f6fc00a4d1d255460737.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3d2/3d2a4337cf7673b086a1623d9e5ed2f3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5f3/5f3bc8289f9545db69a30fc414e94186.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2b7/2b731c32ebc308c30abe974cd1266648.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/460/4606e5ba14266eb2292cea7444e4239b.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2f1/2f10403f41e636dac29d1af2c5c1b982.jpg\";}', 12.99, 0, NULL),
(124, 'Deus Ex: Mankind Divided', '<p>Deus Ex: Mankind Divided is currently the last entry in the Deus Ex franchise. It was two years after the accident in Human Revolution, where augmented people started to act uncontrollable and aggressive. As it turns out, a rogue group called Illuminati made it look like a proof for their instability and now augmented people are living like outcasts. </p>\n<p>We follow Adam Jensen once again as he works as a double agent for Interpol and a hackers group called Juggernaut Collective to confront the Illuminati and reveal the truth.</p>\n<p>The core gameplay of Mankind Divided hasn&#39;t changed much except minor changes like no need for batteries anymore because your energy bar slowly regenerates itself back and a non-killing politic. You can beat the game without killing anyone making Mankind Divided a big morality question for the player as he walks it through.</p>', 'https://media.rawg.io/media/games/00d/00d374f12a3ab5f96c500a2cfa901e15.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d4c/d4ce2d053a78f5e05cea8c99be22b135.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/515/515438994fe978193980d9b259ad7c50.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/0a0/0a0fd428643d0491c96bf29840d18d02.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a31/a31228f42e1e5025cb35c2ab1b21bc98.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f06/f066b272534017b7f33b09cca803bd18.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2ae/2ae9537fd36039072f8ce5f5da592b68.jpg\";}', 12.99, 0, NULL),
(125, 'The Last of Us Part II', '<p>The Last of Us Part II is the sequel to the post-apocalyptic zombie game The Last of Us.</p>\n<p>Plot</p>\n<p>The game follows Ellie, the girl who was the secondary protagonist and the player character&#39;s companion in The Last of Us. The game is set five years after the ending of the original. Both Ellie (who is by 19 now) and Joel survived and live in Jackson, Wyoming, where Ellie is dating another girl, Dina. However, the characters have to deal with the evil cult called the Seraphites, who try to sacrifice their former members. A matter of revenge forces Ellie and her friends to undertake a trip to Seattle, Washington, to kill their enemies. The major theme of the plot is Ellie&#39;s dealing with her hate issues.</p>\n<p>Gameplay</p>\n<p>Unlike in the original game, the player controls Ellie instead of Joel, who now becomes her AI-controlled companion. The game features improved controls that include new options such as crawling, dodging, and a jump button. A new AI system allows the human adversaries to communicate share information with each other. The game also introduces multiplayer.</p>', 'https://media.rawg.io/media/games/909/909974d1c7863c2027241e265fe7011f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5a8/5a8f06949b0264aa27374d3f005a2842.jpg\";i:1;s:88:\"https://media.rawg.io/media/screenshots/160/1603055e1fc4fbbea395809242d23c67_CDpXDx3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e9c/e9cfbbc7821827e04c890ecf087c246c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e58/e58f17219570ca451356f6eec746e697.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/02a/02aede3e5e6738e37ff1240c1c2fcee8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/5ea/5ea913f25ebb5454571e8d92deddebcc.jpg\";}', 12.99, 0, NULL),
(126, 'Shadow of the Tomb Raider', '<p>Experience Lara Croft’s defining moment as she becomes the Tomb Raider. In Shadow of the Tomb Raider, Lara must master a deadly jungle, overcome terrifying tombs, and persevere through her darkest hour. As she races to save the world from a Maya apocalypse, Lara will ultimately be forged into the Tomb Raider she is destined to be.</p>\n<p>Survive and Thrive In the Deadliest Place on Earth: Master an unforgiving jungle setting in order to survive. Explore underwater environments filled with crevasses and deep tunnel systems.</p>\n<p>Become One With the Jungle: Lara must use the jungle to her advantage to strike suddenly and disappear like a jaguar, use mud as camouflage, and instill fear in enemies to sow chaos.</p>\n<p>Discover Brutal Tombs: Terrifying tombs, filled with deadly puzzles, require advanced traversal techniques to be accessed</p>\n<p>Uncover Living History: Discover a hidden city and explore the biggest Tomb Raider hub ever.</p>', 'https://media.rawg.io/media/games/7f6/7f6cd70ba2ad57053b4847c13569f2d8.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/167/16728aa54b1130772b06cdcac128e056.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3f7/3f711b42d24d9fdeb58faf1f69eccbe3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ef2/ef2be35eaf7e083cc5b51d2e2addf441.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/0d1/0d129ec2c410a11f4407ca469f92edda.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/bd5/bd51765bc9e33644cae768ee91c10e14.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/877/877d713525903c9f6019ad58b80650a6.jpg\";}', 12.99, 0, NULL),
(127, 'INSIDE', '<p>INSIDE is a platform adventure game that transfers the atmosphere of a dystopic world. Players assume the role of a lonely boy, who walks through the monochromatic 2.5D environment and solves various puzzles. By the time main antagonists of the character pursue him throughout the whole world. The main storyline follows the unnamed boy through the in-game world locations including a forest, a farm, and a fictional laboratory, where experiments on bodies are held. The gameplay is divided into levels tied to each location. While completing them, the boy, controlled by players, has to swim, run, climb the obstacles and use his supernatural ability to control bodies with his special helmet. In the course of the travel, the protagonist also comes across a siren-like creature, who gives him gear for breathing underwater. The death occurs in several ways ranging from drowning to being shot with a tranquilizer dart. In addition to the basic ending, the storyline features an alternate one, which unlocks after collecting all the hidden glowing orbs.</p>', 'https://media.rawg.io/media/games/d5a/d5a24f9f71315427fa6e966fdd98dfa6.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/3a0/3a049846766e09f8883badea6538e736.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b58/b58b50e9da6b409fd223912039c4cba7.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/7d0/7d07f39a90bc1ed2dea7186580b49c7a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/411/4116e5d3ccdf2bdcf6e4ee4eedf7caa2.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/e6b/e6b8b49e33a11f4ae875d1ce5b236cc8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/eb2/eb2b33954421291b98e2ae11fba72f7d.jpg\";}', 12.99, 0, NULL),
(128, ' Tomb Raider (2013)', '<p>A cinematic revival of the series in its action third person form, Tomb Rider follows Lara in her least experience period of life – her youth. Heavily influenced by Naughty Dog’s “Uncharted”, the game is a mix of everything, from stealth and survival to combat and QTE action scenes.<br />\nYoung Lara Croft arrives on the Yamatai, lost island near Japan, as the leader of the expedition in search of the Yamatai Kingdom, with a diverse team of specialists. But shipwreck postponed the successful arrival and seemingly forgotten island is heavily populated with hostile inhabitants, cultists of Solarii Brotherhood.<br />\nThe game will be graphic at times, especially after failed QTE’s during some of the survival scenes, but overall players will enjoy classic action adventure, reminiscent of the beginning of the series. This game is not a direct sequel or continuation of existing sub-series within the franchise, but a reboot, setting up Tomb Raider to represent modern gaming experience.<br />\nThe game has RPG elements and has a world, which you can explore during the story campaign and after the completion. As well as multiplayer mode, where 2 teams (4 scavengers and 4 survivors) are clashing in 3 game modes while using weapons and environments from the single-player campaign.</p>', 'https://media.rawg.io/media/games/021/021c4e21a1824d2526f925eff6324653.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/4f9/4f9d5efdecfb63cb99f1baa4c0ceb3bf.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/80f/80f373082b2a74da3f9c3fe2b877dcd0.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a87/a8733e877f8fbe45e4a727c22a06aa2e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3f9/3f91678c6805a76419fa4ea3a045a909.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/417/4170bf07be43a8d8249193883f87f1c1.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2a4/2a4250f83ad9e959d8b4ca9376ae34ea.jpg\";}', 12.99, 0, NULL),
(129, 'BioShock Remastered', '<p>BioShock is set in an alternate dimension in 1960. Our main protagonist Jack is the sole survivor of a plane crash in the Atlantic Ocean. With help, he gets to the Rapture - underwater city created by Andrew Ryan that wanted to create a utopia. After arriving in the city, however, he discovers Little Sisters and Big Daddies, and it is clear to Jack that there is something not okay with the city. </p>\n<p>Being a first-person shooter, BioShock works with an active weapon and a plasmid, on the other hand, giving the player the ability to use some supernatural powers and developing unique combos with it. Many of the weapons have different types of ammunition that are effective against some specific types of enemies. Same goes for plasmids, as you need to know weapon will be effective. By retrieving EVE, you will be able to fill your resources and use plasmid once more. Although the economics of the game is more complicated as you need to gather money for refilling resources and ADAM for purchasing new skills for your plasmid. In Remastered edition, games framerate and technical issues being fully fixed making this a modern-looking game.</p>', 'https://media.rawg.io/media/games/be0/be01c3d7d8795a45615da139322ca080.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/c70/c709280e11aabec614d0aafb5779114a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/414/41463563e721aa62c605cd0bf8350af3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/76d/76d11a76541bcfa63de3ef8fe5a5a668.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/25a/25ac07efdbf90a2d7e626353ebadc565.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/0f6/0f69943b1d81710ba2fdcac27d248ca9.jpg\";}', 12.99, 0, NULL),
(130, 'The Stanley Parable', '<p>The Stanley Parable is a first-person interactive story game. Being initially released in 2011 as a modification for Half-Live 2, it was entirely remade in 2013, featuring updated graphics and more content.  <br />\nThe game follows Stanley, an office worker whose job boils down to pressing buttons on the keyboard depending on what he sees on his office computer screen. One day the screen goes black and Stanley, not knowing what to do, decides to investigate the building. <br />\nThe gameplay consists of exploring a deserted office building. The game has 19 possible endings that depend on which way the player chooses to explore his surroundings. The Stanley Parable’s key feature is the permanent presence of the narrator who comments protagonist’s actions and suggests player what to do next. However, the player can ignore his suggestions which makes the narrator adjust his story to the player’s actions.</p>', 'https://media.rawg.io/media/screenshots/8f0/8f0b94922ad5e59968852649697b2643.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1c8/1c8d3926c83674020830ad74c9dab0cf.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e30/e3038541ff49b1fb1611160f8939fa68.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/033/033bd132868e1876c24d39016dd20771.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/214/21469106b5a6e8a07679c98e0c75867f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/7e8/7e81831cb05b80ebeefb61f20c6120fb.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0d7/0d744206035632e141640eb7d5c6b694.jpg\";}', 12.99, 0, NULL),
(131, 'This War of Mine', '<p>A small town surrounded by war. The usual order is irrevocably violated, you have to survive, but you are not a soldier and certainly not a superhero.<br />\nThe player controls a group of two to four civilians selected from twelve characters. The goal is simple - to survive the war.<br />\nLater, new people can join the group. Characters need food, can get sick, freeze, die from wounds. Can run away with all the food stock.<br />\nThe day is different from the night in everything. During the day we equip the shelter, repair and produce weapons and tools - from what can be found. In the afternoon we communicate with neighbours, sometimes with benefit. At night we go out for prey. The night harbours us but also harbours looters, often they are armed. Winter brings cold and freezes water, requires more health and firewood.<br />\nDecisions that have to be made often have a moral dimension - can one rob an unarmed person if this is a matter of life and death for someone from the group?<br />\nAs in life, events are seen as random and do not repeat from game to game. The same characters can behave very differently, and the siege can sometimes last twenty days, and sometimes eighty.</p>', 'https://media.rawg.io/media/games/283/283e7e600366b0da7021883d27159b27.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9e8/9e8b0c791f6dfc516a29e8b03d4fc7c3.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/294/29423009618495c87e9763eae5623de5.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fef/feff21b52293d9620423235314a581d0.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a58/a587e9b61baa56ca72869abe839a634e.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/257/257ad17745b95dbb0c02127d64b23473.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a34/a34c4dd8482b553855dc1eb4eedaf9b9.jpg\";}', 12.99, 0, NULL),
(132, 'Brutal Legend', '<p>Heavy Metal is a way of life and a world in itself, but Eddie Riggs found the real one, after the accident during a concert left him crushed by the scenery and making the involuntary blood sacrifice to the Ormagöden. The action adventure game with the real-time strategy elements in the open world introduced a star voice cast, compiled by musicians that became prototypes for some of the characters players will encounter during the game. Aside from the main story, players will be able to encounter dozens of side missions that may vary from the defense battles to a race. When using his V-guitar named Clementine, Eddie can cast spells, called Solos, by a simple rhythm game, reminiscent of Guitar Hero. Some story missions are so-called Battles of the Bands, where players will fight the armies in a real-time strategy fashion, and winning by outperforming the enemy band and destroying the stage.</p>', 'https://media.rawg.io/media/games/af7/af7a831001c5c32c46e950cc883b8cb7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ded/ded6b47a8903f3ff9903f2068f132942.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/252/252def39bf9e2630a2c7eb6a736171eb.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/092/092467f790f3f594bb3f0886df02d9d0.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/9bb/9bb08c6e8ae706f90c106c8a7de57644.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d29/d298235806cffe6393aadf37ef6c0632.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a30/a3059c047b76d09c8dfa19ce5ed0c8cf.jpg\";}', 12.99, 0, NULL),
(133, 'Fallout: New Vegas', '<p>Fallout: New Vegas is the second instalment after the reboot of the Fallout series and a fourth instalment in the franchise itself. Being a spin-off and developed by a different studio, Obsidian Entertainment, Fallout: New Vegas follows the Courier as he&#39;s ambushed by a gang lead by Benny, stealing a Platinum Chip and heavily wounded, practically left for dead. As he wakes up, he minds himself in the company of Doc Mitchell who saved our protagonist and patches him up. This section of the game is given for customising your characters, picking traits and the look of the main hero before embarking on his journey to retrieve Platinum Chip.</p>\n<p>New Vegas has very similar gameplay to Fallout 3 with a few improvements, such as iron sights for most of the guns, new animations for VATS kills, new perk Survivor, which allowed you to have more benefits from drinks and food you could craft and gambling in the casinos. Expanded crafting system, weapon modification system force player to scavenge for resources. Reputation system was reintroduced in New Vegas as old reputation system from Fallout 2, with Karma making a serious impact on the game.</p>', 'https://media.rawg.io/media/games/995/9951d9d55323d08967640f7b9ab3e342.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5b3/5b39206a3b241688fbd69467d75151b8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/286/2861a20b67d61263b5b790cb1ab5e330.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/7c5/7c5083ee282a2ea3d6248361592cf8af.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/704/704c2186d4d1e73ca30e4a3f904f7a6c.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/502/502aacc7e1e71435c29e4dae7ce6c1f3.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/afe/afecd18ebd303b5cc450777f6beb1dd5.jpg\";}', 12.99, 0, NULL),
(134, 'Hitman: Absolution', '<p>The direct sequel to the Hitman: Blood money, Absolution tells the story of Agent 47, the true intentions of his Agency and how top Agent became a renegade on the run. Unlike previous games in the series, players will get more linear and cinematic experience. The game revolves around objective-based missions, providing various methods of completion. Players can avoid direct confrontation by disguising themselves in other people’s uniforms and use environmental interactions to distract or kill unsuspecting targets. And in case of raising the alarm, players can try to rush the mission with the direct attack, using dozens of available weapons.<br />\nPlayers can use special vision mechanic, called Instinct. It allows seeing through the solid surfaces in order to observe NPC’s, items that can be interacted with and predict the movement of patrolling guards. Absolution provides players with additional challenges and collectibles in order to invite players to explore the maps.</p>', 'https://media.rawg.io/media/games/d46/d46373f39458670305704ef089387520.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1b9/1b935461ecbdaf9ce51a8d3f02d6848e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/53c/53c2e650009d65f1a8587fbef7c44e89.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/69b/69bf3d7eda87b1e9c382276e3b4fa987.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2b5/2b5454013919650e315f6d2c249c4978.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c40/c401710fe96692996a4091afdac694d8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3c4/3c44380232b0e07918d3a4d9647fc606.jpg\";}', 12.99, 0, NULL),
(135, 'The Wolf Among Us', '<p>The Wolf Among Us is a five-part episodic game relying heavily on dialogues and choices of the player. The game is considered a prequel to Bill Willingham&#39;s &#39;Fables&#39; comic book and features usual TellTale stylistics: cartoon-like graphics, comparing your choices to the decisions of the other players and QTEs. &#39;The Wolf&#39; is the first part of the series with a promised expansion to the second season coming out in 2019.<br />\nYou play as Bigby Wolf; he is a Sheriff of a Fabletown: as a typical Sheriff, you need to fulfill the requests of the Fabletown&#39;s residents and uncover mysteries lying behind the crimes there. The gameplay consists of choosing the dialogue options, reacting to QTE button-mash and watching cutscenes. <br />\nThe critics are marking down that unlike many other TellTale games &#39;The Wolf Among Us&#39; borrows original comic book&#39;s portrayal thus looking better, and having the original as sequel before you eyes lets you engage with Fabula more quickly.</p>', 'https://media.rawg.io/media/games/be0/be084b850302abe81675bc4ffc08a0d0.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/de9/de9542857c18a8021aaeb6150c13fed0.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e24/e24e0d5e604b3746e60e89d2450c8c26.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e97/e972f959ca6fd2a10c8775cbe21ac16c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3f9/3f9cceba2f198128b92b1c4ad2eee438.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b8e/b8ec355a1260f9d882394ce0350a5d2a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/40f/40f741b69448c6c4a73215a47e8d3b95.jpg\";}', 12.99, 0, NULL),
(136, ' The Elder Scrolls V: Skyrim', '<p>The fifth game in the series, Skyrim takes us on a journey through the coldest region of Cyrodiil. Once again player can traverse the open world RPG armed with various medieval weapons and magic, to become a hero of Nordic legends –Dovahkiin, the Dragonborn. After mandatory character creation players will have to escape not only imprisonment but a fire-breathing dragon. Something Skyrim hasn’t seen in centuries.</p>', 'https://media.rawg.io/media/games/7cf/7cfc9220b401b7a300e409e539c9afd5.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/3bd/3bd2710bd1ffb6664fdea7b83afd067e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/d4e/d4e9b13f54748584ccbd6f998094dade.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/599/59946a630e9c7871003763d63184404a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c5d/c5dad426038d7d12f933eedbeab48ff3.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b32/b326fa01c82db82edd41ed299886ee44.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/091/091e95b49d5a22de036698fc731395a2.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(137, 'The Witcher 2: Assassins of Kings Enhanced Edition', '<p>The player is Geralt of Rivia, infamous monster slayer. In the second game of the series, titular witcher is involved in the inner conflicts of Temeria, where he stopped the rebellion and was hired as a bodyguard of Temerian King Foltest. Eventually, Foltest was assassinated by a witcher-like assassin, and the only person fitting the description was Geralt. <br />\nThe game combat system was reworked, in order to add traps and ranged throwing weapon, giving players more control over the course of the battle. It’s still a third person action RPG, and the player can upgrade and improve general abilities, swordsmanship, alchemy, and magic. <br />\nThe enhanced edition includes additional hours of content, new cinematics, the original soundtrack, game manual and quest handbook, among other things. The new tutorial allows players to spend more time to master new game mechanics and see for themselves visual improvements to the core game.</p>', 'https://media.rawg.io/media/games/6cd/6cd653e0aaef5ff8bbd295bf4bcb12eb.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/0c2/0c2a61b9c675c79be87bb3932779062c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/361/36171d84641951be2ca964b667d55d54.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/336/3366909fa35d542c7293df9d6b4d0aac.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c67/c672445939555d23ab0acbeba2d4527f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/441/4413f59b847bc08634920b79a2071399.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/cb5/cb5517c5b620811050cb791516f2c5da.jpg\";}', 12.99, 0, NULL),
(138, 'Paladins', '<p>Paladins (also known as Paladins: Champions of the Realm) is a free-to-play multiplayer first-person shooter. The game is, according to developers, influenced by Team Fortress 2 and is an example of hero shooter subgenre: a type of multiplayer shooter in which you choose to play as one of the pre-made characters with unique abilities and weapons¬.  <br />\nThe primary game mode in Paladins is the siege. Two teams are fighting for the capture point in the center of the map. When a team successfully seizes the capture point, it gets 1 Objective Point, and the Payload spawns for them. Now they must escort the Payload to the enemy’s base to get additional Objective Point. The hostile team can, however, steal the Payload to get Objective Point themselves. Once a team gets 4 Objective Points, it wins the match. <br />\nThere are more than 38 heroes (or “champions” as they are called in the game) available in Paladins. Initially, the player has access to 5 of them at any time, and 4 more are in a two-week rotation. To permanently get any other champion, the player has to buy the champion via in-game currency or buy the champions pack for real money.</p>', 'https://media.rawg.io/media/games/d2c/d2c74dacd89fd817c2deb625b01adb1a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/014/014f87c62cbff3027ddcf9779f2ac18c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/d48/d488374a06516f9e801ba067fb2469e8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/43f/43f109d255699d139723b15bcf0e7d10.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/737/73717d42eba514f3231df9980206d350.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/dc6/dc6e1c1b47a3f53cdaa6bbab7dc8b1b5.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0cc/0cc3a18b8fdaecfdfe9b6551c32e9297.jpg\";}', 12.99, 0, NULL),
(139, 'Marvel\'s Spider-Man', '<p>Marvel&#39;s Spider-Man offers the player to take on the role of the most famous Marvel superhero.</p>\n<h3>Plot</h3>\n<p>The game introduces Spider-Man as an already experienced superhero. By the time the game begins, Peter has captured the infamous Kingpin as well as several other supervillains. Now, a gang that goes by the name of Demons poses a new danger to New York. Meanwhile, Peter is working for the scientist Otto Octavius, who didn&#39;t yet become Dr. Octopus, on their science project. Throughout the game, Spidey has to deal with multiple enemies, such as Norman Osbourne, Electro, Vulture, Rhino and Kingpin, among others.</p>\n<h3>Gameplay</h3>\n<p>The player controls Peter Parker, aka Spider-Man, from the third person view. There are also sections of the game in which the player controls other protagonists, namely Mary Jane and Miles Morales. The game is set in a 3D environment that is modeled after New York City. The player can travel the city using web slings, running, jumping, and crawling the walls. The setting includes numerous high-rise buildings designed specifically for Spider-Man&#39;s movements.</p>\n<p>As the player progresses, he or she unlocks new suits that grant Spider-Man new abilities, such as additional attacks or enhanced Spider-Sense. The abilities are not tied to the suits, however, and the player can use the suit of his or her choice without losing the ability. The combat system is similar to that in Batman: Arkham, in that Spider-Man fights many opponents in hand-to-hand combat but avoids killing them.</p>', 'https://media.rawg.io/media/games/9aa/9aa42d16d425fa6f179fc9dc2f763647.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/331/331ba5164c5c53a5d59aad3fe9771ac7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/a15/a15b42bd8a652a3733c6ad419ebb24bd.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/150/150589c127b28f287f992c2bd426b443.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f52/f526988f895b554dccf68767557a8518.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/745/74589db2dee21101d7af690976fca902.jpg\";i:5;s:81:\"https://media.rawg.io/media/screenshots/090/09063845f2efe6d0b9bc908e2652c1e1.jpeg\";}', 12.99, 0, NULL),
(140, ' God of War (2018)', '<p>It is a new beginning for Kratos. Living as a man outside the shadow of the gods, he ventures into the brutal Norse wilds with his son Atreus, fighting to fulfill a deeply personal quest. </p>\n<p>His vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh, unforgiving world that he must fight to survive… And teach his son to do the same. This startling reimagining of God of War deconstructs the core elements that defined the series—satisfying combat; breathtaking scale; and a powerful narrative—and fuses them anew. </p>\n<p>Kratos is a father again. As mentor and protector to Atreus, a son determined to earn his respect, he is forced to deal with and control the rage that has long defined him while out in a very dangerous world with his son. </p>\n<p>From the marble and columns of ornate Olympus to the gritty forests, mountains, and caves of Pre-Viking Norse lore, this is a distinctly new realm with its own pantheon of creatures, monsters, and gods. With an added emphasis on discovery and exploration, the world will draw players in to explore every inch of God of War’s breathtakingly threatening landscape—by far the largest in the franchise. </p>\n<p>With an over the shoulder free camera that brings the player closer to the action than ever before, fights in God of War mirror the pantheon of Norse creatures Kratos will face: grand, gritty, and grueling. A new main weapon and new abilities retain the defining spirit of God of War while presenting a vision of violent conflict that forges new ground in the genre</p>', 'https://media.rawg.io/media/games/4be/4be6a6ad0364751a96229c56bf69be59.jpg', 'a:6:{i:0;s:81:\"https://media.rawg.io/media/screenshots/d68/d6868e5f7bce66e326bd48b11ba24b13.jpeg\";i:1;s:81:\"https://media.rawg.io/media/screenshots/928/928cdaf4ae204f202d177bbd65e911b3.jpeg\";i:2;s:81:\"https://media.rawg.io/media/screenshots/a54/a549a06ebe89c570cabb57308c4c42a5.jpeg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f02/f0279f8199da3e91134078e737e5fbcf.jpg\";i:4;s:81:\"https://media.rawg.io/media/screenshots/e87/e87c57660c7c37fe973c6dd6ebcc1ac6.jpeg\";i:5;s:81:\"https://media.rawg.io/media/screenshots/5b7/5b7280fe437c39d3ce501a867c46a998.jpeg\";}', 12.99, 0, NULL),
(141, 'Assassin\'s Creed Odyssey', '<p>Assassin&#39;s Creed Odyssey is the twentieth game in its series. It is the earliest game in the Assassin&#39;s Creed universe chronology and the prequel to Assassin&#39;s Creed Origins.</p>\n<h3>Plot</h3>\n<p>The events of Assassin&#39;s Creed Odyssey&#39;s take place in the Classical Era of Ancient Greece, in 431 BC, before the Brotherhood of Assassins was even formed. The plot follows a fictionalized story of the Peloponnesian War between city-states of Sparta and Athens that left Greece devastated. The player can choose to control either a male (named Alexios) or female (named Kassandra) protagonist, both of them being descendants of the famous Spartan king Leonidas. The player enters the plot as a mercenary and can side with either Athens or its rival Sparta. There&#39;s also the frame story set in the contemporary age. Its protagonist is Layla Hassan, who was also the main character in the frame story of Assassin&#39;s Creed Origins.</p>\n<h3>Gameplay</h3>\n<p>Unlike most earlier installments of Assassin&#39;s Creed, which put the emphasis solely on action, Odyssey has a strong role-playing element in it. Dialogue options and the non-linear plot allow the player to reach several alternate endings. The game also has a reputation system and multiple options for romancing, including same-sex romances. The combat system is similar to that in Origins with the addition of new skills. The game also reintroduces naval battles.</p>', 'https://media.rawg.io/media/games/c6b/c6bd26767c1053fef2b10bb852943559.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/412/412b1dd5c880b80d8404451d3ff44360.jpg\";i:1;s:88:\"https://media.rawg.io/media/screenshots/9b5/9b59a790deab688ea923e0cd7b0cadbd_sNpbwUf.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b09/b09a53fb76ea832671599a5f287ab34a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2f9/2f993667330526171e4056c0a0663437.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/6d8/6d8c268dff506f890478e6a0a492858b.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/588/5883818edafd22c8a2e1a45bf6fe07b1.jpg\";}', 12.99, 0, NULL),
(142, 'Hitman 2', '<p>Hitman 2 is the seventh game in its series. It is the sequel to Hitman and a prequel to all other entries of the franchise.</p>\n<h3>Plot</h3>\n<p>As with all Hitman series, the game follows Agent 47, a hitman for hire and a member of a secret assassins&#39; organization called International Contract Agency. His missions are tied together by a story that continues the plot of 2016&#39;s Hitman. The protagonist is searching for an anonymous opponent known as Shadow Client, who was also the main antagonist of the previous game. Hitman 2 also provides insight into Agent 47&#39;s mysterious past. The hunt for Shadow Client and his militia takes Agent 47 to new locations, such as a motor race on the sunny streets of Miami and a deadly tropical rainforest in Colombia.</p>\n<h3>Gameplay</h3>\n<p>As usual for Hitman series, the player controls Agent 47 from the third person view (switching to the first person when using sniper rifles) in a 3D environment. The game consists of several missions in which the protagonist has to assassinate various targets around the world using non-conventional tactics, stealth, and camouflage. Hitman 2 features an advanced crowd AI and an improved stealth system that allows the player to hide between the trees and in the crowd. The game also features new weapons, such as concussion gadgets that the player can use to knock people out.</p>\n<h3>Multiplayer</h3>\n<p>The game introduces a new mode called Sniper Assassin that allows the players to cooperate online.</p>', 'https://media.rawg.io/media/games/858/858c016de0cf7bc21a57dcc698a04a0c.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/787/7872b36b20cef1baf445317f5d72716a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b06/b06268c8a5b5948eb80916eb9feba028.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/d70/d705d2dc0fc9f0a679c6fa17a0d1b99f.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/16b/16b1268158bea29f5779f360ec60b0f1.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/26c/26cde3952d7fb62b7d667accb71ade95.jpg\";}', 12.99, 0, NULL),
(143, 'Halo Infinite', '<p>Halo Infinite is the twelfth installment in the Halo franchise, and the sixth in the main series of science fiction first-person shooters. It is the sequel to Halo 5: Guardians and the third chapter in the Reclaimer Saga sub-series that was started by Halo 4. It is also the first game powered by the completely new Slipspace engine developed by Microsoft.</p>\n<h3>Setting</h3>\n<p>The Halo franchise is set in the 26th century, when the human civilization, led by United Nations Space Command, wages total war against the theocratic interstellar alliance called the Covenant. The goal of the war is the control of ring-shaped space stations, called Halos, which were built in ancient times by a lost civilization of Forerunners. </p>\n<h3>Plot</h3>\n<p>The game follows the series&#39; most famous protagonist: Master Chief, who is a “Spartan” - a genetically enhanced, power armor wearing super soldier. Infinite continues the story of Master Chief and his companions, the Blue Team, as they fight against the AI called Cortana that tries to take over the control of the Halos. AHalo Infinite is set on a forested Halo inhabited by rhinos and other wildlife reminiscent of prehistoric Earth.</p>\n<h3>Modes</h3>\n<p>In addition to single player story campaign, Halo Infinite supports cooperative multiplayer modes, both local and online. There&#39;s, however, no Battle Royale mode.</p>', 'https://media.rawg.io/media/games/e1f/e1ffbeb1bac25b19749ad285ca29e158.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/36a/36a9550af95879ae39a48f80e106d5ed.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/884/8842afada8446980b4505431d728a122.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/6bb/6bb5d30829ca80d70c764bbf77ecea8b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/268/268a25ed5ef5a72a0d73c83b22b4a0e3.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9a3/9a35c5aa47c2ab13538e0d8b44359129.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/82f/82f6357fac62c3bf376edb2437c086b4.jpg\";}', 12.99, 0, NULL),
(144, 'DOOM Eternal', '<p>As the DOOM Slayer, you return to find Earth has suffered a demonic invasion. Raze Hell and discover the Slayer’s origins and his enduring mission to rip and tear…until it is done.</p>\n<p>Experience the ultimate combination of speed and power as you battle your way across dimensions with the next leap in push-forward, first-person combat.<br />\nSlayer Threat Level at Maximum</p>\n<p>Armed with a shoulder-mounted flamethrower, retractable wrist-mounted blade, upgraded guns and mods, and abilities like the Double Dash, you&#39;re faster, stronger, and more versatile than ever.<br />\nUnholy Trinity</p>\n<p>Take what you need from your enemies: Glory kill for extra health, incinerate for armor, and chainsaw demons to stock up on ammo to become the ultimate demon-slayer.</p>\n<p>BATTLEMODE is the new 2 versus 1 multiplayer experience built from the ground up at id Software. A fully-armed DOOM Slayer faces off against two player-controlled demons, duking it in a best-of-five round match of intense first-person combat. BATTLEMODE launches with 6 handcrafted maps and 5 playable demons – the Marauder, Archvile, Revenant, Mancubus and Pain Elemental.</p>', 'https://media.rawg.io/media/games/3ea/3ea3c9bbd940b6cb7f2139e42d3d443f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/e60/e605ef79d45fcde4afcdbbe8783b7755.jpg\";i:1;s:88:\"https://media.rawg.io/media/screenshots/65d/65db880d23d8d9afe59da1a0f4fbc9d1_s0rkn1r.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/bb4/bb448b8a9aa51ff3e620d3d4c292214b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/922/922d1b5f0231cf8b0eaa4b78f3935434.jpg\";i:4;s:88:\"https://media.rawg.io/media/screenshots/311/311c4a0364dd23e2ccaabe0fef29f467_U6b7UNM.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/32a/32abc47d857fffc485b86dcd56cbe3c7.jpg\";}', 12.99, 0, NULL),
(145, 'Control', '<p>Control is a surrealist low-fantasy game about a secret organization that deals with the paranormal activities.</p>\n<h3>Plot</h3>\n<p>The game follows Jesse Faden, a woman with superhuman powers. She works with the Federal Bureau of Control, a secret governmental organization that deals with the paranormal phenomena, often by annihilating it as a threat. The Bureau headquarters, known as the Oldest House, is taken over by a supernatural power called the Hiss. The director of Bureau, Zachariah Trench, is killed, and Faden is unexpectedly promoted to his place, while the ghost of her predecessor haunts her. She has to travel the endless corridors of the Oldest House and defeat the Hiss using magical Director&#39;s Pistol. </p>\n<h3>Setting</h3>\n<p>Most of the game takes place in the FBC building, which is a high-rise on Manhattan. The Oldest House is a non-euclidian space, which is larger on the inside. Its corridors and rooms change shape and positions depending on the rituals its inhabitants perform. The Oldest House stores the magical artifacts called Altered Items.</p>\n<h3>Gameplay</h3>\n<p>The player controls Faden from the third person view. To defeat her enemies, she uses various superhuman powers, such as telekinesis or levitation. She also wields the shape-shifting Director&#39;s Pistol and the magic artifacts she can obtain as a reward for completing quests. Jesse&#39;s skills grow throughout the game. </p>\n<p>There is no multiplayer mode.</p>', 'https://media.rawg.io/media/games/253/2534a46f3da7fa7c315f1387515ca393.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5b2/5b2548a1b1a0ac9fa6469cb8526657e4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/ec7/ec7724c8ff1c309499b2d356f8763156.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/219/21934e4ab7d99134fc0564b7bbf10ab2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/151/151ce2dd8a8d7c1bd6e4a7a8862f3097.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9f4/9f4d8c704ea7711f17d3a5b6a9d94483.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4e9/4e97e38a479472b0c7dd7a738d7e34ce.jpg\";}', 12.99, 0, NULL),
(146, 'Killing Floor', '<p>In Killing Floor you play as a part of a special team to fight off legions of cloned zombies. Horzine Biotech released an endless amount of clones from the facility and citizens are drowning in this waves of human flesh. Local police are trying to fight them back, but there is no progress. British government decides to build up a special team of fighters to fight off numerous amount of enemies on their territory.</p>\n<p>Every level in the game has a precise amount of waves according to your difficulty. With each wave, the number of zombies and types will change becoming more challenging to live through. By successfully winning the round and depending on your skills, game awards with cash that you can spend on new weapon and supplies. High variety of classes have added a different gaming style for every player. You can be a Gunslinger and use pistols, Commando that uses rifles or Support that uses shotguns. Every class has their advantages and perks that can be unlocked by levelling it up. As the final wave players must face a boss with a unique mechanic.</p>', 'https://media.rawg.io/media/games/806/8060a7663364ac23e15480728938d6f3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/757/7576d0ae4bdabc3442043623c989a4ee.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1ed/1edabf8e9c1ed7e187b0e2c2ff67ef4b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e1b/e1b5a8adf4855bd059200687d0ee3f6d.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/2e5/2e5f23676804039741f7f46ea3bc8184.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/93b/93bf96476aa0aca92d1aed700fb27cf7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/239/239a7c924ba73c82e19a34b05a60336b.jpg\";}', 12.99, 0, NULL),
(147, 'PlayerUnknown’s Battlegrounds', '<p>PLAYERUNKNOWN’S BATTLEGROUNDS is battle-royale shooter made only for the multiplayer experience. Players should do their best to become the last one alive. Matches are held on 3 main maps of a large size (Erangel, Miramar, and Sanhok). Each match has 100 participants fighting for themselves. The battle begins with players making the leap out of the plane to spread out across the map and to gather all possible equipment required for survival. Then, after a while, game intelligence randomly sets a circle shape safe zone, which gamers must reach to stay alive, and marks it on the map. Gear and resources are scattered throughout the map, so players can grab everything they need while running to the zone. Therefore, the main action comes out of the players’ collision on their ways to the circle. You can join the fight either alone or in a team (up to 4 people). Due to the customization system, lots of clothing items and weapon skins could be both bought on the marketplace and found in crates. However, in-app purchases don’t actually affect the gameplay.</p>', 'https://media.rawg.io/media/games/1bd/1bd2657b81eb0c99338120ad444b24ff.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/657/6576473e7e22b81ac5c389b6f836e73c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/da8/da806bbd76f24d01e654edfc6a573b40.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/241/241d6a22b84dc483bcd980b428805556.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/0bb/0bb71c08f7d23715886253f6b2cc2657.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b54/b545a7128b63a125aed16181c0237686.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/2fb/2fb10f556bbcaebed101f23d571e8498.jpg\";}', 12.99, 0, NULL),
(148, 'Injustice: Gods Among Us Ultimate Edition', '<p>Injustice: Gods Among Us Ultimate Edition is an extended version of fighting game Injustice: Gods Among Us based on the imaginary universe of DC Comics. The gameplay is made in a traditional fighting 2.5D manner: battles occur in a 2D perspective but all the characters and objects are 3D. All fights are held in one-on-one form, where each participant has two life scales. Game mechanics are simple: three different types of hits and a special ability are available for each character. Some on-map objects are interactive and can be also used in attack. The main action takes place in a universe, which is parallel to a DC’s one, so occasionally clashes may look unusual. According to the storyline, Superman established dictatorship on Earth, and several Justice League members started resisting him. In the game, players are able to take control of favourite DC heroes and to participate in a war between Superman’s domination and the rebellion led by Batman. The Ultimate Edition offers players 6 new characters, over 30 new skins, and 60 new S.T.A.R. Labs missions. <br />\nInjustice: Gods Among Us is followed by the sequel Injustice 2.</p>', 'https://media.rawg.io/media/games/234/23410661770ae13eac11066980834367.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d5a/d5ae88f0e4e6d5558550cc76967f702d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/cab/cab011ad99d98ce321f8444cd2710686.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/46c/46cc7cfdc64f5338135f2a72da87ac88.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/032/03288e337bc2c89830370cc4d271f28f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/067/06750098636883e86b7fa555be21b748.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/92c/92cbd636e0181822d5e6b1f1a5ce8205.jpg\";}', 12.99, 0, NULL),
(149, 'Batman: Arkham Asylum Game of the Year Edition', '<p>Batman: Arkham Asylum is the first game in Warner Brothers’ action-adventure franchise Batman: Arkham. The game takes places in fictional Asylum on Arkham Island near Gotham City where dangerous and mentally unstable criminals are kept.  <br />\nThe story follows Batman as he captures Joker after his assault on Gotham City Hall. The game starts when Batman accompanies convoy that transfers Joker to the Arkham Asylum. With the help from Harley Queen and corrupted police officers, Joker manages to escape. He releases his gang members takes over the Asylum. Now Batman must defeat Joker, restore order in Arkham and save Gotham from bombs that Joker planted in it. During the game, the player meets several characters from Batman universe such as Scarecrow, Killer Croc, Poison Ivy, Commissioner Gordon and others.  <br />\nThe gameplay is a mix of action sequences, investigations and puzzle solving. In action sequences Batman has to defeat villains with brute force or stealthy, using his numerous gadgets.<br />\nThe Game of the Year Edition of Batman: Arkham Asylum includes support of 3D displays, two pairs of 3D glasses, and six previously released DLCs.</p>', 'https://media.rawg.io/media/games/fd8/fd882c8267a44621a0de6f9cec77ae90.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/85b/85bb2ed59cc85c21bfdc068012dfc5c8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/05e/05ebf1dc9066bf43e9c45b31399e741d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ee2/ee2b4270a1eb48b0aa2ac3deb882ce9b.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a43/a43dde8dcb6445387f429da88d50b703.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/803/803acffeb45da0d884582991f380c6bf.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/23e/23e14000ba6668b022633e3600c8c140.jpg\";}', 12.99, 0, NULL),
(150, 'Batman: Arkham City - Game of the Year Edition', '<p>Batman: Arkham City is the second game in the Arkham series. Joker has escaped from Arkham Asylum, and Doctor Hugo Strange is capturing Bruce Wayne. Strange discovers the true identity behind the Batman and tries to kill him, but Wayne escapes from the prison and saves the Catwoman from Two-Face. Trying to acknowledge the mysterious &quot;Protocol 10&quot; he finds Joker in devastating state - fatal infection slowly kills. Joker infects Batman and every Gotham hospital.</p>\n<p>Arkham City involves legendary Kevin Conroy and Mark Hammil coming back as Bruce Wayne and Joker, gifting their voices one more time. Noir Gotham atmosphere is supported by a grim plot and very live surroundings. The gameplay is still concentrating on simple but comforting fighting system making fights feel very fast and intense. In solving puzzles and gaining a tactical advantage, Batman can use different gadgets, as Batarang or a grapnel gun. You can silently dive and kill your enemies and use your detective skills to find clues about villains your facing, becoming as close to Batman, as possible.</p>', 'https://media.rawg.io/media/games/c50/c5085506fe4b5e20fc7aa5ace842c20b.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/7f0/7f06dde491c2e2e7a89d9375f016e0b1.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/00f/00f1b94e6bee4ca226902ec724ef6cb6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/794/79445f5a4e6f145be0a9e8bfb8fe5c03.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/700/700c6a91d1ea98e7ca3f53e44d6000f0.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/590/5908186c284c2d02700064a968546d64.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/712/712aef3ca77ad875dbaf058d0e5949b4.jpg\";}', 12.99, 0, NULL),
(151, 'The Witcher: Enhanced Edition Director\'s Cut', '<p>The Witcher is the very first instalment of the series that follows the story of Geralt from Rivia. Being found unconscious on the battlefield he must retrieve his memory and help the emperor&#39;s daughter, Adda to stop her from turning in to a feral monster. Facing the biggest enemy, Salamander, Geralt must also help all the fractions around the world to find peace between each other.</p>\n<p>The fighting system is very flexible. Choosing from three different styles, you can adapt Geralt for any kind of a combat situation. Fast style of fighting gives you an opportunity to strike your opponents with your speed. The strong style focuses itself on destroying your enemies with powerful attacks, while sweeping style is very good when facing a number of foes. You can also craft some potions to gain important benefits such as seeing in the dark or having a larger amount HP. Plot style is unique as well. The game never gives a precise definition of evil, which leads the player to convenient situations where the choice is quite bad anyway. Enhanced edition improves every aspect of the game as graphics and the productivity of it, while Director&#39;s Cut does the same without censorship for North America&#39;s version.</p>', 'https://media.rawg.io/media/games/ee3/ee3e10193aafc3230ba1cae426967d10.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/6dc/6dc151862452fba8dfb510ba7131cefd.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5c7/5c7f753ec6b9ca51eb477b016e1f6126.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/698/6983ac0ee603750b50212a0822a2cab7.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/7c5/7c545f5c7ae02355e8b76ee3d28bd12a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5bf/5bf40b1e7d50240c867a0ca1540b7b07.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/39c/39c47322a4dad4f3ac87cc97557c9a2d.jpg\";}', 12.99, 0, NULL),
(152, 'Ori and the Blind Forest: Definitive Edition', '<p>NEW IN THE DEFINITIVE EDITION<br />\n• Packed with new and additional content: New areas, new secrets, new abilities, more story sequences, multiple difficulty modes, full backtracking support and much more!<br />\n• Discover Naru’s past in two brand new environments.<br />\n• Master two powerful new abilities – Dash and Light Burst.<br />\n• Find new secret areas and explore Nibel faster by teleporting between Spirit Wells.<br />\nThe forest of Nibel is dying. After a powerful storm sets a series of devastating events in motion, Ori must journey to find courage and confront a dark nemesis to save the forest of Nibel. “Ori and the Blind Forest” tells the tale of a young orphan destined for heroics, through a visually stunning Action-Platformer crafted by Moon Studios. Featuring hand-painted artwork, meticulously animated character performance, a fully orchestrated score and dozens of new features in the Definitive Edition, “Ori and the Blind Forest” explores a deeply emotional story about love and sacrifice, and the hope that exists in us all.</p>', 'https://media.rawg.io/media/games/04a/04a7e7e185fb51493bdcbe1693a8b3dc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/a5d/a5df71a9c11f8b94ea8aaf81d3daac82.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/999/9994adb2d2b31749c40a5cbfd7f2b8f8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/016/0165f9be40790dad6833e075690464fa.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/145/1454bae6ad3827d8d471c3648c500b63.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/c0e/c0e7f1ca14d1b48d364f867f320275e3.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c46/c46540669db0a243275f8be0351244e1.jpg\";}', 12.99, 0, NULL),
(153, 'Titan Quest Anniversary Edition', '<p>Titan Quest Anniversary Edition is an extended version of the original action role-playing slasher Titan Quest, released in honor of game’s 10th anniversary. The game is set in the world of pre-Roman age and includes 3 locations: Ancient Greece, Egypt, and eastern civilizations. The story begins with a narration about Titans, who ruled the entire world before the Olympians. The idea is that a trio of Telkines managed to break off the communication between Earth and Olympus and started terrorizing the mortal world. The protagonist is a hero, who is expected to defeat Telkines and to restore the conduit linking to worlds. To assume the role of the mythical hero players need to customize their own character: choose the gender and appearance. The further action continues in a traditional hack and slash manner. Players navigate the 3D world through the overhead third-person view and lead the protagonist with the mouse, while special abilities are tied to keyboard buttons. The Anniversary edition includes all possible fixtures and improvements of graphics and gameplay.</p>', 'https://media.rawg.io/media/games/33d/33df5a032898b8ab7e3773c7a5f1d336.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/157/157e3887246416a83c3c001f7fb36458.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e29/e29e01f38adc07950f38e016ad08df6b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e6f/e6f34f7d388e2205638e72541ac7698f.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/dea/dea64067438aa50b8fecaa5b6ad08d8d.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b81/b815aef2e8a6d0011d76444a011e012b.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/7d1/7d1ac751296b22c4f005ce5f82d30d29.jpg\";}', 12.99, 0, NULL),
(154, 'Half-Life', '<p>Half-Life is the original game in the series. Being a revolutionary at the time, we follow the story of Gordon Freeman - a silent scientist at the facility called Black Mesa. Arriving late at work and hastily doing his routine he runs into the experiment field. However, the experiment goes completely wrong and opens a portal to a completely different dimension called Xen. The laboratory is destroyed as well as the facility itself, as unknown creatures like Vortigaunts are now everywhere in the facility. Gordon must battle his way to the surface and find a way to close the portal.</p>\n<p>One of the main features of Half-Life was story-telling through scripted sequences within the actual gameplay. Without having cutscenes, the game was able to tell the full story of the game by showing scripted deaths, dialogues, character appearance while the gameplay was moving one. By not ripping off the player from the process, the game feels much more smooth as it continues. Despite his science nature, Gordon is masterfully using his weapons and destroys any enemy at his path with rifles, grenades, shotguns and much more.</p>', 'https://media.rawg.io/media/games/6c5/6c55e22185876626881b76c11922b073.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/345/3458269ae8ea44a6b8c8268d39fe36a1.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/3c5/3c55c835054009de798c0a9fa886ef8b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/700/70005f6c84708d988a287d406cbb038c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/755/755a2b42257cf09c7f37e902dfa08400.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/921/9213ce16eba80f51b3562a3e5d322e02.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/948/948de39d02c1f08c8c98fa10e69e87af.jpg\";}', 12.99, 0, NULL),
(155, 'Brothers: A Tale of Two Sons', '<p>Brothers - A Tale of Two Sons is a story about teamwork. Having a very curious setup, the story follows two brothers on a quest. With their mother dead and father being heavily ill, the only way to save is to bring water from the Tree of Life. But on their way, they will have to challenge the world and themselves. Villages, mountains and forests, bullies, trolls and wolves will await Naiee and Naia on their journey. </p>\n<p>With having such setup, the game found a perfect way to portray this world to the audience. The beautiful visual style and something in between adventure and a platformer make the game an exciting experience. Although that is not the most curious thing about the game. With having two brothers involved in a story, the game actually gives you an opportunity to control both of them. You can solve puzzles by simultaneously moving both of the characters. For example, one of your heroes must distract an enemy, and another is supposed to go behind. This amazing feature provides you with one of the most unique experiences as you play two characters at once.</p>', 'https://media.rawg.io/media/games/b6b/b6b20bfc4b34e312dbc8aac53c95a348.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/14d/14dcdb86ae346a69022ab5837016fdc1.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5e7/5e71a4ccee940eb51a6110535f79d4ed.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/709/70954b4dac5e2a4966293ce0c7dbc6c4.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/08f/08fd4301c46d14aed67c9d7f98b12ec0.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5bd/5bd04279767fc7febc37e460da236b28.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/900/900738abfbca21ada3170e5f9dc7a333.jpg\";}', 12.99, 0, NULL),
(156, 'Magicka', '<p>Magicka is a fun franchise. Based on Scandinavian mythology, we follow a story of four mages that have formed an order to protect Midgard from a warlock. Yet this warlock is just a pawn in the greater game of a demon Assatur, who wants to destroy wants to destroy the homeland of the mages. The game gives few nods towards some other known franchises as Warhammer, Warcraft or even Star Wars.</p>\n<p>Gaming process is very complicated. Having no character class as it is, every mage can create his unique combinations from eight different types of magic - water, life, shield, cold, lightning, arcane, earth and fire. Some of them are not compatible such as fire and cold because of their opposing nature, but the game deeply explores the way to create a unique gameplay-style based on your preference. Around the world, you can find magickas - scrolls that contain new spells and magic. Supporting up to four players at the same time it is a very fun game despite having loads of technical issues, like bugs and other problems.</p>', 'https://media.rawg.io/media/games/c7a/c7a71a0531a9518236d99d0d60abe447.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/db7/db79b48791ee86a2a744bd97a5023925.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/d05/d055330429f9cbb6e62dfba4d42c77e8.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/fb2/fb2680ea519660b217608ae33517f300.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/4c5/4c54ec4404bdc6597d579f9e40208035.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/af9/af9d1193c1073e8787b855d30728c622.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/32e/32e24d4e6937688ce3a70069385d79d5.jpg\";}', 12.99, 0, NULL),
(157, 'Counter-Strike: Condition Zero', '<p>Counter-Strike: Condition Zero is the second installment in first-person multiplayer shooter series Counter-Strike. It is the only game in the Counter-Strike main series that includes a single-player campaign. In the campaign, you play as a leader of a special forces squad. You form your team from a cast of pre-made characters with unique features and go on through several unconnected missions. The missions themselves are mostly a string of multiplayer matches played with AI bots and some additional challenges like killing enemies with a specific type of weapon <br />\nThe multiplayer part of the game is very similar to the previous installment. There are two teams in every match: terrorists and counter-terrorists. You choose one of the sites and have to defeat the enemy team by killing hostile players or completing different tasks. For doing this, you also get money rewards which you can spend on more advanced weapons and gear.  <br />\nThe game also features Condition Zero: Deleted Scenes, the early version of the game, developed by Ritual Entertainment before the game was handled to Turtle Rock Studios.</p>', 'https://media.rawg.io/media/games/8bd/8bd24e3c15354a9555bb1437fe555a69.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2da/2da3030a20fe317bc5087fdd4c216e31.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5f4/5f4dbf2713355ed98af62daef33067ee.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ece/eced74adbdbd702c637699663caf5428.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/0f7/0f7762d1d407810e9ce59af149ca610a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/291/291e8a3537fe1b371aa66a286ab5afd5.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/4a2/4a2c1c30ee1d93a941a7fc869c5d5fae.jpg\";}', 12.99, 0, NULL),
(158, 'Dota 2', '<p>What used to be an unofficial modded map for the Warcraft 3, ended up being the most budgeted cybersport discipline, gathering millions of people to watch annual international championships.<br />\nMOBA genre started with the DOTA, Defense of the Ancients, which can be efficiently described as 5 vs 5 top-down action strategy game, during which players are tasked to destroy the enemy core while protecting their own.<br />\nPlayers can pick out of the roster of 112 heroes and battle on the single map while taking advantage of field vision, resources and item build that can either make heroes stronger or disable the enemy. DOTA 2 is still active, and receives updates weekly, reshaping metas and refreshing game balance, if by any chance some heroes became unreasonably strong. Each hero has not only a unique set of abilities but is fully customizable, through getting items for heroes after matches of through the trade. Not only heroes but terrain, couriers, that deliver items for you and even match announcers, that can be voiced by heroes, professional casters of just memorable characters from other forms of media.</p>', 'https://media.rawg.io/media/games/6fc/6fcf4cd3b17c288821388e6085bb0fc9.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cef/cefd0f45c88be2d6e2ff7eed94c16cf3.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e2a/e2a1a6c8b07bcdb91d7c6050b16854c5.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/55e/55e2c2ff16229eef87cfd8728ca537ac.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/601/601ceb08d04da42f4de5d8b9016f31a6.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/f02/f02a389dafd748b801cb4ff971a868af.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/da6/da6e4cba4e5787674d0e6877d1fc426a.jpg\";}', 12.99, 0, NULL),
(159, 'BioShock 2 Remastered', '<p>Bioshock 2 is a shooter with RPG elements, centered around resource-management to a great extent: more like an RPG than a shooter. The game is made by 2K studios and represents the final part of a dystopia dilogy — preceded by the original Bioshock. Its successor is Bioshock Infinite.<br />\nYou play as Big Daddy — a giant mech with a drill replacing one of the hands. The game, while they both are telling the story of a charming Rapture — the city descended from Orwell&#39;s and Zamyatin&#39;s pages where the society&#39;s greatest mind have suffered a severe decline.<br />\nThe central feature of the game is the unique abandoned city&#39;s aesthetics — minding the time Bioshock 2 is still a beautiful title, with detailed drawn water and strange surroundings, never mind the variety of foes.<br />\nThe remaster introduces a 4k resolution — it is now more enjoyable to explore Rapture and enjoy its various landscapes and sea-filled quarters. Among the other features: high-res textures and a set of Protector Trials,  which can give the player freakish weaponry and ammunition.</p>', 'https://media.rawg.io/media/games/7c4/7c448374df84b607f67ce9182a3a3ca7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f8f/f8f97169e49ff503f182cb480c75d377.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/be7/be7ba98fad14386322335d9d87f4cf05.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/d0e/d0e70feaab57195e8286f3501e95fc5e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f6e/f6e3977b58906b54d43232262521e7c6.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/932/932a57c6958406a255b36d90d7eb62cd.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/dd5/dd5c9b494d356ecc6b06115e51bf95c4.jpg\";}', 12.99, 0, NULL),
(160, 'Half-Life 2: Lost Coast', '<p>Essentially a tech demo, “Half-Life 2: Lost Coast” sole purpose was to show off the new high-dynamic-range-rendering of the Source engine, it was a welcome addition to the franchise. It’s a free addition to the game that can be downloaded through Steam by the owners of Half-Life 2. Gordon Freeman founds himself near a group of decaying piers, fully armed and ready to explore the monastery above him, fighting through the Combine forces.<br />\nHigh-dynamic-range-rendering introduced realistic lighting effects to the game, emulating even camera’s overexposure to the bright light, which was eventually moved to the main game. Lost Coast story is conveyed without cutscenes, every part of the level is tailored specifically to demonstrate the changes, made by developers. Even though it was originally created for the Half-Life 2, it was removed from the main game, alongside some minor story details. It’s not a full standalone game and wasn’t intended as one.</p>', 'https://media.rawg.io/media/games/b7b/b7b8381707152afc7d91f5d95de70e39.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9bf/9bf18c7c6759805fc79aad53f3df6f7d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/9c5/9c5ac8722a23212460d1536e03c5562d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/59d/59d81fcb1b2bff1e56bfe5c489638a46.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/259/259239f48f9e32210774b5641527071f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/12b/12b9a7c1311586328718da042e5c16f3.jpg\";}', 12.99, 0, NULL),
(161, 'Counter-Strike', '<p>Counter-Strike franchise started in back in 2000. Originated as a mod for Half-Life, the developers were signed by Valve Corporation thus beginning the franchise that exists to this very day. </p>\n<p>Having no particular plot or story at all, Counter-Strike was a competitive game mostly used as PvP. With new physics and a large amount of weaponry, you can choose between two fractions - Counter-Terrorists and Terrorists. Each team had their signature weapon (CTs had M16 while T had AK-47, for example), the main goal of every round was to kill the opposite team or fulfil a task.  In case there is a bomb plant - detonate or prevent, hostages - rescue or prevent from it or assassination. One player from the team is chosen as a VIP person that must be protected, and the goal of the opposite team is to kill this VIP. By winning every round, you received a good payment, by loosing - much lesser one. You can spend cash on buying equipment and weapon. Counter-Strike franchise is still loved to this day, and even such old shooters live to this day.</p>', 'https://media.rawg.io/media/games/9c4/9c47f320eb73c9a02d462e12f6206b26.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/208/2087d6a9a20434bf4a28313b6ce09917.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/58a/58a8a824744a5fe1c84e53ca9135f7ce.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/8a8/8a8b23c4b62065c093f288e70ee9d9f2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b3c/b3c5cf63e4558bb98b85eba830b90215.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a88/a8877e5cae44ef1ac8b36eeefce2ca34.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/565/56570a92d4c85576f9ff1382c75c5ac4.jpg\";}', 12.99, 0, NULL),
(162, 'Alan Wake', '<p>Titular best-selling psychological thriller author was going through a writer’s block, but when he tries to take a small vacation, it seems that he is attacked and has to fight off the “darkness” that possess people and animals alike. Action-adventure with horror elements, Alan Wake is paced like a thriller show, cinematic and slow, which is in alignment with the visual style of the rural region of Washington and linear storytelling. The main enemy, encountered by the players will be Taken – possessed by darkness creatures and humans that cannot be attacked outright, because they are shrouded in black smoke, blocking the attacks. Only after dispelling the darkness with a source of light players are able to affect the enemies. When the enemies are getting too close, Alan can perform a slow-motion dodge.<br />\nTwo more episodes were published for the first game, called “The Signal” and “The Writer”, directly continuing the story of the main game, and completing the first season.</p>', 'https://media.rawg.io/media/games/5c0/5c0dd63002cb23f804aab327d40ef119.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/8d7/8d7d24df1418efdaba45128e2c855f62.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/5ac/5ac6dd243c0ed41fb1a0b5734bff55f1.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ad2/ad2e4f73ac71839178ea01ab66d8bf6c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b28/b28fd421d570931d83b27213538689df.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/d1e/d1e49ff4902b1bc964262ffc2e08043d.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/02f/02f6cb8534d5434e94559cdcd35aeef7.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(163, 'Ori and the Blind Forest', '<p>Ori and the blind forest is a game with a stunning visual style, which looks like a fairytale one, and also the game takes place to a beautiful and atmospheric soundtrack.</p>\n<p>The forest of Nibel is dying. You play as a character named Ori and a spirit named Sein. They are trying to save the magical forest after the dark spirit Kuro stole the heart of the tree of life, what made the forest began to wither rapidly, losing its vitality: the water becomes dirty, the trees cease to bloom and bear fruit, and the woodland is covered with thick thorns.</p>\n<p>Playing in the Ori and the blind forest, you have to explore a vast world, to solve platform problems and relatively complex, but interesting puzzles (first of all, they test your reaction and agility). Using the abilities of Ori (initially, he can only jump, but a lot of other skills will be opened during the game) and Sein (the ability to attack enemies) you have to cope with the difficulties on the way to fix the situation and cure the forest.</p>', 'https://media.rawg.io/media/games/f8c/f8c6a262ead4c16b47e1219310210eb3.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/bcb/bcb49e0507f3501823a8e39c15679763.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/391/391ea86f85bb996caeace19ea84af4fc.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9d5/9d505b1fb80fedd0fe8af5cb8edcb5f5.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/10d/10ddacff2f1844429f6c8632da0a3d61.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/b94/b94241e60c095aeda306d6905070a12e.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/fb5/fb51d10ba2967208f4baf27220212a3b.jpg\";}', 12.99, 0, NULL),
(164, 'Half-Life 2: Episode Two', '<p>Right after the escape from the collapsed Citadel, Gordon Freeman and his companion Alyx Vance learn that Combine used the destruction to open a portal, in order to bring powerful reinforcement. No major changes have been applied to the gameplay since the previous episode, instead, players will be invited to experiment with the gravity gun and more physics objects to use as impromptu ammunition. Episode Two brings back every staple of the series, including physic puzzles, driving sections, because it was developed simultaneously with the Episode One, but unlike first one Episode two has more puzzles, including the biggest puzzle in the series up to date.</p>', 'https://media.rawg.io/media/games/198/1988a337305e008b41d7f536ce9b73f6.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/04b/04b62b9115ccd64ebac1e8d813c69d08.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/278/278f1654ade9d116ca1bb42bb37d94ba.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/0f2/0f2b40d5aa1eb776fdedcdb4d11aca8e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/895/895f1c364465b338e2d1b41b0b4eff67.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/016/01638fb0f73a6acde1714a107e078807.jpg\";}', 12.99, 0, NULL),
(165, 'Half-Life 2: Episode One', '<p>Direct continuation of the Half-Life 2, Episode One serves as a direct sequel to the story. After the mystically assisted escape from the citadel, Gordon and Alyx are reunited outside, but the Citadel core became unstable and will imminently self-destruct. And the only way to save citizens of City 17 is to re-enter the decaying building and slow down the destruction for long enough, to evacuate the civilians and families. <br />\nContinuation of the story uses the same Source engine, and players will have to traverse linear stages, disposing of enemies and solving physics puzzles. This time Gordon will be accompanied and assisted by Alyx. Her AI will attempt to adjust to the player choices. While purchasing Episode One, players will receive a copy of Half-Life: Deathmatch with it. Game mechanics and puzzles will center around Gravity Gun, which will be the first weapon in players possession from the beginning.</p>', 'https://media.rawg.io/media/games/7a2/7a2500ee8b2c0e1ff268bb4479463dea.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cf5/cf50b7b3673456c8a8c3a4667e9b46c2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/8e4/8e44bdded28ebe1a2e7ac876110cfdc6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/5ed/5edb413d48035b3ab97a5ea5123f7b88.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/421/4214168942f1ddb5475b2c270b0419d1.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/653/6536627d155c339a2fd9a824fad78c84.jpg\";}', 12.99, 0, NULL),
(166, 'Rise of the Tomb Raider', '<p>Rise of the Tomb Raider is the eleventh entry in the franchise, being a sequel to its predecessor, Tomb Raider, a reboot of the franchise. This story follows Lara Croft, one year after battling her supernatural experiences in Yamatai. This time she is trying to find the legendary city of Kitezh in Siberia, Russia. The legend behind the city begins in the 12th century and still comes nowadays, that this ancient city grants with a promise of immortality. While Lara tries to solve the mystery of Siberia, she encounters an organisation called Trinity. They want to retrieve this gift to themselves. Following the notes of her father, Lara tries to discover the secrets of the ancient city and stop Trinity in doing so.</p>\n<p>Exploring the Soviet motive, even more, the game has the DLC&#39;s - Baba Yaga, the Temple of the Witch, which follows Lara in the Soviet mine and confronting the legendary witch of Russian folk-tales, Cold Darkness Awakened, the story about a secret biological weapon and Blood Ties and Lara&#39;s Nightmare - a fight for ownership of the Croft estate. </p>\n<p>Besides craftmanship and exploring, the game focuses on a very progressive combat system giving a player a wide variety of strategic options. There is a way to evade your opponents in the bushes; stealth kills with bow and arrows or open combat with firearms like shotguns, pistols and other guns. WIth earning experience, you can give Lara new ways of encountering her enemies by three different specialisations - Hunter, Survivor or Brawler. Each skill tree offers various options of combat, for example using Lara&#39;s surroundings and fauna, traps or better aim. With these options, you can choose how to guide Lara Croft in her adventures.</p>', 'https://media.rawg.io/media/games/b45/b45575f34285f2c4479c9a5f719d972e.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fbf/fbff1fe1f3cbe33dec8b2fc98bbad4a4.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/c18/c187789c40eea061a44c3fb497059c01.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/256/256472a369b9f52cfe0b8e85eb49ef19.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/38a/38a67aab95a0a5f9fe1a40821a63f0c6.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a1f/a1f2d03a0d0f70f4aed355f6e138f2a4.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/03d/03df750d5d64eb8bf0121e92e1f701e0.jpg\";}', 12.99, 0, NULL),
(167, 'Watch Dogs 2', '<p>Watch Dogs 2 is an action-adventure open-world game developed by Ubisoft Montreal. It is the second installment in the series and continues the main idea of its predecessor - hacking and hacktivism in an open world.</p>\n<p>Welcome to San-Francisco. It is the second city in the United States to install the city-wide operating system named ctOS, which connects everything from your car to your smart home to a global network. Marcus Holloway is tagged by the system as a suspect for a crime he did not commit. Marcus decides to take action and gets together with the hacktivist group DedSec to expose ctOS and its creators.</p>\n<p>WD2 offers the player an immense open world which consists of San-Francisco, Oakland, Marin and Silicon Valley. It&#39;s the player&#39;s choice to navigate the world on foot or on a wide range of vehicles from cars to boats.</p>\n<p>It is up to the player to choose whether to use a lethal or non-lethal approach on a mission as there is always a taser in your inventory and a billiard ball attached to a paracord that knocks enemies out. </p>\n<p>It is possible to hack into any devices that are connected to ctOS. For instance, Marcus can control forklifts, buzz guards phones in order to distract them.</p>', 'https://media.rawg.io/media/games/f52/f52cf6ba08089cd5f1a9c8f7fcc93d1f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/90e/90edc66e2c32c0808d3d344e750b11d5.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/7f6/7f631f852a2e85ec4bcaddfc65b587c2.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/d71/d71d662d1c3dc61336cab6d25daa4815.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/713/713688460802e5937eec631e5ee60bbd.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/8e0/8e06d6982f789e6ac58a0a59119bd7ef.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/acf/acfc10929189efe5a324040325cb5425.jpg\";}', 12.99, 0, NULL),
(168, 'ARK: Survival Of The Fittest', '<p>Welcome to ARK: Survival of the Fittest, the first ever M.O.S.A. - a Multiplayer Online Survival Arena - that Studio Wildcard designed for the burgeoning wild west of eSports. A spin-off from the most popular open-world Early Access game on Steam ARK: Survival Evolved, ARK: Survival of the Fittest (SotF) pits up to 72 combatants in an action-packed struggle for survival where players are ultimately pushed into an epic final showdown where only one “Tribe” will make it out alive.</p>\n<p>Survivors can form one- to six-person Tribes with the options to choose Unofficial and Official (Ranked) servers, and a variety of game-lengths and sizes in which to play. Players will start in the base forest environment introduced in the original ARK: Survival Evolved, with new environments and creatures introduced as the game evolves. Dedicated eSport ranking, matchmaking, reward, and tournament features make ARK: SotF readily accessible to all players.</p>\n<p>Balanced for intense competition, contestants begin in a neutral staging area where they can communicate pre-game, strategize, or talk trash. After a count-down, they dramatically descend from the sky onto the ARK in a circular formation via beams of light. There is a cache of valuable items in the center – do survivors dash for the goods and fight it out, do they run into the forest and hide, search for Dinosaurs to rapidly build their army, or do they freeze up from the sheer terror of death? A continually shrinking “ring of death” forces contestants ever closer together over time. The hunt is on!<br />\nKEY FEATURES<br />\nAction-Packed Core Survival Gameplay<br />\n30+ Creatures to Tame and Ride at Early Access Start, Many more planned at full launch<br />\nMultiple game modes (1v1, 2v2, 4v4, and 6v6)<br />\nOne-to-Six Player Tribes<br />\nVariable game configurations ranging from 30-minute “instant action” to three-hour long “epic wars”<br />\nTop-ranked players are listed dynamically on SurviveTheArk.com and are provided monthly prize packages!<br />\nGame-Changing Tameable Super Creatures (Dragon, Giant Ape, Brood Mother)<br />\nRandom “Evolution Events”<br />\nArsenal of Weapons, Traps, Armor, Structures and other Items from Primitive to Modern Tech Tiers<br />\nRobust Ranking, Tournament &amp; Spectator Features<br />\nExclusive SotF Cosmetic Items that can also be used in ARK: Survival Evolved<br />\nCustom-Painted “War Banners” enable Tribes to show off their team spirit on Flags across their army of Dinosaurs, and are also broadcast on the gigantic billboards during game events. Just don’t draw anything offensive!<br />\nA custom soundtrack written by award-winning composer Gareth Coker of Ori and the Blind Forest!</p>', 'https://media.rawg.io/media/games/095/0953bf01cd4e4dd204aba85489ac9868.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cd7/cd7e2b2294f39174c173f841529df871.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/886/88683f22ae769ca11a842f2e17645d67.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/411/41183d8d31da75a88e92839592cf15e4.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/ae6/ae6036694d569bf8fb5fea8893c17002.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/654/6540928602af293014efa90d75c420b7.jpg\";}', 12.99, 0, NULL),
(169, 'No Man\'s Sky', '<p>No Man&#39;s Sky is a space action-adventure survival game developed by Hello Games.</p>\n<p>The overall visual style of the game is inspired by various science fiction books. Demoscene also served as a source of inspiration for the developers.</p>\n<p>The main feature that the game revolves around is the procedural generation. Each planet you visit is generated from scratch. The information about the planets and their inhabitants is dynamically updated so every player can discover a new species or planet and give it a name.</p>\n<p>No Man&#39;s Sky gameplay implies the exploration of space and planets some of which are inhabited with extra-terrestrial life, gathering resources, space battles, maintaining and upgrading the player&#39;s ship and completing bounty hunting missions. The main objective is to reach the center of the galaxy. </p>\n<p>On release, it was stated that the game is in fact multiplayer, but the size of its world is so big that the probability of meeting another player is extremely small. It turned out that it is impossible to meet any other player due to the extremely limited multiplayer aspect. As of 2018, Hello Games released the fourth major update which included the full multiplayer experience.</p>', 'https://media.rawg.io/media/games/174/1743b3dd185bda4a7be349347d4064df.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/34a/34a9f8a7a487e90c51d0ed1782a122f8.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/77d/77d311572d90024a03d1ac722a2d21d3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/6a7/6a766ebcc837efc2d324a44a81959a3a.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/d0d/d0d758329f0f48b4afaa1b5493c904db.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/53a/53a2c5e50e9c27efa5796e928000af92.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b51/b5196300fae35706f1165443c56b3c7c.jpg\";}', 12.99, 0, NULL),
(170, 'Company of Heroes 2', '<p>Company of Heroes 2 is the second installment in the series of real-time strategy games, following its predecessor’s legacy as one of the most complex and realistic WWII simulators. New features and game engine improvements will provide the most intense experience of the most significant battles of both the Western and Eastern fronts of the war.<br />\nAfter seven years since the first game’s release, Company of Heroes 2 provides the players with new battle mechanics, even more, micromanagement and new game modes, as well as an expanded single-player campaign, taking place in the Eastern front. The key features of the first game, being the dynamic environments and cover system, have also been overhauled, with additions as a line of sight for every troop. The warfare itself has also been changed, removing the mechanics of doctrines and adding traits to various generals on the field.<br />\nThe game also includes additional content, which adds two new Allied factions, the US expeditionary forces and the Royal Army, and new campaigns for both factions, while also improving performance and adding new features to the game, such as tech trees, various tactics and many more.</p>', 'https://media.rawg.io/media/games/0bd/0bd5646a3d8ee0ac3314bced91ea306d.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/260/260204d8d634ec55fdcc4050523d124f.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/79d/79d118350fab8531cee4ab7df5ea267a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/f5f/f5ffdf62a5e5b78268e9e11d2ea64144.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/7b0/7b071155a6b6482b063096f626643b63.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/850/85019f1470023bb50671c8a1a4b6d7a7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3b2/3b2793e4c18ff62f07dd5747b38f07fb.jpg\";}', 12.99, 0, NULL),
(171, 'Hitman', '<p>Hitman is a six episodes game with different contracts. The action takes place as a prequel to Hitman: Agent 47 (only prologue) and episodes take place six years after Hitman: Absolution. All contracts are being ordered by a &quot;shadow client&quot; and seem to be unrelated. But as you fulfil those contracts, you start to realise that all of the targets somehow are a part of a secret organisation called the Providence.</p>\n<p>While playing Agent 47, you have a large amount of free will in completing those contracts. The main target is all that matters, and you can do anything to kill this person in your style and fashion. You can disguise as a different person and infiltrate secured area to perform the kill manually or use a long-range sniper rifle to do the trick. Your surroundings help you a lot as well by listening to nearby chat or news reports. Players are given as much freedom as possible to find your professional style in the art of killing. A large amount of DLC and expanded missions can either give you gimmick-based contracts and travel to Japan, Serbia and other countries.</p>', 'https://media.rawg.io/media/games/16b/16b1b7b36e2042d1128d5a3e852b3b2f.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/ef6/ef6c0a92d08a99d2e405cac53c597d10.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/fb3/fb3c23014fcb24a28fb94af0a009906c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/202/202293192d1b6245c8a1e252d9df604c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/278/278bd63ee564982e816ec7fe802df420.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/002/0021b0e5db6959989d90979abba68c8d.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c8a/c8a537532ab8ce8750293a1fc41ee7f8.jpg\";}', 12.99, 0, NULL),
(172, ' Limbo', '<p>This popular 2D puzzle-platformer creates the atmosphere of isolation, where the player alone can guide the nameless protagonist to his destination. Hostile environments and one-hit deaths may seem difficult, but the game implements a fair amount of checkpoints. The monochrome color palette showcases cartoony proportions of every living thing while making lack of details threatening. Limbo shows you exactly what you encounter, but never how it looks.</p>\n<p>Limbo uses the atmosphere and sound design of the horror genre while avoiding tropes of the modern horror games. The overarching theme and unique style compensated for the rather short game with an abrupt ending, making Limbo one of the most impactful games for the genre.</p>\n<p>The simple controls and easy-to-pick-up mechanics help to make a clear distinction, which part of the stage players can interact with, and which part can lead to the quick death. Even though the game is in black and white, this separation is intuitive and natural, so the player would know exactly where to go or what to do.</p>', 'https://media.rawg.io/media/games/942/9424d6bb763dc38d9378b488603c87fa.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/512/512f4bc2092016478ddcb9e7e60aeec0.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/63d/63d30699e8fcab9c808e6714d9d3fd59.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/de0/de04bbc0fd9904071ef25bf23113c8c4.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/eed/eedbbca4ae2debf2d4e23e55d1f6cff7.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/59f/59f472b3ed7b414777a29213d70b4d17.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e58/e58d31146e4a9e3786dabcbfc30126bc.jpg\";}', 12.99, 0, NULL),
(173, 'Batman: Arkham Origins', '<p>Batman Arkham Origins is an action-adventure game, the third main entry in Warner Brothers’ Batman: Arkham series. Concerning story, Origins is the prequel to the first game in the franchise, Batman: Arkham Asylum. It takes place in Gotham City on Christmas Eve. The notorious crime lord Black Mask places $50 million bounties on Batman and hires eight of the world’s deadliest assassins including Bane, Deathstroke, Killer Croc and others. The story covers some events important for the other installments in the series, like Batman’s first encounter with Joker and incidents that lead to the reopening of Arkham Asylum. <br />\nThe gameplay of Origins is very similar to the previous two installments. It mostly consists of beat-em-up sequences, stealth sequences, and investigations. Like in Arkham City player can freely explore an open world, but this time it is not just Arkham Asylum, but the whole of Gotham City.</p>', 'https://media.rawg.io/media/games/fc3/fc30790a3b3c738d7a271b02c1e26dc2.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/dc3/dc388c04293881ff771241a80b4c2261.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/ca9/ca9e389da140dad6aac3829f840da57a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e82/e82b3df1d687b0590643ad82d5a54fc9.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/04e/04e478ce59abed28b912d6b296378227.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9e7/9e7cb59972f4b09f5bf9cf0d7c4fe4b1.jpg\";i:5;s:81:\"https://media.rawg.io/media/screenshots/0cb/0cb5067fa0e917050d5a84e0f6177f8f.jpeg\";}', 12.99, 0, NULL),
(174, 'Minecraft', '<p>One of the most popular games of the 2010s, Minecraft allows you to rebuild the environment around you. The world of the game is open, infinitely wide, and procedurally generated. It is composed of small 3D cubes that represent specific types of materials or terrain. The gameplay is centered on mining and building various structures of your choice. You can also craft items like tools, weapons, and armor. There&#39;s an option to shift to the first or the third person view.<br />\nMinecraft includes multiple modes that dramatically change the focus of the game. Survival and Adventure modes require the player to gather resources, hunt for food and fight monsters to survive. In the Hardcore mode, there’s even permanent death. Creative mode, by contrast, offers you to freely explore the world and construct whatever you want with unlimited resources. There’s also a multiplayer mode that allows the players to share their worlds and engage in the traditional MMO activities, such as player-vs-player combat.<br />\nMinecraft’s crude visual style, reminiscent of Lego cubes, became an iconic part of the popular culture. There are many myths and fan fiction surrounding the game, such as the legend of Herobrine, a rumored character that officially doesn’t exist.</p>', 'https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/324/32454b11adde40d87c046f310f0d710d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/268/2689f04cbcabb467dd4948e30fe90f51.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/e83/e83fbaf3a8bdf1cdd855acf8fc90d2fe.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a02/a021bf48ee5e492026e6464b3751cf35.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/0cc/0cc6c1534e782b9d040c665a1f78c6f7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3f6/3f66dd84a110f796a80baa4539430b68.jpg\";}', 12.99, 0, NULL),
(175, 'Crusader Kings II', '<p>Crusader Kings II is a global RTS which takes place in the Middle Ages of Europe. The players will govern a house of nobility of that time, and ensure that its heritage will last for centuries. The second installment of the series fills the gap in the developer’s continuum of global strategies, allowing for lengthy grand campaigns and world conquests.<br />\nThe main points of interest in the game are your noble house, holdings, and vassals. Players can engage in diplomacy between neighboring households, sign treaties and create a bloodline between two families, forge documents and declare wars. However, the primary competitive objective would not be conquering the world, but instead, winning the prestigious ranks and ensuring that your family will prosper.<br />\nGameplay-wise, the mechanics revolve around interactions with your neighbors and your court. Buildings built, armies trained, but most importantly, your character should be built, too. Education, marriage, religion - everything will affect your lord-protege, and players often come up with different guides on how to achieve success without regards to the luck and skill of the player.</p>', 'https://media.rawg.io/media/games/c22/c22d804ac753c72f2617b3708a625dec.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/bf1/bf1489ef85bcc54b83decef53756cf1a.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/8d0/8d07057c417db873377c71d335dff134.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/792/79260feaa378a8990ae914c08e0093a1.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/75c/75cf4c20d3990f5783b8770381b763b8.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/a9e/a9ebad5b9350d75d185092647775e3a7.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e09/e09cea3a2d09dfcc01f0812a1380179e.jpg\";}', 12.99, 0, NULL),
(176, 'Tom Clancy\'s Rainbow Six Siege', '<p>The gameplay of the game is based on intense strategic battles between the Navigator and the defenders in a limited space. Locations in the game consist of a multi-level object (for example, a multi-storey building), inside which there are defenders, and the area around it, where the attackers begin.</p>\n<p>Destruction is at the head of the game mechanics. The surrounding objects are created with maximum realism, the degree of damage depends on the calibre of the bullets used by the players or on the total power of the laid explosives. Walls can be destroyed, creating new firing positions and shelters. Optimal use of the potential of destruction often becomes a guarantee of victory. Defenders can limit the ability of attackers to destroy, using kits to strengthen the walls and the device of some operatives.</p>\n<p>The primary game mode - multiplayer, normal or rating. During the game in the last mode, the player is assigned a certain rank, and parameters such as the ratio of kills/deaths and wins/losses are recorded in his profile displayed in the game.</p>', 'https://media.rawg.io/media/games/b34/b3419c2706f8f8dbe40d08e23642ad06.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cde/cde4694574a78e355478cf6e438106ac.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6c3/6c386356a134572ccac11bffa6a74820.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/2b3/2b38b4a3dcdd8993ae211dc1616f6ced.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/df2/df22920866e77c82a6a505776023d7d9.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5c3/5c3b2517577b729ba9c59d1638fd3a48.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/004/004cd2d5e5bf8c06f24a526d2ccd6fff.jpg\";}', 12.99, 0, NULL),
(177, 'The Walking Dead: Season 1', '<p>The Walking Dead is a five-part game series set in the same universe as Robert Kirkman’s award-winning comic book series. Play as Lee Everett, a convicted criminal, who has been given a second chance at life in a world devastated by the undead. With corpses returning to life and survivors stopping at nothing to maintain their own safety, protecting an orphaned girl named Clementine may offer him redemption in a world gone to hell.<br />\nA continuing story of adventure horror spanning across 5 episodes:</p>\n<p>Episode 1 – A New Day (Available Now)<br />\nEpisode 2 – Starved for Help (Available Now)</p>\n<p>Episode 3 – Long Road Ahead (Available Now)<br />\nEpisode 4 – Around Every Corner (Available Now)<br />\nEpisode 5 – No Time Left (Available Now)<br />\nAll five episodes are now available immediately upon purchasing Season 1. Based on Robert Kirkman’s Eisner-Award winning comic book series, The Walking Dead allows gamers to experience the true horror of the zombie apocalypse<br />\nA tailored game experience – Live with the profound and lasting consequences of the decisions that you make in each episode. Your actions and choices will affect how your story plays out across the entire series.<br />\nExperience events, meet people and visit locations that foreshadow the story of Deputy Sheriff Rick Grimes<br />\nMeet Glenn before he heads to Atlanta, explore Hershel’s farm before Rick and his group of survivors arrive and before the barn becomes a notorious location in Walking Dead lore<br />\nYou’ll be forced to make decisions that are not only difficult, but that will require you to make an almost immediate choice. There’s no time to ponder when the undead are pounding the door down!<br />\nFeatures meaningful decision-making, exploration, problem solving and a constant fight for survival in a world overrun by the undead<br />\nArtwork inspired by the original comic books</p>', 'https://media.rawg.io/media/games/8d6/8d69eb6c32ed6acfd75f82d532144993.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d38/d38c78ec9cc707bf42652452235dbe8c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/bdb/bdb7dd4891bfbb0a80cd49b36ffd1a20.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/72b/72b67d15b5ae5538734bac2b195f2976.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/74d/74d6a18a7b5592777de8f6a7cdbc91f8.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/52a/52aca015b4748b1b0bbbacf33110e983.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/94b/94b6701276d06b5b562890601fd6abaa.jpg\";}', 12.99, 0, NULL),
(178, 'Far Cry 5', '<p>Far Cry 5 is an open-world adventure first-person shooter developed by Ubisoft Montreal. It is the fifth main installment in the series.</p>\n<p>Welcome to Hope County, Montana, where a violent religious doomsday cult appeared. You play as a junior deputy sheriff who gets trapped in the Hope County as all the ways out the county are now patrolled with cultists and all external communication is cut off. It is your job to free the county of cultists.</p>\n<p>For the first time in the series, the game features a character creation screen. A wide range of weaponry which varies from pistols to grenade launchers is available to the player. Various vehicles are also at your exposal: cars, planes, helicopters, and so on. </p>\n<p>The game puts a strong emphasis on building the resistance to the cultists. Players have to recruit the locals in order to have more fighters and gain reputation.</p>\n<p>A welcome addition to the game is the so-called Guns For Hire system. It allows the players to choose one of the comrades that will follow them anywhere. For example, hiring a sniper will help the player spot enemy targets in the distance.</p>\n<p>The whole game can be played in both singleplayer and co-op modes.</p>', 'https://media.rawg.io/media/games/bce/bce62fbc7cf74bf6a1a37340993ec148.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/5cf/5cf8e7fd61723cdd8f2673be38fa96d7.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f10/f103b8facce20a692c632e92d75cb7dc.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a75/a7559b87154002909f338f36ae4cf584.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/954/9543c597ffd856a12d9b0bd82733a370.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/406/40613f69f9f3b7ed28cf46cc55a9b06a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/0ce/0ce9665ddbe8aef0086af7528ae44980.jpg\";}', 12.99, 0, NULL),
(179, 'Psychonauts', '<p>Double Fine Productions and Tim Shafer are known for making very curious games out of amazing ideas. Psychonauts is exactly about some idea. You have to get inside people&#39;s mind and help them fight with their fears or memories from the past.</p>\n<p>We follow a story of Raz, who runs away from the circus and goes to the summer camp for Psychonauts - people with special abilities. They refuse to teach him but allow him to participate in &quot;Basic Braining&quot; course. When his talent becomes clear, he&#39;s being invited to an experiment. After receiving a vision, he realises that there&#39;s a sinister plan behind the camp and only he can save everyone there.</p>\n<p>The game exists in two different worlds - a real one and a mental one. If the real world leaves no question about it, the mental world is one of the most interesting features of the game. Twisted minds, memories from the past and deepest fears is something you are about to encounter with. Having a number of abilities like telekinesis or invisibility will help you cure a person&#39;s psychological issue.</p>', 'https://media.rawg.io/media/games/c89/c89ca70716080733d03724277df2c6c7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2de/2dea22a973d765a5383940307b368268.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/310/3103cb1e58a5d6bba1c356d8d1570920.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9c0/9c03e9baa71db649d849660067d07979.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f9a/f9a391f3d4a496195a5cbce41421fb03.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/897/897ad883ed085ec7269fb0d235e41625.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/224/224f218780ffdeeb1cec7062b8c61b41.jpg\";}', 12.99, 0, NULL),
(180, 'Viscera Cleanup Detail: Shadow Warrior', '<p>Viscera Cleanup Detail is about cleaning. After a brutal fight with endless waves of enemies, you must really live a bloody mess after yourselves. That&#39;s where Space-Station Janitors come in to play with their mops, buckets of water and biohazard bins to clean the area for the next bloody fight. </p>\n<p>Your goal as a janitor to search the whole area and clean any kind of a trace of a brutal fight. Body parts, med-kits, bloodbaths and others signs of a harsh battle with forces of evil. For bullets casings or flares you can use a broom to gather thing and then throw everything into the incinerator and burn all the evidence.</p>\n<p>In this specific DLC, Shadow Warrior, janitors arrive on a very first mission of Shadow Warrior 2013. Lo Wang fought through demons and his opponents, slicing his katana in their bodies and tearing them apart. And now it is your job to take your mop, a bucket of water and funky music to clean the mess up.</p>', 'https://media.rawg.io/media/screenshots/f2f/f2f3c93d6153da7aee590f3ab8ccd803.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/181/181bba9474b13903a4f15cdca305e57e.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/6a7/6a73b800a67bc595adeaeed2ca62f6e6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/681/6817ea54c56ea5e51822abdc65d8089c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/d8d/d8d35af224bd8a95f01403da03030d57.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/654/6547ebbac9c7b971c914d26f54ca6594.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/8b0/8b011fbc533d8ffd6419880e491d4d38.jpg\";}', 12.99, 0, NULL),
(181, ' DOOM (2016)', '<p>Return of the classic FPS, Doom (2016) acts as a reboot of the series and brings back the Doomslayer, protagonist of the original Doom games. In order to solve the energy crisis, humanity learned to harvest the energy from Hell, and when something went wrong and a demon invasion has started, it’s up to the player to control the Doomslayer and destroy the evil.</p>\n<p>Doom is a fast-paced game that restores the concept of instant health packs and leaves the player against armies of Hell with no cover, no health regeneration, or help from anyone. After damaging monsters enough, they will start glowing, which will allow players to perform glory kills to restore some health. While exploring the levels, players will come across secrets, collectible items, or upgrade points for the weapons and armor. The single-player campaign silent protagonist has a noticeable personality. He gets visibly annoyed and angry in his actions during expository cutscenes and forces his way through the game. Multiplayer maps gather players in Deathmatch/”king-of-the-hill” type game modes, with all the weapons from the single-player campaign.</p>', 'https://media.rawg.io/media/games/587/587588c64afbff80e6f444eb2e46f9da.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/353/353c1e834e7da7d6ceaa6beaff529c29.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e50/e50f822107b8cc6af57aa21d76524149.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/ae9/ae9e9f7bfe19c63bd16151f81f81a7ed.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/14e/14e33eccb109558b0524761340ff2023.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/45d/45d16955ac9e90141b726684a07db02a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/b77/b77629938389a41160d3b2a56eaed568.jpg\";}', 12.99, 0, NULL),
(182, 'Sid Meier’s Civilization VI', '<p>The sixth installment in Sid Meier’s Civilization series. Like in all previous Civilization games, the player controls one of eighteen unique historical civilizations, builds its cities, explores the hexagonal map of the world, researches technologies, develops his country&#39;s culture, establishes relationships with other civilizations and wages wars. All the traditional victory types are in place, and a new one, religious, is introduced.</p>\n<p>A distinct new feature in the sixth part is that city improvements are no more concentrated in each city&#39;s only main tile. Instead, they are distributed throughout its whole surrounding area. Each of them is now considered a &quot;district&quot; with a specific purpose, and some of them should be built only on specific terrain. Similarly, wonders now occupy tiles on their own. Technology tree was also modified to take into account the player&#39;s terrain improvements that may speed up the research of certain technologies. Cultural achievements, such as Opera or Drama, are no more considered &quot;technologies&quot; and form a separate Civics research tree instead. Also, unlike most of its predecessors, Civilization VI allows stacking similar types of military units.</p>', 'https://media.rawg.io/media/games/997/997ab4d67e96fb20a4092383477d4463.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cb8/cb84dc82bfe7aa4057f13b9d120e4a11.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/241/2410ce2130e2a926cbeace46bf934a70.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/3d5/3d5793b7fbab188f1ebd0f2e3e645bd2.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a12/a12c0d56a2c4e8f7b09761ab7f3bd44f.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/482/482a21efe8c44e491d814ea6a3f5d443.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/681/681a009d0a8bdafd01a871d5d07d9ec9.jpg\";}', 12.99, 0, NULL),
(183, 'Uncharted 4: A Thief’s End', '<p>Uncharted 4 is the final installment in the Uncharted series. The story follows Nathan Drake for the last time as he now searches for Captain Henry Avery&#39;s treasure. </p>\n<p>Introducing new characters such as Samuel Drake, with Sam and Sully Nathan agrees to find the treasure of the Gunsway heist in 1695. As antagonists, Nathan must face Rafe Adler and Nadine Ross while they are also trying to find this treasure and Nathan must face details about Sam&#39;s past.</p>\n<p>Now changing the game&#39;s concept, Naughty Dog made locations much bigger and more explorable. Expanding the story behind Henry Avery&#39;s actions in history the story once again feels like Indiana Jones kind of adventure. The grappling hook, climbing on rocks and mountains, or diving from the top, Nathan still engages into hand to hand combat with his enemies as well as using firearms. Nolan North, Emily Rose, and Richard McGonagle return to the final installment in the series to say farewell to the story of Nathan Drake for the last time.</p>', 'https://media.rawg.io/media/games/709/709bf81f874ce5d25d625b37b014cb63.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/fd5/fd5451e27048c3e416de1737047e4684.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/63f/63f551c55bb44ec41dbcab6898cdd264.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/30b/30bfd42d8bfe46301dbef56ba526b3ed.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/fd2/fd2ae2bc22f4fefeeb6f4b6f1587e128.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/66c/66c2aecdd80e940ea7a2d64c17cff843.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/89c/89c96f28e032d3434bab7b9247e01fe3.jpg\";}', 12.99, 0, NULL),
(184, 'Team Fortress 2', '<p>TF2 is an objective based arena shooter with unique characters, representing different classes, acting as a staple of casual and competitive gaming for Steam. Dozens of different maps and game modes are trying to keep this game alive, after all the years it was available. Each character has a vast arsenal that can be accessed through completing in-game achievements, randomly receiving them from loot-boxes within the game, crafting them or just buying and trading items on the Steam Market. <br />\nFor players, that&#39;s not into the direct clash with players from the enemy team, Team Fortress 2 introduced a PvE mode, which is wave defense from the mirrored robotic opponents that have qualities of some of the playable classes. <br />\nEvery update and introduction, made over years, provided a lot of entertainment In the form of comic books an short animated videos, creating and explaining a story behind endless clashes for resources, briefcases or pure domination.</p>', 'https://media.rawg.io/media/games/46d/46d98e6910fbc0706e2948a7cc9b10c5.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/596/5968ba06bac8bee0ec7e9d03c970c421.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/94f/94f4eb0b3d1fde7a37ec84f0f66f7f87.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a0a/a0ad82cad18d0a2466d1d5f12bf8858c.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/a83/a83038d2ec296522ab1b9ab0521b1ec3.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/8d4/8d488a3e65256ec777c8097b0faacc78.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/707/707c7488bd6e35bc74d274a923bc1df2.jpg\";}', 12.99, 0, NULL),
(185, 'Dark Souls III', '<p>Dark Souls III is the fourth installment in the Dark Souls series, now introducing the players to the world of Lothric, a kingdom which has suffered the fate similar to its counterparts from the previous games, descending from its height to utter darkness. A new tale of dark fantasy offers to create and guide the path of game’s protagonist, the Ashen One, through the dangers of the world before him.<br />\nSharing many gameplay similarities with previous installments of the Souls series, Dark Souls III improves at what it is best. These features are the unforgiving difficulty and unique, overwhelming environments. Let alone the soundtracks, allowing players to travel through the familiar locations and encounter new obstacles alike, resulting in a great test of nerves, while also giving the fruit of resolving the secrets and echoes of the past of Dark Souls series.<br />\nThe new changes to the systems of multiplayer, crafting and combat will offer new and experienced players to challenge themselves on the field of battle, and to enhance the playthrough with each consecutive New Game +, where the in-game cycle never indeed ends, allowing for a multitude of different playstyles, and showing different events based on player’s actions.</p>', 'https://media.rawg.io/media/games/da1/da1b267764d77221f07a4386b6548e5a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d7c/d7c05cdfb30ec07147bcd0d3985ec54c.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/479/479cb74c874748ca70a3a14e79a0c232.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/070/0703edc6d3db345a3acf19b4e6e43ebd.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e4f/e4feaf5b078949102e72780091eb12af.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/028/02863a140eea53c1f51fd790aca753aa.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/8d2/8d2c0bb90867031f9265ef62c01445c5.jpg\";}', 12.99, 0, NULL),
(186, 'Star Wars Jedi: Fallen Order', '<p>Cal Kestis—one of the last surviving members of the Jedi Order after the purge of Order 66—is now a Padawan on the run. </p>\n<p>Star Wars Jedi: Fallen Order is an action-adventure game set after Star Wars: Episode III — Revenge of the Sith™. Develop your Force abilities, hone your lightsaber techniques, and explore the ancient mysteries of a long-lost civilization—all while staying one step ahead of the Empire and its deadly Inquisitors. an</p>', 'https://media.rawg.io/media/games/559/559bc0768f656ad0c63c54b80a82d680.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/1c0/1c0016ec0441e86648bd7f751c8e5adf.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/4fd/4fd551e67bc9fd9eb4c855604838d10f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/dd6/dd69cc02ef3d56dabbe62f06ddea8569.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/b2c/b2cdb1843349dd5db358a4b214a00f2c.jpg\";i:4;s:88:\"https://media.rawg.io/media/screenshots/c60/c6065f618a7304016db7fa02d563084a_rSIdAmV.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/99f/99f9710b7305817f44866b7a61b77dd0.jpg\";}', 12.99, 0, NULL),
(187, 'Counter-Strike: Source', '<p>Counter-Strike: Source is the third entry of the big franchise of competitive shooters. Based on a modification to the original Valve game Half-Life, Counter-Strike: Source has no plot yet fully concentrating on a competitive part of the gameplay.</p>\n<p>With two opposing teams, Counter Terrorist and Terrorist, each side has a unique set of weapons to choose. Having a big variety for a player, you can select a gun for your particular style of gameplay. Pistols, shotguns, rifles or machine guns are available in the game for a certain price you can earn by winning each round. You can win by successful bombing the target or defusing the bomb, eliminate the whole enemy team or by rescuing hostages. A big choice of game modes also aids plenty amount of maps. You can have a standard match, deathmatch, gun game or jumping challenges. In Counter-Strike: Source anyone can find something for himself.</p>', 'https://media.rawg.io/media/games/48e/48e63bbddeddbe9ba81942772b156664.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/d8a/d8abe071b4628ee58cda844676959b18.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f54/f54c9f442426f52afaf29d45ff8d7a2f.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b49/b4961b17e0031e5819c0722343e97a12.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/58f/58f23befccb87ef5d8e9501658f8c8f2.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/69c/69ca8f86ffefe75f33388a48301a5228.jpg\";}', 12.99, 0, NULL),
(188, 'Disco Elysium', '<p>Disco Elysium is a groundbreaking blend of hardboiled cop show and isometric RPG. Solve a massive, open ended case in a unique urban fantasy setting. Kick in doors, interrogate suspects, or just get lost exploring the gorgeously rendered city of Revachol and unraveling its mysteries. Tough choices need to be made. What kind of cop you are — is up to you.</p>\n<p>You play a disgraced lieutenant detective in Revachol West, a shore town where corruption’s out of control, murders go unsolved, and the kids just wanna dance. Kick in doors, interrogate suspects, or get lost exploring a gorgeously rendered city and unraveling its mysteries. All the while, tensions rise around you as Revachol threatens to explode.</p>\n<p>Disco Elysium’s completely original skill system makes your innermost feelings, doubts, and memories an integral part of every conversation. Level up your rational faculties, sharpen your wits, or give in to your basest instincts. What kind of cop you are is up to you.</p>', 'https://media.rawg.io/media/games/840/8408ad3811289a6a5830cae60fb0b62a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/6a0/6a0ec32ec86894561d88ede9f165a343.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f86/f867d4742a343639a29f82b71fcb6bb6.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/1e0/1e0dbe1bf2bc3e65a4c9dcc259140a88.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/972/972b2c15a9ae299546fad2b3c2fe6b7a.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/9d4/9d4f4828438089af6d03992f5c0ae275.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/c43/c434bb25b5a1f5c48eb5ee0b2b09b8dd.jpg\";}', 12.99, 0, NULL);
INSERT INTO `tbl_products` (`id`, `product_name`, `product_description`, `product_thumbnail`, `snapshots`, `price`, `sold_count`, `deleted_at`) VALUES
(189, 'Shadowrun Returns', '<p>Shadowrun Returns is a science fiction tactical RPG. The game became a revival of the original Shadowrun series, as the new chapter had some references to the 1993 Shadowrun. The Shadowrun universe includes several fictional cyberpunk elements because the main action takes place in the future. The game gives an opportunity to assume the role of a shadowrunner and to investigate a mysterious crime. To start a single campaign called Dead Man’s Switch players are offered to create their own character. The story begins in 2054 in Seattle, when the nameless protagonist receives a message from their shadowrunner accomplice Sam Watts, which was triggered by a dead man’s switch. The message is about Sam’s assassination, and the protagonist is aksed to investigate the case for Sam’s 100 thousand of local currency. The investigation will lead players through the story of serial killer Emerald City Ripper to the large-scale intergalactic conspiracy. In the course of the investigation, the character will participate in turn based fights and complete in-game objectives. Although the gameplay is mostly linear, it features some exploration and interaction with the environment.</p>', 'https://media.rawg.io/media/games/d4b/d4bcd78873edd9992d93aff9cc8db0c8.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/516/5160a9b6b847bf4b5765f15535b7c445.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/220/2204bd96b724a52083b76770e3a0c438.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/9e1/9e1e0a45851fdbb0e5c0e1b83feaf0f9.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/3ba/3badbdd810dad59775fbca0edc6e0594.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/257/257e7e03f5cd96fbd95c4a3d8f52454c.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/3f1/3f173a2c6f59d0c4a4abe8c91dd24273.jpg\";}', 12.99, 0, NULL),
(190, 'Half-Life Deathmatch: Source', '<p>A direct port of the original Deathmatch mode for the half-life to the Source engine slightly improves the game flow, by making controls more responsive and the connection more stable. Half-Life Deathmatch Source recreates the gameplay of the original multiplayer of Half-Life. All players are randomly spawned at the different map points and battle each other within a free-for-all brawl. To acquire any resource (weapons, ammo, health, and energy) players must scavenge the map for the various caches. Victory is achieved by obtaining the largest amount of kills during the match, by eliminating other players. In case of the draw, the player with the least amount of deaths is a winner of the match. Aside from the user created content, there are 8 available maps for the Half-Life Deathmatch: Source.</p>', 'https://media.rawg.io/media/games/174/174fabfca02d5730531bab2153a7dfcb.jpg', 'a:5:{i:0;s:80:\"https://media.rawg.io/media/screenshots/93b/93bc0cb7efc9ac841433dc7763b674bc.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/496/4966eb36d9048d222226fcd0ae8455ca.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/aaf/aaf0a14f690cd76f6844c651495b19b6.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/246/2464d78ea26df75043b37361c0e181a8.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/69d/69d3c07e45fcbbe167235d7b3f09fc8b.jpg\";}', 12.99, 0, NULL),
(191, 'Heavy Rain', '<p>Heavy Rain is an interactive drama telling the story of the investigation of a serial murder’s case. Players assume roles of four people – Ethan Mars, Norman Jayden, Madison Paige, and Scott Shelby – somehow involved in the case of Origami Killer, who is used to leave his victims alone, marked with origami figures. It soon reveals that all Origami Killer’s murders are connected with weather changes (actually heavy rains). In the course of the completion, players will follow the characters on their way to the key of the murderer’s mystery. Heavy Rain is an unusual action-adventure game. All four main characters are controlled from the third-person perspective with only several buttons, as the interaction with the environment is usually done by activating on-screen prompts like holding the trigger, pushing a button, positioning the stick, or all in one. The gameplay consists of multiple scenes, which affect the further in-game progress by the players’ choice and create a branching storyline that can lead to various endings including the death of certain main characters.</p>', 'https://media.rawg.io/media/games/0af/0af85e8edddfa55368e47c539914a220.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/2a0/2a0abc877b38468c38b12608e8f4e6e9.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1ce/1cea6b99424718659971772dcd34365c.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a5b/a5b869636cb34edcc92cacc598d1a6ef.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/daa/daa642d6610d252281237fd7e769e598.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/949/949962605a08b75f58a7b0f4fbe4511b.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/1ea/1ea689dd2ef1cbef6d9bc04562e739e9.jpg\";}', 12.99, 0, NULL),
(192, 'Garry\'s Mod', '<p>Garry&#39;s Mod or simply GMod is a source-engine based modification that now works as a standalone game. With no plot or exact gameplay at all, anyone can create his own game mode to play for fun. You can find anything you&#39;re into. Trouble In Terrorist Town, Prop Hunt, Hunger Games, Franchise-based modes such as Star Wars or Lord of the Rings - anything.</p>\n<p>Basically, GMod stands for God Mode in video games, because you can play with any asset of the source engine. Try out physics, characters, maps, weaponry - anything. Based on that, Garry&#39;s Mod gives players quite a variety of mods to spend their time. It doesn&#39;t sound so earnestly. You will probably find something that will provide you with quite a good amount of fun. Servers are specifically sorted in game modes so you&#39;ll never play a different mode while playing exact one what you wanted. At the end of the day, this game is about receiving as much fun from what is happening around you as possible.</p>', 'https://media.rawg.io/media/games/48c/48cb04ca483be865e3a83119c94e6097.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/cbf/cbf0e5c6fa2b8a8c653074b9258884df.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/01b/01b5cb2ad3f6fa69b70790094bfd3372.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/b31/b3141dbd80cd27a1d7b335e3b5956f89.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/40b/40bcfff9760f368d158e92d05f4a0d9b.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/6eb/6ebc3896184e94ebe617d2cb224eee2a.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e68/e6800252d7fc63fcb794af70ec28c8fc.jpg\";}', 12.99, 0, NULL),
(193, 'Unturned', '<p>Unturned is a low-poly survival game providing single or multiplayer experience. The main action takes place on 6 different maps (Prince Edward Island, Yukon, Washington, Germany and Russia) flooded with zombies. The story begins in the random location of the chosen map and lasts till the death. Playing for one of the few people not yet turned into a zombie, you should stay aware of various natural or unnatural dangers, gather required resources, and make your way through the tough survival. Survivors meet thirst, hunger, disease, injures, zombie bites, and other hostile players looking for safety. Since land, air and sea vehicles are available, players can choose the most suitable transport to explore the entire map. The gameplay stands for the wider opportunity of customization of pretty much everything in the in-game world, starting with simple object destruction and following to guns modification and shelters construction. In-app purchases do not actually affect the gameplay, but due to the cosmetic system, plenty of items (clothing and weapon skins) are purchasable or available in crates.</p>', 'https://media.rawg.io/media/games/93e/93ee6101e1c943732f06080dddb0fe4c.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9d4/9d47e01a1cf7bb9e1631209508871bad.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/73d/73d4d368858bd642406b48b13f57b51b.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/512/5125113bf634a7453a76fb3dd0a9caa8.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f67/f678bfbaf7fcc9c27e3db05ba1a64c24.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/bcf/bcf6ea78a7101e7af450eea9ab5d35f8.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/9f1/9f17aae472a62e2edec200a137ea09e5.jpg\";}', 12.99, 0, NULL),
(194, 'Hollow Knight', '<p>Hollow Knight is a Metroidvania-type game developed by an indie studio named Team Cherry.</p>\n<p>Most of the game&#39;s story is told through the in-world items, tablets, and thoughts of other characters. Many plot aspects are told to the player indirectly or through the secret areas that provide a bit of lore in addition to an upgrade. At the beginning of the game, the player visits a town of Dirtmouth. A town built above the ruins of Hallownest. The players descend down into the ruins to find some answers to his questions.</p>\n<p>The game revolves mainly around the exploration of the in-game world, which requires the players to have some platforming skills. The players have to find secrets that are scattered around the level and battle their enemies. There is a certain degree of backtracking in the game as some areas are locked until the player defeats a certain boss or picks up a specific item. Each area changes as the plot advances so it may be surprising to come back in a certain area. </p>\n<p>The Protagonist uses a nail which serves as a replacement for a sword. Players can attack in four directions. The nail is upgradable.</p>', 'https://media.rawg.io/media/games/4cf/4cfc6b7f1850590a4634b08bfab308ab.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/6b3/6b309936c1fe07e9b7fa5e62a372790d.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/1a7/1a7a69db58c19d323f1dfbcc340d3f1e.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/723/7237d0c546b0d17a6a226f38823081d4.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/331/331095489397e7387681d921e8e472d4.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/5db/5db89e896496352c8f0a0a0bd545bd6d.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/843/843e06c9c5b26c309b47bd7075320dae.jpg\";}', 12.99, 0, NULL),
(195, 'Hades', '<p>Hades is a rogue-like dungeon crawler that combines the best aspects of Supergiant&#39;s critically acclaimed titles, including the fast-paced action of Bastion, the rich atmosphere and depth of Transistor, and the character-driven storytelling of Pyre.</p>\n<p>BATTLE OUT OF HELL<br />\nAs the immortal Prince of the Underworld, you&#39;ll wield the powers and mythic weapons of Olympus to break free from the clutches of the god of the dead himself, while growing stronger and unraveling more of the story with each unique escape attempt.</p>\n<p>UNLEASH THE FURY OF OLYMPUS<br />\nThe Olympians have your back! Meet Zeus, Athena, Poseidon, and many more, and choose from their dozens of powerful Boons that enhance your abilities. There are thousands of viable character builds to discover as you go.</p>\n<p>BEFRIEND GODS, GHOSTS, AND MONSTERS<br />\nA fully-voiced cast of colorful, larger-than-life characters is waiting to meet you! Grow your relationships with them, and experience hundreds of unique story events as you learn about what&#39;s really at stake for this big, dysfunctional family.</p>\n<p>BUILT FOR REPLAYABILITY<br />\nNew surprises await each time you delve into the ever-shifting Underworld, whose guardian bosses will remember you. Use the powerful Mirror of Night to grow permanently stronger, and give yourself a leg up the next time you run away from home.</p>\n<p>NOTHING IS IMPOSSIBLE<br />\nPermanent upgrades mean you don&#39;t have to be a god yourself to experience the exciting combat and gripping story. Though, if you happen to be one, crank up the challenge and get ready for some white-knuckle action that will put your well-practiced skills to the test.</p>\n<p>SIGNATURE SUPERGIANT STYLE<br />\nThe rich, atmospheric presentation and unique melding of gameplay and narrative that&#39;s been core to Supergiant&#39;s games is here in full force: spectacular hand-painted Underworld environments and a blood-pumping original score bring the Underworld to life.</p>', 'https://media.rawg.io/media/games/1f4/1f47a270b8f241e4676b14d39ec620f7.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/546/546826ed2cde2dec94e1b470c8cbb9ac.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/0aa/0aa5e778c3cf8f47e3ee7f8e0185eb16.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/a06/a0649473a36bb879cef146a244d9cb54.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/f70/f7079ac3e96a5da13c8cfda6fb9fe249.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/8d4/8d4d9c4ffe01ad0addc29353a895d562.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/ece/eceaae77766d7f7b0fdfa4f3bb4eff98.jpg\";}', 12.99, 0, NULL),
(196, 'ARK: Survival Evolved', '<p>As a man or woman stranded naked, freezing and starving on the shores of a mysterious island called ARK, you must hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements. Use your cunning and resources to kill or tame &amp; breed the leviathan dinosaurs and other primeval creatures roaming the land, and team up with or prey on hundreds of other players to survive, dominate... and escape!<br />\nDinosaurs, Creatures, &amp; Breeding! -- over 100+ creatures can be tamed using a challenging capture-&amp;-affinity process, involving weakening a feral creature to knock it unconscious, and then nursing it back to health with appropriate food. Once tamed, you can issue commands to your tames, which it may follow depending on how well you’ve tamed and trained it. Tames, which can continue to level-up and consume food, can also carry Inventory and Equipment such as Armor, carry prey back to your settlement depending on their strength, and larger tames can be ridden and directly controlled! Fly a Pterodactyl over the snow-capped mountains, lift allies over enemy walls, race through the jungle with a pack of Raptors, tromp through an enemy base along a gigantic brontosaurus, or chase down prey on the back of a raging T-Rex! Take part in a dynamic ecosystem life-cycle with its own predator &amp; prey hierarchies, where you are just one creature among many species struggling for dominance and survival. Tames can also be mated with the opposite gender, to selectively breed successive generations using a trait system based on recombinant genetic inheritance. This process includes both egg-based incubation and mammalian gestation lifecycles! Or put more simply, raise babies!<br />\nYou must eat and drink to survive, with different kinds of plants &amp; meat having different nutritional properties, including human meat. Ensuring a supply of fresh water to your home and inventory is a pressing concern. All physical actions come at a cost of food and water, long-distance travel is fraught with subsistence peril! Inventory weight makes you move slower, and the day/night cycle along with randomized weather patterns add another layer of challenge by altering the temperature of the environment, causing you to hunger or thirst more quickly. Build a fire or shelter, and craft a large variety of customizable clothing &amp; armors, to help protect yourself against locational damage &amp; extreme temperatures using the dynamic indoor/outdoor insulation calculation system!<br />\nBy chopping down forests full of trees and mining metal and other precious resources, you can craft the parts to build massive multi-leveled structures composed of complex snap-linked parts, including ramps, beams, pillars, windows, doors, gates, remote gates, trapdoors, water pipes, faucets, generators, wires and all manner of electrical devices, and ladders among many other types. Structures have a load system to fall apart if enough support has been destroyed, so reinforcing your buildings is important. All structures and items can be painted to customize the look of your home, as well as placing dynamically per-pixel paintable signs, textual billboards, and other decorative objects. Shelter reduces the extremes of weather and provides security for yourself and your stash! Weapons, clothing &amp; armor gear can also be painted to express your own visual style.<br />\nPick seeds from the wild vegetation around you, plant them in plots that you lay down, water them and nurture them with fertilizer (everything poops after consuming calories, which can then be composted, and some fertilizer is better than others). Tend to your crops and they will grow to produce delicious and rare fruits, which can also be used to cook a plethora of logical recipes and make useful tonics! Explore to find the rarest of plant seeds that have the most powerful properties! Vegetarians &amp; vegans can flourish, and it will be possible to master and conquer the ARK in a non-violent manner!<br />\nBy bringing sufficient rare sacrificial items to special Summon locations, you can capture the attention of the one of the ARK’s god-like mythical creatures, who will arrive for battle. These gargantuan monstrosities provide an end-game goal for the most experienced groups of players and their armies of tames, and will yield extremely valuable progression items if they are defeated.<br />\nCreate a Tribe and add your friends to it, and all your tames can be commanded by and allied to anyone in your Tribe. Your Tribe will also be able to respawn at any of your home spawn points. Promote members to Tribe Admins to reduce the burden of management. Distribute key items and pass-codes to provide access your shared village!<br />\nAll items are crafted from Blueprints that have variable statistics and qualities, and require corresponding resources. More remote and harsh locales across the ARK tend to have better resources, including the tallest mountains, darkest caves, and depths of the ocean! Level-Up your player character by gaining experience through performance actions, Level-Up your tames, and learn new &quot;Engrams&quot; to be able to craft Items from memory without the use of blueprints, even if you die! Customize the underlying physical look of your character with hair, eye, and skin tones, along with an array of body proportion modifiers. As you explore the vast ARK, you&#39;ll find clues left by other Survivors who have made the ARK their home in ages past, in the form of collectible detailed 3D &quot;Explorer Notes&quot;. By uncovering all of these, you can begin to piece together the true nature of the ARK, and discover its purpose!<br />\nEverything you craft has durability and will wear-out from extended use if not repaired, and when you leave the game, your character remains sleeping in the persistent world. Your inventory physically exists in boxes or on your character in the world. Everything can be looted &amp; stolen, so to achieve security you must build-up, team-up, or have tames to guard your stash. Death is permanent, and you can even knock out, capture, and force-feed other players to use them for your own purposes, such as extracting their blood to for transfusions, harvesting their fecal matter to use as fertilizer, or using them as food for your carnivorous tames!<br />\nThe mysterious ARK is a formidable and imposing environment, composed of many natural and unnatural structures, above-ground, below-ground, and underwater. By fully exploring its secrets, you’ll find the most exotic procedurally randomized creatures and rare blueprints. Also to be found are Explorer Notes that are dynamically updated into the game, written by previous human denizens of the ARK from across the millennia, creatively detailing the creatures and backstory of the ARK and its creatures. Fully develop your in-game ARK-map through exploration, write custom points of interest onto it, and craft a Compass or GPS coordinates to aid exploring with other players, whom you can communicate with via proximity text &amp; voice chat, or long-distance radio. Construct &amp; draw in-game signs for other players to help them or lead them astray...  And yet.. how do you ultimately challenge the Creators and Conquer the ARK? A definitive end-game is planned.<br />\nOn the 100+ player servers, your character, everything you built, and your tames, stay in-game even when you leave. You can even physically travel your character and items between the network of ARK&#39;s by accessing the Obelisks and uploading (or downloading) your data from the Steam Economy! A galaxy of ARKs, each slightly different than the previous, to leave your mark on and conquer, one at a time -- special official ARKs will be unveiled on the World-map for limited times in singular themed events with corresponding limited-run items! Furthermore, you can now design or randomize your own unique &#39;Procedurally Generated ARKs&#39;, for infinite replayability and endless surprises.<br />\nYou can play single-player local games, and bring your character and items between unofficial player-hosted servers, back and forth from singleplayer to multiplayer. Mod the game, with full Steam Workshop support and customized Unreal Engine 4 editor. See how we built our ARK using our maps and assets as an example. Host your own server and configure your ARK precisely to your liking. We want to see what you create!<br />\nThe over-the-top hyper real imagery of the ARK its creatures is brought to expressive life using a highly-customized Unreal Engine 4, with fully dynamic lighting &amp; global illumination, weather systems (rain, fog, snow, etc) &amp; true-to-life volumetric cloud simulation, and the latest in advanced DirectX11 and DirectX12 rendering techniques. Music by award-winning composer of &quot;Ori and the Blind Forest&quot;, Gareth Coker!</p>', 'https://media.rawg.io/media/games/58a/58ac7f6569259dcc0b60b921869b19fc.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/660/660811527f1b41a42ae101148295d66b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/e53/e53ac4ceecd06dee0ff0f2cff2117d3a.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/c77/c7786494eae003730f22e118c4442e98.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/4f6/4f65f028427f46e923ba557e80d910f2.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/bfe/bfe582a512a2f50473dd35831efb7b56.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/fb2/fb2aa1404293b03b44c27c16302d2b16.jpg\";}', 12.99, 0, NULL),
(197, 'Brawlhalla', '<p>Brawlhalla is a free-to-play fighting game with platformer elements. You pick a character from 39 available heroes (this amount is increasing with new updates) and try to knock your opponent off the stage. The controls are simple to make the game easy to master. Every character has two weapons and also can use boosts that drop on the stage. They also have such characteristics as Strength, Dexterity, Defense, and Speed that determine their combat style and can be slightly modified. <br />\nBrawlhalla supports online and local multiplayer and cooperative along with multiple modes where you can test your skills and increase the rank. Except for 1v1 duels and different team matches, you can take part in huge arena battles with multiple opponents. Some stages consist of several platforms that can change their position during the fight. Moreover, Brawlhalla holds numerous competitions and tournaments all over the world with money prizes.</p>', 'https://media.rawg.io/media/games/35b/35b47c4d85cd6e08f3e2ca43ea5ce7bb.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/68e/68e9226c1c45af8bab290580f7456be2.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/440/4409227ccd02e3a1d4de7894d04ef62d.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/df9/df9063e1a20d9ab1bd1e1deb693c17b6.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/537/537f4a9f7cbc8be0e5e9a8943b09e124.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/50d/50d0c17d79e3210c20a4c6cc16b49e31.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/a8c/a8ca6fcb3c8df773c4cfd5101682edab.jpg\";}', 12.99, 0, NULL),
(198, 'Don\'t Starve Together', '<p>Don&#39;t Starve Together is surrealistic and grim survival game made up for six people simultaneously. Initially, Don&#39;t Starve is a single-player game with a core mechanic of going through various problems of your character. You have to sleep and eat well. Also, you have to keep your mental health all right and don&#39;t go completely mad at a situation, when these dreadful and twisted creatures are running towards you to tear apart. It seems like the world of Don&#39;t Starve is heavily inspired by Tim Burton, having a very grotesque yet creepy and bizarre-looking monsters and locations with an atmospheric soundtrack.</p>\n<p>While heading to multiplayer, you will experience every single problem from a singles game. The game exploits pretty similar mechanic to Minecraft - randomly generated world, surviving as a top priority for the gamer. With the only difference - if you die, you die. Permanent death of your characters increases the grim and tense atmosphere of the game itself, making the process challenging and creepy. Just remember. Don&#39;t Starve.</p>', 'https://media.rawg.io/media/games/dd5/dd50d4266915d56dd5b63ae1bf72606a.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/9c4/9c4cdf7b06094566881d343c286d8d30.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/33e/33ef93d155298edf4045540529b30eb3.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/340/3409a9ab93c4c69873909f62e4ab6519.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/c70/c707c04d79f5e0441dac2eb7b85554fb.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/78c/78c0b0a90a4c5d18ac36dbc2623f12e4.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/dc5/dc5965a2a6b94d8d129492287f7206c7.jpg\";}', 12.99, 0, NULL),
(199, 'Layers of Fear', '<p>Layers of Fear is the horror game with a focus on exploring and puzzles. It is the only installment in the IP, featuring one DLC which expands the storyline further and one port to the Nintendo Switch, which adds multiple features like accelerated controllers&#39; support and touchscreen assistance.<br />\nThe primary goal of the player is to guide the genius and psychopath painter on the way to complete the painting. The problem is the player does not know how to do so — they start exploring the house, which is changing the layouts repeatedly and find out many jump-scares along the way.<br />\nGetting through all of the six chapters the player may reach of the three endings: bad, average and good. The end is decided not by momentarily choice but by a series of decisions throughout the game. While the player is uncovering the truth about the premises of the hero&#39;s masterpiece, the DLC tells a story of his daughter which returns to her memories of the past. The DLC also features three endings in the same fashion as the original game.</p>', 'https://media.rawg.io/media/games/6a2/6a2e48933245e2cd3c92248c75c925e1.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/f49/f4994fea6a84b578a92abd51b20da5f9.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/b2f/b2f0f53e5fdeb1c2da275a24a1f86baa.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/3c5/3c55efc4e3b008840dd2747fd8abbd72.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/e69/e695b7a3e93ac142d6f7a6c142f4dfad.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/fe5/fe54e15f23a2f9cffa9a8d113de874db.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/16c/16cae54a4aff2bc41a4a90221e00309f.jpg\";}', 12.99, 0, NULL),
(200, 'Battlefield 1', '<p>Battlefield 1 is a first-person action shooter set in the historical period of the World War I. Although the game is a part of the Battlefield franchise, it has no references to the previous chapters. Players are able to experience both single and multiplayer mods to get in action and to feel the era better. As a single-player campaign, Battlefield 1 offers 6 storylines (chapters) one following each other. Each consists of several missions and tells a story of a single man in the middle of a global military conflict. Playing for these soldiers and closing the targets introduces new game mechanics to players. Completing these missions gives an opportunity to dive into the history and to examine the warfare of past ages. Multiplayer experience is divided into 9 different game mods spread on 31 historical maps. You can join the dynamic battle alone or in a squad with your friends. Multiplayer allows you to assume different battlefield roles (classes) starting with a medic, support or assault and following to the tank driver, pilot and some elite units.</p>', 'https://media.rawg.io/media/games/998/9980c4296f311d8bcc5b451ca51e4fe1.jpg', 'a:6:{i:0;s:80:\"https://media.rawg.io/media/screenshots/27a/27a9c742a08434db6a977cc2429c366b.jpg\";i:1;s:80:\"https://media.rawg.io/media/screenshots/f46/f46d9deb7955215f387ea91657e77fac.jpg\";i:2;s:80:\"https://media.rawg.io/media/screenshots/735/73572f56fa1a583f574b4ee8919dd77e.jpg\";i:3;s:80:\"https://media.rawg.io/media/screenshots/31a/31a37c6951371300d4ae7f85bd7b4b88.jpg\";i:4;s:80:\"https://media.rawg.io/media/screenshots/278/2788384314e838a1f3c1aa8a3bfced38.jpg\";i:5;s:80:\"https://media.rawg.io/media/screenshots/e23/e238e91681ab9a80f363d82ad1f7caa3.jpg\";}', 12.99, 0, NULL),
(208, 'Astral Drifters', 'Astral Drifter is a fast-paced, rogue-lite action RPG where you explore procedurally generated space stations, collect powerful loot, and battle ruthless alien enemies. Each run throws you into a unique environment filled with challenging enemies, hidden secrets, and powerful upgrades. Master a variety of weapons and abilities as you fight your way through the depths of the station, uncovering the mysteries of a forgotten civilization and your own forgotten past.', 'product_thumbnail_798072.jpeg', 'a:5:{i:0;s:28:\"product_snapshot_196231.jpeg\";i:1;s:28:\"product_snapshot_370611.jpeg\";i:2;s:28:\"product_snapshot_405155.jpeg\";i:3;s:28:\"product_snapshot_347332.jpeg\";i:4;s:28:\"product_snapshot_568391.jpeg\";}', 19.99, 0, NULL),
(209, '12345312', '123asd123', 'product_thumbnail_301343.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_609795.jpeg\";i:1;s:27:\"product_snapshot_18405.jpeg\";i:2;s:28:\"product_snapshot_563309.jpeg\";i:3;s:28:\"product_snapshot_279943.jpeg\";i:4;s:28:\"product_snapshot_544434.jpeg\";i:5;s:28:\"product_snapshot_179841.jpeg\";}', 12345300, 0, '2024-04-19'),
(210, 'asdas', 'asdasd', 'product_thumbnail_584373.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_321643.jpeg\";i:1;s:27:\"product_snapshot_64945.jpeg\";i:2;s:28:\"product_snapshot_998285.jpeg\";i:3;s:28:\"product_snapshot_238471.jpeg\";i:4;s:28:\"product_snapshot_857713.jpeg\";i:5;s:27:\"product_snapshot_38363.jpeg\";}', 11232, 0, '2024-04-19'),
(211, 'Something', '12312', 'product_thumbnail_590789.jpeg', 'a:1:{i:0;s:28:\"product_snapshot_288608.jpeg\";}', 12.99, 0, '2024-04-18'),
(212, 'asdas', 'asdasd', 'product_thumbnail_178899.jpg', 'a:6:{i:0;s:28:\"product_snapshot_668199.jpeg\";i:1;s:28:\"product_snapshot_631261.jpeg\";i:2;s:28:\"product_snapshot_359659.jpeg\";i:3;s:27:\"product_snapshot_99658.jpeg\";i:4;s:27:\"product_snapshot_546455.jpg\";i:5;s:26:\"product_snapshot_27041.jpg\";}', 12, 0, '2024-04-19'),
(213, '123', 'asd', 'product_thumbnail_262768.jpeg', 'a:3:{i:0;s:26:\"product_snapshot_69434.jpg\";i:1;s:27:\"product_snapshot_804721.jpg\";i:2;s:27:\"product_snapshot_921534.jpg\";}', 11, 0, '2024-04-19'),
(214, '123', 'asd123', 'product_thumbnail_405180.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_431360.jpeg\";i:1;s:28:\"product_snapshot_345496.jpeg\";i:2;s:28:\"product_snapshot_348991.jpeg\";i:3;s:27:\"product_snapshot_766394.jpg\";i:4;s:25:\"product_snapshot_6744.jpg\";i:5;s:27:\"product_snapshot_841843.jpg\";}', 130, 0, '2024-04-19'),
(215, 'test_load', '123', 'product_thumbnail_329228.jpg', 'a:6:{i:0;s:27:\"product_snapshot_29301.jpeg\";i:1;s:28:\"product_snapshot_658312.jpeg\";i:2;s:28:\"product_snapshot_884708.jpeg\";i:3;s:28:\"product_snapshot_577346.jpeg\";i:4;s:28:\"product_snapshot_868908.jpeg\";i:5;s:28:\"product_snapshot_531589.jpeg\";}', 11233, 0, '2024-04-19'),
(216, 'test_load2', '', 'product_thumbnail_133704.jpeg', 'a:1:{i:0;s:28:\"product_snapshot_882516.jpeg\";}', 1213, 0, '2024-04-19'),
(217, 'test_load3', '123', 'product_thumbnail_303744.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_649606.jpeg\";i:1;s:28:\"product_snapshot_675148.jpeg\";i:2;s:28:\"product_snapshot_226327.jpeg\";i:3;s:28:\"product_snapshot_380348.jpeg\";i:4;s:28:\"product_snapshot_507377.jpeg\";i:5;s:28:\"product_snapshot_694744.jpeg\";}', 1, 0, '2024-04-19'),
(218, 'test_load', '123', 'product_thumbnail_369195.jpeg', 'a:5:{i:0;s:28:\"product_snapshot_398798.jpeg\";i:1;s:28:\"product_snapshot_947320.jpeg\";i:2;s:28:\"product_snapshot_317853.jpeg\";i:3;s:28:\"product_snapshot_583449.jpeg\";i:4;s:28:\"product_snapshot_511009.jpeg\";}', 1123, 0, '2024-04-19'),
(219, 'asd', 'asd', 'product_thumbnail_909222.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_741389.jpeg\";i:1;s:28:\"product_snapshot_496794.jpeg\";i:2;s:28:\"product_snapshot_273586.jpeg\";i:3;s:28:\"product_snapshot_238860.jpeg\";i:4;s:28:\"product_snapshot_788931.jpeg\";i:5;s:27:\"product_snapshot_26772.jpeg\";}', 1123, 0, '2024-04-19'),
(220, 'test_Load_last?', 'asd23', 'product_thumbnail_4593.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_198546.jpeg\";i:1;s:28:\"product_snapshot_458054.jpeg\";i:2;s:28:\"product_snapshot_690048.jpeg\";i:3;s:28:\"product_snapshot_661967.jpeg\";i:4;s:26:\"product_snapshot_2989.jpeg\";i:5;s:28:\"product_snapshot_560359.jpeg\";}', 99997, 0, '2024-04-19'),
(221, 'test_delete_with_load', 'testing123', 'product_thumbnail_785970.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_867841.jpeg\";i:1;s:28:\"product_snapshot_580644.jpeg\";i:2;s:28:\"product_snapshot_326229.jpeg\";i:3;s:28:\"product_snapshot_569615.jpeg\";i:4;s:28:\"product_snapshot_622076.jpeg\";i:5;s:28:\"product_snapshot_572447.jpeg\";}', 1123, 0, '2024-04-19'),
(222, '123', '123', 'product_thumbnail_256969.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_420492.jpeg\";i:1;s:28:\"product_snapshot_604368.jpeg\";i:2;s:28:\"product_snapshot_386868.jpeg\";i:3;s:28:\"product_snapshot_924788.jpeg\";i:4;s:28:\"product_snapshot_126697.jpeg\";i:5;s:28:\"product_snapshot_640916.jpeg\";}', 1123, 0, '2024-04-19'),
(223, 'test-product', 'test', 'product_thumbnail_367799.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_153955.jpeg\";i:1;s:27:\"product_snapshot_38749.jpeg\";i:2;s:28:\"product_snapshot_845206.jpeg\";i:3;s:28:\"product_snapshot_612828.jpeg\";i:4;s:28:\"product_snapshot_517211.jpeg\";i:5;s:28:\"product_snapshot_831661.jpeg\";}', 12, 0, '2024-04-21'),
(224, 'practice2', 'asdasdas', 'product_thumbnail_847462.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_455532.jpeg\";i:1;s:28:\"product_snapshot_388508.jpeg\";i:2;s:28:\"product_snapshot_763593.jpeg\";i:3;s:28:\"product_snapshot_409725.jpeg\";i:4;s:28:\"product_snapshot_633884.jpeg\";i:5;s:28:\"product_snapshot_690458.jpeg\";}', 1, 0, '2024-04-23'),
(225, 'asd', 'asd', 'product_thumbnail_387228.jpeg', 'a:7:{i:0;s:28:\"product_snapshot_716274.jpeg\";i:1;s:28:\"product_snapshot_920253.jpeg\";i:2;s:28:\"product_snapshot_485578.jpeg\";i:3;s:28:\"product_snapshot_279373.jpeg\";i:4;s:28:\"product_snapshot_733197.jpeg\";i:5;s:27:\"product_snapshot_92735.jpeg\";i:6;s:28:\"product_snapshot_423351.jpeg\";}', 1, 0, '2024-04-23'),
(226, 'test product', 'aklsjdklasdja', 'product_thumbnail_261048.jpeg', 'a:5:{i:0;s:28:\"product_snapshot_170063.jpeg\";i:1;s:28:\"product_snapshot_130877.jpeg\";i:2;s:28:\"product_snapshot_483826.jpeg\";i:3;s:27:\"product_snapshot_28886.jpeg\";i:4;s:28:\"product_snapshot_619763.jpeg\";}', 1123, 0, '2024-04-23'),
(227, 'test product1', 'asdas', 'product_thumbnail_599789.jpg', 'a:0:{}', 1, 0, NULL),
(228, 'test_product_with_new_method1', 'lakdjlkasdj', 'product_thumbnail_722496.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_731070.jpeg\";i:1;s:28:\"product_snapshot_470578.jpeg\";i:2;s:28:\"product_snapshot_557662.jpeg\";i:3;s:28:\"product_snapshot_766419.jpeg\";i:4;s:28:\"product_snapshot_892940.jpeg\";i:5;s:28:\"product_snapshot_184976.jpeg\";}', 1123, 0, '2024-04-23'),
(229, 'TEST_SOMETHING', 'askdjakl1231', 'product_thumbnail_435422.jpeg', 'a:6:{i:0;s:28:\"product_snapshot_937178.jpeg\";i:1;s:27:\"product_snapshot_57848.jpeg\";i:2;s:28:\"product_snapshot_184477.jpeg\";i:3;s:28:\"product_snapshot_830396.jpeg\";i:4;s:28:\"product_snapshot_182892.jpeg\";i:5;s:28:\"product_snapshot_823200.jpeg\";}', 1, 0, '2024-04-23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 4),
(2, 1, 51),
(3, 1, 83),
(4, 2, 4),
(5, 2, 3),
(6, 2, 7),
(7, 3, 4),
(8, 3, 3),
(9, 3, 5),
(10, 4, 4),
(11, 4, 3),
(12, 4, 5),
(13, 4, 6),
(14, 4, 83),
(15, 5, 2),
(16, 6, 4),
(17, 7, 5),
(18, 7, 10),
(19, 8, 3),
(20, 8, 19),
(21, 8, 51),
(22, 9, 3),
(23, 9, 51),
(24, 10, 4),
(25, 10, 5),
(26, 11, 4),
(27, 11, 15),
(28, 11, 40),
(29, 11, 59),
(30, 11, 51),
(31, 12, 4),
(32, 12, 2),
(33, 13, 4),
(34, 13, 2),
(35, 13, 5),
(36, 14, 15),
(37, 14, 1),
(38, 14, 51),
(39, 15, 4),
(40, 15, 3),
(41, 16, 4),
(42, 16, 2),
(43, 17, 4),
(44, 17, 14),
(45, 17, 40),
(46, 18, 4),
(47, 19, 4),
(48, 19, 2),
(49, 19, 5),
(50, 20, 4),
(51, 20, 5),
(52, 21, 4),
(53, 21, 5),
(54, 22, 4),
(55, 23, 4),
(56, 23, 2),
(57, 24, 4),
(58, 24, 2),
(59, 25, 4),
(60, 25, 5),
(61, 26, 4),
(62, 26, 2),
(63, 26, 11),
(64, 26, 51),
(65, 27, 4),
(66, 27, 2),
(67, 28, 4),
(68, 28, 5),
(69, 29, 4),
(70, 29, 3),
(71, 30, 4),
(72, 30, 2),
(73, 31, 4),
(74, 31, 3),
(75, 32, 10),
(76, 32, 14),
(77, 33, 4),
(78, 33, 5),
(79, 33, 59),
(80, 33, 51),
(81, 34, 4),
(82, 34, 2),
(83, 34, 59),
(84, 35, 4),
(85, 35, 3),
(86, 35, 51),
(87, 36, 4),
(88, 36, 3),
(89, 37, 4),
(90, 37, 2),
(91, 38, 4),
(92, 38, 2),
(93, 39, 4),
(94, 39, 3),
(95, 39, 51),
(96, 40, 4),
(97, 40, 5),
(98, 41, 4),
(99, 41, 5),
(100, 42, 4),
(101, 42, 3),
(102, 42, 51),
(103, 43, 4),
(104, 43, 2),
(105, 44, 4),
(106, 44, 3),
(107, 45, 4),
(108, 45, 3),
(109, 45, 51),
(110, 45, 7),
(111, 45, 83),
(112, 46, 4),
(113, 46, 2),
(114, 47, 4),
(115, 47, 2),
(116, 48, 4),
(117, 48, 2),
(118, 48, 51),
(119, 49, 4),
(120, 49, 3),
(121, 50, 3),
(122, 51, 51),
(123, 51, 83),
(124, 52, 4),
(125, 53, 4),
(126, 53, 51),
(127, 54, 4),
(128, 55, 4),
(129, 55, 5),
(130, 56, 4),
(131, 56, 5),
(132, 57, 4),
(133, 58, 4),
(134, 58, 2),
(135, 59, 4),
(136, 59, 2),
(137, 59, 5),
(138, 60, 4),
(139, 61, 4),
(140, 61, 83),
(141, 62, 4),
(142, 62, 51),
(143, 62, 7),
(144, 62, 83),
(145, 63, 4),
(146, 63, 6),
(147, 64, 4),
(148, 64, 5),
(149, 65, 4),
(150, 65, 5),
(151, 66, 4),
(152, 66, 59),
(153, 67, 4),
(154, 68, 4),
(155, 68, 2),
(156, 69, 4),
(157, 69, 51),
(158, 69, 83),
(159, 70, 4),
(160, 71, 4),
(161, 71, 2),
(162, 72, 4),
(163, 72, 2),
(164, 72, 3),
(165, 73, 4),
(166, 73, 3),
(167, 74, 4),
(168, 74, 2),
(169, 75, 4),
(170, 75, 3),
(171, 75, 5),
(172, 75, 51),
(173, 76, 5),
(174, 76, 14),
(175, 76, 51),
(176, 77, 4),
(177, 77, 2),
(178, 77, 59),
(179, 78, 4),
(180, 78, 2),
(181, 78, 5),
(182, 79, 4),
(183, 79, 5),
(184, 80, 4),
(185, 80, 2),
(186, 81, 4),
(187, 81, 5),
(188, 81, 51),
(189, 82, 4),
(190, 82, 2),
(191, 83, 4),
(192, 83, 2),
(193, 84, 1),
(194, 84, 11),
(195, 85, 4),
(196, 85, 2),
(197, 86, 4),
(198, 86, 7),
(199, 87, 4),
(200, 87, 2),
(201, 87, 5),
(202, 88, 4),
(203, 88, 2),
(204, 89, 4),
(205, 89, 5),
(206, 90, 4),
(207, 90, 2),
(208, 91, 2),
(209, 91, 7),
(210, 92, 4),
(211, 93, 4),
(212, 93, 3),
(213, 93, 5),
(214, 94, 4),
(215, 95, 4),
(216, 95, 2),
(217, 96, 4),
(218, 96, 2),
(219, 97, 2),
(220, 98, 5),
(221, 99, 4),
(222, 99, 2),
(225, 101, 14),
(226, 101, 34),
(227, 101, 51),
(228, 101, 7),
(229, 102, 4),
(230, 102, 2),
(231, 103, 4),
(232, 104, 5),
(233, 104, 51),
(234, 105, 4),
(235, 106, 4),
(236, 106, 2),
(237, 107, 4),
(238, 107, 3),
(239, 108, 2),
(240, 109, 4),
(241, 109, 2),
(242, 110, 4),
(243, 110, 2),
(244, 111, 4),
(245, 111, 51),
(246, 112, 4),
(247, 112, 2),
(248, 113, 10),
(249, 114, 4),
(250, 114, 3),
(251, 114, 5),
(252, 115, 4),
(253, 115, 3),
(254, 115, 51),
(255, 116, 10),
(256, 117, 4),
(257, 117, 5),
(258, 118, 4),
(259, 118, 2),
(260, 118, 5),
(261, 119, 10),
(262, 120, 4),
(263, 120, 5),
(264, 121, 4),
(265, 121, 2),
(266, 122, 4),
(267, 122, 5),
(268, 123, 4),
(269, 123, 3),
(270, 124, 4),
(271, 124, 5),
(272, 125, 4),
(273, 125, 2),
(274, 125, 3),
(275, 126, 4),
(276, 126, 3),
(277, 127, 4),
(278, 127, 3),
(279, 127, 51),
(280, 127, 7),
(281, 127, 83),
(282, 128, 4),
(283, 129, 2),
(284, 130, 3),
(285, 130, 51),
(286, 131, 3),
(287, 131, 14),
(288, 131, 51),
(289, 132, 4),
(290, 132, 10),
(291, 133, 4),
(292, 133, 2),
(293, 133, 5),
(294, 134, 4),
(295, 134, 2),
(296, 135, 3),
(297, 136, 4),
(298, 136, 5),
(299, 137, 5),
(300, 138, 4),
(301, 138, 2),
(302, 139, 4),
(303, 140, 4),
(304, 141, 4),
(305, 141, 5),
(306, 142, 4),
(307, 142, 2),
(308, 143, 4),
(309, 143, 2),
(310, 143, 3),
(311, 144, 4),
(312, 144, 2),
(313, 145, 4),
(314, 145, 2),
(315, 145, 3),
(316, 146, 4),
(317, 147, 4),
(318, 147, 2),
(319, 147, 59),
(320, 148, 4),
(321, 148, 11),
(322, 148, 6),
(323, 149, 4),
(324, 149, 3),
(325, 149, 83),
(326, 150, 4),
(327, 150, 3),
(328, 151, 4),
(329, 151, 5),
(330, 152, 3),
(331, 152, 83),
(332, 153, 4),
(333, 153, 5),
(334, 154, 4),
(335, 154, 2),
(336, 155, 4),
(337, 155, 3),
(338, 155, 51),
(339, 156, 4),
(340, 156, 5),
(341, 157, 4),
(342, 158, 4),
(343, 158, 59),
(344, 159, 4),
(345, 159, 5),
(346, 160, 4),
(347, 161, 4),
(348, 161, 2),
(349, 162, 4),
(350, 162, 2),
(351, 162, 3),
(352, 163, 3),
(353, 163, 83),
(354, 164, 4),
(355, 164, 2),
(356, 164, 7),
(357, 165, 4),
(358, 165, 2),
(359, 166, 4),
(360, 167, 4),
(361, 167, 3),
(362, 168, 4),
(363, 168, 5),
(364, 168, 10),
(365, 168, 59),
(366, 168, 51),
(367, 169, 4),
(368, 169, 3),
(369, 169, 5),
(370, 169, 14),
(371, 169, 59),
(372, 169, 51),
(373, 170, 10),
(374, 171, 4),
(375, 171, 2),
(376, 171, 14),
(377, 172, 4),
(378, 172, 51),
(379, 172, 7),
(380, 172, 83),
(381, 173, 4),
(382, 174, 4),
(383, 174, 14),
(384, 174, 11),
(385, 174, 59),
(386, 174, 51),
(387, 175, 10),
(388, 175, 14),
(389, 176, 4),
(390, 176, 2),
(391, 177, 4),
(392, 177, 3),
(393, 178, 4),
(394, 178, 2),
(395, 179, 4),
(396, 179, 83),
(397, 180, 4),
(398, 180, 14),
(399, 180, 51),
(400, 181, 4),
(401, 181, 2),
(402, 182, 10),
(403, 182, 14),
(404, 183, 4),
(405, 183, 2),
(406, 184, 4),
(407, 184, 2),
(408, 185, 4),
(409, 185, 5),
(410, 186, 4),
(411, 186, 3),
(412, 187, 2),
(413, 188, 3),
(414, 188, 5),
(415, 188, 51),
(416, 189, 5),
(417, 189, 10),
(418, 189, 51),
(419, 190, 4),
(420, 191, 4),
(421, 191, 3),
(422, 192, 4),
(423, 192, 3),
(424, 192, 14),
(425, 192, 40),
(426, 192, 51),
(427, 193, 4),
(428, 193, 2),
(429, 194, 4),
(430, 194, 51),
(431, 194, 83),
(432, 195, 4),
(433, 195, 3),
(434, 195, 5),
(435, 195, 51),
(436, 196, 4),
(437, 196, 3),
(438, 196, 5),
(439, 196, 59),
(440, 196, 51),
(441, 197, 4),
(442, 197, 40),
(443, 197, 6),
(444, 197, 51),
(445, 198, 4),
(446, 198, 14),
(447, 198, 51),
(448, 199, 3),
(449, 199, 51),
(450, 200, 4),
(451, 200, 2),
(2471, 211, 1),
(2472, 211, 2),
(2473, 211, 3),
(2479, 210, 1),
(2480, 210, 2),
(2481, 210, 3),
(2482, 210, 28),
(2483, 210, 34),
(2484, 212, 1),
(2485, 212, 28),
(2486, 213, 1),
(2487, 214, 1),
(2488, 215, 1),
(2489, 216, 2),
(2490, 217, 3),
(2491, 217, 4),
(2492, 218, 1),
(2493, 218, 28),
(2494, 219, 1),
(2495, 219, 2),
(2496, 220, 1),
(2497, 220, 2),
(2498, 220, 3),
(2499, 220, 28),
(2500, 220, 34),
(2501, 221, 1),
(2502, 221, 2),
(2503, 221, 3),
(2504, 221, 28),
(2505, 221, 34),
(2506, 221, 40),
(2517, 209, 1),
(2518, 209, 2),
(2519, 222, 1),
(2520, 222, 2),
(2521, 100, 3),
(2522, 100, 4),
(2523, 223, 1),
(2583, 225, 1),
(2589, 208, 4),
(2590, 208, 5),
(2594, 224, 1),
(2595, 224, 4),
(2596, 224, 5),
(2597, 226, 1),
(2598, 226, 2),
(2599, 226, 28),
(2622, 228, 1),
(2634, 229, 1),
(2646, 227, 34);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_platforms`
--

CREATE TABLE `tbl_product_platforms` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product_platforms`
--

INSERT INTO `tbl_product_platforms` (`id`, `product_id`, `platform_id`) VALUES
(1, 1, 3),
(2, 1, 6),
(3, 1, 4),
(4, 1, 12),
(5, 1, 1),
(6, 2, 4),
(7, 2, 3),
(8, 2, 1),
(9, 3, 3),
(10, 3, 4),
(11, 3, 1),
(12, 4, 3),
(13, 4, 12),
(14, 4, 13),
(15, 4, 4),
(16, 4, 6),
(17, 4, 1),
(18, 5, 3),
(19, 5, 16),
(20, 5, 1),
(21, 5, 4),
(22, 5, 14),
(23, 6, 1),
(24, 6, 2),
(25, 6, 5),
(26, 6, 3),
(27, 6, 16),
(28, 6, 14),
(29, 6, 4),
(30, 7, 6),
(31, 7, 12),
(32, 7, 1),
(33, 7, 3),
(34, 7, 13),
(35, 8, 1),
(36, 8, 7),
(37, 8, 3),
(38, 8, 16),
(39, 9, 12),
(40, 9, 13),
(41, 9, 6),
(42, 9, 3),
(43, 9, 4),
(44, 9, 1),
(45, 10, 1),
(46, 10, 4),
(47, 10, 3),
(48, 10, 5),
(49, 10, 2),
(50, 11, 4),
(51, 11, 3),
(52, 11, 1),
(53, 11, 6),
(54, 11, 5),
(55, 12, 1),
(56, 12, 2),
(57, 12, 4),
(58, 12, 3),
(59, 13, 13),
(60, 13, 12),
(61, 13, 1),
(62, 13, 16),
(63, 13, 14),
(64, 13, 8),
(65, 14, 6),
(66, 14, 13),
(67, 14, 12),
(68, 14, 4),
(69, 14, 1),
(70, 14, 3),
(71, 15, 1),
(72, 15, 4),
(73, 15, 6),
(74, 15, 8),
(75, 15, 7),
(76, 15, 3),
(77, 16, 3),
(78, 16, 1),
(79, 16, 6),
(80, 16, 4),
(81, 17, 8),
(82, 17, 6),
(83, 17, 1),
(84, 17, 7),
(85, 17, 3),
(86, 17, 2),
(87, 17, 4),
(88, 18, 1),
(89, 18, 6),
(90, 18, 4),
(91, 18, 3),
(92, 19, 1),
(93, 19, 14),
(94, 19, 16),
(95, 20, 3),
(96, 20, 1),
(97, 20, 4),
(98, 21, 4),
(99, 21, 1),
(100, 21, 6),
(101, 21, 21),
(102, 21, 3),
(103, 22, 14),
(104, 22, 16),
(105, 22, 4),
(106, 22, 1),
(107, 22, 12),
(108, 22, 3),
(109, 23, 3),
(110, 23, 4),
(111, 23, 6),
(112, 23, 1),
(113, 23, 12),
(114, 23, 13),
(115, 24, 6),
(116, 24, 1),
(117, 24, 13),
(118, 24, 4),
(119, 24, 3),
(120, 24, 12),
(121, 25, 13),
(122, 25, 4),
(123, 25, 14),
(124, 25, 16),
(125, 25, 3),
(126, 25, 12),
(127, 25, 1),
(128, 26, 13),
(129, 26, 6),
(130, 26, 4),
(131, 26, 3),
(132, 26, 19),
(133, 26, 1),
(134, 27, 14),
(135, 27, 1),
(136, 28, 5),
(137, 28, 2),
(138, 28, 12),
(139, 28, 3),
(140, 28, 6),
(141, 28, 1),
(142, 28, 4),
(143, 29, 3),
(144, 30, 3),
(145, 30, 6),
(146, 30, 12),
(147, 30, 1),
(148, 30, 4),
(149, 31, 1),
(150, 31, 3),
(151, 32, 4),
(152, 32, 1),
(153, 32, 12),
(154, 32, 13),
(155, 32, 6),
(156, 32, 3),
(157, 33, 4),
(158, 33, 3),
(159, 33, 1),
(160, 34, 4),
(161, 34, 1),
(162, 34, 12),
(163, 34, 13),
(164, 34, 3),
(165, 35, 3),
(166, 35, 4),
(167, 35, 1),
(168, 35, 12),
(169, 35, 13),
(170, 36, 4),
(171, 36, 21),
(172, 36, 14),
(173, 36, 16),
(174, 36, 3),
(175, 36, 1),
(176, 37, 4),
(177, 37, 3),
(178, 37, 1),
(179, 38, 4),
(180, 38, 1),
(181, 38, 14),
(182, 38, 16),
(183, 38, 3),
(184, 39, 13),
(185, 39, 12),
(186, 39, 1),
(187, 40, 3),
(188, 41, 4),
(189, 41, 1),
(190, 41, 3),
(191, 42, 4),
(192, 42, 6),
(193, 42, 3),
(194, 42, 1),
(195, 43, 12),
(196, 43, 13),
(197, 43, 1),
(198, 43, 14),
(199, 44, 4),
(200, 44, 3),
(201, 44, 14),
(202, 44, 13),
(203, 44, 12),
(204, 44, 1),
(205, 45, 6),
(206, 45, 16),
(207, 45, 14),
(208, 45, 3),
(209, 45, 19),
(210, 45, 7),
(211, 45, 1),
(212, 45, 12),
(213, 45, 13),
(214, 46, 14),
(215, 46, 1),
(216, 46, 16),
(217, 46, 3),
(218, 46, 4),
(219, 47, 3),
(220, 47, 1),
(221, 47, 4),
(222, 47, 16),
(223, 47, 14),
(224, 48, 12),
(225, 48, 1),
(226, 48, 13),
(227, 49, 3),
(228, 49, 16),
(229, 49, 14),
(230, 49, 4),
(231, 49, 12),
(232, 49, 1),
(233, 50, 1),
(234, 50, 13),
(235, 50, 16),
(236, 50, 12),
(237, 50, 7),
(238, 50, 14),
(239, 50, 8),
(240, 50, 3),
(241, 50, 4),
(242, 51, 13),
(243, 51, 6),
(244, 51, 21),
(245, 51, 14),
(246, 51, 3),
(247, 51, 19),
(248, 51, 8),
(249, 51, 51),
(250, 51, 1),
(251, 51, 12),
(252, 52, 13),
(253, 52, 12),
(254, 52, 1),
(255, 53, 13),
(256, 53, 12),
(257, 53, 6),
(258, 53, 1),
(259, 53, 4),
(260, 53, 3),
(261, 54, 21),
(262, 54, 14),
(263, 54, 16),
(264, 54, 4),
(265, 54, 3),
(266, 54, 1),
(267, 55, 4),
(268, 55, 1),
(269, 55, 3),
(270, 56, 1),
(271, 56, 4),
(272, 56, 3),
(273, 56, 8),
(274, 57, 1),
(275, 57, 3),
(276, 57, 4),
(277, 58, 3),
(278, 58, 4),
(279, 58, 1),
(280, 58, 51),
(281, 58, 5),
(282, 58, 2),
(283, 59, 4),
(284, 59, 1),
(285, 59, 3),
(286, 60, 14),
(287, 60, 4),
(288, 60, 1),
(289, 60, 6),
(290, 60, 21),
(291, 60, 16),
(292, 60, 3),
(293, 61, 3),
(294, 61, 1),
(295, 61, 4),
(296, 61, 6),
(297, 62, 3),
(298, 62, 6),
(299, 62, 1),
(300, 62, 13),
(301, 62, 12),
(302, 63, 1),
(303, 63, 4),
(304, 63, 3),
(305, 64, 1),
(306, 64, 3),
(307, 65, 21),
(308, 65, 1),
(309, 65, 12),
(310, 65, 14),
(311, 65, 16),
(312, 66, 4),
(313, 66, 3),
(314, 66, 1),
(315, 67, 12),
(316, 67, 1),
(317, 67, 7),
(318, 67, 15),
(319, 67, 8),
(320, 67, 3),
(321, 67, 16),
(322, 67, 17),
(323, 67, 14),
(324, 67, 4),
(325, 68, 4),
(326, 68, 14),
(327, 68, 1),
(328, 68, 6),
(329, 68, 16),
(330, 68, 3),
(331, 69, 14),
(332, 69, 21),
(333, 69, 9),
(334, 69, 4),
(335, 69, 3),
(336, 69, 7),
(337, 69, 1),
(338, 69, 12),
(339, 69, 13),
(340, 69, 6),
(341, 69, 16),
(342, 69, 19),
(343, 69, 8),
(344, 70, 8),
(345, 70, 12),
(346, 70, 1),
(347, 70, 7),
(348, 70, 3),
(349, 70, 19),
(350, 70, 17),
(351, 70, 15),
(352, 71, 12),
(353, 71, 1),
(354, 71, 7),
(355, 71, 8),
(356, 71, 3),
(357, 71, 17),
(358, 71, 15),
(359, 72, 3),
(360, 72, 1),
(361, 72, 4),
(362, 72, 6),
(363, 73, 16),
(364, 73, 1),
(365, 73, 4),
(366, 73, 3),
(367, 73, 14),
(368, 73, 13),
(369, 74, 13),
(370, 74, 1),
(371, 74, 4),
(372, 75, 3),
(373, 75, 19),
(374, 75, 4),
(375, 75, 1),
(376, 75, 7),
(377, 75, 13),
(378, 75, 6),
(379, 75, 14),
(380, 75, 12),
(381, 76, 6),
(382, 76, 4),
(383, 76, 1),
(384, 76, 7),
(385, 76, 12),
(386, 76, 13),
(387, 76, 3),
(388, 76, 19),
(389, 76, 8),
(390, 77, 5),
(391, 77, 2),
(392, 77, 3),
(393, 77, 4),
(394, 77, 6),
(395, 77, 1),
(396, 78, 16),
(397, 78, 12),
(398, 78, 1),
(399, 78, 8),
(400, 78, 13),
(401, 78, 19),
(402, 78, 14),
(403, 79, 4),
(404, 79, 1),
(405, 79, 3),
(406, 80, 14),
(407, 80, 4),
(408, 80, 16),
(409, 80, 1),
(410, 80, 3),
(411, 81, 6),
(412, 81, 3),
(413, 81, 1),
(414, 81, 7),
(415, 81, 12),
(416, 81, 13),
(417, 82, 1),
(418, 82, 14),
(419, 82, 12),
(420, 83, 4),
(421, 83, 3),
(422, 83, 1),
(423, 84, 16),
(424, 84, 14),
(425, 84, 12),
(426, 84, 1),
(427, 85, 3),
(428, 85, 14),
(429, 85, 6),
(430, 85, 13),
(431, 85, 1),
(432, 85, 16),
(433, 85, 4),
(434, 86, 12),
(435, 86, 1),
(436, 86, 8),
(437, 86, 16),
(438, 86, 14),
(439, 86, 13),
(440, 86, 6),
(441, 87, 3),
(442, 87, 1),
(443, 87, 5),
(444, 87, 2),
(445, 87, 4),
(446, 88, 4),
(447, 88, 14),
(448, 88, 16),
(449, 88, 1),
(450, 88, 3),
(451, 89, 4),
(452, 89, 14),
(453, 89, 16),
(454, 89, 1),
(455, 90, 1),
(456, 90, 12),
(457, 90, 14),
(458, 90, 13),
(459, 90, 15),
(460, 90, 8),
(461, 91, 16),
(462, 91, 1),
(463, 91, 14),
(464, 91, 13),
(465, 91, 12),
(466, 91, 4),
(467, 92, 16),
(468, 92, 12),
(469, 92, 1),
(470, 92, 14),
(471, 92, 4),
(472, 93, 3),
(473, 93, 16),
(474, 93, 14),
(475, 93, 1),
(476, 93, 4),
(477, 94, 14),
(478, 94, 16),
(479, 94, 1),
(480, 95, 16),
(481, 95, 1),
(482, 95, 14),
(483, 95, 12),
(484, 96, 16),
(485, 96, 12),
(486, 96, 1),
(487, 96, 14),
(488, 97, 1),
(489, 97, 13),
(490, 97, 14),
(491, 97, 16),
(492, 98, 30),
(493, 98, 1),
(494, 98, 13),
(495, 98, 12),
(496, 99, 14),
(497, 99, 16),
(498, 99, 4),
(499, 99, 1),
(505, 101, 13),
(506, 101, 12),
(507, 101, 1),
(508, 101, 7),
(509, 101, 8),
(510, 101, 19),
(511, 102, 3),
(512, 102, 4),
(513, 102, 6),
(514, 102, 1),
(515, 102, 12),
(516, 102, 14),
(517, 102, 16),
(518, 103, 14),
(519, 103, 1),
(520, 103, 16),
(521, 103, 4),
(522, 104, 5),
(523, 104, 6),
(524, 104, 4),
(525, 104, 1),
(526, 104, 12),
(527, 104, 13),
(528, 104, 3),
(529, 104, 19),
(530, 105, 16),
(531, 105, 4),
(532, 105, 14),
(533, 105, 6),
(534, 105, 1),
(535, 106, 14),
(536, 106, 16),
(537, 106, 4),
(538, 106, 1),
(539, 107, 3),
(540, 107, 16),
(541, 107, 14),
(542, 107, 1),
(543, 107, 4),
(544, 107, 6),
(545, 108, 1),
(546, 108, 4),
(547, 108, 16),
(548, 108, 12),
(549, 108, 14),
(550, 109, 6),
(551, 109, 3),
(552, 109, 4),
(553, 109, 14),
(554, 109, 16),
(555, 110, 16),
(556, 110, 1),
(557, 110, 4),
(558, 110, 14),
(559, 111, 4),
(560, 111, 1),
(561, 111, 3),
(562, 112, 16),
(563, 112, 14),
(564, 112, 1),
(565, 112, 13),
(566, 112, 4),
(567, 113, 1),
(568, 113, 12),
(569, 113, 13),
(570, 114, 3),
(571, 114, 4),
(572, 114, 1),
(573, 115, 13),
(574, 115, 12),
(575, 115, 1),
(576, 116, 1),
(577, 116, 8),
(578, 116, 7),
(579, 116, 14),
(580, 116, 16),
(581, 116, 12),
(582, 117, 1),
(583, 117, 4),
(584, 117, 16),
(585, 117, 14),
(586, 118, 1),
(587, 118, 14),
(588, 118, 16),
(589, 119, 12),
(590, 119, 1),
(591, 119, 13),
(592, 120, 3),
(593, 120, 6),
(594, 120, 1),
(595, 120, 4),
(596, 121, 16),
(597, 121, 14),
(598, 121, 1),
(599, 121, 4),
(600, 122, 4),
(601, 122, 1),
(602, 122, 3),
(603, 123, 1),
(604, 123, 3),
(605, 124, 13),
(606, 124, 1),
(607, 124, 4),
(608, 124, 12),
(609, 124, 3),
(610, 125, 3),
(611, 125, 2),
(612, 126, 4),
(613, 126, 1),
(614, 126, 3),
(615, 126, 12),
(616, 126, 13),
(617, 127, 6),
(618, 127, 1),
(619, 127, 7),
(620, 127, 12),
(621, 127, 4),
(622, 127, 3),
(623, 128, 3),
(624, 128, 12),
(625, 128, 1),
(626, 128, 4),
(627, 128, 14),
(628, 128, 16),
(629, 129, 3),
(630, 129, 6),
(631, 129, 12),
(632, 129, 1),
(633, 129, 4),
(634, 130, 1),
(635, 130, 12),
(636, 130, 13),
(637, 131, 8),
(638, 131, 19),
(639, 131, 6),
(640, 131, 13),
(641, 131, 12),
(642, 131, 1),
(643, 131, 7),
(644, 132, 14),
(645, 132, 16),
(646, 132, 4),
(647, 132, 7),
(648, 132, 1),
(649, 132, 13),
(650, 132, 12),
(651, 133, 14),
(652, 133, 1),
(653, 133, 4),
(654, 133, 3),
(655, 133, 16),
(656, 134, 3),
(657, 134, 1),
(658, 134, 12),
(659, 134, 14),
(660, 134, 16),
(661, 135, 19),
(662, 135, 3),
(663, 135, 4),
(664, 135, 7),
(665, 135, 1),
(666, 135, 8),
(667, 135, 14),
(668, 135, 12),
(669, 136, 1),
(670, 136, 5),
(671, 136, 2),
(672, 136, 4),
(673, 136, 3),
(674, 136, 6),
(675, 136, 14),
(676, 136, 16),
(677, 137, 12),
(678, 137, 1),
(679, 137, 14),
(680, 138, 12),
(681, 138, 1),
(682, 138, 3),
(683, 138, 4),
(684, 138, 6),
(685, 139, 3),
(686, 139, 1),
(687, 139, 2),
(688, 140, 1),
(689, 140, 3),
(690, 141, 3),
(691, 141, 1),
(692, 141, 4),
(693, 141, 6),
(694, 142, 4),
(695, 142, 1),
(696, 142, 3),
(697, 143, 4),
(698, 143, 1),
(699, 143, 5),
(700, 144, 1),
(701, 144, 3),
(702, 144, 4),
(703, 144, 6),
(704, 144, 2),
(705, 145, 5),
(706, 145, 2),
(707, 145, 4),
(708, 145, 3),
(709, 145, 1),
(710, 146, 1),
(711, 146, 13),
(712, 146, 12),
(713, 147, 1),
(714, 147, 4),
(715, 147, 3),
(716, 148, 3),
(717, 148, 19),
(718, 148, 1),
(719, 148, 14),
(720, 148, 16),
(721, 149, 16),
(722, 149, 1),
(723, 149, 3),
(724, 149, 14),
(725, 150, 3),
(726, 150, 14),
(727, 150, 4),
(728, 150, 16),
(729, 150, 12),
(730, 150, 1),
(731, 151, 1),
(732, 151, 12),
(733, 152, 4),
(734, 152, 1),
(735, 152, 6),
(736, 152, 14),
(737, 153, 1),
(738, 154, 46),
(739, 154, 13),
(740, 154, 12),
(741, 154, 1),
(742, 154, 17),
(743, 155, 16),
(744, 155, 4),
(745, 155, 7),
(746, 155, 6),
(747, 155, 14),
(748, 155, 3),
(749, 155, 8),
(750, 155, 1),
(751, 156, 8),
(752, 156, 1),
(753, 157, 1),
(754, 157, 12),
(755, 157, 13),
(756, 158, 13),
(757, 158, 12),
(758, 158, 1),
(759, 159, 3),
(760, 159, 12),
(761, 159, 1),
(762, 159, 4),
(763, 159, 6),
(764, 160, 12),
(765, 160, 13),
(766, 160, 1),
(767, 161, 12),
(768, 161, 1),
(769, 161, 13),
(770, 161, 15),
(771, 162, 14),
(772, 162, 4),
(773, 162, 1),
(774, 163, 14),
(775, 163, 4),
(776, 163, 1),
(777, 164, 8),
(778, 164, 13),
(779, 164, 12),
(780, 164, 1),
(781, 164, 14),
(782, 165, 13),
(783, 165, 1),
(784, 165, 14),
(785, 165, 8),
(786, 165, 12),
(787, 166, 4),
(788, 166, 1),
(789, 166, 12),
(790, 166, 3),
(791, 167, 4),
(792, 167, 3),
(793, 167, 1),
(794, 168, 8),
(795, 168, 13),
(796, 168, 12),
(797, 168, 1),
(798, 168, 7),
(799, 169, 6),
(800, 169, 4),
(801, 169, 1),
(802, 169, 3),
(803, 169, 2),
(804, 170, 13),
(805, 170, 12),
(806, 170, 1),
(807, 171, 3),
(808, 171, 13),
(809, 171, 12),
(810, 171, 1),
(811, 171, 4),
(812, 172, 8),
(813, 172, 19),
(814, 172, 3),
(815, 172, 16),
(816, 172, 14),
(817, 172, 13),
(818, 172, 12),
(819, 172, 1),
(820, 172, 7),
(821, 172, 4),
(822, 172, 6),
(823, 173, 16),
(824, 173, 1),
(825, 173, 8),
(826, 173, 14),
(827, 174, 8),
(828, 174, 19),
(829, 174, 3),
(830, 174, 16),
(831, 174, 14),
(832, 174, 9),
(833, 174, 6),
(834, 174, 12),
(835, 174, 1),
(836, 174, 7),
(837, 174, 21),
(838, 174, 4),
(839, 174, 13),
(840, 175, 1),
(841, 175, 12),
(842, 175, 13),
(843, 176, 4),
(844, 176, 1),
(845, 176, 3),
(846, 176, 5),
(847, 176, 2),
(848, 177, 8),
(849, 177, 19),
(850, 177, 12),
(851, 177, 1),
(852, 177, 7),
(853, 177, 3),
(854, 177, 16),
(855, 177, 14),
(856, 177, 6),
(857, 177, 4),
(858, 178, 3),
(859, 178, 1),
(860, 178, 4),
(861, 179, 16),
(862, 179, 4),
(863, 179, 7),
(864, 179, 1),
(865, 179, 12),
(866, 179, 13),
(867, 179, 14),
(868, 179, 17),
(869, 179, 3),
(870, 179, 15),
(871, 180, 12),
(872, 180, 1),
(873, 181, 3),
(874, 181, 6),
(875, 181, 1),
(876, 181, 4),
(877, 182, 7),
(878, 182, 1),
(879, 182, 12),
(880, 182, 3),
(881, 182, 4),
(882, 182, 6),
(883, 182, 13),
(884, 183, 2),
(885, 183, 3),
(886, 184, 1),
(887, 184, 12),
(888, 184, 13),
(889, 185, 4),
(890, 185, 3),
(891, 185, 1),
(892, 186, 3),
(893, 186, 1),
(894, 186, 2),
(895, 186, 4),
(896, 187, 13),
(897, 187, 12),
(898, 187, 1),
(899, 188, 1),
(900, 188, 12),
(901, 188, 4),
(902, 188, 6),
(903, 188, 3),
(904, 188, 5),
(905, 188, 2),
(906, 189, 1),
(907, 189, 12),
(908, 189, 8),
(909, 189, 13),
(910, 189, 7),
(911, 190, 12),
(912, 190, 13),
(913, 190, 1),
(914, 191, 1),
(915, 191, 3),
(916, 191, 16),
(917, 192, 13),
(918, 192, 12),
(919, 192, 1),
(920, 193, 3),
(921, 193, 13),
(922, 193, 12),
(923, 193, 1),
(924, 193, 4),
(925, 194, 3),
(926, 194, 13),
(927, 194, 12),
(928, 194, 1),
(929, 194, 6),
(930, 194, 4),
(931, 195, 2),
(932, 195, 5),
(933, 195, 3),
(934, 195, 6),
(935, 195, 1),
(936, 195, 4),
(937, 196, 6),
(938, 196, 4),
(939, 196, 3),
(940, 196, 13),
(941, 196, 12),
(942, 196, 1),
(943, 196, 7),
(944, 197, 4),
(945, 197, 8),
(946, 197, 7),
(947, 197, 1),
(948, 197, 12),
(949, 197, 6),
(950, 197, 3),
(951, 198, 13),
(952, 198, 4),
(953, 198, 3),
(954, 198, 12),
(955, 198, 1),
(956, 199, 12),
(957, 199, 1),
(958, 199, 6),
(959, 199, 13),
(960, 199, 3),
(961, 199, 4),
(962, 199, 7),
(963, 200, 4),
(964, 200, 1),
(965, 200, 3),
(994, 211, 1),
(995, 211, 2),
(996, 211, 3),
(997, 210, 1),
(998, 210, 2),
(999, 210, 3),
(1000, 212, 1),
(1001, 212, 2),
(1002, 212, 3),
(1003, 213, 1),
(1004, 214, 1),
(1005, 214, 2),
(1006, 215, 2),
(1007, 216, 3),
(1008, 217, 11),
(1009, 217, 12),
(1010, 217, 13),
(1011, 218, 1),
(1012, 218, 11),
(1013, 218, 23),
(1014, 219, 2),
(1015, 220, 1),
(1016, 220, 2),
(1017, 220, 3),
(1018, 220, 11),
(1019, 220, 12),
(1020, 220, 13),
(1021, 221, 1),
(1022, 221, 2),
(1023, 221, 11),
(1024, 221, 12),
(1040, 209, 1),
(1041, 209, 2),
(1042, 209, 11),
(1043, 222, 1),
(1044, 222, 2),
(1045, 100, 1),
(1046, 100, 4),
(1047, 100, 13),
(1048, 100, 14),
(1049, 100, 16),
(1050, 223, 1),
(1051, 223, 12),
(1052, 223, 13),
(1053, 223, 51),
(1142, 225, 1),
(1149, 208, 1),
(1150, 208, 2),
(1151, 208, 5),
(1155, 224, 1),
(1156, 224, 2),
(1157, 224, 5),
(1158, 226, 1),
(1159, 226, 2),
(1176, 228, 1),
(1195, 229, 16),
(1205, 227, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'student',
  `date_registered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `email`, `role`, `date_registered`) VALUES
(1, 'Lorenz Bocatot', 'lorenz.bocatot@gmail.com', 'student', '2024-04-17 21:20:39'),
(2, 'Test Signup', 'test@gmail.com', 'student', '2024-05-03 21:20:39'),
(3, 'Admin', 'auth@gmail.com', 'admin', '2024-05-01 21:20:39'),
(4, 'Lezy Jie', 'oscianent@gmail.com', 'student', '2024-04-22 04:19:49'),
(6, 'Lorenz Bocatot', 'lorenzbocatot1@gmail.com', 'student', '2024-04-23 16:16:58');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_view`
-- (See below for the actual view)
--
CREATE TABLE `user_view` (
`id` int(11)
,`full_name` varchar(100)
,`email` varchar(100)
,`username` varchar(100)
,`password` varchar(300)
,`role` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `cart_view`
--
DROP TABLE IF EXISTS `cart_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cart_view`  AS   (select `tbl_cart`.`id` AS `cart_id`,`tbl_cart`.`user_id` AS `user_id`,`tbl_cart`.`product_id` AS `product_id`,`tbl_cart`.`quantity` AS `quantity`,`tbl_products`.`product_name` AS `product_name`,`tbl_platforms`.`platform_name` AS `platform_name`,`tbl_products`.`product_thumbnail` AS `product_thumbnail` from ((`tbl_cart` join `tbl_products` on(`tbl_cart`.`product_id` = `tbl_products`.`id`)) join `tbl_platforms` on(`tbl_platforms`.`id` = `tbl_cart`.`platform_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `game_platform_view`
--
DROP TABLE IF EXISTS `game_platform_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `game_platform_view`  AS SELECT `tbl_products`.`id` AS `product_id`, `tbl_platforms`.`id` AS `platform_id`, `tbl_platforms`.`platform_name` AS `platform_name` FROM ((`tbl_products` join `tbl_product_platforms` on(`tbl_products`.`id` = `tbl_product_platforms`.`product_id`)) join `tbl_platforms` on(`tbl_platforms`.`id` = `tbl_product_platforms`.`platform_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `order_view`
--
DROP TABLE IF EXISTS `order_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_view`  AS SELECT `tbl_orders`.`id` AS `id`, `tbl_orders`.`customer_id` AS `customer_id`, `tbl_orders`.`quantity` AS `quantity`, `tbl_orders`.`receipient_name` AS `receipient_name`, `tbl_orders`.`order_status` AS `order_status`, `tbl_orders`.`order_address` AS `order_address`, `tbl_orders`.`order_total` AS `order_total`, `tbl_orders`.`order_completed` AS `order_completed`, `tbl_products`.`product_name` AS `product_name`, `tbl_products`.`product_thumbnail` AS `product_thumbnail`, `tbl_platforms`.`platform_name` AS `platform_name` FROM ((`tbl_orders` join `tbl_products` on(`tbl_orders`.`product_id` = `tbl_products`.`id`)) join `tbl_platforms` on(`tbl_orders`.`platform_id` = `tbl_platforms`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `popular_categories`
--
DROP TABLE IF EXISTS `popular_categories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popular_categories`  AS   (select sum(`tbl_products`.`sold_count`) AS `products_sold`,`tbl_categories`.`category_name` AS `category_name` from ((`tbl_products` join `tbl_product_categories` on(`tbl_products`.`id` = `tbl_product_categories`.`product_id`)) join `tbl_categories` on(`tbl_categories`.`id` = `tbl_product_categories`.`category_id`)) group by `tbl_product_categories`.`category_id` order by sum(`tbl_products`.`sold_count`) desc)  ;

-- --------------------------------------------------------

--
-- Structure for view `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view`  AS SELECT `tbl_products`.`id` AS `id`, `tbl_products`.`product_name` AS `product_name`, `tbl_products`.`product_description` AS `product_description`, `tbl_products`.`product_thumbnail` AS `product_thumbnail`, `tbl_products`.`snapshots` AS `snapshots`, `tbl_products`.`price` AS `price`, `tbl_products`.`deleted_at` AS `deleted_at`, `tbl_products`.`sold_count` AS `sold_count`, `tbl_categories`.`category_name` AS `category_name` FROM ((`tbl_products` join `tbl_product_categories` on(`tbl_products`.`id` = `tbl_product_categories`.`product_id`)) join `tbl_categories` on(`tbl_categories`.`id` = `tbl_product_categories`.`category_id`)) WHERE `tbl_products`.`deleted_at` is null ;

-- --------------------------------------------------------

--
-- Structure for view `user_view`
--
DROP TABLE IF EXISTS `user_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_view`  AS   (select `tbl_users`.`id` AS `id`,`tbl_users`.`full_name` AS `full_name`,`tbl_users`.`email` AS `email`,`tbl_login`.`username` AS `username`,`tbl_login`.`password` AS `password`,`tbl_users`.`role` AS `role` from (`tbl_login` join `tbl_users` on(`tbl_login`.`user_id` = `tbl_users`.`id`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_owner` (`user_id`),
  ADD KEY `fk_cart_product_id` (`product_id`),
  ADD KEY `fk_cart_platform_id` (`platform_id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_message_user_id` (`user_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_customer_id` (`customer_id`),
  ADD KEY `fk_product_id` (`product_id`),
  ADD KEY `fk_order_platform_id` (`platform_id`);

--
-- Indexes for table `tbl_platforms`
--
ALTER TABLE `tbl_platforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_productID` (`product_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `tbl_product_platforms`
--
ALTER TABLE `tbl_product_platforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_platform_id` (`platform_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_platforms`
--
ALTER TABLE `tbl_platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2647;

--
-- AUTO_INCREMENT for table `tbl_product_platforms`
--
ALTER TABLE `tbl_product_platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1206;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `fk_cart_owner` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `tbl_platforms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_messages`
--
ALTER TABLE `tbl_messages`
  ADD CONSTRAINT `fk_message_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `tbl_platforms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productID` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product_platforms`
--
ALTER TABLE `tbl_product_platforms`
  ADD CONSTRAINT `fk_platform_id` FOREIGN KEY (`platform_id`) REFERENCES `tbl_platforms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
