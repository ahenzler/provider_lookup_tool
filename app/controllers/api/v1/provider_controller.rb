require 'will_paginate/array'
class Api::V1::ProviderController < ApplicationController
  def search
  end

  def results
    result_array = ProviderFacade.provider(provider_params[:first_name], provider_params[:last_name], provider_params[:state_initials], provider_params[:specialty])
    @providers = result_array.paginate(page: params[:page], per_page: 20)
  end

  private
  def provider_params
    params.permit(:first_name, :last_name, :state_initials, :specialty)
  end
end