Program lr6;
type
	PTree = ^TNode;
	TNode = record
		name, birthDate: String;
		Left, Right: PTree;
	end;
var
	Tree, Root: PTree;
procedure insertInTree(var Tree: PTree; InName: string; InDate: string);

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
	if Tree=NIL then CreateNode(Tree, InName, InDate) { создаем новый узел дерева }
	else begin
		if Tree^.Left=NIL then begin
			writeln('++', InName);
			insertInTree(Tree^.Left, InName, InDate);
		end else if Tree^.Right=NIL then begin 
			insertInTree(Tree^.Right, InName, InDate);
		end else writeln('This node already has 2 children');
	end;
end;
procedure walkTreeLR(p: PTree); 
Begin 
	if p<>NIL then 
	begin 
		writeln(p^.name, ' ', p^.birthDate); 
		walkTreeLR(p^.left); 
		walkTreeLR(p^.right); 
	end; 
end;
procedure addChildrenByName(var p: PTree; nodeName: string; TempName: string; TempDate: string);
begin
	writeln(p^.name);
	if p<>NIL then 
	begin 
		if p^.name=nodeName then begin
			writeln('here 1');
			insertInTree(p, TempName, TempDate);
		end else begin
		writeln('here 2');
			if p^.left<>NIL then addChildrenByName(p^.left, nodeName, TempName, TempDate); 
			if p^.right<>NIL then addChildrenByName(p^.right, nodeName, TempName, TempDate); 
		end;
	end else writeln('Not found');
end;
procedure makeTree(var Tree: PTree; var Root: PTree);
var
	TempName, TempDate, TargetName: string;
begin
	repeat
		if Tree<>NIL then begin
			writeln('Enter person whose parent we are adding(0 to stop)');
			readln(TargetName);
		end;
		if TargetName='0' then break; {Если 0 - окончим ввод элементов}
		writeln('Enter name');
		readln(TempName);
		writeln('Enter birth date');
		readln(TempDate);
		if Tree=NIL then begin
			insertInTree(Tree, TempName, TempDate); 
			Root := Tree;
		end else begin
			Tree := Root;
			addChildrenByName(Tree, TargetName, TempName, TempDate);
		end;
	until false;
end;
begin
	makeTree(Tree, Root);
	walkTreeLR(Tree);
	writeln('Done!');
	readln();
end.