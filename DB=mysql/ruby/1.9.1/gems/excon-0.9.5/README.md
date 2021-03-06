excon
=====

Http(s) EXtended CONnections

[![Build Status](https://secure.travis-ci.org/geemus/excon.png)](http://travis-ci.org/geemus/excon)
[![Dependency Status](https://gemnasium.com/geemus/excon.png)](https://gemnasium.com/geemus/excon)

Getting Started
---------------

Install the gem.

    $ sudo gem install excon

Require with rubygems.

    require 'rubygems'
    require 'excon'

The simplest way to use excon is with one-off requests:

    response = Excon.get('http://geemus.com')

Supported one-off request methods are #connect, #delete, #get, #head, #options, #post, #put, and #trace.

The returned response object has #body, #headers and #status attributes.

Alternately you can create a connection object which is reusable across multiple requests (more performant!).

    connection = Excon.new('http://geemus.com')
    response_one = connection.get
    response_two = connection.post(:path => '/foo')
    response_three = connection.delete(:path => '/bar')

Sometimes it is more convenient to specify the request type as an argument:

    response_four = connection.request(:method => :get, :path => '/more')

Both one-off and persistent connections support many other options. Here are a few common examples:

    # Custom headers
    Excon.get('http://geemus.com', :headers => {'Authorization' => 'Basic 0123456789ABCDEF'})
    connection.get(:headers => {'Authorization' => 'Basic 0123456789ABCDEF'})

    # Changing query strings
    connection = Excon.new('http://geemus.com/')
    connection.get(:query => {:foo => 'bar'})

    # POST body
    Excon.post('http://geemus.com', :body => 'language=ruby&class=fog')

    # request accepts either symbols or strings
    connection.request(:method => :get)
    connection.request(:method => 'GET')

These options can be combined to make pretty much any request you might need.

Streaming Responses
-------------------

You can stream responses by passing a block that will receive each chunk.

    Excon.get('http://geemus.com') do |chunk, remaining_bytes, total_bytes|
      puts chunk
      puts "Remaining: #{remaining_bytes.to_f / total_bytes}%"
    end

Iterating over each chunk will allow you to do work on the response incrementally without buffering the entire response first. For very large responses this can lead to significant memory savings.

Proxy Support
-------------

You can specify a proxy URL that Excon will use with both HTTP and HTTPS connections:

    connection = Excon.new('http://geemus.com', :proxy => 'http://my.proxy:3128')
    connection.request(:method => 'GET')

The proxy URL must be fully specified, including scheme (e.g. "http://") and port. 

Proxy support must be set when establishing a connection object and cannot be overridden in individual requests. Because of this it is unavailable in one-off requests (Excon.get, etc.)

NOTE: Excon will use the environment variables `http_proxy` and `https_proxy` if they are present. If these variables are set they will take precedence over a :proxy option specified in code. If "https_proxy" is not set, the value of "http_proxy" will be used for both HTTP and HTTPS connections.

Stubs
-----

You can stub out requests for testing purposes by enabling mock mode on a connection.

    connection = Excon.new('http://example.com', :mock => true)

Or by enabling mock mode for a request.

    connection.request(:method => :get, :path => 'example', :mock => true)

Then you can add stubs, for instance:

    # Excon.stub(request_attributes, response_attributes)
    Excon.stub({:method => :get}, {:body => 'body', :status => 200})

Omitted attributes are assumed to match, so this stub will match any get request and return an Excon::Response with a body of 'body' and status of 200.  You can add whatever stubs you might like this way and they will be checked against in the order they were added, if none of them match then excon will raise an error to let you know.

Alternatively you can pass a block instead of `response_attributes` and it will be called with the request params.  For example, you could create a stub that echoes the body given to it like this:

    # Excon.stub(request_attributes, &response_block)
    Excon.stub({:method => :put}) do |params|
      {:body => params[:body], :status => 200}
    end

HTTPS/SSL Issues
----------------

By default excon will try to verify peer certificates when using SSL for HTTPS. Unfortunately on some operating systems the defaults will not work. This will likely manifest itself as something like `Excon::Errors::SocketError: SSL_connect returned=1 ...`

If you have the misfortune of running into this problem you have a couple options. If you have certificates but they aren't being auto-discovered, you can specify the path to your certificates:

    Excon.ssl_ca_path = '/path/to/certs'

Failing that, you can turn off peer verification (less secure):

    Excon.ssl_verify_peer = false

Either of these should allow you to work around the socket error and continue with your work.

Copyright
---------

(The MIT License)

Copyright (c) 2010-2011 {geemus (Wesley Beary)}[http://github.com/geemus]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
