require 'spec_helper'

RSpec.describe SimpleAdminHelper, type: :helper do
  describe '#resource_link' do
    context 'when core resource' do
      context 'when post resource' do
        let(:resource_builded) { build :post }
        let(:resource_created) { create :post }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :new)).to eq '/admin/posts/new'
          expect(resource_link(resource_builded, :create)).to eq '/admin/posts'

          expect(resource_link(resource_created, :edit)).to eq '/admin/posts/1/edit'
          expect(resource_link(resource_created, :update)).to eq '/admin/posts/1'
          expect(resource_link(resource_created, :destroy)).to eq '/admin/posts/1'
        end
      end

      context 'when category resource' do
        let(:resource_builded) { build :category }
        let(:resource_created) { create :category }

        it 'return resource paths' do
          expect(resource_link(resource_builded, :new)).to eq '/admin/categories/new'
          expect(resource_link(resource_builded, :create)).to eq '/admin/categories'

          expect(resource_link(resource_created, :edit)).to eq '/admin/categories/1/edit'
          expect(resource_link(resource_created, :update)).to eq '/admin/categories/1'
          expect(resource_link(resource_created, :destroy)).to eq '/admin/categories/1'
        end
      end
    end
  end

  # describe '#resource_collection_title' do
  #   let(:entity) { create :entity }
  #
  #   subject { resource_collection_title(entity) }
  #
  #   it { expect(subject).to eq "simple_admin.admin.posts.index.title" }
  # end
  #
  # describe '#resource_collection_link' do
  #   let(:entity) { create :entity }
  #   let(:locale) { { locale: :en } }
  #
  #   subject { resource_collection_link(entity, locale) }
  #
  #   it { expect(subject).to eq admin_posts_path(locale) }
  # end
  #
  # describe '#resource_active_link' do
  #   let(:resource_link) { admin_posts_path(locale) }
  #   let(:locale) { { locale: :en } }
  #
  #   before { allow_any_instance_of(SimpleAdminHelper).to receive(:url_for).and_return(admin_posts_path(locale)) }
  #
  #   subject { resource_active_link(resource_link) }
  #
  #   it { expect(subject).to eq 'nav-group__open' }
  #
  #   context 'when not active' do
  #     let(:resource_link) { admin_widgets_path(locale) }
  #
  #     it { expect(subject).to eq '' }
  #   end
  # end
end
