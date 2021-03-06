require 'spec_helper'

describe SmtpSender do

  let(:config) { Factories.parameters }

  let(:message) {
    {
      'store_id' => '123229227575e4645c000001',
      'message_id' => 'abc',
      "message" => "notification:info",
      'payload' => Factories.notification.merge('parameters' => config)
    }
  }

  it "set's the correct via_options from config" do
    sender = SmtpSender.new(message,config)
    sender.via_options[:address].should eql "smtp.mandrillapp.com"
    sender.mail_options[:bcc].should eql 'me+bcc@me.com'
    sender.mail_options[:subject].should eql "[INFO] order has been imported"
  end

end