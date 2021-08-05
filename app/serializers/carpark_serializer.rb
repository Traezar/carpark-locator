class CarparkSerializer < ActiveModel::Serializer
  attributes :address, :carpark_type, :type_of_parking_system, :short_term_parking, :free_parking, :night_parking, :carpark_lots

  def carpark_lots
    CarparkLotSerializer.new(object.carpark_lot, root: :carpark_lots)
  end
end
