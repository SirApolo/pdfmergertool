object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'PDFMergerTool'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    628
    442)
  TextHeight = 15
  object BtAdicionarPdf: TButton
    Left = 0
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 0
    OnClick = BtAdicionarPdfClick
  end
  object BtJuntar: TButton
    Left = 551
    Top = 409
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Juntar'
    Enabled = False
    TabOrder = 1
    OnClick = BtJuntarClick
    ExplicitLeft = 547
    ExplicitTop = 408
  end
  object ListBoxPdfs: TListBox
    Left = 1
    Top = 39
    Width = 626
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 15
    TabOrder = 2
    ExplicitWidth = 622
    ExplicitHeight = 363
  end
  object BtLimpar: TButton
    Left = 80
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Limpar'
    Enabled = False
    TabOrder = 3
    OnClick = BtLimparClick
  end
  object ODPdf: TOpenDialog
    Left = 64
    Top = 48
  end
  object PythonEngine1: TPythonEngine
    AutoLoad = False
    DllName = 'python37.dll'
    DllPath = ''
    APIVersion = 1013
    RegVersion = '3.7'
    UseLastKnownVersion = False
    VenvPythonExe = ''
    Left = 8
    Top = 112
  end
  object SDPdf: TSaveDialog
    DefaultExt = '*.pdf'
    Filter = 'Arquivos PDF (*.pdf)|*.PDF|Any file (*.*)|*.*'
    Left = 8
    Top = 48
  end
end
