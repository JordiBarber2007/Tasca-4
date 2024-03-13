use MER4;
SELECT Client.Nom, Client.Cognom, Polissa.Num_Polissa
FROM Client, Polissa 
WHERE Client.DNI = Polissa.Client_DNI and Client.Nom='Toni';