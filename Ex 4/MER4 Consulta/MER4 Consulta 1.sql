use MER4;
SELECT Client.Nom as "Nom client", Client.Cognom, Polissa.Num_Polissa as "Número de la pòlissa"
FROM Client, Polissa 
WHERE Client.DNI = Polissa.Client_DNI and Client.Nom="Toni";