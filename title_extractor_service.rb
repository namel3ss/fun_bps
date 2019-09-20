# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'byebug'

# Extracts the title of an HTML page
class TitleExtractorService
  def call(url)
    document = Nokogiri::HTML(URI.parse(url).open)
    title = document.css('html > head > title').first.content
    puts title.strip
  rescue StandardError
    puts "Unable to find a title for #{url}"
  end
end
