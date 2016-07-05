class MigrateContent
  MODEL_CLASS = [Page, Project, Photo].freeze

  class << self
    def run
      MODEL_CLASS.each do |model_class|
        update_domains_for(model_class)
      end
    end

    private

    def update_domains_for(model_class)
      model_class.all.each do |model|
        model.update!(domain: model.user.domains.first)
      end
    end
  end
end
