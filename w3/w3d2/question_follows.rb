require_relative 'everything.rb'

class QuestionFollows

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.id, questions.body, questions.title, questions.user_id
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT ?
    SQL

    questions.map {|question| Question.new(question)}
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
      SQL

      questions.map { |question| Question.new(question) }
    end



  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL

    followers.map { |user| User.new(user) }
  end

  def self.find_by_id(search_id)
    options = QuestionsDatabase.instance.execute(<<-SQL, search_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    raise "Invalid ID" if options.empty?
    self.new(options.first)
  end

  attr_accessor :id, :question_id, :user_id
  def initialize(options)
    @id, @question_id, @user_id = options.values_at('id', 'question_id', 'user_id')
  end
end
