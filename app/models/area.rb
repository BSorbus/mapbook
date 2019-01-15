class Area < ApplicationRecord
  has_one_attached :file_pdf
  has_one_attached :file_xlsx

  
  def province_zip_name
    case "#{teryt[0..1]}"
    when '02'
      'dolnośląskiego'
    when '04'
      'kujawsko-pomorskiego'
    when '06'
      'lubelskiego'
    when '08'
      'lubuskiego'
    when '10'
      'łódzkiego'
    when '12'
      'małopolskiego'
    when '14'
      'mazowieckiego'
    when '16'
      'opolskiego'
    when '18'
      'podkarpackiego'
    when '20'
      'podlaskiego'
    when '22'
      'pomorskiego'
    when '24'
      'śląskiego'
    when '26'
      'świętokrzyskiego'
    when '28'
      'warmińsko-mazurskiego'
    when '30'
      'wielkopolskiego'
    when '32'
      'zachodniopomorskiego'
    else
      ''
    end
  end

  def province_zip_url
    province = case "#{teryt[0..1]}"
      when '02'
        'dolnoslaskie'
      when '04'
        'kujawsko_pomorskie'
      when '06'
        'lubelskie'
      when '08'
        'lubuskie'
      when '10'
        'lodzkie'
      when '12'
        'malopolskie'
      when '14'
        'mazowieckie'
      when '16'
        'opolskie'
      when '18'
        'podkarpackie'
      when '20'
        'podlaskie'
      when '22'
        'pomorskie'
      when '24'
        'slaskie'
      when '26'
        'swietokrzyskie'
      when '28'
        'warminsko_mazurskie'
      when '30'
        'wielkopolskie'
      when '32'
        'zachodniopomorskie'
      else
        ''
      end

    "http://#{Rails.application.secrets.domain_name}/file/#{province}.zip"
  end

end
