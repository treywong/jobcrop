class Booking < ApplicationRecord
	mount_uploader :files, FilesUploader
	belongs_to :jobhunter
	belongs_to :job
end
