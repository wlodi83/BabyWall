# Copyright 2012 Mail Bypass, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

dir = File.dirname(__FILE__)

require 'rubygems'
require 'fakeweb'
require 'rr'
require 'json'

require "#{dir}/spec_core_extensions"
require "#{dir}/../lib/messagebus_ruby_api"


def json_valid_send
  json = <<JAVASCRIPT
{"statusCode":202,"statusMessage":"OK","statusTime":"2011-10-10T21:32:14.195Z","successCount":1,"failureCount":0,"results":[{"toEmail":"apitest1@messagebus.com","messageId":"51efcf00f38711e0a93640405cc99fee","messageStatus":0}]}
JAVASCRIPT
  json
end

def json_incomplete_results
  json = <<JAVASCRIPT
{"statusCode":202}
JAVASCRIPT
  json
end

def json_invalid_results
  json = <<JAVASCRIPT
GARBAGE_JSON
JAVASCRIPT
  json
end

def json_mailing_lists
  json = <<JAVASCRIPT
{"statusCode":200,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z","results":[{"name":"list_1","key":"51efcf00f38711e0a93640405cc99fee"}]}
JAVASCRIPT
  json
end

def json_mailing_list_create
  json = <<JAVASCRIPT
{"statusCode":201,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z","key":"51efcf00f38711e0a93640405cc99fee"}
JAVASCRIPT
  json
end

def json_unsubscribes
  json = <<JAVASCRIPT
{"statusCode":200,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z","results":[{"toEmail":"joe@example.com","time":"2011-10-10T21:32:14.195Z"}]}
JAVASCRIPT
  json
end

def json_delivery_errors
  json = <<JAVASCRIPT
{"statusCode":200,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z","results":[{"toEmail":"joe@example.com", "messageId":"62cf5460b7b0012e8cb440406818e8c7","time":"2011-10-10T21:32:14.195Z","DSNCode":"5.1.1"}]}
JAVASCRIPT
  json
end

def json_stats
  json = <<JAVASCRIPT
{"statusCode":200,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z","results":[{"date":"2011-09-01", "sent":10,"errors":2,"opens":3,"uniqueOpens":2,"clicks":0}]}
JAVASCRIPT
  json
end

def json_response_201
  json = <<JAVASCRIPT
{"statusCode":201,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z"}
JAVASCRIPT
  json
end

def json_response_200
  json = <<JAVASCRIPT
{"statusCode":200,"statusMessage":"","statusTime":"2011-10-10T21:32:14.195Z"}
JAVASCRIPT
  json
end
