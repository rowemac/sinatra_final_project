50 times do
    Album.create(
        title: Faker::Music.album
        artist: Faker::Music.band
        year: rand(1921..2021)
        condition: ["New", "Good", "Fair", "Poor"].sample
        reissue: [true, false].sample
        tracklist:
        label: 
        producer: 
    )


end 


puts "Data Seeded."