class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

    def index
      @videos = Video.all.order(id: :desc)
    end

  end