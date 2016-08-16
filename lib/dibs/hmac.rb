require 'openssl'

module DIBS
  class HMAC
  
    # Params taken from the below urls. 2013-10-17
    # http://tech.dibs.dk/integration_methods/dibs_payment_window/parameters/
    # http://tech.dibs.dk/integration_methods/dibs_payment_window/return_pages/
    # 
    DIBS_PARAM_NAMES = %{
      currency
      merchant
      amount
      orderId
      acceptReturnUrl
      oiTypes
      oiNames
      billingFirstName
      billingLastName
      billingAddress
      billingAddress2
      billingPostalCode
      billingPostalPlace
      billingEmail
      billingMobile
      cancelReturnUrl
      callbackUrl
      language
      addFee
      payType
      capturenow
      shippingFirstName
      shippingLastName
      shippingAddress
      shippingAddress2
      shippingPostalCode
      shippingPostalPlace
      socialSecurityNumber
      createTicket
      createTicketAndAuth
      test
      account
      status
      amount
      currency
      transaction
      transactionId
      actionCode
      acquirer
      cardNumberMasked
      expMonth
      expYear
      cardTypeName
      captureStatus
      status3D
      ECI
      enrollStatus
      xidPresent
      ticket
      ticketStatus
      fee
      verificationIdPresent
      validationErrors
      acquirerOrderId
      acquirerCustomerId
      acquirerFirstName
      acquirerLastName
      acquirerDeliveryAddress
      acquirerDeliveryPostalCode
      acquirerDeliveryPostalPlace
      acquirerDeliveryCountryCode
      expandOrderInformation
      ticketId
      merchantId
    }.strip.split("\n").map {|name| name.strip }


    def self.calculate(params, key)
      param_string = ""
      params.keys.sort.each do |key|
        if DIBS_PARAM_NAMES.include?(key.to_s) || key.to_s.start_with?("s_") || key.to_s.match(/oiRow[0-9]+/)
          value = params[key]
          param_string += "&" if param_string.length > 0
          param_string += "#{key}=#{value}"
        end
      end
    
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'),Array(key).pack('H*'), param_string)
    end
  
    def self.valid?(params, key)
      params['MAC'] || params[:MAC] == calculate(params, key)
    end
  
  end
end
