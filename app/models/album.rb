require "open-uri"

class Album < ApplicationRecord
  belongs_to :user
  belongs_to :band
  has_one_attached :photo

  after_save if: -> { saved_change_to_name? } do
    set_photo
  end

  private

  def set_photo
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
        model: "dall-e-3",
        prompt: "Create my band a album cover using the following prompt: #{Album.last.prompt}, this is the name of the album: #{Album.last.name}"

    })

    url = response["data"][0]["url"]
    file = URI.parse(url).open

    photo.purge if photo.attached?
    photo.attach(io: file, filename: "ai_generated_image.jpg", content_type: "image/png")
    return photo
  end


end
