{   Visualizador de archivos DBF
            v1.0

      Autor: Ing. Francisco Sáez

 Visualizador simple de archivos .dbf (FoxPro, DBase). Se utilizó el componente
 externo TDbf 7.0 (gratuito)

    Calabozo, 9 de febrero de 2014
}

unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, dbf, Vcl.ComCtrls, Vcl.Buttons;

type
  TFPrinc = class(TForm)
    //Tabla: TTable;
    Button1: TButton;
    DS: TDataSource;
    DBGrid1: TDBGrid;
    OpenDlg: TOpenDialog;
    BSalir: TButton;
    Tabla: TDbf;
    SBar: TStatusBar;
    SpeedButton1: TSpeedButton;
    procedure BSalirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;

implementation

{$R *.dfm}

procedure TFPrinc.BSalirClick(Sender: TObject);
begin
  Tabla.Active:=false;
  Application.Terminate;
end;

procedure TFPrinc.Button1Click(Sender: TObject);
begin
  OpenDlg.Execute();
  if OpenDlg.FileName<>'' then
  begin
    Tabla.Active:=false;
    Tabla.TableName:=OpenDlg.FileName;
    Tabla.Active:=true;
    Tabla.Open;
    SBar.Panels[0].Text:=' Total campos: '+IntToStr(Tabla.FieldCount);
    SBar.Panels[1].Text:=' Registro '+IntToStr(Tabla.RecNo)+
                         ' de '+IntToStr(Tabla.RecordCount);
    SBar.Panels[2].Text:=' Nombre del archivo: '+Tabla.TableName;
  end;
end;

procedure TFPrinc.DSDataChange(Sender: TObject; Field: TField);
begin
  SBar.Panels[1].Text:=' Registro '+IntToStr(Tabla.RecNo)+
                         ' de '+IntToStr(Tabla.RecordCount);
end;

procedure TFPrinc.FormShow(Sender: TObject);
begin
  Caption:=Application.Title;
end;

procedure TFPrinc.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage(Application.Title+#13+'        v1.0'+#13#13+
    'Autor: Ing. Francisco Sáez'+#13#13+'Calabozo, 9 de febrero de 2014');
end;

end.
