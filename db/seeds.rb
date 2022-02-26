artist1 = Artist.create(name: "Nujabes", age: "31")
artist2 = Artist.create(name: "Frank Sinatra", age: "43")
artist3 = Artist.create(name: "Maluma", age: "28")
artist4 = Artist.create(name: "Taylor Swift", age: "28")

song1 = Song.create(title: "Imaginary Folklore", duration: "3:50", rating: 5, progress: 0)
song2 = Song.create(title: "Space dream", duration: "4:50", rating: 5, progress: 0)
song3 = Song.create(title: "Shake it off", duration: "3:50", rating: 5, progress: 0)
song4 = Song.create(title: "Felices los 4", duration: "3:50", rating: 5, progress: 0)

album = Album.create(title: "Album Nujabes", rating: 3)
album.songs << song1
album.artists << artist1

album2 = Album.create(title: "Album Sinatra", rating: 3)
album2.songs << song2
album2.artists << artist2

album3 = Album.create(title: "Album Maluma", rating: 3)
album3.songs << song3
album3.artists << artist3

album4 = Album.create(title: "Album Taylor", rating: 3)
album4.songs << song4
album4.artists << artist4
