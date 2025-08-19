class Lesson < ApplicationRecord
  has_many :lesson_topics
  has_many :topics, through::lesson_topics
end
