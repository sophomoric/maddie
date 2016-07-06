class OrderSwap
  def initialize(params, domain)
    @params = params
    @domain = domain
  end

  def save
    result = true
    Page.transaction(requires_new: true) do
      begin
        pages.update_all(order: -1)
        params.each do |id, order|
          page = pages.find(id)
          page.order = order
          page.save!
        end
      rescue ActiveRecord::RecordInvalid
        result = false
        raise ActiveRecord::Rollback
      end
    end
    result
  end

  private

  def pages
    @_pages ||= domain.pages.where(id: params.keys)
  end

  attr_reader :params, :domain
end
