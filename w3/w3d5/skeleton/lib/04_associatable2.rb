require_relative '03_associatable'
require 'byebug'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name.to_s) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]
      source_table_name = source_options.model_class.table_name
      through_table_name = through_options.model_class.table_name
      # debugger
      results = DBConnection.execute(<<-SQL)
      SELECT
        #{source_table_name}.*
      FROM
        #{through_table_name}
      JOIN
        #{source_table_name} ON #{source_table_name}.#{source_options.primary_key} = #{through_table_name}.#{source_options.foreign_key}
      WHERE
        #{through_table_name}.#{through_options.primary_key} = #{self.send(through_name).id}
    SQL
    source_options.model_class.parse_all(results).first
end


  end
end
