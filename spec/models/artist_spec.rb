require 'spec_helper'

describe MusixMatch::Models::Artist do
  it 'should call search_track on Search class' do
    params = { :q_artist => 'artist name' }
    MusixMatch::API::Search.should_receive(:search_track).with(params)
    MusixMatch::Models::Track.search(params)
  end
  
  it 'should call find_artist on Finder class' do
    artist_id = 1
    MusixMatch::API::Finder.should_receive(:find_artist).with(artist_id)
    MusixMatch::Models::Artist.get(artist_id)
  end
  
  it "should call get_related on RelatedArtist" do
    params = { :artist_id => 123 }
    MusixMatch::API::RelatedArtist.should_receive(:get_related).with(params)
    MusixMatch::Models::Artist.related_artists(params)
  end
  
  context 'when created' do
    it 'should have the search class method' do
      MusixMatch::Models::Artist.should respond_to(:search)
    end
    
    it 'should have the get class method' do
      MusixMatch::Models::Artist.should respond_to(:get)
    end
  end
  
  context 'when initialized' do
    it 'should set artist_id' do
      artist_id = 1
      artist = MusixMatch::Models::Artist.new('artist_id' => artist_id)
      artist.artist_id.should == artist_id
    end
    
    it 'should set artist_mbid' do
      artist_mbid = 1
      artist = MusixMatch::Models::Artist.new('artist_mbid' => artist_mbid)
      artist.artist_mbid.should == artist_mbid
    end
    
    it 'should set artist_name' do
      artist_name = "artist name"
      artist = MusixMatch::Models::Artist.new('artist_name' => artist_name)
      artist.artist_name.should == artist_name
    end
    
  end
end
