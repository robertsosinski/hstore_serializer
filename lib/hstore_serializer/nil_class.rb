class NilClass
  # If to_hstore or from_hstore is called on a nil, which can happen
  # when using with an ActiveRecord serializer, return nil.
  def to_hstore
    self
  end
  
  def from_hstore
    self
  end
end