# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing existing records..."

Event.destroy_all
UserGenre.destroy_all
Message.destroy_all
Chat.destroy_all
Song.destroy_all
Application.destroy_all
Vacancy.destroy_all
BandMember.destroy_all
Instrument.destroy_all
Post.destroy_all
Band.destroy_all
User.destroy_all
Genre.destroy_all


puts "Creating genres..."
["Rock", "Britpop", "Jazz", "Electronic", "Indie", "Pop", "Techno", "Disco", "Punk", "Blues", "New-age", "Hip-hop", "Funk", "Synth-pop", "K-pop", "Bossanova", "Gabber", "Schlager" ].each do |name|
  Genre.create(name: name)
end

puts "Creating users..."

milo = User.new(
  email: "milo@milo.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Milo",
  last_name: "Vingoe",
  username: "milo",
  bio: "I am a musician and I love to play the guitar. I am looking for a band to join.",
  address: "New Cross, London, UK"
)
milo.photo.attach(io: File.open(Rails.root.join("app/assets/images/milo_vingoe.jpg")), filename: "milo_vingoe.jpg", content_type: "image/jpg")
milo.user_genres.build(genre: Genre.all.sample)

james =User.new(
  email: "james@james.com",
  password: "password",
  password_confirmation: "password",
  first_name: "James",
  last_name: "Kay-Shuttleworth",
  username: "james",
  bio: "I am a drummer and I love to play the drums.",
  address: "Brixton, London, UK"
)
james.photo.attach(io: File.open(Rails.root.join("app/assets/images/james_kay-shuttleworth.jpg")), filename: "james_kay-shuttleworth.jpg", content_type: "image/jpg")
james.user_genres.build(genre: Genre.all.sample)


admir = User.new(
  email: "admir@admir.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Admir",
  last_name: "Kurman",
  username: "admir",
  bio: "I am a bassist and I love to play the bass.",
  address: "Maida Vale, London, UK"
)
admir.photo.attach(io: File.open(Rails.root.join("app/assets/images/admir_kurman.jpg")), filename: "admir_kurman.jpg", content_type: "image/jpg")
admir.user_genres.build(genre: Genre.all.sample)

jane = User.new(
  email: "jane@jane.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jane",
  last_name: "Doe",
  username: "jane",
  bio: "I am a vocalist and I love to sing.",
  address: "Earls Court, London, UK"
)
jane.photo.attach(io: File.open(Rails.root.join("app/assets/images/jane_doe.jpg")), filename: "jane_doe.jpg", content_type: "image/jpg")

john = User.new(
  email: "john@john.com",
  password: "password",
  password_confirmation: "password",
  first_name: "John",
  last_name: "Doe",
  username: "john",
  bio: "I am a keyboardist and I love to play the keyboard.",
  address: "Epsom, London, UK"
)
john.photo.attach(io: File.open(Rails.root.join("app/assets/images/john_doe.jpg")), filename: "john_doe.jpg", content_type: "image/jpg")

tom = User.new(
  email: "tom@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Thomas",
  last_name: "Everleigh",
  username: "tom",
  bio: " Hi, I’m Tom Everleigh, a 19-year-old violinist based in London. I've been playing the violin since I was seven and have trained classically through both private tuition and youth orchestras, performing everything from chamber works to larger ensemble pieces.
  I’m currently looking to join a classical or neo-classical group in London—something that values musicality, collaboration, and a fresh approach to performance. I’m particularly drawn to projects that blend tradition with innovation, but I’m also very happy to be part of a more traditional string ensemble or quartet.
  Though I’m young, I bring commitment, a trained ear, and a genuine love for the violin. I'm keen to connect with like-minded musicians who want to create something beautiful and meaningful.
  Let’s make music together!
  ",
  address: "Camden, London, UK"
)
tom.photo.attach(io: File.open(Rails.root.join("app/assets/images/thomas_everleigh.jpg")), filename: "thomas_everleigh.jpg", content_type: "image/jpg")

leo = User.new(
  email: "leo@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Leo",
  last_name: "Hartley",
  username: "leo",
  bio: "Hey, I’m Leo Hartley, a 22-year-old vocalist based in London with a passion for live performance and storytelling through music. I’ve been singing for as long as I can remember, and over the years I’ve developed a dynamic vocal style influenced by rock, indie, soul, and a touch of blues.
  I’m currently on the lookout for a band to join as a lead singer—ideally a group that's serious about rehearsing, gigging, and writing original material. I’m especially drawn to bands with a strong creative vision, but I’m open to different genres as long as there’s energy and heart behind the sound.
  Whether it's intimate acoustic sets or high-energy stages, I thrive in front of an audience and bring both stage presence and vocal power. If you’re building something fresh and want a frontman who’s driven, versatile, and all in—let’s chat.
  ",
  address: "Hackney, London, UK"
)
leo.photo.attach(io: File.open(Rails.root.join("app/assets/images/leo_hartley.jpg")), filename: "leo_hartley.jpg", content_type: "image/jpg")

aiko = User.new(
  email: "aiko@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Aiko",
  last_name: "Tanaka",
  username: "aiko",
  bio: " Hello, I’m Aiko Tanaka, a 24-year-old pianist originally from Japan, now based in London. I’ve been passionate about the piano since childhood, with a background in classical training alongside a growing love for contemporary and jazz styles.
  I’m eager to join a band or musical project where I can contribute both my technical skills and creative ideas. I’m especially interested in groups that blend different genres or experiment with new sounds, but I’m equally comfortable supporting more traditional ensembles.
  With a strong work ethic and a collaborative spirit, I enjoy bringing music to life both in the studio and on stage. If you’re looking for a dedicated pianist with an open mind and a fresh perspective, I’d love to connect.
  ",
  address: "Shoreditch, London, UK"
)
aiko.photo.attach(io: File.open(Rails.root.join("app/assets/images/aiko_tanaka.jpg")), filename: "aiko_tanaka.jpg", content_type: "image/jpg")

zawadi = User.new(
  email: "zawadi@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Zawadi",
  last_name: "Nyongo'o",
  username: "zawadi",
  bio: "I am Zawadi, born and raised in South London with deep Kenyan roots and a sound that’s as layered as my playlists — grunge guitars, indie angst, and the raw edge of East African rhythm. I have spent the past few years writing, gigging, and fronting small projects, but I am now on the hunt for a serious band to grow with, create with, and blow the roof off venues with.
  I am drawn to gritty alt-rock, moody indie textures, and punk energy with a twist — something that hits hard but stays smart. My voice is husky and powerful, perfect for both razor-sharp anthems and stripped-back, soul-cutting verses.
  ",
  address: "South London, UK"
)
zawadi.photo.attach(io: File.open(Rails.root.join("app/assets/images/zawadi_nyongoo.jpg")), filename: "zawadi_nyongoo.jpg", content_type: "image/jpg")

callum = User.new(
  email: "callum@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Callum",
  last_name: "Fraser",
  username: "callum",
  bio: "Hey, I’m Callum—a drummer based in London with a solid background in live performance and studio work. I’ve been playing for years, and my style pulls from a mix of rock, funk, indie, and a bit of jazz and electronic influence. Whether it’s locking in a groove or adding some creative energy to a track, I’m all about serving the song and elevating the sound.
  Right now, I’m looking to join a band that’s serious about making music—whether that means regular gigs, recording, or just building something tight and exciting together. I’m reliable, easygoing, and committed, with my own gear and transport. Always up for a jam, rehearsal, or last-minute show.
  If you're looking for a drummer who brings both feel and focus, I’d love to hear from you.",
  address: "Clapham, London, UK"
)
callum.photo.attach(io: File.open(Rails.root.join("app/assets/images/callum_fraser.jpg")), filename: "callum_fraser.jpg", content_type: "image/jpg")

kai = User.new(
  email: "kai@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Kai",
  last_name: "Lennox",
  username: "kai",
  bio: "I’m Kai Lennox, synth player and sound designer for StarLynx, an electronic band based in Birmingham. We fuse ambient textures, hypnotic rhythms, and immersive synthscapes to create a sound that’s both cinematic and deeply electronic. My setup blends analog gear with digital tools to shape atmospheres that hit hard live and translate just as well in headphones.
  Influenced by artists like Jon Hopkins, Moderat, and Nine Inch Nails, I’m all about layering melody, noise, and pulse to build something that resonates. With StarLynx, every track is designed to take you somewhere—whether it’s dark and driving or spaced-out and introspective.
  We’re all about pushing boundaries, playing live, and connecting through sound. Keep an ear out—StarLynx is just getting started.",
  address: "Birmingham, UK"
)
kai.photo.attach(io: File.open(Rails.root.join("app/assets/images/kai_lennox.jpg")), filename: "kai_lennox.jpg", content_type: "image/jpg")

jiro = User.new(
  email: "jiro@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jiro",
  last_name: "Sato",
  username: "jiro",
  bio: "I’m Jiro Sato, the other half of StarLynx, an electronic duo based in Birmingham. I handle the beats, production, and live performance elements that bring our sound to life. My background is in electronic music production, with a focus on creating dynamic, emotive tracks that blend organic and synthetic elements.
  Influenced by artists like Bonobo, Four Tet, and ODESZA, I love crafting intricate rhythms and textures that draw listeners in. Whether it’s building a track from the ground up or remixing something to give it a fresh spin, I’m all about innovation and pushing the limits of what electronic music can be.
  With StarLynx, we’re not just making music—we’re creating experiences that resonate on and off the stage. Keep an eye out for our upcoming releases and live shows—we’re just getting started.",
  address: "Birmingham, UK"
)
jiro.photo.attach(io: File.open(Rails.root.join("app/assets/images/jiro_sato.jpg")), filename: "jiro_sato.jpg", content_type: "image/jpg")

emily = User.new(
  email: "emily@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Emily",
  last_name: "Clarke",
  username: "emily",
  bio: "I’m Emily Clarke, a 21-year-old singer-songwriter based in Brighton. I’ve been writing and performing my own music for the past five years, blending indie-pop melodies with heartfelt lyrics and a touch of folk influence. My sound is all about catchy hooks, emotional depth, and a bit of quirkiness.",
  address: "Brighton, UK"
)
emily.photo.attach(io: File.open(Rails.root.join("app/assets/images/emily_clarke.jpg")), filename: "emily_clarke.jpg", content_type: "image/jpg")

sophie = User.new(
  email: "sophie@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Sophie",
  last_name: "Bennett",
  username: "sophie",
  bio: "I’m Sophie Bennett, a 20-year-old bassist and vocalist from Brighton. I’ve been playing bass for over six years and have a strong background in both rock and pop music. My style is versatile, allowing me to adapt to different genres while bringing my own flair to the sound.",
  address: "Brighton, UK"
)
sophie.photo.attach(io: File.open(Rails.root.join("app/assets/images/sophie_bennett.jpg")), filename: "sophie_bennett.jpg", content_type: "image/jpg")

chloe = User.new(
  email: "chloe@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Chloe",
  last_name: "Davies",
  username: "chloe",
  bio: "I’m Chloe Davies, a 22-year-old drummer and percussionist from Brighton. I’ve been playing drums for over eight years and have experience in various genres, including rock, pop, and jazz. My drumming style is energetic and dynamic, perfect for live performances.",
  address: "Brighton, UK"
)
chloe.photo.attach(io: File.open(Rails.root.join("app/assets/images/chloe_davies.jpg")), filename: "chloe_davies.jpg", content_type: "image/jpg")

kenji = User.new(
  email: "kenji@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Kenji",
  last_name: "Takahashi",
  username: "kenji",
  bio: "I’m Kenji Takahashi, a 21-year-old cellist and composer from Tokyo, now based in London. I’ve been playing the cello for over ten years and have a strong background in classical music, but I’m also passionate about exploring contemporary and experimental sounds.",
  address: "London, UK"
)
kenji.photo.attach(io: File.open(Rails.root.join("app/assets/images/kenji_takahashi.jpg")), filename: "kenji_takahashi.jpg", content_type: "image/jpg")

minsoo = User.new(
  email: "minsoo@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Minsoo",
  last_name: "Kim",
  username: "minsoo",
  bio: "I’m Minsoo Kim, a 23-year-old pianist and composer from Seoul, now based in London. I’ve been playing the piano for over 12 years and have a strong background in classical music, but I’m also passionate about jazz and contemporary styles.",
  address: "London, UK"
)
minsoo.photo.attach(io: File.open(Rails.root.join("app/assets/images/minsoo_kim.jpg")), filename: "minsoo_kim.jpg", content_type: "image/jpg")

wei = User.new(
  email: "wei@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Wei",
  last_name: "Zhang",
  username: "wei",
  bio: "I’m Wei Zhang, a 20-year-old violinist and composer from Beijing, now based in London. I’ve been playing the violin for over 15 years and have a strong background in classical music, but I’m also passionate about exploring contemporary and experimental sounds.",
  address: "London, UK"
)
wei.photo.attach(io: File.open(Rails.root.join("app/assets/images/wei_zhang.jpg")), filename: "wei_zhang.jpg", content_type: "image/jpg")

arun = User.new(
  email: "arun@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Arun",
  last_name: "Chaiyaporn",
  username: "arun",
  bio: "I’m Arun Chaiyaporn, a 22-year-old violaist and composer from Bangkok, now based in London. I’ve been playing the viola for over 10 years and have a strong background in classical music, but I’m also passionate about exploring contemporary and experimental sounds.",
  address: "London, UK"
)
arun.photo.attach(io: File.open(Rails.root.join("app/assets/images/arun_chaiyaporn.jpg")), filename: "arun_chaiyaporn.jpg", content_type: "image/jpg")

daichi = User.new(
  email: "daichi@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Daichi",
  last_name: "Saito",
  username: "daichi",
  bio: "I’m Daichi Saito, a 21-year-old violinist and composer from Tokyo, now based in London. I’ve been playing the violin for over 14 years and have a strong background in classical music, but I’m also passionate about exploring contemporary and experimental sounds.",
  address: "London, UK"
)
daichi.photo.attach(io: File.open(Rails.root.join("app/assets/images/daichi_saito.jpg")), filename: "daichi_saito.jpg", content_type: "image/jpg")

jack = User.new(
  email: "jack@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jack",
  last_name: "Morrigan",
  username: "jack",
  bio: "I’m Jack Morrigan, a 25-year-old guitarist from Shoreditch, London. I’ve been playing guitar for over 10 years and have a strong background in rock, blues, and indie music. My style is versatile, allowing me to adapt to different genres while bringing my own flair to the sound.",
  address: "Shoreditch, London, UK"
)
jack.photo.attach(io: File.open(Rails.root.join("app/assets/images/jack_morrigan.jpg")), filename: "jack_morrigan.jpg", content_type: "image/jpg")

theo = User.new(
  email: "theo@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Theo",
  last_name: "Marsh",
  username: "theo",
  bio: "I’m Theo Marsh, a 24-year-old drummer from Camden, London. I’ve been playing drums for over 12 years and have a strong background in rock, funk, and jazz music. My drumming style is energetic and dynamic, perfect for live performances.",
  address: "Camden, London, UK"
)
theo.photo.attach(io: File.open(Rails.root.join("app/assets/images/theo_marsh.jpg")), filename: "theo_marsh.jpg", content_type: "image/jpg")

eliza = User.new(
  email: "eliza@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Eliza",
  last_name: "Quinn",
  username: "eliza",
  bio: "I’m Eliza Quinn, a 23-year-old bassist and backup vocalist from Camden, London. I’ve been playing bass for over 8 years and have a strong background in rock, funk, and jazz music. My style is versatile, allowing me to adapt to different genres while bringing my own flair to the sound.",
  address: "Camden, London, UK"
)
eliza.photo.attach(io: File.open(Rails.root.join("app/assets/images/eliza_quinn.jpg")), filename: "eliza_quinn.jpg", content_type: "image/jpg")

dylan = User.new(
  email: "dylan@hotmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Dylan",
  last_name: "Cray",
  username: "dylan",
  bio: "I’m Dylan Cray, a 29-year-old keyboardist and synth player from Camden, London. I’ve been playing keyboards for over 15 years and have a strong background in rock, funk, and jazz music. My style is versatile, allowing me to adapt to different genres while bringing my own flair to the sound.",
  address: "Camden, London, UK"
)
dylan.photo.attach(io: File.open(Rails.root.join("app/assets/images/dylan_cray.jpg")), filename: "dylan_cray.jpg", content_type: "image/jpg")

milo.save!
james.save!
admir.save!
jane.save!
john.save!
tom.save!
leo.save!
aiko.save!
zawadi.save!
callum.save!
kai.save!
jiro.save!
emily.save!
sophie.save!
chloe.save!
kenji.save!
minsoo.save!
wei.save!
arun.save!
daichi.save!
jack.save!
theo.save!
eliza.save!
dylan.save!

puts "Created #{User.count} users."

puts "Creating bands..."

rockers = Band.new(
  name: "The Rockers",
  address: "New Cross, London, UK",
  bio: "We are a rock band from London. We love to play rock music and we are looking for new members.",
  genre: "Rock",
  user_id: User.first.id
)
rockers.photo.attach(io: File.open(Rails.root.join("app/assets/images/three-men-radiant-flawless-skin.jpeg")), filename: "three-men-radiant-flawless-skin.jpeg", content_type: "image/jpeg")

jazzers = Band.new(
  name: "The Jazzers",
  address: "Brixton, London, UK",
  bio: "We are a jazz band from London. We love to play jazz music and we are looking for new members.",
  genre: "Jazz",
  user_id: User.last.id
)
jazzers.photo.attach(io: File.open(Rails.root.join("app/assets/images/jazz-band.jpg")), filename: "jazz-band.jpg", content_type: "image/jpeg")

starlynx = Band.new(
  name: "StarLynx",
  address: "Croydon, UK",
  bio: " We are StarLynx — Kai Lennox, 24, and Jiro Sato, 23 — an English electronic duo based in Birmingham, weaving futuristic soundscapes that combine shimmering synths with dynamic, emotive beats. Driven by a passion for innovative production and boundary-breaking creativity, we create music that’s fresh, bold, and perfect for both intimate venues and festival main stages.
We are on the lookout for a female lead vocalist with a unique voice and captivating presence to bring our sound to life. If you’re creative, ambitious, and ready to be part of something cutting-edge, let’s connect and make the future sound unforgettable.
",
  genre: "Electronic",
  user_id: User.find_by(first_name: "Kai").id
)
starlynx.photo.attach(io: File.open(Rails.root.join("app/assets/images/StarLynx.jpg")), filename: "StarLynx.jpg", content_type: "image/jpeg")

moonlit_roses = Band.new(
  name: "The Moonlit Roses",
  address: "Chelmsford, UK",
  bio: "We are The Moonlit Roses — Emily, Sophie, and Chloe — a Brighton-based trio blending catchy pop hooks with indie vibes and heartfelt lyrics. Together, we create music that is fresh, vibrant, and full of personality, perfect for both intimate gigs and lively festival crowds.
    Right now, we are searching for a talented fourth member to complete our lineup. Whether you are a vocalist, instrumentalist, or multi-instrumentalist with a passion for pop and indie sounds, we would love to hear from you. If you are creative, dedicated, and ready to join a fun, ambitious band making waves, get in touch — let’s make music and memories together.",
  genre: "Pop/Indie",
  user_id: User.find_by(first_name: "Emily").id
)
moonlit_roses.photo.attach(io: File.open(Rails.root.join("app/assets/images/the_moonlit_roses.jpg")), filename: "the_moonlit_roses.jpg", content_type: "image/jpeg")

dolce_capella = Band.new(
  name: "Dolce Capella",
  address: "Guildford, London, UK",
  bio: "We are Dolce Capella — five classically trained musicians from across Asia, now based in London and united by a shared love of harmony, tradition, and innovation. Aged between 20 and 22, we blend rich a cappella vocals with classical instruments, creating heartfelt performances that move between timeless elegance and fresh interpretation.
    With roots in Japan, Korea, China, and Thailand, we bring a multicultural depth to our sound, performing across the UK and Europe at festivals, concert halls, and cultural events.
    We are currently looking for one more male musician or vocalist to join our group — someone with a classical background, strong musicality, and a passion for performance. If you are collaborative, creative, and ready to travel and perform with a committed ensemble, we would love to hear from you. Join us — and help shape the next chapter of Dolce Capella.
    ",
  genre: "Classical/ A Cappella",
  user_id: User.find_by(first_name: "Kenji").id
)
dolce_capella.photo.attach(io: File.open(Rails.root.join("app/assets/images/dolce_capella.jpg")), filename: "dolce_capella.jpg", content_type: "image/jpeg")

fifth_elephant = Band.new(
  name: "Fifth Elephant",
  address: "Camden, London, UK",
  bio: "We are The Fifth Elephant — a gritty four-piece rock band based in Camden, forged in the heart of London’s underground scene and raised on power chords, distortion, and late-night gigs. Our sound blends raw alt-rock energy with punk spirit and grunge edge, channeling chaos into catharsis at every show.
    We have been tearing through rock bars and festivals across the UK, building a loyal following and sharpening our sound in the studio we call home. The name, inspired by \"The Fifth Elephant\" - the title of the 24th novel in Terry Pratchett’s Discworld series. The name comes from an old Discworld myth.
    We're currently looking for a female lead vocalist — someone with a killer voice, presence, and fire to match our sound. If you can command a crowd, write with soul, and love the thrill of the stage (and a bit of Discworld magic wouldn’t hurt), let’s make some noise together.
    Drop us a message. Let’s melt some amps.",
  genre: "Alt Rock/Punk/Grunge",
  user_id: User.find_by(first_name: "Jack").id
)
fifth_elephant.photo.attach(io: File.open(Rails.root.join("app/assets/images/the_fifth_elephant.jpg")), filename: "the_fifth_elephant.jpg", content_type: "image/jpeg")

rockers.save
jazzers.save
starlynx.save
moonlit_roses.save
dolce_capella.save
fifth_elephant.save

puts "Created #{Band.count} bands."

puts "Creating instruments..."

Instrument.create!(
  name: "Guitar",
  experience: 3,
  description: "I can play rock, jazz, and blues.",
  user_id: User.find_by(first_name: "Milo").id
)
Instrument.create!(
  name: "Drums",
  experience: 4,
  description: "I can play rock, jazz, and funk.",
  user_id: User.find_by(first_name: "James").id
)
Instrument.create!(
  name: "Bass",
  experience: 5,
  description: "I can play rock, jazz, and funk.",
  user_id: User.find_by(first_name: "Admir").id
)
Instrument.create!(
  name: "Vocals",
  experience: 2,
  description: "I can sing rock, pop, and jazz.",
  user_id: User.find_by(first_name: "Jane").id
)
Instrument.create!(
  name: "Keyboard",
  experience: 4,
  description: "I can play rock, jazz, and classical.",
  user_id: User.find_by(first_name: "John").id
)
Instrument.create!(
  name: "Violin",
  experience: 12,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Thomas").id
)
Instrument.create!(
  name: "Vocals",
  experience: 10,
  description: "I can sing rock, indie, and soul.",
  user_id: User.find_by(first_name: "Leo").id
)
Instrument.create!(
  name: "Piano",
  experience: 15,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Aiko").id
)
Instrument.create!(
  name: "Vocals",
  experience: 5,
  description: "I can sing rock, indie, and soul.",
  user_id: User.find_by(first_name: "Zawadi").id
)
Instrument.create!(
  name: "Drums",
  experience: 8,
  description: "I can play rock, funk, and jazz.",
  user_id: User.find_by(first_name: "Callum").id
)
Instrument.create!(
  name: "Synths",
  experience: 6,
  description: "I can create electronic music and soundscapes.",
  user_id: User.find_by(first_name: "Kai").id
)
Instrument.create!(
  name: "Synths",
  experience: 6,
  description: "I can create electronic music and soundscapes.",
  user_id: User.find_by(first_name: "Jiro").id
)
Instrument.create!(
  name: "Vocals",
  experience: 3,
  description: "I can sing pop, indie, and folk.",
  user_id: User.find_by(first_name: "Emily").id
)
Instrument.create!(
  name: "Bass",
  experience: 4,
  description: "I can play rock, pop, and funk.",
  user_id: User.find_by(first_name: "Sophie").id
)
Instrument.create!(
  name: "Drums",
  experience: 5,
  description: "I can play rock, pop, and jazz.",
  user_id: User.find_by(first_name: "Chloe").id
)
Instrument.create!(
  name: "Cello",
  experience: 10,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Kenji").id
)
Instrument.create!(
  name: "Piano",
  experience: 12,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Minsoo").id
)
Instrument.create!(
  name: "Violin",
  experience: 15,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Wei").id
)
Instrument.create!(
  name: "Viola",
  experience: 10,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Arun").id
)
Instrument.create!(
  name: "Violin",
  experience: 14,
  description: "I can play classical, jazz, and contemporary.",
  user_id: User.find_by(first_name: "Daichi").id
)
Instrument.create!(
  name: "Guitar",
  experience: 10,
  description: "I can play rock, blues, and indie.",
  user_id: User.find_by(first_name: "Jack").id
)
Instrument.create!(
  name: "Drums",
  experience: 12,
  description: "I can play rock, funk, and jazz.",
  user_id: User.find_by(first_name: "Theo").id
)
Instrument.create!(
  name: "Bass",
  experience: 8,
  description: "I can play rock, funk, and jazz.",
  user_id: User.find_by(first_name: "Eliza").id
)
Instrument.create!(
  name: "Keyboard",
  experience: 10,
  description: "I can play rock, funk, and jazz.",
  user_id: User.find_by(first_name: "Dylan").id
)

puts "Created #{Instrument.count} instruments."

puts "Creating band members..."

BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "Milo").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Milo").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "James").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "James").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "Admir").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Admir").id).id
)
BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "The Jazzers").id,
  user_id: User.find_by(first_name: "John").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "John").id).id
)
BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "StarLynx").id,
  user_id: User.find_by(first_name: "Kai").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Kai").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "StarLynx").id,
  user_id: User.find_by(first_name: "Jiro").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Jiro").id).id
)
BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "The Moonlit Roses").id,
  user_id: User.find_by(first_name: "Emily").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Emily").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Moonlit Roses").id,
  user_id: User.find_by(first_name: "Sophie").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Sophie").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Moonlit Roses").id,
  user_id: User.find_by(first_name: "Chloe").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Chloe").id).id
)
BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "Dolce Capella").id,
  user_id: User.find_by(first_name: "Kenji").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Kenji").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Dolce Capella").id,
  user_id: User.find_by(first_name: "Minsoo").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Minsoo").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Dolce Capella").id,
  user_id: User.find_by(first_name: "Wei").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Wei").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Dolce Capella").id,
  user_id: User.find_by(first_name: "Arun").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Arun").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Dolce Capella").id,
  user_id: User.find_by(first_name: "Daichi").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Daichi").id).id
)
BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "Fifth Elephant").id,
  user_id: User.find_by(first_name: "Jack").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Jack").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Fifth Elephant").id,
  user_id: User.find_by(first_name: "Theo").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Theo").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Fifth Elephant").id,
  user_id: User.find_by(first_name: "Eliza").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Eliza").id).id
)
BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "Fifth Elephant").id,
  user_id: User.find_by(first_name: "Dylan").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Dylan").id).id
)

puts "Created #{BandMember.count} band members."

puts "Creating vacancies..."

Vacancy.create!(
  instrument: "Singer",
  description: "We are looking for a vocalist to join our band. You must be able to sing rock music and have your own microphone.",
  filled: false,
  band_id: Band.find_by(name: "The Rockers").id,
  years_of_experience: 2,
  availability: "Weekends",
  confidence: "Comfortable performing in front of an audience"
)
Vacancy.create!(
  instrument: "Vocalist",
  description: "We are looking for a vocalist to join our band. You must be able to sing jazz music and have your own microphone.",
  filled: false,
  band_id: Band.find_by(name: "StarLynx").id,
  years_of_experience: 3,
  availability: "Weekdays",
  confidence: "Comfortable performing in front of an audience"
)
Vacancy.create!(
  instrument: "Vocalist/Guitarist/Keyboard player",
  description: "Right now, we are searching for a talented fourth member to complete our lineup. Whether you are a vocalist, instrumentalist, or multi-instrumentalist with a passion for pop and indie sounds, we would love to hear from you. If you are creative, dedicated, and ready to join a fun, ambitious band making waves, get in touch — let’s make music and memories together.",
  filled: false,
  band_id: Band.find_by(name: "The Moonlit Roses").id,
  years_of_experience: 2,
  availability: "Weekends",
  confidence: "Comfortable performing in front of an audience"
)
Vacancy.create!(
  instrument: "Double Bass",
  description: "We are currently looking for a double bassist to join our group — someone with a classical background, strong musicality, and a passion for performance. If you are collaborative, creative, and ready to travel and perform with a committed ensemble, we would love to hear from you. Join us — and help shape the next chapter of Dolce Capella.",
  filled: false,
  band_id: Band.find_by(name: "Dolce Capella").id,
  years_of_experience: 3,
  availability: "Weekdays",
  confidence: "Comfortable performing in front of an audience"
)
Vacancy.create!(
  instrument: "Lead Vocalist",
  description: "We're currently looking for a female lead vocalist — someone with a killer voice, presence, and fire to match our sound. If you can command a crowd, write with soul, and love the thrill of the stage (and a bit of Discworld magic wouldn’t hurt), let’s make some noise together.
    Drop us a message. Let’s melt some amps.",
  filled: false,
  band_id: Band.find_by(name: "Fifth Elephant").id,
  years_of_experience: 4,
  availability: "Weekends",
  confidence: "Comfortable performing in front of an audience"
)

puts "Created #{Vacancy.count} vacancies."

puts "Creating applications..."

Application.create!(
  pitch: "I am a guitarist and I love to play rock music. I have my own equipment and I am available to rehearse.",
  user_id: User.find_by(first_name: "Jane").id,
  vacancy_id: Vacancy.first.id
)

puts "Created #{Application.count} applications."

puts "Creating posts..."

the_rockers_post = Post.create!(
  title: "Just started a new band!!!",
  content: "I cant wait to rock n roll!!!",
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "James").id
)

the_rockers_post.photo.attach(io: File.open(Rails.root.join("app/assets/images/three-men-radiant-flawless-skin.jpeg")), filename: "three-men-radiant-flawless-skin.jpeg", content_type: "image/jpeg")
the_rockers_post.save!

fifth_elephant_post = Post.create!(
  title: "Looking for a drummer!",
  content: "Join the band and help us create some amazing music! We are looking for a drummer who can play rock, jazz, and funk. If you are interested, please contact us.",
  band_id: Band.find_by(name: fifth_elephant.name).id,
  user_id: User.find_by(first_name: "Jack").id
)

the_jazzers = Post.create!(
  title: "Just played in Buckingham Palace",
  content: "The king loved it :)",
  band_id: Band.find_by(name: "The Jazzers").id,
  user_id: User.find_by(first_name: "John").id
)

the_jazzers.photo.attach(io: File.open(Rails.root.join("app/assets/images/the_jazzers_post.jpg")), filename: "the_jazzers_post.jpg", content_type: "image/jpg")
the_jazzers.save!

fifth_elephant_post.photo.attach(io: File.open(Rails.root.join("app/assets/images/drummer.jpg")), filename: "drummer.jpg", content_type: "image/jpg")
fifth_elephant_post.save!

zawadi_post = Post.create!(
  title: "Look at me go!",
  content: "I love playing live",
  user_id: User.find_by(first_name: "Zawadi").id
)

zawadi_post.photo.attach(io: File.open(Rails.root.join("app/assets/images/zawadi.jpg")), filename: "zawadi.jpg", content_type: "image/jpg")


puts "Created #{Post.count} posts."
puts "Creating songs..."

the_rockers_song = Song.new(
  title: "Dance Yrself Clean",
  band_id: Band.find_by(name: "The Rockers").id
)
the_rockers_song.song.attach(io: File.open(Rails.root.join("app/assets/songs/dance_yrself_clean.mp3")), filename: "dance_yrself_clean.mp3", content_type: "song/mp3")

fifth_elephant = Song.new(
  title: "Smells like teen spirit",
  band_id: Band.find_by(name: "Fifth Elephant").id
)

fifth_elephant.song.attach(io: File.open(Rails.root.join("app/assets/songs/smells_like_teen_spirit.mp3")), filename: "smells_like_teen_spirit.mp3", content_type: "song/mp3")

the_rockers_song2 = Song.new(
  title: "Sparks",
  band_id: Band.find_by(name: "The Rockers").id
)

the_rockers_song2.song.attach(io: File.open(Rails.root.join("app/assets/songs/sparks.mp3")), filename: "sparks.mp3", content_type: "song/mp3")

the_rockers_song2.save
fifth_elephant.save
the_rockers_song.save

puts "Created #{Song.count} songs."

puts "Creating chats..."
chat1 = Chat.new(
  band_id: Band.find_by(name: "Fifth Elephant").id,
  user1_id: User.find_by(first_name: "Milo").id
)

chat1.save

puts "Created #{Chat.count} chats."

puts "Creating messages..."

message1 = Message.new(
  message_content: "Hey, I just wanted to say that I really love your music! I think you guys are amazing.",
  user_id: User.find_by(first_name: "Milo").id,
  chat_id: chat1.id
)
message1.save

puts "Created #{Message.count} messages."

puts "Creating events..."

event1 = Event.new(
  title: "Rock Night at The O2",
  content: "Join us for an unforgettable night of rock music at The O2! Featuring live performances from The Rockers and special guests. Don't miss out!",
  start_time: DateTime.now + 1.month,
  end_time: DateTime.now + 1.month + 3.hours,
  address: "The O2, London",
  band_id: Band.find_by(name: "The Rockers").id,
  user1_id: User.find_by(first_name: "Milo").id,
  status: 1
)
event1.save!

event2 = Event.new(
  title: "Practice Session with The Rockers",
  content: "We are having a practice session at our studio in New Cross. All band members are required to attend.",
  start_time: DateTime.now + 1.week,
  end_time: DateTime.now + 1.week + 2.hours,
  address: "New Cross, London",
  band_id: Band.find_by(name: "The Rockers").id,
  user1_id: User.find_by(first_name: "James").id,
  status: 2
)
event2.save!

event3 = Event.new(
  title: "Summer Tour",
  content: "We are going on a summer tour across the UK! Join us for an amazing journey filled with music, fun, and unforgettable memories.",
  start_time: DateTime.now + 2.months,
  end_time: DateTime.now + 2.months + 1.week,
  address: "Various locations across the UK",
  band_id: Band.find_by(name: "The Rockers").id,
  user1_id: User.find_by(first_name: "Milo").id,
  status: 3
)
event3.save!

event4 = Event.new(
  title: "Meeting with Zawadi",
  content: "Meeting with Zawadi to see if she would be a good addition to the band.",
  start_time: DateTime.now + 1.week,
  end_time: DateTime.now + 1.week + 1.hour,
  address: "Camden, London",
  band_id: Band.find_by(name: "The Rockers").id,
  user1_id: User.find_by(first_name: "Milo").id,
  status: 0
)
event4.save!

puts "Created #{Event.count} events."

# Uncomment the following lines to create a gig post
# puts "Creating gig post..."

# gig_post = Post.create!(
#   title: "Gig at The O2",
#   content: "We are playing at The O2 next month and we would love to see you there!",
#   user_id: User.find_by(first_name: "James").id,
#   band_id: Band.find_by(name: "The Jazzers").id
# )
# gig_post.photo.attach(io: File.open(Rails.root.join("app/assets/images/gig.jpg")), filename: "gig.jpg", content_type: "image/jpeg")

puts "Seeding completed successfully!"
