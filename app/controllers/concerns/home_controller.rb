class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

    def index
      @videos = Video.all
    end

  end