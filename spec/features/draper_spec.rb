require 'spec_helper'

feature "makup decorators" do
  scenario "can makup dates" do
    dummy = DummyModel.create!
    visit root_path
    expect(page).to have_text(I18n.l(dummy.created_at))
    expect(page).to have_text('Sim')
    expect(page).to have_text('Não')
  end
end
