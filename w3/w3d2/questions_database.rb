require_relative 'everything.rb'
require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.results_as_hash = true
    self.type_translation = true
  end

  # def find_by_id_in_table(search_id, table)
  #   search = QuestionsDatabase.instance.execute(<<-SQL, table, search_id)
  #     SELECT
  #       *
  #     FROM
  #       ?
  #     WHERE
  #       id = ?
  #   SQL
  #   debugger
  # end
end
