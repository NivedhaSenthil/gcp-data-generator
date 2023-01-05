#
# Autogenerated by Thrift Compiler (0.17.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module PhoneType
  MOBILE = 0
  HOME = 1
  WORK = 2
  VALUE_MAP = {0 => "MOBILE", 1 => "HOME", 2 => "WORK"}
  VALID_VALUES = Set.new([MOBILE, HOME, WORK]).freeze
end

class Name; end

class Phone; end

class Person; end

class PhoneBook; end

class Name
  include ::Thrift::Struct, ::Thrift::Struct_Union
  FIRSTNAME = 1
  LASTNAME = 2

  FIELDS = {
    FIRSTNAME => {:type => ::Thrift::Types::STRING, :name => 'firstName'},
    LASTNAME => {:type => ::Thrift::Types::STRING, :name => 'lastName'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class Phone
  include ::Thrift::Struct, ::Thrift::Struct_Union
  TYPE = 1
  NUMBER = 2

  FIELDS = {
    TYPE => {:type => ::Thrift::Types::I32, :name => 'type', :default =>     0, :enum_class => ::PhoneType},
    NUMBER => {:type => ::Thrift::Types::I32, :name => 'number'}
  }

  def struct_fields; FIELDS; end

  def validate
    unless @type.nil? || ::PhoneType::VALID_VALUES.include?(@type)
      raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Invalid value of field type!')
    end
  end

  ::Thrift::Struct.generate_accessors self
end

class Person
  include ::Thrift::Struct, ::Thrift::Struct_Union
  NAME = 1
  PHONES = 2

  FIELDS = {
    NAME => {:type => ::Thrift::Types::STRUCT, :name => 'name', :class => ::Name},
    PHONES => {:type => ::Thrift::Types::LIST, :name => 'phones', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Phone}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end

class PhoneBook
  include ::Thrift::Struct, ::Thrift::Struct_Union
  PEOPLE = 1

  FIELDS = {
    PEOPLE => {:type => ::Thrift::Types::LIST, :name => 'people', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Person}}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end
