class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    response = parser(params['file'].tempfile).process
    render json: response, status: 200
  end

  private

  def parser(file)
    @parser ||= Parsers::EmlParser.new(file)
  end
end