# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.destroy_all
Task.destroy_all
ProjectMember.destroy_all
Project.destroy_all
User.destroy_all

user = User.create({
  first_name: 'Aaron',
  last_name: 'Anderson',
  email: 'a@a.a',
  password: 'a',
  password_confirmation: 'a'
  })
project = Project.create({
  name: 'road',
  deadline: 'May 7, 2016'
  })
project.tasks.create({
  content: 'buy stuff',
  deadline: 'April 20, 2016'
  })
task = project.tasks.first
task.posts.create({
  content: "I'll buy that",
  user: user
  })
user2 = User.create({
  first_name: 'Bob',
  last_name: 'Bobson',
  email: 'b@b.b',
  password: 'b',
  password_confirmation: 'b'
  })
ProjectMember.create({
  project_id: project.id,
  user_id: user.id,
  })
ProjectMember.create({
  project_id: project.id,
  user_id: user2.id
  })
project2 = Project.create({
  name: 'Organize',
  deadline: 'April 2, 2016',
  completed: true
  })
ProjectMember.create({
  project_id: project2.id,
  user_id: user.id
  })
