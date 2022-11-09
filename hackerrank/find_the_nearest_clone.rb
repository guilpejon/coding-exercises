#!/bin/ruby

# PROBLEM DESCRIPTION AND INFO:
# https://www.hackerrank.com/challenges/find-the-nearest-clone/problem

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(id, color)
    @nodes[id] = Node.new(id, color)
  end

  def add_edge(node_id1, node_id2)
    @nodes[node_id1].add_edge(@nodes[node_id2])
    @nodes[node_id2].add_edge(@nodes[node_id1])
  end

  def print
    @nodes.each do |_k, node|
      puts "NODE=#{node.id} COLOR=#{node.color} NEIGHBORS=#{node.neighbors.map(&:id)}"
    end; nil
  end
end

class Node
  attr_accessor :id, :color, :neighbors

  def initialize(id, color)
    @id = id
    @color = color
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end
end

def bfs(root_node)
  visited = []
  to_visit = []

  # add root node to visited list and to_visit queue
  visited << root_node
  root_node.neighbors.each do |node|
    to_visit << [node, 1]
  end

  until to_visit.empty?
    current_node, hops = to_visit.shift
    return hops if current_node.color == root_node.color

    current_node.neighbors.each do |node|
      to_visit << [node, hops + 1] unless visited.include?(node)
      visited << node
    end
  end

  -1
end

def dfs(node, color, visited = [], hops = 0)
  hops += 1
  visited << node.id

  node.neighbors.each do |n|
    next if visited.include?(n.id)
    return hops if n.color == color

    answer = bfs_recursive(n, color, visited, hops)
    return answer if answer != -1
  end

  -1
end

def findShortest(graph_nodes, graph_from, graph_to, ids, val)
  @graph = Graph.new

  # add nodes
  graph_nodes.times do |id|
    @graph.add_node(id + 1, ids[id])
  end

  # add edges
  graph_from.each_with_index do |from, index|
    @graph.add_edge(from, graph_to[index])
  end

  @graph.print

  ans = []
  @graph.nodes.each do |_k, node|
    ans << dfs(node, val) if node.color == val
    # ans << bfs(node) if node.color == val
  end

  ans.min
end

graph_nodes = 5
graph_from = [1, 2, 2, 3]
graph_to = [2, 3, 4, 5]
colors = [1, 2, 3, 1, 3]
searched_color = 3

puts "SEARCHED COLOR #{searched_color}: #{findShortest graph_nodes, graph_from, graph_to, colors, searched_color} HOP(S)"
