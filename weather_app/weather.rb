require "yahoo_weatherman"

puts "To find the weather in your area, please enter your zip code."
location = gets.chomp

  def weather(location)
    client = Weatherman::Client.new
    weather = client.lookup_by_location(location)
  end


forecast = weather(location).forecasts

today = Time.new.strftime("%w").to_i


forecast.each do |f|
  day = f["date"]

  weekday_number = day.strftime("%w").to_i
  weekday_word = day.strftime("%A")

  if weekday_number == today
    puts "Today is going to be #{f["text"].downcase} with a low of #{f["low"]} and a high of #{f["high"]} degrees celcius."
  elsif weekday_number == today + 1
    puts "Tomorrow is going to be #{f["text"].downcase} with a low of #{f["low"]} and a high of #{f["high"]} degrees celcius."
  else
    puts "#{weekday_word} is going to be #{f["text"].downcase} with a low of #{f["low"]} and a high of #{f["high"]} degrees celcius."
  end
end
