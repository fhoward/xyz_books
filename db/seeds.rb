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
american_elf = Book.create(title: "American Elf",publication_year: 2004, isbn_13: "978-1-891830-85-3", publisher: paste_magazine, edition: "Book 2", price: 1000, authors: [joel_hartse,hannah_templer,marguerite_duras])
# Cosmoknights Kingsley Amis
cosmo_knights = Book.create(title: "Cosmoknights",publication_year: 2019, isbn_13: "978-1-60309-454-2", publisher: publisher_weekly, edition: "Book 1", price: 2000, authors: [kingsley_amis])
# Essex County Kingsley Amis 
essex_county = Book.create(title: "Essex County",publication_year: 1990, isbn_13: "978-1-60309-038-4", publisher: graywolf_press, price: 500, authors: [kingsley_amis])
# Hey, Mister (Vol 1) Hannah P. Templer, Fannie Peters Flagg, Camille Byron Paglia
hey_mister = Book.create(title: "Hey, Mister(Vol 1)",publication_year: 2000, isbn_13: "978-1-891830-02-0", publisher: graywolf_press, edition: "After School Special", price: 1200, authors: [hannah_templer,fannie_flagg,camille_paglia])
# Rainer Steel Rilke 
the_underwater_welder = Book.create(title: "The Underwater Welder",publication_year: 2022, isbn_13: "978-1-60309-398-9", publisher: mcsweeney, price: 3000, authors: [rainer_steel])





    
    
    
