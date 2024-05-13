module RedmineLandingPage
    module WelcomeControllerPatch
    def self.perform
      WelcomeController.class_eval do
        alias_method :index_without_landing_page, :index unless method_defined? :index_without_landing_page

        def index
          if User.current.logged? &&
             User.current.landing_page &&
             !User.current.landing_page.empty?
            redirect_to User.current.landing_page, status: 302
          else
            index_without_landing_page
          end
        end
      end
    end
  end
end
