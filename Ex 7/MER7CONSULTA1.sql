USE MER7;
select Ticket.Num_factura, Ticket.Data_, Empleat.Nom, Empleat.Cognom
FROM Ticket, Empleat, Producte, Lini_ticket
WHERE Producte.ID=Lini_ticket.Producte_ID AND
Ticket.Num = Lini_ticket.Ticket_Num AND
Empleat.ID=Ticket.Empleat_ID AND
Producte.Nom="Allioli";