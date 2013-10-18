require_relative '../myth_buster/definition'

module Definitions
  class SomeOtherMythBuster < MythBuster::Definition
    define "Some other myth buster" do
      introduction do
        text "Another myth buster about something or other"
      end
    end
  end
end
