require 'rails_helper'

RSpec.describe Admin::Settings::CitiesController, type: :routing do

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/settings/cities').to route_to('admin/settings/cities#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/settings/cities/new').to route_to('admin/settings/cities#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/settings/cities/1').to
      route_to('admin/settings/cities#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/settings/cities/1/edit').to route_to('admin/settings/cities#edit', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/admin/settings/cities').to route_to('admin/settings/cities#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/settings/cities/1').to route_to('admin/settings/cities#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/settings/cities/1').to route_to('admin/settings/cities#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/settings/cities/1').to route_to('admin/settings/cities#destroy', id: '1')
    end
  end
end
