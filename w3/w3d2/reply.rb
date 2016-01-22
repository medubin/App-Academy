require_relative 'everything.rb'
class Reply
  attr_accessor :id, :question_id, :user_id, :parent_reply, :body

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    replies.map { |reply| Reply.new(reply) }
  end


  def self.find_by_id(search_id)
    options = QuestionsDatabase.instance.execute(<<-SQL, search_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    raise "Invalid ID" if options.empty?
    self.new(options.first)
  end

  def initialize(options)
    @id, @question_id, @user_id, @parent_reply, @body = options.values_at('id', 'question_id', 'user_id', 'parent_reply', 'body')
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply) if @parent_reply
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply = #{@id}
    SQL

    replies.map { |reply| Reply.new(reply) }
  end
end
