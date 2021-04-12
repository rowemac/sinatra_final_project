Album.destroy_all
User.destroy_all
Library.destroy_all


50 times do
    Album.create(
        title: Faker::Music.album
        artist: Faker::Music.band
        year: rand(1950..2021)
        condition: ["New", "Good", "Fair", "Poor"].sample
        reissue: [true, false].sample
        genre: Faker::Music.genre
        label: 
        producer: 
        single: Faker::Music::RockBand.song 
    )


end 


puts "Data Seeded."