require_relative '../myth_buster/definition'

module Definitions
  class AlcoholMythBuster < MythBuster::Definition
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
end
