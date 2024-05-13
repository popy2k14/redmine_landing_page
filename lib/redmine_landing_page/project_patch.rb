module RedmineLandingPage
  module ProjectPatch
    def self.perform
      Project.class_eval do
        safe_attributes 'landing_page'
      end
    end
  end
end
