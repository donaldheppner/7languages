module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
	  include InstanceMethods
	end
  end
  
  module InstanceMethods
    def read
	  @csv_contents = []
	  filename = self.class.to_s.downcase + '.txt'
	  file = File.new(filename)
	  @headers = file.gets.chomp.split(', ')
	  
	  file.each do |row|
	    @csv_contents << row.chomp.split(', ')
	  end
	end
	
	#added each method for exercise
	def each (&block)
	  @csv_contents.each do |row|
	    x = CsvRow.new(@headers, row)
		block.call(x)
	  end
	end
	
	attr_accessor :headers, :csv_contents
	def initialize
	  read
	end
  end
end

#new class for exercise
class CsvRow
  attr_accessor :headers, :row

  def initialize headers, row 
    @headers = headers
	@row = row
  end
  
  def method_missing name, *args
    index = @headers.index(name.to_s)
	return @row[index]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

# from book
=begin
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
=end

m = RubyCsv.new
m.each { |row| puts row.one }