use MER7;
select count(*)
from Lini_ticket, Ticket, Empleat
where Ticket.Num = Lini_ticket.Ticket_Num AND
Empleat.ID=Ticket.Empleat_ID AND
Empleat.Nom LIKE "M%";