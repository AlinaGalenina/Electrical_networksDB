CREATE (tp092:TP {name:'St.Sverdl.24_ramp'})
CREATE (tp093:TP {name:'St.Green,Budennogo'})
CREATE (lr032:LR {name:'LR_032'})
CREATE
  (tp092)-[:CONNECTION_LR {number_lr:32}]->(lr032),
  (tp093)-[:CONNECTION_LR {number_lr:32}]->(lr032)
  
CREATE (tp089:TP {name:'Parkovaya'})
CREATE (tp088:TP {name:'St.Lenina,Komsomolskaya,School'})
CREATE (tp090:TP {name:'St.Lenina,Pervomayskaya,Komsomolskaya'})
CREATE (lr030:LR {name:'LR_030'})
CREATE
  (tp089)-[:CONNECTION_LR {number_lr:30, name: ['VL'], nominal_voltage:10, number_vl:16}]->(lr030),
  (tp088)-[:CONNECTION_LR {number_lr:30, name: ['VL'], nominal_voltage:10, number_vl:16}]->(lr030),
  (tp090)-[:CONNECTION_LR {number_lr:30, name: ['VL'], nominal_voltage:10, number_vl:16}]->(lr030)
  
MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_032' AND m.name = 'LR_030'
CREATE (a)-[:CON_BETWEEN_LR]->(m)
RETURN a, m

CREATE (tp140:TP {name:'Pumping station, gym'})
CREATE (tp094:TP {name:'St.Oktyabrskaya'})
CREATE (tp091:TP {name:'St.Zarechnaya,Prudki,Bath'})
CREATE (tp095:TP {name:'St.Novikova,Tele2'})
CREATE (ps:PS35 {name:'Semzavod', nominal_voltage:'35/10'})
CREATE
  (tp140)-[:CONNECTION_PS]->(ps),
  (tp094)-[:CONNECTION_PS]->(ps),
  (tp091)-[:CONNECTION_PS]->(ps),
  (tp095)-[:CONNECTION_PS]->(ps)
  
MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_030' AND m.name = 'Semzavod'
CREATE (a)-[:CON_PS_LR]->(m)
RETURN a, m

CREATE (tp082:TP {name:'St.Molodezhnaya'})
CREATE (tp081:TP {name:'St.Narodnaya'})
CREATE (tp085:TP {name:'Ozerki(current)'})

MATCH (a:TP), (m:PS35)
WHERE a.name = 'St.Narodnaya' OR a.name = 'Ozerki(current)' or a.name = 'St.Molodezhnaya' AND m.name = 'Semzavod'
CREATE
  (a)-[:CONNECTION_PS {name: ['VL'], nominal_voltage:10, number_vl:10}]->(m)
    
CREATE (tp067:TP {name:'8 March street, Lesnaya'})
CREATE (lr027:LR {name:'LR_027'})
CREATE
  (tp067)-[:CONNECTION_LR {number_lr:27}]->(lr027)
  
CREATE (tp068:TP {name:'St.Vatutina, politotdelskaya'})
CREATE (tp071:TP {name:'St.Vatutina(current)'})
CREATE (tp069:TP {name:'St.Vatutina,Elbrus'})
CREATE (lr026:LR {name:'LR_026'})
CREATE
  (tp068)-[:CONNECTION_LR {number_lr:26}]->(lr026),
  (tp069)-[:CONNECTION_LR {number_lr:26}]->(lr026),
  (tp071)-[:CONNECTION_LR {number_lr:26}]->(lr026)
  
MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_027' AND m.name = 'LR_026'
CREATE (a)-[:CON_BETWEEN_LR]->(m)
RETURN a, m

CREATE (tp077:TP {name:'St.Krasnostepovskaya'})
CREATE (tp076:TP {name:'Well'})
CREATE (tp075:TP {name:'St.Gagarina'})
CREATE (tp073:TP {name:'St.Dzerzhinskogo'})
CREATE (tp074:TP {name:'Village council central,Embankment'})
CREATE (tp072:TP {name:'St.Shkolnaya, Vishnev, Hospital'})
CREATE (lr025:LR {name:'LR_025'})
CREATE
  (tp077)-[:CONNECTION_LR {number_lr:25}]->(lr025),
  (tp076)-[:CONNECTION_LR {number_lr:25}]->(lr025),
  (tp075)-[:CONNECTION_LR {number_lr:25}]->(lr025),
  (tp073)-[:CONNECTION_LR {number_lr:25}]->(lr025),
  (tp074)-[:CONNECTION_LR {number_lr:25}]->(lr025),
  (tp072)-[:CONNECTION_LR {number_lr:25}]->(lr025)

CREATE (tp064:TP {name:'Kids camp'})
CREATE (tp065:TP {name:'Сlub'})
CREATE (lr024:LR {name:'LR_024'})
CREATE
  (tp064)-[:CONNECTION_LR {number_lr:24}]->(lr024),
  (tp065)-[:CONNECTION_LR {number_lr:24}]->(lr024)

MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_026' AND m.name = 'LR_024'
CREATE (a)-[:CON_BETWEEN_LR]->(m)
RETURN a, m

MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_024' AND m.name = 'Semzavod'
CREATE (a)-[:CON_PS_LR]->(m)
RETURN a, m

CREATE (tp078:TP {name:'Gas'})
CREATE (tp080:TP {name:'Megaphone'})
CREATE (tp063:TP {name:'Khutor mokrenkiy'})
MATCH (a:TP), (m:PS35)
WHERE a.name = 'Gas' OR a.name = 'Megaphone' or a.name = 'Khutor mokrenkiy' AND m.name = 'Semzavod'
CREATE
  (a)-[:CONNECTION_PS {name: ['VL'], nominal_voltage:10, number_vl:9}]->(m)

CREATE (tp086:TP {name:'Kolbasovka'})
CREATE (lr031:LR {name:'LR_031'})
CREATE (tp086)-[:CONNECTION_LR {number_lr:31}]->(lr031)

MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_030' AND m.name = 'LR_031'
CREATE (a)-[:CON_BETWEEN_LR]->(m)

CREATE (tp087:TP {name:'Svobodnyy'})
CREATE (psp:PS35 {name:'Pristen', nominal_voltage:'35/10'})
CREATE (tp087)-[:CONNECTION_PS]->(psp)

MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_031' AND m.name = 'Pristen'
CREATE (a)-[:CON_PS_LR]->(m)

CREATE (tp120:TP {name:'Grachevka, Vodokachka, Shilovka'})
CREATE (tp123:TP {name:'St.Druzhba, Mirnaya'})
CREATE (tp113:TP {name:'Solnechnaya, Mirnaya'})
CREATE (lr041:LR {name:'LR_041'})
CREATE
  (tp120)-[:CONNECTION_LR {number_lr:41}]->(lr041),
  (tp123)-[:CONNECTION_LR {number_lr:41}]->(lr041),
  (tp113)-[:CONNECTION_LR {number_lr:41}]->(lr041)
 
CREATE (tp110:TP {name:'AZC'})
CREATE (tp111:TP {name:'Old farm'})
CREATE (tp112:TP {name:'Festivalnaya, solnechnaya'})
MATCH (a:TP), (m:PS35)
WHERE (a.name = 'AZC' OR a.name = 'Old farm') AND m.name = 'Pristen'
CREATE
  (a)-[:CONNECTION_PS {name: ['KVL'], nominal_voltage:10, number_kvl:18}]->(m)

CREATE (lr045:LR {name:'LR_045', type:'NTR'})

MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_045' AND m.name = 'Semzavod'
CREATE (a)-[:CON_PS_LR_NTR]->(m)

CREATE (tp109:TP {name:'Dolina'})
CREATE (lr040:LR {name:'LR_040'})
CREATE
  (tp109)-[:CONNECTION_LR {number_lr:40}]->(lr040)
  
MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_041' AND m.name = 'Pristen'
CREATE (a)-[:CON_PS_LR]->(m)

CREATE (tp108:TP {name:'Vodokachka'})
CREATE (lr039:LR {name:'LR_039'})
CREATE
  (tp108)-[:CONNECTION_LR {number_lr:39}]->(lr039)

MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_039' AND m.name = 'Pristen'
CREATE (a)-[:CON_PS_LR]->(m)

CREATE (crp:CRP {name:'Pristen', nominal_voltage:10})

MATCH (a:CRP), (m:PS35)
WHERE a.name = 'Pristen' AND m.name = 'Pristen'
CREATE (a)-[:CON_PS_CRP]->(m)

CREATE (tp125:TP {name:'Krestyanskaya'})
CREATE (tp126:TP {name:'SHT'})
CREATE (tp127:TP {name:'Beeline'})
CREATE (tp128:TP {name:'MTC'})
CREATE (tp158:TP {name:'Tele2'})

MATCH (a:TP), (m:CRP)
WHERE a.name = 'Tele2' AND m.name = 'Pristen'
CREATE (a)-[:CON_CRP]->(m)

CREATE (tp196:TP {name:'Ponizovka'})
CREATE (tp194:TP {name:'St.Penzinskaya, Sadovaya'})
CREATE (lr074:LR {name:'LR_074'})
CREATE
  (tp194)-[:CONNECTION_LR {number_lr:74}]->(lr074),
  (tp196)-[:CONNECTION_LR {number_lr:74}]->(lr074)
  
MATCH (a:LR), (m:CRP)
WHERE a.name = 'LR_074' AND m.name = 'Pristen'
CREATE (a)-[:CON_CRP {name: ['VL'], nominal_voltage:10, number_vl:9}]->(m)

CREATE (tp097:TP {name:'Babkin'})
CREATE (lr087:LR {name:'LR_087'})
CREATE (lr064:LR {name:'LR_064'})
CREATE (lr064)-[:CON_BETWEEN_LR]->(lr087)

MATCH (a:TP), (m:PS35)
WHERE a.name = 'Babkin' AND m.name = 'Pristen'
CREATE(a)-[:CONNECTION_PS]->(m)

MATCH (a:LR), (m:PS35)
WHERE a.name = 'LR_087' AND m.name = 'Pristen'
CREATE (a)-[:CON_PS_LR]->(m)

CREATE (tp121:TP {name:'Embankment'})

MATCH (a:TP), (m:LR)
WHERE a.name = 'Embankment' AND m.name = 'LR_064'
CREATE(a)-[:CONNECTION_LR {name: ['KVL'], nominal_voltage:10, number_kvl:14}]->(m)

CREATE (lr088:LR {name:'LR_088', type:'NTR'})

MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_088' AND m.name = 'LR_041'
CREATE (a)-[:CON_LR_NTR]->(m)

CREATE (lr042:LR {name:'LR_042'})
CREATE (lr091:LR {name:'LR_091'})

MATCH (a:LR), (m:LR)
WHERE a.name = 'LR_042' AND m.name = 'LR_064'
CREATE (a)-[:CON_BETWEEN_LR {name: ['KVL'], nominal_voltage:10, number_kvl:14}]->(m)

CREATE (tp039:TP {name:'KRC'})

MATCH (a:TP), (m:LR)
WHERE a.name = 'KRC' AND m.name = 'LR_042'
CREATE(a)-[:CONNECTION_LR {name: ['KVL'], nominal_voltage:10, number_kvl:14}]->(m)

CREATE (tp254:TP {name:'SK Vozrozhdeniye'})

MATCH (a:TP), (m:LR)
WHERE a.name = 'SK Vozrozhdeniye' AND m.name = 'LR_091'
CREATE(a)-[:CONNECTION_LR {name: ['KVL'], nominal_voltage:10, number_kvl:14}]->(m)
