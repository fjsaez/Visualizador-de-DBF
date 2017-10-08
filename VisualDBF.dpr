program VisualDBF;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FPrinc},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Visualizador de archivos DBF';
  TStyleManager.TrySetStyle('Cyan Dusk');
  Application.CreateForm(TFPrinc, FPrinc);
  Application.Run;
end.
