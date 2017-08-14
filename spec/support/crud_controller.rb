shared_examples :crud_testing do
  let(:flash_message) { "#{controller.params[:controller].gsub("\/", '.')}.#{controller.params[:action]}.success" }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end

  describe '#edit' do
    let(:params) do
      {
        id: resource.id
      }
    end

    subject { get :edit, params: params }

    it { is_expected.to have_http_status(200) }
  end

  describe '#update' do
    subject { patch :update, params: resource_params }

    it 'update resource' do
      expect(subject).to redirect_to resource_path
      expect(assigns(:resource)).to eq resource

      expect(flash[:notice]).to eq I18n.t(flash_message)
      expect(resource.reload.public_send(resource_attributes[:name])).to eq resource_attributes[:value]
    end
  end

  describe '#create' do
    subject { post :create, params: resource_params }

    it 'create resource' do
      expect { subject }.to change { resource.class.count }.by(1)
      expect(flash[:notice]).to eq I18n.t(flash_message)

      expect(subject).to redirect_to resource_path
    end
  end

  describe '#destroy' do
    let(:params) do
      {
        id: resource.id,
      }
    end

    subject { delete :destroy, params: params }

    it 'delete resource' do
      expect { subject }.to change { resource.class.count }.by(-1)
      expect(flash[:notice]).to eq I18n.t(flash_message)

      expect(subject).to redirect_to resource_path
    end
  end
end
