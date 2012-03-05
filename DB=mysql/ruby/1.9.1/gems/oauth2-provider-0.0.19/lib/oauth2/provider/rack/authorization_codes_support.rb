module OAuth2::Provider::Rack::AuthorizationCodesSupport
  protected

  def oauth2_authorization_request
    request.env['oauth2.authorization_request'] ||= OAuth2::Provider::Rack::AuthorizationCodeRequest.new(request.params)
  end

  def block_invalid_authorization_code_requests
    oauth2_authorization_request
  end

  def regrant_existing_authorizations
    oauth2_authorization_request.grant_existing!
  end

  def grant_authorization_code(resource_owner = nil, authorization_expires_at = nil)
    oauth2_authorization_request.grant! resource_owner, authorization_expires_at
  end

  def deny_authorization_code
    oauth2_authorization_request.deny!
  end

  def declare_oauth_scope_invalid
    oauth2_authorization_request.invalid_scope!
  end
end