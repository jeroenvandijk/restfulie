class Hash

  def links(*args)
    links = fetch("link", [])
    Tokamak::Xml::Links.new(links)
  end

  include Restfulie::Common::Links

  def method_missing(sym, *args)
    self[sym.to_s].nil? ? super(sym, args) : self[sym.to_s]
  end
  
  def respond_to?(sym)
    include?(sym.to_s) || super(sym)
  end
  
end
