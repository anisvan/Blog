class Admin::PostsController < Admin::AdminController
	
	

	before_action :set_post, only: [ :edit, :update, :destroy]



	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, info: 'Статья успешно создана'
		else
			render :new, danger: 'Статья не создана'
		end
	end

	def edit
		
	end

	def update
		
		if @post.update(post_params)
			
			redirect_to @post,  success: 'Статья успешно обновлена'

		else
			render :edit, danger: 'Статья не обновлена'
		end
	end

	def destroy
		
		@post.destroy
		redirect_to posts_path, success: 'Статья успешно удалена'
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :summary, :body, :image, :content,:all_tags)
	end
end