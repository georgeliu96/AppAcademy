require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    if @columns.nil? 
      columns = 
      DBConnection.execute2(<<-SQL)
        SELECT 
          * 
        FROM 
          #{table_name}
        SQL
      @columns = columns[0].map(&:to_sym) 
    else 
      @columns
    end
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do 
        self.attributes[col] 
      end
      define_method("#{col}=".to_sym) do |value| 
        self.attributes[col] = value
      end   
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name = self.to_s.downcase + 's'
  end

  def self.all
    # ...
    arr = DBConnection.execute(<<-SQL)
      SELECT 
        * 
      FROM 
        #{table_name}
    SQL
    self.parse_all(arr)
  end

  def self.parse_all(results)
    # ...
    obj_arr = []
    results.each do |hash| 
      obj_arr << self.new(hash)
    end
    obj_arr
  end

  def self.find(id)
    # ...
    return nil if self.all.nil?
    return nil if id > self.all.length
    arr = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
        #{table_name}
      WHERE 
        id = '#{id}'
    SQL
    self.new(arr[0])
  end

  def initialize(params = {})
    # ...
    params.each do |k,v| 
      raise "unknown attribute '#{k}'" unless self.class.columns.include?(k.to_sym)
      self.send("#{k}=".to_sym, v) 
    end
  end


  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
    col_names = self.class.columns[1..-1].join(",")
    question_marks = (["?"] * (self.class.columns.length - 1)).join(",")

    # debugger
    DBConnection.execute(<<-SQL, *self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES 
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    col_names = (self.class.columns[1..-1].map {|attr| "#{attr} = ?"}).join(", ")
    # debugger
    DBConnection.execute(<<-SQL, *self.attribute_values.drop(1))
      UPDATE 
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE 
        id = #{self.id}
    SQL

  end

  def save
    # ...
    self.id.nil? ? self.insert : self.update
  end
end
