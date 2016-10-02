# Improfestival "Tilt" 2016 homepage

[![Travis branch](https://img.shields.io/travis/improv-jaa/improfestival-2016/develop.svg?maxAge=2592000)](https://travis-ci.org/improv-jaa/improfestival-2016)
[![
 branch](https://img.shields.io/scrutinizer/g/improv-jaa/improfestival-2016/develop.svg?maxAge=2592000)](https://scrutinizer-ci.com/g/improv-jaa/improfestival-2016/)
[![Docker Pulls](https://img.shields.io/docker/pulls/improvjaa/improfestival-2016.svg?maxAge=2592000)](https://hub.docker.com/r/improvjaa/improfestival-2016/)
[![GitHub release](https://img.shields.io/github/release/improv-jaa/improfestival-2016.svg?maxAge=2592000)](https://github.com/improv-jaa/improfestival-2016/releases)

This is the homepage for the 4th [international improv festival Tilt](https://improfestival.ee) (2016).

## Managing Content

This is a static site, built with [Jekyll](http://jekyllrb.com). This means that one can not "edit and save" content similarly to Wordpress. 
For every change, a new "deployment" needs to happen before the changed content is visible to the world.

### Workflow

To change something within the website:

- Make the desired change on the [develop branch](https://github.com/improv-jaa/improfestival-2016/tree/develop) _(only for people who are members of the organization)_
- Create a [pull request](https://guides.github.com/activities/hello-world/#pr) from `develop` to `master` branch
- The change will automatically be deployed to the live environment [2016.improfestival.ee](https://2016.improfestival.ee) once the pull request is merged

Each change automatically triggers a [Travis build](https://travis-ci.org/improv-jaa/improfestival-2016/builds), which will build a new version of the site's Docker image and checks for coding errors.
The build takes about ~2...5 minutes. If the build fails see Travis logs for an error and fix the problem.

### Folder Structure

Here is a list of the most important folders in the project.

- `_assets/img` - All images, split into sub-folders
- `_data/` - Data files (yml): information that does not need to be translated and does not require an extensive content section. Example: venues and sponsors.
- `_i18n/` - All translatable content (text in Estonian and English)
- `_performances/` - Metadata about performances (dates, times...)
- `_team/` - Metadata about Tilt team members
- `_workshops/` - Metadata about workshops (dates, locations)
- `_config.yml` - Global configuration. Contains things like timezone and social media links.

### Performances and Workshops

Performance (workshop) details (ticket prices, locations) can be edited from files in `_performances/` (`_workshops`) folder. One file per performance.
The files contain metadata (between `---` lines), which is generic information about the thing: location, title, dates. The description of the event will be in 
`_i18n/<lang>/performances/` folder, because that is translated.
 
#### Performance Metadata

```yaml
# Start and end times of the event, in the specified format.
start: 2016-10-20 19:45
end: 2016-10-20 20:15

# Only the date of the event, in specified format. This duplicate information is needed for technical reasons.
date: 2016-10-20

# The name of the performance group. This is not translated.
name: Eesti Improteater

# The title of the performance. This is a reference to a translatable string in _i18n/ folder
title: performances.titles.eesti_improteater

# The origin country of the performance group
country: est

# The language of the performance
language: est

# Reference to a promotional image of the performance in `_assets/img/` folder. No leading slash.
image: performers/improteater.jpg

# Reference to the location of the performance. See `_data/venues.yml`.
venue: soprus

# Boolean (true or false): is the performance sold out? If set to `true`, a "SOLD OUT" sign will be shown.
sold_out: false

# Reference to a ticket sales link. Translated: see `_i18n/` for the actual link.
ticket_url: performances.ticket_links.eesti_improteater
```

#### Workshop Metadata

Identical to "performance".

```yaml
start: 2016-10-20 15:00
end: 2016-10-20 18:00
date: 2016-10-20
title: workshops.titles.do_it_yourself
country: grc
name: Menelaos Prokos
image: workshops/menelaos.jpg
sold_out: false
venue: vene
ticket_url: workshops.ticket_url
```

#### Adding and Changing Images

Add an image to `_assets/img/` folder. Before adding the image, ensure that the image is optimized for web:

- Not much larger than it needs to be: if the display size is 400x400px in it's largest form, don't upload a 1000px image; resize it beforehand
- Is .jpg or .png format. JPG for photos, .png for graphics (logo)
- Has a reasonable file name (ASCII characters)

## Development

### Requirements

* Docker
* Docker Compose
* Ruby and Bundler

### Installation

Run the image:

```
docker run -p 80:80 improvjaa/improfestival-2016
```

This will start a Nginx webserver image listening on port 80.

### Running Locally

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
