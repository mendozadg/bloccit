require "random_data"


15.times do
	Topic.create!(
		name: 				RandomData.random_sentence,
		description: 	RandomData.random_paragraph
	)
end
topics =  Topic.all

50.times do
	Post.create!(
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all

100.times do
	Comment.create!(
		post:posts.sample,
		body: RandomData.random_paragraph
	)
end

10.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
questions = Question.all

15.times do
	Sponsored_Post.create!(
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
sponsored_posts = Sponsored_Post.all

puts "Seeds finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{Sponsored_Post.count} sponsored post created"
