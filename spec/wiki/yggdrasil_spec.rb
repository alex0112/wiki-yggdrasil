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
    it 'returns a hash for a tree with a depth of 1' do
      children = @tree.children(depth: 1)
      expect(children).to be_a Hash
    end

    it 'returns a hash for a tree with a depth of 2' do
      children_2 = @tree_2.children(depth: 2)
      expect(children_2).to be_a Hash
    end

    it 'returns a hash for a tree with a depth of 3' do
      children_3 = @tree_3.children(depth: 3)
      expect(children_3).to be_a Hash
    end
  end
  
end
