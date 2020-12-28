 
:param nameEO => 'LR_024' MATCH  p=({name: $nameEO})<-[*..15]-(lastnode)
 
WHERE NOT (lastnode)<-[*..15]-()
RETURN collect(distinct lastnode.name), LENGTH(p) AS len
ORDER BY len DESC
LIMIT 10 //Какие ТП запитываются посредством объекта с именем nameEO? Вывести наименования и длину пути

MATCH (t:TP)-[:CONNECTION_LR]->(l:LR {name:$nameEO})
RETURN t.name AS name //Найти имена всех ТП, которые принадлежат заданному ЛР.

MATCH (t:TP)-[:CONNECTION_LR]->(l:LR)
RETURN l.name AS name_LR, t.name AS name_TP
ORDER BY l.name // Вывести списком все ТП и ЛР, с которым они соединяются с сортировкой по имени ЛР. 

MATCH (p)-[rel]->(:PS35 {name:'Semzavod'})
RETURN p.name, type(rel) //Найти все типы связей между объектом ПС «Семзавод» и объектами, с которыми ПС соединяется напрямую.

/*Вернуть список всех ЛР, которые запитываются от ПС «Семзавод» посредством 
соединения через другие ЛР (т.е. запитываются не напрямую).*/

MATCH(:PS35)<-[:CON_PS_LR]-(:LR)<-[:CON_BETWEEN_LR*]-(l:LR)
RETURN l.name

MATCH  (:PS35)<-[:CONNECTION_PS|CON_PS_LR|CONNECTION_LR|CON_BETWEEN_LR*]-(a:TP)
RETURN a.name //Вернуть все ТП, которые запитываются от ПС «Семзавод» как напрямую, так и не напрямую

MATCH (t:TP)-[rel:CONNECTION_PS|CONNECTION_LR {name: ['VL'], nominal_voltage:10}]->()
RETURN t.name //Посмотреть список ТП, которые запитываются посредством ВЛ 10 кВ.

MATCH (:LR {name:'LR_024'})-[:CONNECTION_LR|CON_BETWEEN_LR*]-(t)
RETURN t.name //Посмотреть список всех объектов, которые связаны с заданной ЛР, как напрямую, так и нет

MATCH (a:TP {name:'8 March street, Lesnaya'}),(b:TP {name:'Parkovaya'}), p=shortestPath((a)-[*..15]-(b))
RETURN p //Найти кратчайший путь между заданными объектами (например, ТП)

/*Найти ЛР, у которых количество подсоединенных ТП от 2 до 3. 
Вернуть наименование ЛР, количество ТП и наименование ТП*/

MATCH (l:LR)-[:CONNECTION_LR]-(t:TP)
WITH  l, count(t) AS numTP, collect(t.name) as name_TP
WHERE 1 < numTP < 4
RETURN l.name, numTP, name_TP
ORDER BY l.name

MATCH (:PS35)<-[:CON_PS_LR]-(l:LR)
WITH l
MATCH (l)<-[r:CONNECTION_LR|CON_BETWEEN_LR]-(t)
RETURN l.name, collect(t.name) //Найти объекты, связанные с ЛР, которые напрямую связаны с ПС. 

CALL
{MATCH (t:TP)-[:CONNECTION_LR|CONNECTION_PS]->(l)
RETURN t,l}
MATCH (t) WHERE t.name =~ 'P.*'
RETURN l.name, t.name //Найти ТП, которое начинается с «P*». Вернуть имя ТП и ЛР, с которым ТП соединяется.





 

 






