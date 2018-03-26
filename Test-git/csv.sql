--9. 8,238,330
SELECT sum (sum_1)
FROM (
			--5.-6.(8,021,671)
			SELECT count (DISTINCT c.id_card) AS sum_1
			FROM (				
							--1.
							SELECT c.referenceid AS id_card
							FROM src_mstperson.compensateid c
							JOIN src_mstperson.person p ON (p.referenceid = c.compensateid)
										
							
							UNION ALL
							
							--2.
							SELECT referenceid AS id_card
							FROM src_mstperson.person
							WHERE referenceid NOT LIKE 'COMP%' 
							
							
							UNION ALL
							
							--3.
							SELECT parentidno AS id_card
							FROM src_mstinactive.in_guardian
							WHERE parentidno NOT LIKE 'N00%' 
							
							UNION ALL
							
							--4. 
							SELECT parentidno AS id_card
							FROM src_mstpolicy.guardian
							WHERE parentidno NOT LIKE 'N00%' 
							) c
							
------------------------------------------------------------------------------------							
							UNION ALL
							
							--7.
							SELECT count (*) AS sum_1
							FROM src_mstinactive.in_guardian
							WHERE parentidno LIKE 'N00%' --33,109
							
							UNION ALL
							
							--8.
							SELECT count (*) AS sum_1
							FROM src_mstpolicy.guardian 
							WHERE parentidno LIKE 'N00%' --183,550

) source_sum

EXCEPT
--10. 7,939,074
SELECT count (*)
FROM stg_party.party;

--11.


							
