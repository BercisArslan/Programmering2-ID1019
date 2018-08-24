operational semantics är ett språk för att svara på frågor som vad ett expression ska leda till, "evaluate to". det
svarar också på tids och minnes komplexitet, men behöver inte förklara vad ett program gör i detalj utan användaren ska få en
överblick om programmet är rätt för dem.

det kan också beskriva design kriteria för en compiler mm. egenskaperna av ett program ska beskrivas i operational semantics
och fås också utan att läsa the operational semantics. man använder sig av BNF grammar.

<expression> ::= <atom> | <variable> | '{' <expression> ',' <expression> '}'

detta beskriver vad definitionen av ett expression är. sedan bygger man vidare på detta:

<sequence> ::= <expression> | <match> ';' <sequence>
där
<match> ::= <pattern> '=' <expression> (pattern matching)
<pattern> ::= <atom> | <variable> | '_' | '{' <pattern> ',' <pattern> '}'

det här visar vad som är giltigt att göra gällande expressions osv.

vidare kan man prata om :the :domain of the computation. det kommer vara en 1-1 mapping från atomerna i vår domän till atomerna i språket. elementen i språket (expressions in our language)
och elementen i vår domän.
utvärderingen av vårt expression kommer ge tillhörande datastruktur.

i beskrivningen av evaluation behöver vi ett environment. environment beskriver mappningen från variabler i expression till elementen i domänen.
man börjar alltid med en tom environment och lägger till information en efter en då man evaluate sekvenser av pattern matching expressions.

man beskriver environment med set of bindings v/s, där v är en variabel och s är en data struktur.
en environment där x binds till a och y binds till b blir {x/a,y/b}

hur beskriver man då the evaluation?

the evaluation of the expression e skrivs Eσ(e) menat att vi evaluate the expression e in the context of the environment σ.
