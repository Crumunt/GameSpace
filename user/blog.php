<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
    <link rel="stylesheet" href="../css/blog.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>


<div class="header">
    <a href="../index.php">Go back</a>
    <h1>Trending News</h1>
</div>

<div class="flex-container">
    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/tekken.png" alt="placeholder">
            <h3>Tekken 8 Producer Impressed with Waffle House Stage in Roblox</h3>
            <p class="collapsed">Tekken 8's producer is impressed with a recreation of the fighting game within Roblox, complete with the highly requested Waffle House stage.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button><span class="like-count">0</span>

        </div>
    </div>
    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/genshin.png" alt="placeholder">
            <h3>Genshin Impact Reveals 4.6 Release Date with Cinematic Trailer</h3>
            <p class="collapsed">Genshin Impact reveals the release date of its highly anticipated version 4.6 with a cinematic trailer showcasing the new 5-star Arlecchino in action.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button><span class="like-count">0</span>

        </div>
    </div>
    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/rachet.png" alt="placeholder">
            <h3>Ratchet and Clank Giving Away Free Weapon Eight Years After Launch</h3>
            <p class="collapsed">Eight years after the release of Ratchet and Clank, Insomniac Games surprises players by adding a free weapon to claim in the 2016 game.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button><span class="like-count">0</span>

        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/zelda.png" alt="placeholder">
            <h3>Zelda: Tears of the Kingdom Player Builds King Gleeok Out of LEGOs</h3>
            <p class="collapsed">An inventive Zelda fan builds the three-headed King Gleeok boss from The Legend of Zelda: Tears of the Kingdom out of LEGO pieces.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/helldivers.png" alt="placholder">
            <h3>Helldivers 2 CEO Says No to Adding Popular Customization Mechanic</h3>
            <p class="collapsed">Arrowhead Game Studios CEO, Johan Pilestedt, confirms that one much-requested customization feature won't be coming to Helldivers 2.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/pokemon-hacker-five-years-prison.png" alt="placholder">
            <h3>Arrested Pokemon Hacker Could Spend Five Years in Prison</h3>
            <p class="collapsed">A hacker and seller of modified Pokemon save files finds themselves in trouble with the law, and could end up serving five years hard jail time.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/gta.png" alt="placeholder">
            <h3>Rockstar Games is Making the GTA+ Subscription Service More Expensive</h3>
            <p class="collapsed">The controversial subscription service GTA+ is getting its first price increase without any prior announcement from Rockstar itself.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/pokemon.png" alt="placeholder">
            <h3>Pokemon Fan Designs Regional Forms for Bronzor and Bronzong</h3>
            <p class="collapsed">Inspired by ancient cultures, a Pokemon fan creates clever and unique regional forms for Bronzor and its evolution, Bronzong.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/fallout.png" alt="placeholder">
            <h3>Fallout 4 Mod Adds Lucy's Pistol to the Game</h3>
            <p class="collapsed">A new Fallout 4 mod adds Lucy's tranquilizer gun from Amazon's Fallout show, and it comes with plenty of features and customization options.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/fortnite.png" alt="placeholder">
            <h3>Fortnite Player Has Unique Idea for LEGO Backblings</h3>
            <p class="collapsed">A Fortnite player shares a unique concept for LEGO Backblings that could be equipped in alternate game modes to the collaborative ones.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/yugi.png" alt="placeholder">
            <h3>Yu-Gi-Oh Player Quits Tournament Because of the Smell</h3>
            <p class="collapsed">A Yu-Gi-Oh player abruptly walks out of a tournament, and it turns out that it was purely due to the smell being overwhelming.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/final.png" alt="placeholder">
            <h3>Final Fantasy 7 Remake Part 3 May Come Out Sooner Than Expected</h3>
            <p class="collapsed">Though Final Fantasy 7 Remake and Rebirth were released four years apart, fans may not have to wait as long for the third part of the series.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/stellar.png" alt="placeholder">
            <h3>Stellar Blade Players Asked to Go Easy On The Demo After Reaching Major Milestone</h3>
            <p class="collapsed">Ahead of Stellar Blade's release, the developers ask players to 'go easy' on the digital demo after reaching a huge milestone..</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/sims.png" alt="placeholder">
            <h3>The Sims 4 Player Recreates 3 Stardew Valley Bachelorettes in the Game</h3>
            <p class="collapsed">A fan of Stardew Valley and The Sims has recreated three of the farming title's bachelorettes within The Sims 4. The recreations are impressive and are just one way that fans of Stardew Valley show appreciation for the game outside of the scope of it.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>

    <div class="flex-items">
        <div class="trend">
            <img src="../assets/blog_assets/star.png" alt="placeholder">
            <h3>Star Wars Outlaws Fans Aren't Happy About the Game's Special Editions</h3>
            <p class="collapsed">After Ubisoft reveals the premium editions of Star Wars Outlaws and their pre-order bonuses, some fans express their frustrations.</p>
            <span class="read-more" onclick="toggleExpand(this)">Read More...</span>
            <button class="like-button" onclick="likePost(this)"><i class="bx bx-like bx-xsm bx-tada"></i></button>
        </div>
    </div>
</div>
<div class="pagination">
    <button class="prev" onclick="prevPage()">Prev</button>
    <span class="page-number">1</span>
    <button class="next" onclick="nextPage()">Next</button>
</div>


<div><h1>Top Developers</h1></div>

<div class="wrapper">
    <div class="container">
        <input type="radio" name="slide" id="c1" checked>
        <label for="c1" class="card">
            <div class="row">
                <div class="icon">1</div>
                <div class="description">
                    <h4>Nintendo</h4>
                    <p>Nintendo makes some of the most popular games around, as they have done for decades - since the early 1980s. </p>
                </div>
            </div>
        </label>
        <input type="radio" name="slide" id="c2" >
        <label for="c2" class="card">
            <div class="row">
                <div class="icon">2</div>
                <div class="description">
                    <h4>Rockstar Games</h4>
                    <p>Open-world third-person shooters</p>
                </div>
            </div>
        </label>
        <input type="radio" name="slide" id="c3" >
        <label for="c3" class="card">
            <div class="row">
                <div class="icon">3</div>
                <div class="description">
                    <h4>Naughty Dog</h4>
                    <p>Story-driven action-adventure/third-person shooter</p>
                </div>
            </div>
        </label>
        <input type="radio" name="slide" id="c4" >
        <label for="c4" class="card">
            <div class="row">
                <div class="icon">4</div>
                <div class="description">
                    <h4>Blizzard</h4>
                    <p>Blizzard is a pillar of the gaming industry.</p>
                </div>
            </div>
        </label>
    </div>
</div>   

<script>
    function toggleExpand(element) {
        var paragraph = element.previousElementSibling;
        paragraph.classList.toggle('collapsed');
        if (paragraph.classList.contains('collapsed')) {
            element.innerText = 'Read More...';
        } else {
            element.innerText = 'Read Less';
        }
    }
</script> 
<script>
    function likePost(button) {
    button.classList.toggle('liked');
    if (button.classList.contains('liked')) {
        // Increment like count
        var likeCount = button.parentElement.querySelector('.like-count');
        likeCount.innerText = parseInt(likeCount.innerText) + 1;
    } else {
        // Decrement like count
        var likeCount = button.parentElement.querySelector('.like-count');
        likeCount.innerText = parseInt(likeCount.innerText) - 1;
    }
}

</script>
<script>
const blogItems = document.querySelectorAll('.flex-items');
const itemsPerPage = 6;
const totalPages = Math.ceil(blogItems.length / itemsPerPage);

let currentPage = 1;
function showItems() {
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    
    blogItems.forEach((item, index) => {
        if (index >= startIndex && index < endIndex) {
            item.style.display = 'flex';
        } else {
            item.style.display = 'none';
        }
    });
    document.querySelector('.page-number').textContent = currentPage;
}
function prevPage() {
    if (currentPage > 1) {
        currentPage--;
        showItems();
    }
}
function nextPage() {
    if (currentPage < totalPages) {
        currentPage++;
        showItems();
    }
}
showItems();

</script>
</body>
</html>