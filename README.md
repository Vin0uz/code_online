
# CodeOnline

A simple browser-based API to GS1 codeonline platform.

Instead of manually create all your eans, using codeonline.fr webpage,
you can now do it with a couple of line of code.

#### ⚠️ Warning ⚠️
This gem isn't related to GS1 teams, so it's by definition quite fragile.


## Installation

To use it in Rails, add this line to your application's Gemfile

```ruby
gem "code_online"
```

To use it in a usual ruby environment, you can simply
```ruby
gem install "code_online"
```

## Usage

```ruby
require "code_online"

client = CodeOnline::Client.new(email: "youremail@foo.bar", password: "unbreakable-password")
> "Connected to codeonline ✅"
ean = client.create_ean(product_name: "My Cool product", weight: "50")
> "3701492718516"
```


## How it works ?

It's simply copying what you'd do if you were going to the web interface.

_This makes it quite fragile because the web page can change anyday.._



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are always welcome! Feel free to open issues or pull requests 🙏

_If you notice any security issue, please reach outbefore opening a public issue_
