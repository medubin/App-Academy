require_relative 'everything.rb'

class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(search_id)
    options = QuestionsDatabase.instance.execute(<<-SQL, search_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    raise "Invalid ID" if options.empty?
    self.new(options.first)
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end


  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id, @title, @body, @user_id = options.values_at('id', 'title', 'body', 'user_id')
  end

  def author
    User.find_by_user_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
end
