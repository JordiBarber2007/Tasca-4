use MER5;
SELECT Client.Nom, Vehicle.Marca, Tipus_vehicle.Nom, Cita.Data_cita, Cita.Lloc, Client_Vehicle.Data_darrera_revisio
FROM Client, Vehicle, Tipus_vehicle, Cita, Client_Vehicle
WHERE Client.DNI=Client_Vehicle.Vehicle_Num_bastidor AND
Vehicle.Num_bastidor_vehicle=Client_Vehicle.Vehicle_Num_bastidor AND
Tipus_vehicle.ID=Vehicle.Tipus_vehicle_ID AND
Client_Vehicle.ID=Cita.Client_Vehicle_ID;