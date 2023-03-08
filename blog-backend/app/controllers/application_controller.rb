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

  get '/blogs/author/:author_name' do
    author = Author.find_by(name: params[:author_name])

    if author.nil?
      status 404
      return { message: "Author #{params[:author_name]} not found" }.to_json
    end

    blogs = author.blogs.map do |blog|
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

  get '/blogs/created_on/:date' do
    begin
      date = Date.parse(params[:date])
    rescue ArgumentError
      status 400
      return { message: "Invalid date format. Please use yyyy-mm-dd" }.to_json
    end

    blogs = Blog.where(created_at: date.beginning_of_day..date.end_of_day)

    if blogs.empty?
      status 404
      return { message: "No blogs found on #{params[:date]}" }.to_json
    end

    response_blogs = blogs.map do |blog|
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

    response_blogs.to_json
  end

  delete '/blogs/:id' do
    blog = Blog.find_by(id: params[:id])

    if blog.nil?
      status 404
      return { message: "Blog not found" }.to_json
    end

    blog.destroy
    status 200
    return { message: "Blog successfully deleted" }.to_json
  end

  patch '/blogs/:id' do
    blog = Blog.find_by(id: params[:id])

    if blog.nil?
      status 404
      return { message: "Blog not found" }.to_json
    end

    blog.title = params[:title] if params[:title]
    blog.content = params[:content] if params[:content]
    blog.cover = params[:cover] if params[:cover]
    blog.category_id = params[:category_id] if params[:category_id]

    if blog.save
      status 200
      return blog.to_json
    else
      status 422
      return { errors: blog.errors }.to_json
    end
  end

  post '/blogs' do
    blog = Blog.new(
      title: params[:title],
      content: params[:content],
      cover: params[:cover],
      category_id: params[:category_id],
      author_id: params[:author_id]
    )

    if blog.save
      status 201
      return blog.to_json
    else
      status 422
      return { errors: blog.errors }.to_json
    end
  end

  post '/authors' do
    author = Author.new(
      name: params[:name],
      avatar: params[:avatar]
    )

    if author.save
      status 201
      return author.to_json
    else
      status 422
      return { errors: author.errors }.to_json
    end
  end

  post '/categories' do
    category = Category.new(name: params[:name])

    if params[:subcategories].present?
      subcategories = params[:subcategories].map do |subcat|
        Category.new(name: subcat)
      end

      category.subcategories = subcategories
    end

    if category.save
      status 201
      return category.to_json(include: :subcategories)
    else
      status 422
      return { errors: category.errors }.to_json
    end
  end


end
