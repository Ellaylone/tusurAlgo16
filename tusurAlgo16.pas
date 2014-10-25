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
	else
		if Root^.Left=NIL then begin
			insertInTree(Root^.Left, InName, InDate);
		end else if Root^.Right=NIL then begin 
			insertInTree(Root^.Right, InName, InDate);
		end else writeln('This node already has 2 children');
end;
procedure walkTreeLR(p:PTree); 
Begin 
   if p<>nil then 
   begin 
      walkTreeLR(p^.left); 
      writeln(p^.name, ' ', p^.birthDate); 
      walkTreeLR(p^.right); 
   end; 
end;
procedure addChildrenByName(p: PTree; nodeName: string);
var
	inputName, inputDate: string;
begin
	if p<>nil then 
	begin 
		walkTreeLR(p^.left); 
		if p^.name=nodeName then begin
			writeln('Enter name');
			readln(inputName);
			writeln('Enter birth date');
			readln(inputDate);
			insertInTree(p, inputName, inputDate);
		end;
		walkTreeLR(p^.right); 
	end; 
	writeln('Not found');
end;
procedure startTree(var Root: PTree);
begin
	writeln('Enter name');
	readln(TempName);
	writeln('Enter birth date');
	readln(TempDate);
	insertInTree(Root, TempName, TempDate);
end;
begin
	startTree(Root);
	addChildrenByName(Root, 'name');
	walkTreeLR(Root);
	writeln('Done!');
	readln();
end.