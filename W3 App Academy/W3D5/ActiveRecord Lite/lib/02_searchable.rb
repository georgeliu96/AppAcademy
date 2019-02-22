require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    # ...
    conds = ""
    params.each {|k,v| ((v.is_a?(String)) ? (conds << "#{k} = '#{v}' AND ") : (conds << "#{k} = #{v} AND "))}
    conds = conds[0..-5]
    # debugger
    arr = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
        #{table_name}
      WHERE 
        #{conds}
    SQL
    self.parse_all(arr)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
