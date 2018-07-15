json.extract! doctor, :id, :firstname, :lastname, :pesel, :occupation, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
