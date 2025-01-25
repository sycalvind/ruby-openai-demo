# Write your solution here!
require "openai"
require "dotenv/load"

request = ""
message_list = []
while request != "bye"
  if request != ""
    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
    message_list.append({"role" => "user", "content" => request})
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )
    response = api_response["choices"][0]["message"]["content"]
    puts response
    message_list.append({"role" => "assistant", "content" => response})
    # i did not add the response to message list at first.
  end
  puts "-"*50
  puts "Hello! How can I help you today?"
  puts "-"*50
  request = gets.chomp
end

puts "Goodbye! Have a great day!"
