require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:board) { create(:board) }
  let(:default_locale) { I18n.default_locale }
  let(:params) { { locale: I18n.default_locale, board_id: board.id } }
  let(:post) { build(:post) }


  describe 'GET new' do
    before { get :new, params: params }

    it { is_expected.to render_template(:new) }
    it { is_expected.to route(:get, "/#{default_locale}/boards/#{board.id}/posts/new")
                        .to(action: :new,
                            locale: default_locale,
                            board_id: board.id) }
  end
end
