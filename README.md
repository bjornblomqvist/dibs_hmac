# dibs_hmac

An implementation of DIBS Message authentication code. Has correct sorting and rules for which params to include. So far it only includes the params for DIBS Payment Window. This is production ready. I am curently using it for a Webshop.

- http://tech.dibs.dk/integration_methods/dibs_payment_window/parameters/
- http://tech.dibs.dk/integration_methods/dibs_payment_window/return_pages/

If you find this useful please tell me in an email.

## Code example

### Calculate mac

    mac = DIBS::HMAC.calculate(data, Rails.application.config.dibs_hmac_key)

### Validate response from DIBS

    raise "INVALID REQUEST" unless DIBS::HMAC.valid?(params, Rails.application.config.dibs_hmac_key)
    

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

