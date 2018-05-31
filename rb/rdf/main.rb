require 'rdf' #RDF.rbの読み込み
require 'rdf/rdfxml'  #rdf-rdfxmlの読み込み
require 'rdf/vocab'
require 'openssl'

graph = RDF::Graph.load("http://ci.nii.ac.jp/naid/110008682472.rdf")  #Ciniiの論文のrdfデータを読み込み

query = RDF::Query.new({
  :person => {
    RDF.type  => RDF::Vocab::FOAF.Person,
    RDF::Vocab::FOAF.name => :name
  }
})

query.execute(graph).each do |solution|
  puts "#{solution.name}"
end