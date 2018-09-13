mst(Graph,MST) :-
  once(call(Graph,CurrV,L_child)),
  no_children(CurrV,L_child,MST);

  once(call(Graph,CurrV,_)),
  once(deepen(Graph,CurrV,[],_,MST)).

deepen(Graph,CurrV,Visited, Acc_visited2,Tree) :-
  Tree = [],
  Acc_visited2 = Visited,
  member(CurrV,Visited);

  call(Graph,CurrV,[H_child|T_child]),
  append(Visited,[CurrV],New_visited),
  deepen(Graph,H_child,New_visited,Acc_visited1,D_subtree),
  broaden(Graph,CurrV,T_child,Acc_visited1, Acc_visited2,B_subtree),
  nesting_append([CurrV],D_subtree,Temp_MST),
  nesting_append(Temp_MST,B_subtree,Tree).

broaden(_,_,[],Acc_visited,Acc_visited,[]).
broaden(Graph,CurrV,[H_child|T_child],Visited, Acc_visited2,Tree) :-
  deepen(Graph,H_child,Visited,Acc_visited1,D_subtree),
  broaden(Graph,CurrV,T_child,Acc_visited1,Acc_visited2,B_subtree),
  append(D_subtree,B_subtree,Tree).

nesting_append(L1,L2,Res) :-
  Res = L1,
  L2 = [];
  append(L1,[L2],Res).

no_children(V,L_nbrs,Tree) :-
  L_nbrs = [],
  append([],[V],Tree).
