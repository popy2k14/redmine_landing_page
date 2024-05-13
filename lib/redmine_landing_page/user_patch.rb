module RedmineLandingPage
    module UserPatch
    def self.perform
      User.class_eval do
        safe_attributes 'landing_page'
      end
    end
  end
end
