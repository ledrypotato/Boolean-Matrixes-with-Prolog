% TP6 / Projet
% TAYLOR Matt / SOCHAJ Yoann
% 15/05/2020

boolean(v). %notre definition du type boolean
boolean(f).
%----------------------------------------------------------------

%Optimisation de notre Xor avec des test qui nous ont montré que cette clause etait plus optimiser
xor(A,A,R):- % si A==B (f==f) ou (v==v) alors le xor est faux
R=f.

xor(A,B,R):- % si A!=B (v==f) ou (f==v) alors le xor est vrai
A\=B,
R=v.

% definition de vecteur: [v,f]
% definition d'une matrice [[v,f],[f,v],[f,f],[v,v]]
%----------------------------------------------------------------
vecteur(X,L):- %cette clause va s'occuper de creer un vecteur de taille L avec des valeurs random
	vecteur(X,[],L). %appelle qu'une fonction auxiliaire avec un accumulateur

vecteur(X,X,0). %notre predicat de sortie

vecteur(X,Acc,L):-
	L>0, %tant que L>0
	boolean(Z), %ceci va attribuer au hasard une valeur 
	Acc2=[Z|Acc], %on ajoute a Acc la valeur Z
	L2 is L-1, %on décrémente la valeur L
	vecteur(X,Acc2,L2). %notre appel recursif
%----------------------------------------------------------------
long([], 0). %notre cas trivial

long([_|T], N) :- %ceci est pour avoir la longueur d'une liste
	long(T, N1), 
	N is N1+1.

longll([H|_], X):- %cette clause est pour avoir la taille d'une sous liste pour connaitre la longueur du vecteur V pour une prochainne clause
	long(H,X).	
%----------------------------------------------------------------
ajoute_fin(X,[],[X]). %notre predicat de sortie

ajoute_fin(X,[Y|L1],[Y|L2]):- %une clause pour ajouter un element a la fin d'une liste
    ajoute_fin(X,L1,L2).
%----------------------------------------------------------------
xorliste(L1,L2,R):- %cette clause va faire la xor entre deux liste de n'importe quelle taille
	xorlisteAcc(L1,L2,[],R). %appel d'une clause auxiliare

xorliste([],[],R):- %cas pour qu'on ait comme solution R={f,f,.....}
	creerVecteur(R,1).	

xorlisteAcc([],[],X,X). %predicat de sortie

xorlisteAcc([H1|T1],[H2|T2],Acc,R):-
	xor(H1,H2,X), %on fait le xor des deux tetes
	ajoute_fin(X,Acc,Acc2), %on ajoute en fin d'Acc2
	xorlisteAcc(T1,T2,Acc2,R).%appel recursif
%----------------------------------------------------------------
creerVecteur([],0).%cas trivial 

creerVecteur(R,N):-   %N la longueur du vecteur R, ou R va etre rempli qu'avec des faux.
	creerVecteur(R,[],N).%appel d'une clause auxiliare avec un accumulateur

creerVecteur(R,R,0). %predicat de sortie

creerVecteur(R,Acc,N):- %on pourra test sans Acc pour opti ???
	N>0,  %verification pour que N>0
	N1 is N-1, %on décrémente N pour l'appel recursif
	creerVecteur(R,[f|Acc],N1). %vu qu'on doit remplir le vecteur de f on ajoute f à Acc
%----------------------------------------------------------------
produit(V,M,R):- %produit d'une matrice et d'un vecteur a l'aide de la methode du TP
produitAcc(V,M,[],R). % pas envie de commenter car on va opti

produitAcc([],[],R,R). % quand on aura fini de parcourir les deux listes

produitAcc([v|T1],[H2|T2],[],R):- %si on a vrai dans la tete  et que l'accumulateur est vide
    produitAcc(T1,T2,H2,R).

produitAcc([v|T1],[H2|T2],Acc,R):-  % si la tete = vrai et que L'accumulateur n'est pas vide
    xorliste(H2,Acc,S),
    produitAcc(T1,T2,S,R).

produitAcc([f|T1],[_|T2],Acc,R):-%si la tete=f alors on passe au prochain element des listes
    produitAcc(T1,T2,Acc,R).
%----------------------------------------------------------------
nbVrai(L,X):- %clause avoir le nombre de v dans une liste
	nbVrai(L,0,X).%clause auxiliare avec Acc

nbVrai([],X,X). %predicat de sortie

nbVrai([v|T],Acc,X):- %la clause si la tete=v 
	Acc1 is Acc+1, %on incremente la valeur de Acc car on a vu un vrai  
	nbVrai(T,Acc1,X). %appel recursif sur la tete

nbVrai([f|T],Acc,X):- %la clause si la tete=f
	nbVrai(T,Acc,X). %on ignore et passe à la tete
%----------------------------------------------------------------
solution([],0,[]).
solution(M,N,V):- % La clause qui va nous donner toutes les solution de V tel que le vecteur R soit rempli de faux.N correspond au nombre de vrai
	longll(M,LongM), %on prends la longueur pour creer le vecteur R qui va etre rempli de faux
	creerVecteur(R,LongM), %creation de R avec la longueur obtenue 
	long(M,S), % longueur qui va nous servir pour vecteur 
	vecteur(V,S), %pour dire que le vecteur V doit prendre des valeurs aleatoire et faire la taille S
	nbVrai(V,N),%pour prendre que les valeurs avec N nombre de vrai
	produit(V,M,R). %va permettre de trouver les solutions
%----------------------------------------------------------------



	

	