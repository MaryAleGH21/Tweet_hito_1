# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(name:"Jordan", photo:"https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg", email:"jordan@hola.com", password: "123456")
user1 = User.create(name:"Alejandra", photo:"https://i.pinimg.com/236x/c6/c4/16/c6c41639a7096b68e0da004a7f413c84--faces-children.jpg", email:"ale@hola.com", password: "123456")
user2 = User.create(name:"Rafa", photo:"https://i.blogs.es/712ff6/sorpresa/450_1000.jpg", email:"rafa@hola.com", password: "123456")
user3 = User.create(name:"Carmen", photo:"https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg", email:"carmen@hola.com", password: "123456")
user4 = User.create(name:"Edwin", photo:"https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg", email:"edwin@hola.com", password: "123456")


current_user = User.first
user_3 = User.find(3)
friendship = current_user.friends.build(friend_id:user_3.id)
friendship.save
user_4 = User.find(4)
friendship = current_user.friends.build(friend_id:user_4.id)
friendship.save


100.times do |i|
    Tweet.create(content:"contenido#{i}", user_id:user.id)
end
 
10.times do |i|
    Tweet.create(content:"#contenido#{i}", user_id:user_3.id)
end
5.times do |i|
    Tweet.create(content:"#contenido#{i}", user_id:user_4.id)
end

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?