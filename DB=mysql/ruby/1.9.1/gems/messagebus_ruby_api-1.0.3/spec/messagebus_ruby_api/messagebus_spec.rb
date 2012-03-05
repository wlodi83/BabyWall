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
require "#{dir}/../spec_helper"

class MessagebusTest < MessagebusApi::Messagebus
  attr_accessor :last_init_time
end

describe MessagebusApi::Messagebus do
  attr_reader :client, :api_key, :required_params

  def default_message_params
    {:toEmail => 'apitest1@messagebus.com',
     :toName => 'EmailUser',
     :fromEmail => 'api@messagebus.com',
     :fromName => 'API',
     :subject => 'Unit Test Message',
     :customHeaders => ["sender"=>"apitest1@messagebus.com"],
     :plaintextBody => 'This message is only a test sent by the Ruby Message Bus client library.',
     :htmlBody => "<html><body>This message is only a test sent by the Ruby Message Bus client library.</body></html>",
     :tags => ['RUBY', 'Unit Test Ruby']
    }
  end

  def default_template_message_params
    {:toEmail => 'apitest1@messagebus.com',
     :toName => 'John Smith',
     :templateKey => '66f6181bcb4cff4cd38fbc804a036db6',
     :customHeaders => ["reply-to"=>"apitest1@messagebus.com"],
     :mergeFields => ["%NAME%" => "John"]
    }
  end

  def create_success_result(num_result)
    list=[]
    num_result.times do
      list << @success_message
    end

    success_result = {
      "statusMessage" => "OK",
      "successCount" => num_result,
      "failureCount" => 0,
      "results" => list
    }
    success_result
  end

  def create_results_array
    results = {
      "statusMessage" => "OK",
      "results" => []
    }
    results
  end

  def json_parse(data)
    JSON.parse(data, :symbolize_names => true)
  end

  before do
    FakeWeb.allow_net_connect = false

    @api_key = "7215ee9c7d9dc229d2921a40e899ec5f"
    @client = MessagebusTest.new(@api_key)
    @success_message={
      "status" => 200,
      "messageId" => "abcdefghijklmnopqrstuvwxyz012345"
    }
    @simple_success_result = create_success_result(1)
  end

  describe "messagebus object set up correctly" do
    it "has correct headers set for api calls" do
      client = MessagebusApi::Messagebus.new(@api_key)
    end
  end

  describe "add cacert file to http communitcations" do
    it "raises error if cert file does not exist" do
      client = MessagebusApi::Messagebus.new(@api_key)
      cert_file_path = File.join(File.dirname(__FILE__), "nofile.pem")
      expect do
        client.cacert_info(cert_file_path)
      end.should raise_error
    end

    it "accepts a cert file that exists" do
      client = MessagebusApi::Messagebus.new(@api_key)
      cert_file_path = File.join(File.dirname(__FILE__), "cacert.pem")
      expect do
        client.cacert_info(cert_file_path)
      end.should_not raise_error
    end
  end

  describe "#add_message" do
    it "buffered send that adds to empty buffer" do
      client.add_message(default_message_params)
      client.flushed?.should be_false
    end

    it "buffered send that adds to empty buffer and sends with flush_buffer flag" do
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => json_valid_send)
      client.add_message(default_message_params, true)
      client.flushed?.should be_true
    end

    it "should have user-agent and x-messagebus-key set in request headers" do
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => json_valid_send)
      client.add_message(default_message_params, true)
      client.flushed?.should be_true

      FakeWeb.last_request.get_fields("X-MessageBus-Key").should_not be_nil
      FakeWeb.last_request.get_fields("User-Agent").should_not be_nil
      FakeWeb.last_request.get_fields("Content-Type").should_not be_nil
    end

    it "buffered send that adds to a buffer and auto-flushes" do
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => create_success_result(client.message_buffer_size).to_json)
      (client.message_buffer_size-1).times do |idx|
        client.add_message(default_message_params)
        client.flushed?.should be_false
      end
      client.add_message(default_message_params)
      client.flushed?.should be_true
      client.results[:results].size.should == client.message_buffer_size
    end

    it "buffered send that adds templates to a buffer and auto-flushes" do
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/templates/send", :body => create_success_result(client.message_buffer_size).to_json)
      (client.message_buffer_size-1).times do |idx|
        client.add_message(default_template_message_params)
        client.flushed?.should be_false
      end
      client.add_message(default_template_message_params)
      client.flushed?.should be_true
      client.results[:results].size.should == client.message_buffer_size
    end
  end

  describe "#flush" do
    it "flush called on empty buffer" do
      client.flush
      client.flushed?.should be_false
    end

    it "flush called on partially filled buffer" do
      message_count = 9
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => create_success_result(message_count).to_json)
      (message_count).times do |idx|
        client.add_message(default_message_params)
        client.flushed?.should be_false
      end
      client.flush
      client.flushed?.should be_true
      client.results[:results].size.should == message_count
    end

    it "doesnt reset connection if under a minute old" do
      current_init_time=client.last_init_time
      current_init_time.should be > Time.now.utc-5
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => create_success_result(1).to_json)
      client.add_message(default_message_params)
      client.flush
      client.flushed?.should be_true
      client.results[:results].size.should == 1
      client.last_init_time.should == current_init_time
    end

    it "resets connection if over a minute old" do
      client.last_init_time=Time.now.utc-60
      current_init_time=client.last_init_time
      current_init_time.should be < Time.now.utc-59
      FakeWeb.register_uri(:post, "https://api.messagebus.com/api/v3/emails/send", :body => create_success_result(1).to_json)
      client.add_message(default_message_params)
      client.flush
      client.flushed?.should be_true
      client.results[:results].size.should == 1
      client.last_init_time.should be > current_init_time
    end
  end

  describe "#message_buffer_size=" do
    it "can set the buffer size" do
      client.message_buffer_size=(10)
      client.message_buffer_size.should == 10
    end

    it "cannot set an invalid buffer size" do
      default_buffer_size = 20
      client.message_buffer_size=(-1)
      client.message_buffer_size.should == default_buffer_size

      client.message_buffer_size=(0)
      client.message_buffer_size.should == default_buffer_size

      client.message_buffer_size=(101)
      client.message_buffer_size.should == default_buffer_size

      client.message_buffer_size=(1)
      client.message_buffer_size.should == 1

      client.message_buffer_size=(100)
      client.message_buffer_size.should == 100
    end
  end

  describe "#delivery_errors" do
    it "request delivery errors list" do

      start_date_str="2011-01-01"
      end_date_str="2011-01-02"

      FakeWeb.register_uri(:get, "https://api.messagebus.com/api/v3/delivery_errors?startDate=#{start_date_str}&endDate=#{end_date_str}&tag=", :body => json_delivery_errors)
      expect do
        response = client.delivery_errors(start_date_str, end_date_str)
        FakeWeb.last_request.body.should be_nil
        response.should == json_parse(json_delivery_errors)
      end.should_not raise_error
    end
  end

  describe "#unsubscribes" do
    it "request blocked emails list" do

      start_date_str="2011-01-01T04:30:00+00:00"
      end_date_str="2011-01-02T04:30:00+00:00"

      expected_request="https://api.messagebus.com/api/v3/unsubscribes?startDate=#{URI.escape(start_date_str)}&endDate=#{URI.escape(end_date_str)}"

      FakeWeb.register_uri(:get, expected_request, :body => json_unsubscribes)
      expect do
        response = client.unsubscribes(start_date_str, end_date_str)
        FakeWeb.last_request.body.should be_nil
        response.should == json_parse(json_unsubscribes)
      end.should_not raise_error
    end
  end

  describe "#delete_mailing_list_entry" do
    it "remove from mailing list" do
      mailing_list_key="test_key"
      to_email="test@example.com"

      expected_request="https://api.messagebus.com/api/v3/mailing_list/test_key/entry/test@example.com"

      FakeWeb.register_uri(:delete, expected_request, :body => json_response_200)
      expect do
        response = client.delete_mailing_list_entry(mailing_list_key, to_email)
        FakeWeb.last_request.body.should be_nil
        response[:statusCode].should == 200
      end.should_not raise_error

    end
  end

  describe "#add_mailing_list_entry" do
    it "add to mailing list" do
      mailing_list_key="test_key"
      merge_fields={"%EMAIL%"=>"test@example.com", "%PARAM1%"=>"test value"}
      expected_request="https://api.messagebus.com/api/v3/mailing_list/test_key/entries"

      FakeWeb.register_uri(:post, expected_request, :body => json_response_200)
      expect do
        response = client.add_mailing_list_entry(mailing_list_key, merge_fields)
        FakeWeb.last_request.body.should =~ /mergeField/
        response[:statusCode].should == 200
      end.should_not raise_error

    end
  end

  describe "#mailing_lists" do
    it "get mailing lists" do
      expected_request="https://api.messagebus.com/api/v3/mailing_lists"

      FakeWeb.register_uri(:get, expected_request, :body => json_mailing_lists)
      expect do
        response = client.mailing_lists
        response.should == json_parse(json_mailing_lists)
      end.should_not raise_error
    end
  end

  describe "#create_mailing_lists" do
    it "create a new mailing list" do
      expected_request="https://api.messagebus.com/api/v3/mailing_lists"

      FakeWeb.register_uri(:post, expected_request, :body => json_mailing_list_create)
      expect do
        response = client.create_mailing_lists("Test List", ["%EMAIL%", "%SOME_TOKEN%"])
        response.should == json_parse(json_mailing_list_create)
      end.should_not raise_error
    end
  end

  describe "#stats" do
    it "stats" do
      start_date_str="2011-01-01"
      end_date_str="2011-01-02"

      expected_request="https://api.messagebus.com/api/v3/stats?startDate=#{start_date_str}&endDate=#{end_date_str}&tag="

      FakeWeb.register_uri(:get, expected_request, :body => json_stats)
      expect do
        response = client.stats(start_date_str, end_date_str)
        response.should == json_parse(json_stats)
      end.should_not raise_error
    end
  end

  describe "#format_iso_time" do
    it "formats ISO time in format YYYY-MM-DDTHH:mm:ssZ" do
      client.format_iso_time(Time.now).should =~ /2\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ/
    end
  end


end

