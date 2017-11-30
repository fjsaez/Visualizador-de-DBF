{   Visualizador de archivos DBF
            v1.1

      Autor: Ing. Francisco Sáez

 Visualizador simple de archivos .dbf (FoxPro, DBase).

 Componentes externos:

 - TDbf 7.01 (gratuito)
 - JvDBGridCSVExport (JEDI, gratuito).

    Calabozo, 9 de febrero de 2014
}

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
