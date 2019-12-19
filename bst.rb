class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data.to_i
    @left = nil
    @right = nil
  end
end
class Bst
  attr_accessor :root, :newNode
  def initialize
    @root = nil
  end
  def initialize
    @newNode = nil
  end
  def insertdata(value)
    if @root == nil
      @root = Node.new(value)
    else
      insertNode(@root,Node.new(value))
    end
  end
  def insertNode(root,newNode)
    if(newNode.data>root.data)
      if(root.right == nil)
        root.right = newNode
      else
        insertNode(root.right,newNode)
      end
    else
      if(root.left == nil)
        root.left = newNode
      else
        insertNode(root.left,newNode)
      end
    end
  end
  def post_order(node)
    if node != nil
      post_order(node.left)
      post_order(node.right)
      p node.data
    end
  end
  def pre_order(node)
    if node != nil
      p node.data
      pre_order(node.left)
      pre_order(node.right)
    end
  end
  def inorder(node)
    if node != nil
      inorder(node.left)
      p node.data
      inorder(node.right)
    end
  end
  def get_root
    @root
  end
  def perform_operation(operation,rootvalue)
    case operation 
    when 1
      puts "in order"
      inorder(rootvalue)
    when 2
      puts "post order:"
      post_order(rootvalue)
    when 3
      puts "pre order"
      pre_order(rootvalue)
    when 4
        exit
    end
    puts "still want to continue with other operations y/n?"
    perform = gets.chomp
    if perform == 'y'
      puts "which operation you want to perform?\n1.inorder\n2.post order\n3.pre order\n4.exit"
      operation = gets.chomp.to_i
      perform_operation(operation,rootvalue)
    else
      exit
    end
  end
end

bst = Bst.new;
puts "enter elements for binary tree"
elements = gets.chomp.split(" ")
elements.each{|element| bst.insertdata(element)}
rootvalue = (bst.get_root)
puts "which operation you want to perform?\n1.inorder\n2.post order\n3.pre order\n4.exit"
operation = gets.chomp.to_i
puts "#{operation}"
bst.perform_operation(operation,rootvalue)
