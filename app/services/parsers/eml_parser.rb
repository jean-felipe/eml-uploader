module Parsers
  class EmlParser
    attr_reader :eml_parsed

    def initialize(file)
      @file = Mail.read(file)
    end

    def process
      html = Nokogiri::HTML(@file.decoded)

      initial_message = html.css('table')[5].children[3].children[1].children[1].children[0].text.strip
      initial_message_part = html.css('table')[5].children[3].children[1].children[1].children[1].text.strip
      intial_message_final = html.css('table')[5].children[3].children[1].children[3].children[0].text.strip

      intereseted = {
        name: html.css('table')[5].children[7].children[1].children[1].children[2].text.strip,
        email: html.css('table')[5].children[7].children[1].children[1].children[6].text.strip,
        phone: html.css('table')[5].children[7].children[1].children[1].children[10].text.strip
      }

      car = {
        name: html.css('table')[5].children[11].children[1].children[1].children[2].text.strip,
        price: html.css('table')[5].children[11].children[1].children[1].children[6].text.strip,
        year: html.css('table')[5].children[11].children[1].children[1].children[10].text.strip,
        link: html.css('table')[5].children[11].children[1].children[1].children[17].attributes['href'].value
      }

      @eml_parsed = {
        message: "#{initial_message} #{initial_message_part} #{intial_message_final}",
        personal_info: intereseted,
        car_info: car
      }
    end
  end
end