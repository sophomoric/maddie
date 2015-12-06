require "rails_helper"

feature "User swaps page order" do
  scenario "User correctly swaps order" do
    user = create(:user)
    domain = create(:domain, user: user)
    set_host(domain.host)

    page1 = create(:page, user: user, order: 1)
    page2 = create(:page, user: user, order: 2)

    visit new_order_swap_path(as: user)

    select_order(page1, 2)
    select_order(page2, 1)
    click_button("Save Order swap")

    expect(page1.reload.order).to eq(2)
    expect(page2.reload.order).to eq(1)
    expect(page).to have_text("Order Swapped!")
  end

  scenario "Same order selected twice" do
    user = create(:user)
    domain = create(:domain, user: user)
    set_host(domain.host)

    page1 = create(:page, user: user, order: 1)
    page2 = create(:page, user: user, order: 2)

    visit new_order_swap_path(as: user)

    select_order(page1, 2)
    # page2 order remains 2 as well
    click_button("Save Order swap")

    expect(page1.reload.order).to eq(1)
    expect(page2.reload.order).to eq(2)
    expect(page).to have_text("Failed")

  end

  def select_order(page, order)
    find("#order_swap_#{page.id}").select(order)
  end
end
