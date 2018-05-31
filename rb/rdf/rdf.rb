#RDFライブラリの読み込み
require 'rdf'                                                                         
require 'rdf/rdfxml'
require 'rdf/turtle'
require 'rdf/vocab'

# RDFグラフオブジェクトの作成
graph = RDF::Graph.new
# RDF:Statement.newにトリプルとなる値を代入（主語、述語、目的語）
statements = [
  RDF::Statement.new(RDF::URI.new("http://example.com/1"), RDF::Vocab::DC11.title, "サンプル"),
  RDF::Statement.new(RDF::URI.new("http://example.com/1"), RDF::Vocab::DC11.subject, "主題1"),
  RDF::Statement.new(RDF::URI.new("http://example.com/1"), RDF::Vocab::DC11.title, "主題2")
]
# トリプルを代入した配列をグラフオブジェクトへ
statements.each do |statement|
   graph << statement
end
# 出力するフォーマットを決める（デフォルトはturtle）
format = ARGV[0] || "turtle"
# RDFグラフをputs
puts graph.dump(format.to_sym)