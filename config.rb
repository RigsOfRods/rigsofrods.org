###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# redirect "/repository/index.html", :to => "http://forum.rigsofrods.org/thread-235.html"


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change



###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :minify_html

end


activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "Blog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "bloglayout"
  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
page "/test.txt", layout: false




data.versions.each do |item|
  proxy "/download/#{item.os}.html", "download/download_confirmation_template.html", :locals => { 
    :url => "/#{item.os}_thanks.html",
    :version => item.version,
    :changeLog_url => item.changeLog_url,
    :os_full_name => item.os_full_name
  }, :ignore => true
  proxy "/download/#{item.os}_thanks.html", "download/download_template.html", :locals => { 
    :url => item.url,
    :version => item.version,
  }, :ignore => true
end
