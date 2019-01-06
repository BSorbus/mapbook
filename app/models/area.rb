class Area < ApplicationRecord
  has_one_attached :file_pdf
  has_one_attached :file_xlsx


end
