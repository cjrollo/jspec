# encoding: utf-8

java_import org.apache.commons.lang3.text.StrTokenizer

describe "StrTokenizer" do

  describe "when tokenizing 'a b c' using space" do

    before :each do
      @tokens = StrTokenizer.new("a b c", " ").getTokenList()
    end

    it "returns 3 tokens" do
      expect(@tokens.size).to eq 3
    end

    it "returns a, b, c in sequence" do
      expect(@tokens.get(0)).to eq "a"
      expect(@tokens.get(1)).to eq "b"
      expect(@tokens.get(2)).to eq "c"
    end

  end

end
