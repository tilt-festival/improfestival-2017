# Improfestival "Tilt" 2016 homepage

[![Travis branch](https://img.shields.io/travis/improv-jaa/improfestival-2016/develop.svg?maxAge=2592000)](https://travis-ci.org/improv-jaa/improfestival-2016)
[![
 branch](https://img.shields.io/scrutinizer/g/improv-jaa/improfestival-2016/develop.svg?maxAge=2592000)](https://scrutinizer-ci.com/g/improv-jaa/improfestival-2016/)
[![Docker Pulls](https://img.shields.io/docker/pulls/improvjaa/improfestival-2016.svg?maxAge=2592000)](https://hub.docker.com/r/improvjaa/improfestival-2016/)
[![GitHub release](https://img.shields.io/github/release/improv-jaa/improfestival-2016.svg?maxAge=2592000)](https://github.com/improv-jaa/improfestival-2016/releases)

This is the homepage for the 4th international improv festival Tilt (2016).

## Managing Content

### Performances and Workshops

Performance (workshop) details (ticket prices, locations) can be edited from files in `_performances/` (`_workshops`) folder. One file per performance.
Translated body of the event is in `_i18n/<lang>/performances/` folder. 

## Requirements

* Docker

## Installation

Run the image:

```
docker run -p 80:80 improvjaa/improfestival-2016
```

This will start a Nginx webserver image listening on port 80.

## Development

* Install Jekyll: `gem install jekyll`
* Install gems: `bundle install`
* Run Jekyll server: `bundle exec jekyll serve`

### Adding Icons

Instead of using the stock Font Awesome icon package, this site uses a custom-generated icon font that includes only the icons it actually uses. This saves bandwidth.
The icons are generated with [Icomoon.io](https://icomoon.io/app/). See `_assets/fonts/icomoon` folder.

To add new icons:
 
- Open the Icomoon app
- Import `_assets/fonts/icomoon/selection.json` into it
- Add new icons
- Download the icon archive into `_assets/fonts/icomoon` folder
- Manually update `_assets/css/_icons.scss` - add new icon variables and classes

# Licence

Licenced under [Apache License 2.0](http://choosealicense.com/licenses/apache-2.0).
