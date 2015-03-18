# Omniauth::Studentbeans

Student Beans OAuth2 strategy for OmniAuth

## Installation

Add this line to your application's Gemfile:

```rubygems
gem 'omniauth-studentbeans'
```

or

```github
gem 'omniauth-studentbeans', git: 'https://github.com/thebeansgroup/omniauth-studentbeans'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-studentbeans

## Usage

`OmniAuth::Strategies::Studentbeans` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in config/initializers/omniauth.rb:

```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :studentbeans, ENV['STUDENTBEANS_KEY'], ENV['STUDENTBEANS_SECRET']
end
```
