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
    p node
    if node != nil
      self.post_order(node.left)
      self.post_order(node.right)
      p node.data
    end
  end
  def pre_order(node)
    if node != nil
      p node.data
      self.pre_order(node.left)
      self.pre_order(node.right)
    end
  end
  def inorder(node)
    if node.left != nil
      self.inorder(node.left)
      p node.data
      self.inorder(node.right)
    end
  end
  def get_root
    @root
  end
end

bst = Bst.new;
puts "enter elements for binary tree"
elements = gets.chomp.split(",")
elements.each{|element| bst.insertdata(element)}
rootvalue = (bst.get_root)
p (rootvalue).class
puts "post order:"
bst.post_order(rootvalue)
puts "pre order"
bst.pre_order(rootvalue)
puts "in order"
bst.inorder(rootvalue)

