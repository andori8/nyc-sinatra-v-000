class FiguresController < ApplicationController
  get '/figures' do
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"/figures/new"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if params[:title][:name]
      figure.titles << Title.find_or_create_by(params[:title])
    end
    if params[:landmark][:name]
      figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    if params[:title][:name]
      figure.titles << Title.find_or_create_by(params[:title])
    end
    if params[:landmark][:name]
      figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
