
#animals = ['lions', 'tigers', 'bears']
#puts animals
#animals[0]
#animals[2]
#animals[10]
#animals[-1]
#animals[-2]
#animals[0..1]
#(0..1).class
=begin
class Tree
	attr_accessor :children, :node_name
	
	def initialize(name, children=[])
		@children = children
		@node_name = name
	end
	
	def visit_all(&block)
		visit &block
		children.each { |c| c.visit_all &block }
	end
	
	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new("Ruby",[Tree.new("Reia"), Tree.new("MacRuby")])

ruby_tree.visit_all {|node| puts node.node_name}
*/
=end
x = (1..16).to_a
b = []
x.each do |a|
  b.push a
  if b.count == 4
    puts b
	puts "woo"
    b = []
  end
end