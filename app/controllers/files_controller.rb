require 'googleauth'
require 'google/apis/drive_v3'

class FilesController < ApplicationController
  before_action :authenticate_user!

  def index
    #drive = Google::Apis::DriveV3::DriveService.new
    #scope = 'https://www.googleapis.com/auth/drive.file'
    #authorizer = Google::Auth::ServiceAccountCredentials.make_creds(json_key_io: File.open('redcross-tamu-cb178ccb27db.json'), scope: scope)
    #authorizer.fetch_access_token!
    #drive.authorization = authorizer
    #list_files = drive.list_files()
    #@result = drive.list_files(page_size: 10, fields: 'files(name,modified_time,web_view_link),next_page_token')
  end
end
