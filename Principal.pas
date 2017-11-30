unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, dbf, Vcl.ComCtrls, Vcl.Graphics, Vcl.Buttons, JvComponentBase,
  JvDBGridExport, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, JvBaseDlg,
  JvProgressDialog, Vcl.Samples.Gauges;

type
  TFPrinc = class(TForm)
    DS: TDataSource;
    DBGrid: TDBGrid;
    OpenDlg: TOpenDialog;
    Tabla: TDbf;
    SBar: TStatusBar;
    SBAcerca: TSpeedButton;
    SaveDlg: TSaveDialog;
    JvCSVExport: TJvDBGridCSVExport;
    SBAbrir: TSpeedButton;
    SBCerrarCSV: TSpeedButton;
    SBGuardarCSV: TSpeedButton;
    ActionList: TActionList;
    ActAbrir: TAction;
    ActCerrar: TAction;
    ActGuardar: TAction;
    SBSalir: TSpeedButton;
    ActSalir: TAction;
    Panel: TPanel;
    Gauge: TGauge;
    procedure FormShow(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure SBAcercaClick(Sender: TObject);
    procedure JvCSVExportProgress(Sender: TObject; Min, Max, Position: Cardinal;
      const AText: string; var AContinue: Boolean);
    procedure ActAbrirExecute(Sender: TObject);
    procedure ActCerrarExecute(Sender: TObject);
    procedure ActGuardarExecute(Sender: TObject);
    procedure ActSalirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ActivarBotones;
  public
    { Public declarations }
  end;

var
  FPrinc: TFPrinc;

implementation

{$R *.dfm}

{Activa/desactiva los botones dependiendo del estado de la tabla}
procedure TFPrinc.ActAbrirExecute(Sender: TObject);
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
    ActivarBotones;
  end;
end;

procedure TFPrinc.ActCerrarExecute(Sender: TObject);
begin
  Tabla.Active:=false;
  ActivarBotones;
end;

procedure TFPrinc.ActGuardarExecute(Sender: TObject);
begin
  SaveDlg.Execute();
  if SaveDlg.FileName<>'' then
  begin
    JvCSVExport.FileName:=SaveDlg.FileName;
    Panel.Visible:=true;
    JvCSVExport.ExportGrid;   //genera y guarda el archivo CSV
    Tabla.First;
    ShowMessage('El archivo '+JvCSVExport.FileName+' se creó exitosamente');
    Panel.Visible:=false;
  end;
end;

procedure TFPrinc.ActivarBotones;
begin
  SBGuardarCSV.Enabled:=Tabla.Active;
  SBCerrarCSV.Enabled:=Tabla.Active;
end;

procedure TFPrinc.ActSalirExecute(Sender: TObject);
begin
  Tabla.Active:=false;
  Application.Terminate;
end;

procedure TFPrinc.DSDataChange(Sender: TObject; Field: TField);
begin
  SBar.Panels[1].Text:=' Registro '+IntToStr(Tabla.RecNo)+
                       ' de '+IntToStr(Tabla.RecordCount);
end;

procedure TFPrinc.FormShow(Sender: TObject);
begin
  Caption:=Application.Title;
  ActivarBotones;
end;

procedure TFPrinc.JvCSVExportProgress(Sender: TObject; Min, Max,
  Position: Cardinal; const AText: string; var AContinue: Boolean);
var
  Porc: string;
begin
  Application.ProcessMessages;
  Gauge.MinValue:=Min;
  Gauge.MaxValue:=Max;
  Gauge.Progress:=Position;
end;

procedure TFPrinc.SBAcercaClick(Sender: TObject);
begin
  ShowMessage(Application.Title+#13+'        v1.1'+#13#13+
    'Autor: Ing. Francisco Sáez'+#13#13+'Calabozo, 9 de febrero de 2014');
end;

end.
