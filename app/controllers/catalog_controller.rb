# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog

  configure_blacklight do |config|
    config.default_solr_params = {
      rows: 100,
      df: 'contents'
    }

    config.add_facet_field 'year', label: 'Year', :sort => 'index'
    config.add_facet_field 'topics', :label => 'Topic', :limit => 20, :sort => 'index'
    config.add_facet_field 'subjects', :label => 'Subject', :limit => 20, :sort => 'index'
    config.add_facet_field 'authors', :label => 'Author', :limit => 20, :sort => 'index'
    config.add_facet_field 'publisher', :label => 'Publisher', :limit => 20, :sort => 'index'
    config.add_facet_field 'journals', :label => 'Journal', :limit => 20, :sort => 'index'
    config.add_facet_field 'language', :label => 'Language', :limit => 20, :sort => 'index'

    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'title', :label => 'Title'
    config.add_index_field 'doi', :label => 'DOI'

    config.add_search_field 'contents', label: 'Contents' do |field|
      field.solr_parameters = { :df => 'contents' }
    end

    config.add_search_field 'authors', label: 'Author' do |field|
      field.solr_parameters = { :df => 'authors' }
    end

    config.add_search_field 'publisher', label: 'Publisher' do |field|
      field.solr_parameters = { :df => 'publisher' }
    end

    config.add_search_field 'journals', label: 'Journals' do |field|
      field.solr_parameters = { :df => 'journals' }
    end

    config.add_search_field 'topics', label: 'Topics' do |field|
      field.solr_parameters = { :df => 'topics' }
    end

    config.add_search_field 'subjects', label: 'Subjects' do |field|
      field.solr_parameters = { :df => 'subjects' }
    end

    config.add_sort_field 'score desc', label: 'relevance'
    config.spell_max = 5
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
