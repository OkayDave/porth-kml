require 'ruby_kml'

kml = KMLFile.new
folder= KML::Folder.new

(1..2).map do |n|
  point = KML::Point.new :coordinates => { :lat => 1+n.to_f,
                                           :lng => 2+n.to_f }
  place = KML::Placemark.new :geometry => point, :name => "Test place ##{n}"
  folder.features << place
end

kml.objects << folder
kml
