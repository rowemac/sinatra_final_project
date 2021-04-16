Album.destroy_all
User.destroy_all
Library.destroy_all


300.times do
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

15.times do
    User.create(
        username: Faker::Internet.username,
        password: ENV['SECRET_PASSWORD'],
        email: Faker::Internet.email
    )
end

300.times do 
    Library.create(
        album: Album.all.sample,
        user: User.all.sample
    )
end



puts "Data Seeded."