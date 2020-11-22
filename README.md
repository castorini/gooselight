# GooseLight

![gooselight](Duck_Hunt-logo.png)

A [Project Blacklight](http://projectblacklight.org/) application for Lucene indexes built by [Anserini](https://github.com/castorini/anserini).

Gooselight is no longer being actively developed or maintained.
See [Covidex](https://covidex.ai/) as the next iteration of a search frontend for Anserini.

## Requirements

* [Ruby](https://www.ruby-lang.org/en/) 2.2 or later
* Java 8+
* Solr 7.6.0+
* [solr_wrapper](https://github.com/cbeer/solr_wrapper) (for development)

## Usage

### dev

* Get an Anserini Lucene index
* Get an Ansersini Solr [configset](https://github.com/castorini/SolrAnserini)
* Start Solr with an Anserini Solr configset
  * `solr_wrapper -i /path/to/solr-7.6.0 -d /path/to/SolrAnserini/configsets/core17 -n core17 --persist`
* `git clone git@github.com:ruebot/gooselight.git`
* ` cd gooselight`
* `bundle install`
* `rails db:migrate`
* `rails s`
* http://localhost:3000

### prod

## License

This application is available as open source under the terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
