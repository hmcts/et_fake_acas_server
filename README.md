# Et Fake Acas Server

This gem is used either as part of a test suite to provide dummy ACAS services, or as a standalone rack application that can
be used during development etc...

## Installation

### If used as part of a test suite

Add this line to your application's Gemfile:

```ruby
gem 'et_fake_acas_server'
```

And then execute:

    $ bundle

### If used standalone

Or install it yourself as:

    $ gem install et_fake_acas_server

and run it using

```

et_fake_acas_server

```
## Usage

## Usage During Testing

The server is pre programmed to respond with all 4 of the different response types depending on the first
part of the certificate number requested.  The numbers after the slashes etc.. do not matter

These are as follows (note, the 'R' can also be 'NE' or 'MU')

R000200/18/68 - Returns a 'No Match'

R000300/18/68 - Returns a delayed (2 mins) valid certificate for error checking

R000500/18/68 - Returns an 'Internal Error'

R000100/18/68 - Returns a valid certificate

and anything else returns a 'Found' response

## Development

This has no test suite - nor is it supposed to have else we would be testing test code which seems over the top.
To prove it is working, use the api project (https://github.com/ministryofjustice/et_api) which uses it as part of
its test suite.

## Environment Variables

The following environment variables can be changed to alter the defaults

ACAS_PRIVATE_KEY_FILE
ET_PUBLIC_KEY_FILE

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/et_fake_acas_server.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
