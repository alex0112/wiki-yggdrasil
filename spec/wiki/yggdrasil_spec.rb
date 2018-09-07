describe Wiki::Yggdrasil do
  before(:all) do
    @tree = Wiki::Yggdrasil::Yggdrasil.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')
    @tree_2 = Wiki::Yggdrasil::Yggdrasil.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')
    @tree_3 = Wiki::Yggdrasil::Yggdrasil.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')
  end

  it "has a version number" do
    expect(Wiki::Yggdrasil::VERSION).not_to be nil
  end

  
  describe '#new' do
    context 'Given no uri' do
      it 'raises an ArgumentError' do
        expect { Wiki::Yggdrasil::Yggdrasil.new() }.to raise_error ArgumentError
      end
    end
    
    context 'Given a valid wikipedia article' do
      it 'returns a Wiki::Yggdrasil::Yggdrasil object' do
           expect(Wiki::Yggdrasil::Yggdrasil.new(uri: 'https://en.wikipedia.org/wiki/Yggdrasil')).to be_a Wiki::Yggdrasil::Yggdrasil
      end
    end

    context 'Given a non-valid wikipedia article' do
      it 'raises an ArgumentError' do
        expect { Wiki::Yggdrasil::Yggdrasil.new(uri: 'https://www.google.com') }.to raise_error ArgumentError
      end
    end
  end

  describe '.root' do
    it 'is a Wiki::Yggdrasil::Article object' do
      expect(@tree.root).to be_a Wiki::Yggdrasil::Article
    end
  end

  describe '.children' do  ## TODO:  Cleanup and implement mocking

    it 'returns the proper structure for a tree with a depth of 1' do
      children             = @tree.children(depth: 1)
      first_level_name     = children[0][:name]
      first_level_children = children[0][:children]
      
      expect(children).to be_an Array
      expect(first_level_name).to be_a String
      expect(first_level_children).to be_an Array
      expect(first_level_children).to match_array []
    end

    it 'returns the proper structure for a tree with a depth of 2' do
      children = @tree_2.children(depth: 2)
      first_level_name      = children[0][:name]
      first_level_children  = children[0][:children]
      second_level_name     = children[0][:children][0][:name]
      second_level_children = children[0][:children][0][:children]

      expected_first_level_object = { :name     => 'Yggdrasil',
                                      :children => [ {:name=>"International Phonetic Alphabet", :children=>[]}, {:name=>"Template:IPAc-en", :children=>[]} ]
                                    }
      
      expect(children).to be_an Array

      ## Level 1
      expect(first_level_name).to be_a String
      expect(first_level_children).to be_an Array
      expect(first_level_children).to match_array expected_first_level_object

      ## Level 2
      expect(second_level_name).to be_a String
      expect(second_level_children).to be_an Array
      expect(second_level_children).to match_array []

    end 

    it 'returns the proper structure for a tree with a depth of 3' do
      children = @tree_3.children(depth: 3)
      first_level_name      = children[0][:name]
      first_level_children  = children[0][:children]
      second_level_name     = children[0][:children][0][:name]
      second_level_children = children[0][:children][0][:children]
      third_level_name     = children[0][:children][0][:name][0][:name]
      third_level_children = children[0][:children][0][:children][0][:children]

      ## Level 1
      expect(first_level_name).to be_a String
      expect(first_level_children).to be_an Array
      expect(first_level_children).to match_array [{:name=>"International Phonetic Alphabet", :children=>[]}, {:name=>"Template:IPAc-en", :children=>[]}]

      ## Level 2
      expect(second_level_name).to be_a String
      expect(second_level_children).to be_an Array
      #expect(second_level_children).to match_array []

      ## Level 3
      expect(third_level_name).to be_a String
      expect(third_level_children).to be_an Array
      expect(third_level_children).to match_array []
    end
  end
  
end
