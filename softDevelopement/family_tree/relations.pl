/*==================== Family Tree */
/* grand parents */
spouse('ghulam muhammad', 'hussain bibi').
spouse('hussain bibi','ghulam muhammad').
/* ------------------------- My family */
spouse('safia bibi','muhammad yousaf').	/* 'safia bibi' is spouse of yousaf */
spouse('muhammad yousaf','safia bibi').
/*--------------------*/
/* grand parents */
female('hussain bibi').
female('mukhtar bibi').
female('rasool bibi').
female('maqbool bibi').
/*------------------------ sibling */
female('safia bibi').			/* 'safia bibi' is female */
female(khalida).
female(suriya).
female(saminah).
female(rubina).
female(zainab).

/*------------------- grandparents */
male('ghulam muhammad').
male('younas abid').
/*------------------------ sibling */

male('muhammad yousaf').
male(ahsan).
male(zaeem).
male(zikar).

/*-------------------- grandparents */
mother('hussain bibi', 'muhammad yousaf').
mother('hussain bibi', 'younas abid').
mother('hussain bibi', 'mukhtar bibi').
mother('hussain bibi', 'rasool bibi').
mother('hussain bibi', 'maqbool bibi').

/*-------------------- sibling */
mother('safia bibi',ahsan).	/* 'safia bibi' is mother of zaeem */
mother('safia bibi',khalida).
mother('safia bibi',suriya).
mother('safia bibi',zaeem).
mother('safia bibi',zikar).
mother('safia bibi',saminah).
mother('safia bibi',rubina).
mother('safia bibi',zainab).
/*------------------*/

/* ----------------- grandparents */
elder('muhammad yousaf', 'mukhtar bibi').
elder('mukhtar bibi', 'rasool bibi').
elder('rasool bibi','younas abid').
elder('muhammad younas', 'maqbool bibi').

/*-------------------- sibling */

elder(ahsan,khalida). /* ahsan is elder than khalida */
elder(khalida,suriya).
elder(suriya,zaeem).
elder(zaeem,zikar).
elder(zikar,saminah).
elder(saminah, rubina).
elder(rubina, zainab).

/* ========================== rules */

elders(X,Y):- 
elder(X,Y);
elder(X,Intermediate),
elders(Intermediate,Y).	/* recursive call */
/* ------------------------- */

daughters(Daughters,Parent):-
/* Daughters are daughters of parents */
/* lists daughters of of a parent */
female(Parent),
mother(Parent,Daughters),
female(Daughters);
/* if parent is male */
male(Parent),
spouse(Parent,Mother),
mother(Mother,Daughters),
female(Daughters).
/* ========================== sons */
sons(Sons,Parent):-
/* Sons are sons of parents */

/* lists son of of a parent */
female(Parent),
mother(Parent,Sons),
male(Sons);
/* if parent is male */
male(Parent),
spouse(Parent,Mother),
mother(Mother,Sons),
male(Sons).
/* ======================== brothers */
brothers(Brothers, Member):-
/* go to the mother of member */
/* select all male children of mother */
mother(Mother, Member),
mother(Mother, Brothers),
male(Brothers),
not(Member=Brothers). /* one is not brother of oneself */

/* ======================== sisters */
sisters(Sisters, Member):-
/* go to the mother of member */
/* select all female children of mother */
mother(Mother, Member),
mother(Mother, Sisters),
female(Sisters),
not(Member=Sisters). /* one is not brother of oneself */

/* ======================== sibling */
siblings(Siblings, Member):-
/* go to the mother of member1 */
/* select all children of mother */
mother(Mother, Siblings),
mother(Mother, Member),
not(Siblings=Member). /* one is not brother of oneself */

/* ======================== father */
father(FatherName,Member):-
/* access member's mother and then spouse */
mother(Mother,Member),
spouse(FatherName, Mother).
/* ======================== chacho and taya*/
chacho(Chacho, Member):-
/* Chacho is chacho of Member */
/* chacho: uncle younger than dad */
/* go to Dad's brother */
father(Father,Member),
/* select only younger than dad */
brothers(Chacho,Father),
elders(Father,Chacho).

/* ======================= Taya */
taya(Taya, Member):-
/* Taya is Taya of Member */
/* chacho: uncle younger than dad */
/* go to Dad's brother */
father(Father,Member),
/* select only younger than dad */
brothers(Taya,Father),
elders(Taya,Father).
