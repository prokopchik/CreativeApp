class Picture < ActiveRecord::Base
	belongs_to :creative, :inverse_of  => :pictures

	mount_uploader :file, FileUploader

	def to_jq_upload
	  {
	    "name" => read_attribute(:file),
	    "size" => file.size,
	    "url" => file.url,
	    "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
	    "delete_type" => "DELETE"
	  }
	end
	def to_jq_download
	  {
	    "name" => read_attribute(:file),
	    "size" => file.size,
	    "thumbnail_url" => file.url,
	    "delete_url" => "/creatives/#{creative_id}/pictures/#{id}",
	    "delete_type" => "DELETE"
	  }
	end
end
