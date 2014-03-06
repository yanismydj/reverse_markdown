require 'spec_helper'

describe ReverseMarkdown do
  let(:input)    { File.read('spec/assets/minimum.html') }
  let(:document) { Nokogiri::HTML(input) }

  it "parses nokogiri documents" do
    lambda { ReverseMarkdown.parse_element(document) }.should_not raise_error
  end

  it "parses nokogiri elements" do
    lambda { ReverseMarkdown.parse_element(document.root) }.should_not raise_error
  end

  it "parses string input" do
    lambda { ReverseMarkdown.parse_string(input) }.should_not raise_error
  end

  it "doesn't throw unknown end tag error" do
    lambda { ReverseMarkdown.parse_string("no html tags here<br />") }.should_not raise_error
  end
end
