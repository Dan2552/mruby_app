# mruby app

A CLI tool for using Ruby (mruby) code as a project.

This is an early version of work in progress. This tool currently supports:
* Running your mruby code in debug mode.

Further (not currently supported) plans:
* Run in distrubution mode (debug off)
* Build / package distribution
* Multi-platform support (e.g. command to package an iOS application that can be opened in Xcode, command to run in iOS simulator)

## Setup

Note: These steps will include steps for using [Mundler](https://github.com/Dan2552/mundler). This is not strictly required, but is the intended use.

Populate in `app/main.rb`:
``` ruby
def main
  puts "hello world"
end
```

Populate your `Gemfile` and run `bundle install`:

``` ruby
gem "mruby_app"
gem "mundler"
```

Populate your `Mundlefile` and run `mundle install`:

``` ruby
mruby tag: "3.0.0"

gembox "default"
```

## Usage

``` bash
# Start your application (in debug)
bundle exec mapp start # or bundle exec mapp s
```
