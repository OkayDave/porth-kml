require 'ruby_kml'

kml = KMLFile.new
folder= KML::Folder.new
point = KML::Point.new :coordinates => { :lat => 0.0, :lng => 0.0 }
place = KML::Placemark.new :geometry => point, :name => @foo
folder.features << place
kml.objects << folder
kml
