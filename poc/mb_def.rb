module MythBuster
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

  class Link
    def initialize(&block)
      @data = {}
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def url(value)
      data[:url] = value
    end

    def text(value)
      data[:text] = value
    end

    private

    attr_reader :data
  end

  class RelatedLinks
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

    def link(&block)
      data[:links] = [] unless data[:links]
      data[:links] << Link.new(&block)
    end

    private

    attr_reader :data
  end

  class Question
    def initialize(&block)
      @data = {}
      instance_eval(&block) if block
    end

    def[](key)
      data.key?(key) ? data[key] : nil
    end

    def statement(value)
      data[:statement] = value
    end

    def answer(value)
      data[:correct_answer] = value
    end

    def explanation(value)
      data[:explanation] = value
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

    def self.define(title, &block)
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

    def more_information(&block)
      data[:related_links] = RelatedLinks.new &block
    end

    def question(&block)
      data[:questions] = [] unless data[:questions]
      data[:questions] << Question.new(&block)
    end

    private

    attr_reader :data
  end
end

class AlcoholMythBusterDefinition < MythBuster::Definition
  define 'Alcohol myth buster' do
    introduction do
      text <<-eos
        There are so many stories around alcohol and drinking that it’s hard
        to know what to believe. Being informed about the facts is the best way
        to make sure that you drink safely.
      eos

      image '/images/mythbuster/alcohol/intro.png'

      start_button_text 'Do you know the facts?'
    end

    more_information do
      text <<-eos
        For further information about alchol-related issues try the following:
      eos

      link {
        text 'Take the alcohol self-assessment test'
        url 'http://www.nhs.uk/Tools/Pages/Alcoholcalculator.aspx' }

      link {
        text 'Find out about the effects of alcohol'
        url 'http://www.nhs.uk/Livewell/alcohol/Pages/Effectsofalcohol.aspx' }
    end

    question do
      statement <<-eos
        Women are affected by alcohol to the same degree as men.
      eos

      answer false

      explanation <<-eos
        Men have a higher averag total body water content than women (62%
        compared to 52% ), meaning men are better able to dilute alcohol than
        women. Other factors have also been reported that can make women more
        sensitive to alcohol, such as enzyme differences. All these factors mean
        that women are more at risk than men from the same level of drinking.
      eos
    end

    question do
      statement <<-eos
        Drinking water can lesson the effects of a hangover.
      eos

      answer true

      explanation <<-eos
        While food and water may ease some of the symptoms, they won't cure a
        hangover. The best way to avoid one is to moderate your drinking and
        have water between alcoholic drinks. Remember that water won't make you
        any less drunk or protect your liver.
      eos
    end
  end
end

class SomeOtherMythBuster < MythBuster::Definition
  define "Some other myth buster" do
    introduction do
      text "Another myth buster about something or other"
    end
  end
end

MythBuster::Definition.definitions.each do |d|
  puts "Myth buster:"
  puts "  Title: #{d[:title]}"
  if d[:introduction]
    puts "  Introduction:"
    puts "    Text:              #{d[:introduction][:text]}"
    puts "    Image:             #{d[:introduction][:image]}"
    puts "    Start button text: #{d[:introduction][:start_button_text]}"
  end
  if d[:related_links]
    puts "  More information:"
    puts "    Text:              #{d[:related_links][:text]}"
    if d[:related_links][:links]
      puts "    Links:"
      d[:related_links][:links].each do |l|
        puts "      Link:"
        puts "        Url: #{l[:url]}"
        puts "        Text: #{l[:text]}"
      end
    end
  end
  if d[:questions]
    puts "  Questions:"
    d[:questions].each do |q|
      puts "    Question:"
      puts "      Statement: #{q[:statement]}"
      puts "      Answer: #{q[:correct_answer]}"
      puts "      Explanation: #{q[:explanation]}"
    end
  end
  puts ''
end
