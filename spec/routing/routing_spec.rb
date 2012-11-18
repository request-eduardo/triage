require 'spec_helper'

describe 'routes' do
  describe 'assignment routes' do
    it 'should route open assignments' do
      { get: '/assignments/open' }.should route_to({controller: 'requests', action: 'open_assignments'})
    end

    it 'should route closed assignments' do
      { :get => '/assignments/closed' }.should route_to({ :controller => 'requests', :action => 'closed_assignments' })
    end
  end

  describe 'request routes' do
    it 'should route request index' do
      { :get => '/requests' }.should route_to({ :controller => 'requests', :action => 'index' })
    end

    it 'should route new request' do
      { :get => '/requests/new' }.should route_to({ :controller => 'requests', :action => 'new' })
    end  

    it 'should route create request' do
      { :post => '/requests' }.should route_to({ :controller => 'requests', :action => 'create' })
    end  

    it 'should route show request' do
      { :get => '/requests/1' }.should route_to({ :controller => 'requests', :action => 'show', :id => '1' })
    end

    it 'should route edit request' do
      { :get => '/requests/1/edit' }.should route_to({ :controller => 'requests', :action => 'edit', :id => '1' })
    end

    it 'should route update request' do
      { :put => '/requests/1' }.should route_to({ :controller => 'requests', :action => 'update', :id => '1' })
    end

    it 'should route destroy request' do
      { :delete => '/requests/1' }.should route_to({ :controller => 'requests', :action => 'destroy', :id => '1' })
    end

    it 'should route open requests' do
      { :get => '/requests/open' }.should route_to({ :controller => 'requests', :action => 'open' })
    end

    it 'should route closed requests' do
      { :get => '/requests/closed' }.should route_to({ :controller => 'requests', :action => 'closed' })
    end

    it 'should route unassigned requests' do
      { :get => '/requests/unassigned' }.should route_to({ :controller => 'requests', :action => 'unassigned' })
    end

    it 'should route create request comment' do
      { :post => '/requests/1/comments' }.should route_to({ :controller => 'comments', :action => 'create', :request_id => '1' })
    end

    it 'should route create request attachment' do
      { :post => '/requests/1/attachments' }.should route_to({ :controller => 'attachments', :action => 'create', :request_id => '1' })  
    end  

    it 'should route destroy request attachment' do
      { :delete => '/requests/1/attachments/1' }.should route_to({ :controller => 'attachments', :action => 'destroy', :request_id => '1', :id => '1' })  
    end 
  end
end