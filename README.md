# dibs_hmac

An implementation of DIBS Message authentication code. Has correct sorting and rules for which params to include. So far it only includes the params for DIBS Payment Window. This is production ready. I am curently using it for a Webshop.

- http://tech.dibs.dk/integration_methods/dibs_payment_window/parameters/
- http://tech.dibs.dk/integration_methods/dibs_payment_window/return_pages/

If you find this useful please tell me in an email.

## Short changelog

**0.1.3 (2015-08-24)**

- Remove deprecation warnings and added support for newer ruby versions.

## Code example

### Calculate mac

```ruby
dibs_params = {:amount => "100", :merchant => "2222", ....}

mac = DIBS::HMAC.calculate(dibs_params, Rails.application.config.dibs_hmac_key)
```
### Validate response from DIBS
```ruby
raise "INVALID REQUEST" unless DIBS::HMAC.valid?(params, Rails.application.config.dibs_hmac_key)
``` 

## Contributing to dibs_hmac
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

## Copyright

Copyright (c) 2013 Björn Blomqvist. See LICENSE.txt for
further details.

