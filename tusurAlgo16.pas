Program lr6;
type
	PTree = ^TNode;
	TNode = record
		name, birthDate: String;
		Left, Right: PTree;
	end;
var
	Root: PTree;
	TempName, TempDate: string;
procedure insertInTree(var Root: PTree; InName: string; InDate: string);

	{ Дополнительная процедура, создающая и инициализирующая новый узел }
	procedure CreateNode(var p: PTree; NodeName: string; NodeDate: string);
	begin
		New(p);
		p^.name := NodeName;
		p^.birthDate := NodeDate;
		p^.Left := nil;
		p^.Right := nil
	end;
	
begin
	if Root=NIL then CreateNode(Root, InName, InDate) { создаем новый узел дерева }
	// else
		// if Root^.Left=NIL then insertInTree(Root^.Left, InName, InDate)
		// else 
		// writeln(Root^.Left=NIL);
		// with Root^ do begin
		// 	if value < X then Insert(Right, X)
		// 	else
		// 		if value > X Then Insert(Left, X)
		// 		else 
		// 		{ Действия, производимые в случае повторного
		// 		внесения элементов в дерево}
		// end;
end;
// Procedure obhod(p:tree); 
// Begin 
//    if p<>nil then 
//    begin 
//       obhod(p^.left); 
//       writeln(p^.inf); 
//       obhod(p^.right); 
//    end; 
// end;
begin
	TempName := 'name';
	TempDate := '2014.01.01';
	insertInTree(Root, TempName, TempDate);
	insertInTree(Root, TempName, TempDate);
	insertInTree(Root, TempName, TempDate);
	writeln('Done!');
	readln();
end.