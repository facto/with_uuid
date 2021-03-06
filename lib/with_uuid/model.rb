require "active_support/concern"

module WithUuid
  module Model

	  extend ActiveSupport::Concern

	  included do

      self.primary_key = :id

      before_validation :set_id
      before_create     :set_id

	  end

    def set_id
      return unless id.blank?

      # Assign generated COMBination GUID to #id
      write_attribute( :id, WithUuid::CombUuid.uuid.to_s )
    end

  end
end
