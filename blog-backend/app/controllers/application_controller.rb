class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    blogs = Blog.all.map do |blog|
      {
        id: blog.id,
        title: blog.title,
        category: blog.category.name,
        subCategory: blog.category.subcategories.pluck(:name),
        description: blog.content,
        authorName: blog.author.name,
        authorAvatar: blog.author.avatar,
        createdAt: blog.created_at.strftime('%B %d, %Y'),
        cover: blog.cover
      }
    end
    blogs.to_json
  end

  get '/blogs/:category_name' do
    category = Category.find_by(name: params[:category_name])

    if category.nil?
      status 404
      return { message: "Category #{params[:category_name]} not found" }.to_json
    end

    blogs = Blog.joins(category: :subcategories).where("categories.id = ? OR categories.parent_id = ?", category.id, category.id).map do |blog|
      {
        id: blog.id,
        title: blog.title,
        category: blog.category.name,
        subCategory: blog.category.subcategories.pluck(:name),
        description: blog.content,
        authorName: blog.author.name,
        authorAvatar: blog.author.avatar,
        createdAt: blog.created_at.strftime('%B %d, %Y'),
        cover: blog.cover
      }
    end

    blogs.to_json
  end


end
