require 'sinatra'
require 'json'

buildings = [
    {"id" => "freedom-tower", "name"=> "Freedom Tower", "top" => "1268", "tip" => "1776"},
    {"id" => "burj-khalifa", "name" => "Burj Khalifa", "top" => "1918", "tip" => "2722"}
]

get "/" do
    erb :index, :locals => {:buildings => buildings}
end

get "/building/:id.json" do
    content_type 'application/json'
    building = buildings.select { |b| b["id"] == params[:id]}.first
    {"stats" => [
        {"item" =>"top", "number"=> building["top"], "heading" => "Top Floor: "},
        {"item" =>"tip", "number"=> building["tip"], "heading" => "Tip: "}
        ]
    }.to_json
end

get "/building/:id" do
    building = buildings.select { |b| b["id"] == params[:id]}.first
    erb :building, :locals => {:building => building}
end


