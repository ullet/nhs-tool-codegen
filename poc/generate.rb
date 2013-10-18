require_relative 'myth_buster/definition'
require_relative 'definitions/alcohol_myth_buster'
require_relative 'definitions/some_other_myth_buster'

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
