# poker_hand_checker_sinatra

This is a Sinatra-based web application that evaluates and ranks poker hands.

## Getting Started

### Prerequisites

- Ruby
- Bundler (install via `gem install bundler`)

### Local Development

1. Run `bundle install` to install dependencies.
2. Run `rackup config.ru` to start the server.

Visit `http://localhost:9292` in your web browser to view the application.

## Usage

Enter a poker hand (e.g. "AH 2D 3C 4C 5D") into the form on the web page and click 'Check hand'. The application will return the name of a hand.

## Tests

- Run unit tests with `bundle exec rspec`.
- Check for linting and style issues with `bundle exec rubocop`.

## Process Thoughts

I believe that using Rails for such a small application would be overkill, I am therefore using Sinatra, to proceed incrementally, first working on the backend, and later on I will simply add a front end to it.

I'm using test driven development to build this app.

## Things I could have done differently if I had more time

More refactoring
