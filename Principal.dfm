object FPrinc: TFPrinc
  Left = 235
  Top = 149
  Caption = 'FPrinc'
  ClientHeight = 497
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    854
    497)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 824
    Top = 4
    Width = 22
    Height = 22
    Hint = 'Acerca del autor...'
    Anchors = [akTop, akRight]
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object Button1: TButton
    Left = 24
    Top = 10
    Width = 145
    Height = 25
    Caption = 'Abrir tabla *.dbf'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 838
    Height = 424
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BSalir: TButton
    Left = 704
    Top = 10
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Salir'
    TabOrder = 2
    OnClick = BSalirClick
  end
  object SBar: TStatusBar
    Left = 0
    Top = 478
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 300
      end>
    ExplicitLeft = 160
    ExplicitTop = 480
    ExplicitWidth = 0
  end
  object DS: TDataSource
    DataSet = Tabla
    OnDataChange = DSDataChange
    Left = 232
    Top = 104
  end
  object OpenDlg: TOpenDialog
    Filter = 'Tabla DBase/FoxPro|*.dbf'
    Title = 'Abrir archivo DBase/FoxPro'
    Left = 384
    Top = 112
  end
  object Tabla: TDbf
    IndexDefs = <>
    ReadOnly = True
    TableLevel = 5
    Left = 312
    Top = 192
  end
end
