def cc(name, age, gender, hair, eye, alive )
  Person.create(name: name, age: age, gender: gender, hair_color: hair, eye_color: eye, alive: alive)
end

def rand_gender
  ["male", "female", "neutral"].shuffle.pop
end

25.times do |p|
  name = Faker::Name.name
  hair = Faker::Color.color_name
  eye = Faker::Color.color_name
  alive = Faker::Boolean.boolean(0.95)
  gender = rand_gender
  age = rand(9...115)

  cc(name, age, gender, hair, eye, alive)


end
