program PintarDBGrid;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, frmPrincipal);
  Application.Run;
end.
