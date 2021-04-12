Album.destroy_all
User.destroy_all
Library.destroy_all


50.times do
    Album.create(
        title: Faker::Music.album,
        artist: Faker::Music.band,
        year: rand(1950..2021),
        condition: ["New", "Good", "Fair", "Poor"].sample,
        reissue: [true, false].sample,
        genre: Faker::Music.genre,
        label: Faker::Fantasy::Tolkien.location + " Records",
        producer: Faker::TvShows::TwinPeaks.character,
        single: Faker::Music::RockBand.song 
    )
end 

25.times do
    User.create(
        username: Faker::Internet.username,
        password: "getinthereson", 
        email: Faker::Internet.email
    )
end

25.times do 
    Library.create(
        album_id: rand(1..50),
        user_id: rand(1..25)
    )
end



puts "Data Seeded."