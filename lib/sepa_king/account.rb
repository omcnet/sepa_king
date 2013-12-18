# encoding: utf-8
module SEPA
  class Account
    include ActiveModel::Validations
    extend Converter

    attr_accessor :name, :iban, :bic
    convert :name, :to => :text

    validates_length_of :name, :within => 1..70
    validates_with BICValidator, IBANValidator

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end
