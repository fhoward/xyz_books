joel_hartse = Author.create(first_name: "Joel", last_name: "Hartse")
hannah_templer = Author.create(first_name: "Hannah", middle_name: "P", last_name: "Templer")
marguerite_duras = Author.create(first_name: "Marguerite", middle_name: "Z", last_name: "Duras")
kingsley_amis = Author.create(first_name: "Kingsley",  last_name: "Amis")
fannie_flagg = Author.create(first_name: "Fannie", middle_name: "Peters", last_name: "Flagg")
camille_paglia = Author.create(first_name: "Cammille", middle_name: "Byron", last_name: "Paglia")
rainer_steel = Author.create(first_name: "Rainer", middle_name: "Steel", last_name: "Strike")

paste_magazine = Publisher.create(name: "Paste Magazine") 
publisher_weekly = Publisher.create(name: "Publisher Weekly") 
graywolf_press = Publisher.create(name: "Graywolf Press") 
mcsweeney = Publisher.create(name: "McSweeney's") 

# American Elf Joel Hartse, Hannah P. Templer, Marguerite Z. Duras
Book.create(title: "American Elf",publication_year: 2004, isbn_13: "978-1-891830-85-3",
    publisher: paste_magazine, edition: "Book 2", price: 1000,
    image_url: "https://images.pexels.com/photos/235986/pexels-photo-235986.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    authors: [joel_hartse,hannah_templer,marguerite_duras]
)
# Cosmoknights Kingsley Amis
Book.create(title: "Cosmoknights",publication_year: 2019, isbn_13: "978-1-60309-454-2",
    publisher: publisher_weekly, edition: "Book 1", price: 2000,
    image_url: "https://w0.peakpx.com/wallpaper/960/845/HD-wallpaper-nature-landscape-landscape-nature-thumbnail.jpg",
    authors: [kingsley_amis]
)
# Essex County Kingsley Amis 
Book.create(title: "Essex County",publication_year: 1990, isbn_13: "978-1-60309-038-4",
    publisher: graywolf_press, price: 500,
    image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMWMHmz-U9DrJ65pZjktD6PITBbMgMswUTPibRsCLvuAKelektIiXYet5wsyswNMU5K0s&usqp=CAU",
    authors: [kingsley_amis]
)
# Hey, Mister (Vol 1) Hannah P. Templer, Fannie Peters Flagg, Camille Byron Paglia
Book.create(title: "Hey, Mister(Vol 1)",publication_year: 2000, isbn_13: "978-1-891830-02-0",
    publisher: graywolf_press, edition: "After School Special", price: 1200,
    image_url: "https://c0.wallpaperflare.com/preview/220/1022/380/architecture-black-and-white-brick-wall-building.jpg",
    authors: [hannah_templer,fannie_flagg,camille_paglia]
)
# Rainer Steel Rilke 
Book.create(title: "The Underwater Welder",publication_year: 2022, isbn_13: "978-1-60309-398-9",
    publisher: mcsweeney, price: 3000,
    image_url: "https://c1.wallpaperflare.com/preview/170/783/779/grid-grate-prison-vanished-time.jpg",
    authors: [rainer_steel]
)





    
    
    
