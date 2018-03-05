module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action do
      authorize! :manage, :all
    end
  end
end