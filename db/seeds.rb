# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Student", description: "Can read lessons"})
r2 = Role.create({name: "Teacher", description: "Can create and edit lessons. Can update and destroy own lessons"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

#u1 -> student | u2 -> teacher | u3 -> teacher | u4 -> admin
u1 = User.create({name: "Taner", email: "taner@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Hayriye", email: "hayriye@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Mehmet", email: "mehmet@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "Admin", email: "admin@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
#
c1 = Course.create({name: "CSE222", description: "Data Structures"})
c2 = Course.create({name: "CSE102", description: "Programming"})
c3 = Course.create({name: "CSE461", description: "Artificial Intelligence"})
c4 = Course.create({name: "CSE241", description: "Object Oriented Programming"})
#
#
l1 = Lesson.create({topic: "deneme1", url: "https://www.youtube.com/embed/L9ArgxkC_Bc"})
l2 = Lesson.create({topic: "deneme2", url: "https://www.youtube.com/embed/L9ArgxkC_Bc"})
l3 = Lesson.create({topic: "deneme3", url: "https://www.youtube.com/embed/L9ArgxkC_Bc"})
l4 = Lesson.create({topic: "deneme4", url: "https://www.youtube.com/embed/L9ArgxkC_Bc"})
#
m1 = Message.create({content: "1"})
m2 = Message.create({content: "2"})
m3 = Message.create({content: "3"})
m4 = Message.create({content: "4"})

# l1.messages << m1
# l2.messages << m2
# l3.messages << m3
# l4.messages << m4
#
# l1.save
# l2.save
# l3.save
# l4.save

c1.lessons << l1
c2.lessons << l2
c3.lessons << l3
c4.lessons << l4

c1.save
c2.save
c3.save
c4.save


## hard comments begin
pt1 = PivotTbl.create({user_id: u2.id, course_id: c1.id })
pt2 = PivotTbl.create({user_id: u2.id, course_id: c2.id })
pt3 = PivotTbl.create({user_id: u3.id, course_id: c3.id })
pt4 = PivotTbl.create({user_id: u4.id, course_id: c4.id })

#u2.pivot_tbls_id = pt1.id
# u2.pivot_tbls << pt2.id

#u3.pivot_tbls_id = pt3.id
# u3.pivot_tbls_id << pt4.id

#u2.save
#u3.save

#c1.pivot_tbls_id = pt1.id
# u2.pivot_tbls << pt2.id

#c3.pivot_tbls_id = pt3.id
# u3.pivot_tbls_id << pt4.id

#c1.save
#c3.save

# c1.update({pivot_tbls_id: pt1.id})
# c2.update({pivot_tbls_id: pt2.id})
# c3.update({pivot_tbls_id: pt3.id})
# c4.update({pivot_tbls_id: pt4.id})
#
# u2.update({pivot_tbls_id: [pt1.id, pt2.id]})

# pt1 = PivotTbl.create()
# pt2 = PivotTbl.create()
# pt3 = PivotTbl.create()
#
# pt1.user = u2
# pt1.course = c1
#
# pt2.user = u3
# pt2.course = c3
#
# pt3.user = u3
# pt3.course = c4
#
# pt1.save
# pt2.save
# pt3.save

