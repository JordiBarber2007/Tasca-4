use MER4;
SELECT Polissa.Num_Polissa as "Numero de Pòlissa", Tipus_polissa.Nom as "Nom Pòlissa",
Client.DNI, Client.Nom as "Nom Client", Client.Cognom as "Cognom del Client"
FROM Client, Polissa, Tipus_polissa
WHERE Client.DNI = Polissa.Client_DNI and
Tipus_polissa.ID = Polissa.Tipus_polissa_ID and
Tipus_polissa.Nom = "Moto";