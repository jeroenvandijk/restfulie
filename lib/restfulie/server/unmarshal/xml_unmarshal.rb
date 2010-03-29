class Restfulie::Server::HTTP::XmlUnmarshaller
  
  # Unmarshalls an xml using ActiveRecord's constructor with hash
  def self.unmarshal(content)
    h = Hash.from_xml(content)
    name = h.keys[0]
    type = name.camelize.constantize
    type.new(h.values[0])
  end
  
end

["xml", "application/xml", "text/xml"].each do |type|
  Restfulie::Server::HTTP::Unmarshal.register(type, Restfulie::Server::HTTP::XmlUnmarshaller)
end
