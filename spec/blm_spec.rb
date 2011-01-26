require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe BLM do
  context "reading a .blm file" do
  	before :all do
  		@blm = BLM.new( File.open(File.dirname(__FILE__) + "/blm/example_data.blm", "r").read )
  	end
  	
  	it "should parse settings from the header" do
  		@blm.header.should be_a(Hash)
  		@blm.header[:version].should_not be_nil
  		@blm.header[:eof].should_not be_nil
  		@blm.header[:eor].should_not be_nil
  	end
  	
  	it "should parse the data into an array of hashes" do
  		@blm.data.should be_a(Array)
  		@blm.data.should have_at_least(1).items
  		@blm.data.should respond_to(:each, :each_with_index)
  		@blm.data.each do |row|
  			row.should be_a(Hash)
  		end
  	end
  end
end
