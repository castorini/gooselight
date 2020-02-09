# Gooselight

![gooselight](https://seeklogo.com/images/D/Duck_Hunt-logo-8044A0A3B6-seeklogo.com.png)

A [Project Blacklight](http://projectblacklight.org/) application for Lucene indexes built by [Anserini](https://github.com/castorini/Anserini).

## Requirements

* [Java](https://www.java.com/en/download/) 8+
* [Ruby](https://www.ruby-lang.org/en/) 2.6.5
  * The [Ruby Version Manager (RVM)](https://rvm.io/) is recommended
* [Anserini](https://github.com/castorini/anserini)
* [Solr](https://archive.apache.org/dist/lucene/solr/) version matching the Anserini Lucene version
    * Version 8.3.0 as of Anserini commit [b27be36](https://github.com/castorini/anserini/commit/b27be366d0277d5eff78d76bbbd7f1610248f6fc)
* [solr_wrapper](https://github.com/cbeer/solr_wrapper) for development
  * `gem install solr_wrapper`

## Getting Started

### Prerequisites
* Build an Solr index by following [Solrini](https://github.com/castorini/anserini/blob/master/docs/solrini.md)

### Development
* Install dependencies
  * `bundle install`
* Create db migrations
  * `rails db:migrate`
* Start the Rails server
  * `rails s`
* http://localhost:3000

## License

This application is available as open source under the terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).
