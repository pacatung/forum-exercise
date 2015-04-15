namespace :dev do

  task :fake => :environment do
    puts "Fake data..."

    User.delete_all
    Map.delete_all
    Comment.delete_all

    users = []
    emails = ["ihower@gmail.com", "frozenfung@gmail.com", "vneverz@gmail.com", "tim.du@alphacamp.co"]
    emails.each do |email|
      users << User.create( :email => email, :password => "12345678")
    end

    100.times do |i|
      puts "Generate map #{i}"
      m = Map.create( :name => Faker::Name.name, :country => Faker::Address.country, :time => Faker::Date.backward(3650), :user => users.sample )

      8.times do |c|
        puts "  Generate comment #{c}"
        m.comments.create( :content => Faker::Lorem.paragraph, :user => users.sample )
      end
    end

  end

end