# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create({
  first_name: 'a',
  last_name: 'b',
  email: 'c@c.c',
  password: 'abc',
  password_confirmation: 'abc'
  })
project = Project.create({
  name: 'road',
  deadline: 'May 7, 2016'
  })
project.tasks.create({
  content: 'buy stuff',
  deadline: 'April 20'
  })
task = project.tasks.first
task.posts.create({
  content: 'buy everyting',
  user: user
  })
user2 = User.create({
  first_name: '1',
  last_name: '1',
  email: '1@1.1',
  password: '1',
  password_confirmation: '1'
  })
ProjectMember.create({
  project_id: project.id,
  user_id: user.id,
  })
ProjectMember.create({
  project_id: project.id,
  user_id: user2.id,
  })
