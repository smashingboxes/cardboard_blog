# Cardboard Blog

## Usage

```ruby
#Gemfile
gem 'cardboard_cms', git: 'git@github.com:smashingboxes/cardboard.git'
gem 'cardboard_blog', git: 'git@github.com:smashingboxes/cardboard_blog.git'

```

```bash
rake cardboard_blog:install:migrations
rake db:migrate
```

Then in your `cardboard.css.scss` add
```css
@import "cardboard/blog";
```

### Statistics
We provide hooks for `impressionist` gem
```
rails g impressionist
rake db:migrate
```
Then in your blog controller
```ruby
def show
  @post = Cardboard::Blog::Post.find(params[:id])
  impressionist(@post)
end
```


This project rocks and uses MIT-LICENSE.