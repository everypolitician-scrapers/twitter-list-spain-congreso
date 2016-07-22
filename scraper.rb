require 'bundler/setup'
require 'scraperwiki'
require 'twitter_list'

# https://twitter.com/Congreso_Es/lists/diputados-2011-2016

abort "Need to set ENV['MORPH_TWITTER_TOKENS']" unless ENV.key? 'MORPH_TWITTER_TOKENS'
twitter_list = TwitterList::Scraper.new(twitter_tokens: ENV['MORPH_TWITTER_TOKENS'])

ScraperWiki.save_sqlite([:id], twitter_list.people('Congreso_Es', 'diputados-2011-2016'))
ScraperWiki.save_sqlite([:id], twitter_list.people('Congreso_Es', 'diputados-xi-legislatura'))
