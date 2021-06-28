#Based off http://jonasforsberg.se/2012/12/28/create-jekyll-posts-from-the-command-line
require "stringex"
class Jekyll < Thor
  desc "new", "create a new draft"
  method_option :editor, :default => "emacs"
  def new(*title)
    title = title.join(" ")
    date = Time.now.strftime('%Y-%m-%d')
    filename = "_posts/unpublished/#{date}-#{title.to_url}.md"

    if File.exist?(filename)
      abort("#{filename} already exists!")
    end

    puts "Creating new draft: #{filename}"
    open(filename, 'w') do |post|
      post.puts "---"
      post.puts "layout: post"
      post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
      post.puts "published: false"
      post.puts "---"
    end

  end
end
