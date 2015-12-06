require "rails_helper"

describe OrderSwap do
  describe ".save" do
    it "returns true when it swaps orders successfully" do
      user = create(:user)
      page1 = create(:page, user: user, order: 1)
      page2 = create(:page, user: user, order: 2)
      swap_params = { page1.id => page2.order, page2.id => page1.order }

      order_swap = OrderSwap.new(swap_params, user)

      expect(order_swap.save).to eq(true)
      expect(page1.reload.order).to eq(2)
      expect(page2.reload.order).to eq(1)
    end

    it "handles bad data" do
      user = create(:user)
      page1 = create(:page, user: user, order: 1)
      page2 = create(:page, user: user, order: 2)
      swap_params = { page1.id => 3, page2.id => 3 }

      order_swap = OrderSwap.new(swap_params, user)

      expect(order_swap.save).to eq(false)
      expect(page1.reload.order).to eq(1)
      expect(page2.reload.order).to eq(2)
    end
  end
end
