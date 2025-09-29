use context dcic2024
# fun protein_intake ( x :: string)-> string:
#   if x == protein:
#   print(yes)
#   else: print(no)
#   end
# end

include csv
include data-source


workouts = table: date, workout, Duration, had_protein
  row:"sep 15", "gym", 60, true
  row:"Sep 16", "Bike", 45, false
  row:"Sep 17", "ballet", 20, true
end


ldn-smt = load-table:
  month-year :: String,
  area :: Number,
  idk :: Number,
  qwe :: String,
  monr :: String,
  moth-year :: String,
  mont-year :: String,
  mh-year :: String,
  month-yar :: String,
  month-yer :: String,
  moar :: String

    
    
    
# list= https://data.london.gov.uk/download/facbc883-5383-4558-9018-fef410a43482/d02171f3-ffcc-49e8-8fea-63a965a4a5b4/MPS_MonthlyCrimeDashboard_TNOCrimeData.csv



money_tracker=table: month :: String , expense :: Number
  row:"jan",7000
  row:"feb",10000
  row:"mar",4000
    end






















