use MER4;
SELECT Client.Nom, Client.Cognom, Venedor.Nom, Venedor.Cognom, Polissa.Num_polissa, Tipus_polissa.Nom
FROM Client, Venedor, Polissa, Tipus_polissa
WHERE Client.DNI = Polissa.Client_DNI and Venedor.DNI=Polissa.Venedor_DNI and
Tipus_polissa.ID = Polissa.Tipus_polissa_ID;
