require 'rails_helper'

RSpec.describe Employee::BillsController, type: :routing do

  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/employee/bills').to route_to('employee/bills#index')
    end

    it 'routes to #new' do
      expect(get: '/employee/bills/new').to route_to('employee/bills#new')
    end

    it 'routes to #show' do
      expect(get: '/employee/bills/1').to route_to('employee/bills#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/employee/bills/1/edit').to route_to('employee/bills#edit', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/employee/bills').to route_to('employee/bills#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/employee/bills/1').to route_to('employee/bills#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/employee/bills/1').to route_to('employee/bills#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/employee/bills/1').to route_to('employee/bills#destroy', id: '1')
    end
  end
end
