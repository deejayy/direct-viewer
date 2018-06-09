Program Direct_Viewer_Plus;

Uses Crt, Gr256, Dos;

Var  F: File Of Byte;
     Width, PreLoad: Integer;
     Code: Integer;
     I, J: Integer;
     B: Byte;

Procedure File_Not_Found;
 Begin
  WriteLn('A f jl nem tal lhat¢');
  Halt(1);
 End;

Procedure Usage;
 Begin
  WriteLn('Direct Viewer Plus 0.01');
  WriteLn('Copyright (c) 2000 By DeeJay, All Rights Reserved.');
  WriteLn('');
  WriteLn('Haszn lat: dv.exe f jln‚v sz‚less‚g [el“reolvas s]');
  WriteLn('');
  WriteLn('   f jln‚v        a megjelen¡tend“ f jl neve (8.3 form tumban)');
  WriteLn('   sz‚less‚g      a megjelen“ k‚p sz‚less‚ge k‚ppontokban kifejezve(>1)');
  WriteLn('   el“reolvas s   a program h ny b jtot olvasson el“re a f jlb¢l');
  WriteLn('');
  WriteLn('P‚lda: dv.exe pld.pic 310 10');
  WriteLn('       A program megjelen¡ti a pld.pic nev– f jlt 310 k‚ppont');
  WriteLn('       sz‚less‚gben ‚s t¡z b jtot el“reolvas');
  WriteLn('');
  WriteLn('');
  Halt(2);
 End;

Begin

 (** Ellen“rizget‚sek **)

  If ParamCount in [0..1] Then Usage;
  Assign(F, ParamStr(1));
  {$I-}
  Reset(F);
  {$I+}
  If IOResult<>0 Then File_Not_Found;
  Val(ParamStr(2),Width,Code);
  Val(ParamStr(3),PreLoad,Code);
  If Width<1 Then Usage;

 (** A program kezdete **)
  Screen_Init;

  For I:=1 To PreLoad Do Read(F, B);
  J:=0;
  Repeat
    Inc(J);
    I:=0;
    Repeat
      Inc(I);
      Read(F, B);
      PutPixel(I,J,B xor 127);
    Until (I=Width) Or Eof(F);
  Until Eof(F);




 ReadKey;
 TextMode(Co80);
End.
