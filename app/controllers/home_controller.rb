class HomeController < ApplicationController
  require 'rest-client'

  FACEBOOK_URL = 'https://takehome.io/facebook'
  TWITTER_URL = 'https://takehome.io/twitter'

  def index

    twitter_comments = call_url TWITTER_URL
    facebook_comments = call_url FACEBOOK_URL

    render json: {twitter: twitter_comments, facebook: facebook_comments }
  end

  private

  def call_url url
    begin
      response = RestClient.get url
      return (response.code == 200) ? JSON.parse(response.body) : []
    rescue
      return []
    end
  end

end
