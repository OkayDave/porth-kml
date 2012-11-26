require 'porth-kml/version'
require 'action_controller'
require 'active_record'
require 'porth'
require 'porth/format/kml'

Porth::Handler.register_format :kml, Porth::Format::KML
