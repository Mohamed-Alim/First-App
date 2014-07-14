class HaveMeta
  attr_accessor :expected_val, :actual_val, :attribute
 
  def initialize(expected)
    @expected = expected
  end
 
  def matches?(page)
    @expected.all? do |key, val|
      meta = page.find(:xpath, "//head/meta[@property='#{key}' or @name='#{key}']", :visible => false)
      self.actual_val = meta ? meta.native.attribute("content") : nil
      self.expected_val = val
      self.attribute = key
      actual_val.to_s == expected_val
    end
  end
 
  def failure_message
    "expected '#{attribute}' to contain '#{expected_val}' in '#{actual_val}'"
  end
end
 
def have_meta(expected)
  HaveMeta.new(expected)
end