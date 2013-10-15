module Quiz
  class Introduction
    def initialize(&block)
      @data = {}
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def text(value)
      data[:text] = value
    end

    def image(value)
      data[:image] = value
    end

    def start_button_text(value)
      data[:start_button_text] = value
    end

    private

    attr_reader :data
  end

  class Definition
    class << self
      attr_reader :definitions

      def add_definition(d)
        (Definition.definitions ||= []) << d
      end

      protected

      attr_writer :definitions
    end

    attr_reader :title, :intro

    def self.quiz(title, &block)
      d = Definition.new title, &block
      add_definition d
    end

    def initialize(title, &block)
      @data = {}
      data[:title] = title
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def introduction(&block)
      data[:introduction] = Introduction.new &block
    end

    private

    attr_reader :data
  end
end

class AlcoholMythBusterDefinition < Quiz::Definition
  quiz 'Alcohol myth buster' do
    introduction do
      text <<-eos
        There are so many stories around alcohol and drinking that it’s hard
        to know what to believe. Being informed about the facts is the best way
        to make sure that you drink safely.
      eos

      image '/images/mythbuster/alcohol/intro.png'

      start_button_text 'Do you know the facts?'
    end

#     more_information do
#       text << EOT
# For further information about alchol-related issues try the following:
# EOT
#       link {
#         text: 'Take the alcohol self-assessment test',
#         url: 'http://www.nhs.uk/Tools/Pages/Alcoholcalculator.aspx' }
#       link {
#         text: 'Find out about the effects of alcohol',
#         url: 'http://www.nhs.uk/Livewell/alcohol/Pages/Effectsofalcohol.aspx' }
#     end

#     question do
#       statement << EOT
# Women are affected by alcohol to the same degree as men.
# EOT
#       answer false
#       explanation << EOT
# Men have a higher average total body water content than women (62%
# compared to 52% ), meaning men are better able to dilute alcohol than
# women. Other factors have also been reported that can make women more
# sensitive to alcohol, such as enzyme differences. All these factors mean
# that women are more at risk than men from the same level of drinking.
# EOT
#     end

#     question do
#       statement << EOT
# Drinking water can lesson the effects of a hangover.
# EOT
#       answer true
#       explanation << EOT
# While food and water may ease some of the symptoms, they won't cure a
# hangover. The best way to avoid one is to moderate your drinking and
# have water between alcoholic drinks. Remember that water won't make you
# any less drunk or protect your liver.
# EOT
#     end
  end
end

Quiz::Definition.definitions.each do |d|
  puts "Title: #{d[:title]}"
  puts "Introduction:"
  puts "  Text:              #{d[:introduction][:text]}"
  puts "  Image:             #{d[:introduction][:image]}"
  puts "  Start button text: #{d[:introduction][:start_button_text]}"
end
