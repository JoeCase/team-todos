user_amount       = 2
category_amount   = 2
task_amount       = 2
tag_amount        = 10
tags_per_task     = 3
members_per_user  = 3

categories = ['Home', 'Office', 'Errands']



# USERS
User.create(first_name: 'joe', last_name: 'Case', email: 'joe@joe.com', password: 'pw', description: Faker::Hipster.paragraph)

user_amount.times do
  User.create(  first_name:      Faker::Name.first_name,
                last_name:       Faker::Name.last_name,
                email:           Faker::Internet.email(self.first_name),
                password:        'pw',
                description:     Faker::StarWars.quote
                )
end

user_ids = User.all.map { |user| user.id }
users = User.all


# TAGS
tag_amount.times do
  Tag.create(title: Faker::Commerce.color)
end


# TASKS
users.each do |user|
  members_per_user.times do
    Member.create(first_name:  Faker::Name.first_name,
                  last_name:   Faker::Name.last_name,
                  email:       Faker::Internet.email(self.first_name),
                  phone:       Faker::PhoneNumber.cell_phone,
                  user_id:     user.id
                  )
  end

  team_member_ids = user.members.map { |member| member.id }


  categories.each do |category_name|
    category = Category.create(title: category_name, user_id: user.id)
    task_amount.times do
       task = Task.create(category_id: category.id,
                          user_id:     user.id,
                          name:        Faker::Hipster.sentence(3),
                          status:      0,
                          priority:    rand(1..3),
                          due_date:    Faker::Date.forward(100),
                          notes:       Faker::Lorem.paragraph(3)),
                          member_id:   team_member_ids.sample
                          )

       tag_ids = Tag.all.map { |tag| tag.id }

       tags_per_task.times do
          TagTask.create(tag_id: tag_ids.delete_at(rand(tag_ids.length)),
                         task_id: task.id)
      end
      end
  end
end

