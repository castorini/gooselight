# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog

  configure_blacklight do |config|
    config.default_solr_params = {
      rows: 10,
      'q.alt': '*:*',
      defType: 'edismax',
      echoParams: 'explicit'
    }

    config.index.title_field = 'id'

    #config.add_facet_field 'in_reply_to_status_id', label: 'in_reply_to_status_id'
    #config.add_facet_field 'in_reply_to_user_id', label: 'in_reply_to_user_id'
    #config.add_facet_field 'screen_name', label: 'screen_name'
    #config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'id', label: 'Tweet', accessor: :display_tweet

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    #config.add_show_field 'id', label: 'Tweet', accessor: :display_tweet

    config.add_search_field 'contents', label: 'Text' do |field|
      field.solr_parameters = { 'qf': 'contents' }
    end

    config.add_sort_field 'score desc', label: 'relevance'
    config.spell_max = 5
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
