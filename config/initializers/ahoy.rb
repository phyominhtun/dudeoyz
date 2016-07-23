class Ahoy::Store < Ahoy::Stores::ActiveRecordTokenStore
  Ahoy.visit_duration=10.seconds
  Ahoy.geocode=:async
end
