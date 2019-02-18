# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      yr
    FROM
      nobels n1 
    JOIN 
      nobels n2 ON n1.yr = n2.yr
    GROUP BY 
      yr
    HAVING
      subject IN 'Physics' AND subject NOT IN 'Chemistry' 
  SQL
end
