require "rspec"
require 'spec_helper'
require 'rexml/document'

describe "Render to plist" do


  def template_dir
    File.expand_path('../../test/fixtures', __FILE__)
  end

  def render file, format, assigns = {}
    view = ActionView::Base.new(template_dir, assigns, @controller, [format]).tap do |view|
      #view.lookup_context.freeze_formats [format]
    end
    view.render :file => file
  end

  it "outputs an array of hashes as a plist" do

    output = render('block', :kml)

    xml = REXML::Document.new(output)
    placemarks = xml.elements.to_a("/kml/Folder/Placemark")
    placemarks.length.should == 2
    placemarks[0].elements['name'].text.should == 'Test place #1'
    placemarks[1].elements['name'].text.should == 'Test place #2'
  end

  it "outputs an instance variable into a plist" do

    output = render('instance_variable', :kml, 'foo' => 'bar')

    xml = REXML::Document.new(output)
    xml.elements['/kml/Folder/Placemark/name'].text.should == 'bar'
  end
end