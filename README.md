# porth-kml (Plain Old Ruby Template Handler - KML output)

Adds KML (.kml) support to 'porth' (Plain Old Ruby Template Handler) gem.

This allows a view written in plain ruby to create a tree of kml objects using the ruby_kml gem
and have that kml be rendered to the browser.

## Requirements

## Installation

Add this to your project's Gemfile and run `$ bundle install`

``` ruby
gem 'porth-kml'
```

## Usage

Add the ".kml" mime time to your rails app's config/initializers/mime_types.rb:

``` ruby
Mime::Type.register "application/vnd.google-earth.kml+xml", :kml
```

Add ":kml" to your controller's responds_to calls, for example:

``` ruby
class PeopleController < ApplicationController

  respond_to :json, :xml, :kml, :html

  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_with @people
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_with @person
  end
```

Then your view must return a KMLFile object, for example:

``` ruby
require 'ruby_kml'

kml = KMLFile.new
folder= KML::Folder.new(:name => 'People')

@person.each do |person|
  point = KML::Point.new :coordinates => { :lat => person.latitude,
                                           :lng => person.longitude }
  place = KML::Placemark.new :geometry => point, :name => person.name
  folder.features << place
end

kml.objects << folder
kml
```

etc...

## Dependencies

Runtime dependencies:

* porth
* ruby_kml
* action_pack (>= 3.1) (to be consistent with porth)
* active_record (>= 3.1) (to be consistent with above)

Development dependencies:

* rpsec
* rake

## Compatibility

* MRI 1.9.2+

* rails >= 3.1 (to be consistent with Porth)

## Contributing

1. Fork
2. Install dependancies by running `$ bundle install`
3. Write tests and code
4. Make sure the tests pass by running `$ rake test`
5. Push and send a pull request on GitHub

## Credits

Special thanks to Tate Johnson (et al) for making Porth!

## Copyright

Copyright © 2012 Matt Connolly. Released under the MIT license. See LICENSE.
