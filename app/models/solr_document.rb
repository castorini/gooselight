# frozen_string_literal: true
class SolrDocument
  include Blacklight::Solr::Document

  # self.unique_key = 'id'

  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension(Blacklight::Document::Email)

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension(Blacklight::Document::Sms)

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension(Blacklight::Document::DublinCore)

  def display_tweet
    embed_base_url = 'https://publish.twitter.com/oembed?dnt=true&url=https://twitter.com/fake/status/'
    embed_query_url = embed_base_url + first(:id).to_s
    embed_query_request = URI(embed_query_url)
    embed_response = Net::HTTP.get_response(embed_query_request)
    if embed_response.code.start_with?('2')
      embed_query_response = Net::HTTP.get(embed_query_request)
      embed_query_response_json = JSON.parse(embed_query_response)
      embedded_tweet = embed_query_response_json['html']
      embedded_tweet.html_safe
    else
      #'Sorry, you are not authorized to see this status.'
      nil
    end
  end
end
