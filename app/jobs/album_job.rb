class AlbumJob < ApplicationJob
  queue_as :default

  def perform(album)
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
        model: "dall-e-3",
        prompt: "Create my band a album cover using the following prompt: #{album.prompt}, this is the name of the album: #{album.name}"
    })

    url = response["data"][0]["url"]
    file = URI.parse(url).open

    album.photo.purge if album.photo.attached?
    album.photo.attach(io: file, filename: "ai_generated_image.jpg", content_type: "image/png")
    puts "SAVING PHOTO"

    album.save
    # flash[:notice] = "You have successfully logged out."
    # flash[:notice]
  end
end
