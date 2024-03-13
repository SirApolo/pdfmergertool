unit UForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, PythonEngine,
  Vcl.FileCtrl;

type
  TFormPrincipal = class(TForm)
    BtAdicionarPdf: TButton;
    ODPdf: TOpenDialog;
    BtJuntar: TButton;
    PythonEngine1: TPythonEngine;
    SDPdf: TSaveDialog;
    ListBoxPdfs: TListBox;
    BtLimpar: TButton;
    procedure BtAdicionarPdfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtJuntarClick(Sender: TObject);
    procedure BtLimparClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirPdf;
    procedure JuntarPdf;
    function SalvarPdf: TFileName;
    procedure LimparListaPdfs;
    procedure HabilitarLimpar;
    procedure HabilitarJuntar;
    procedure DesabilitarLimpar;
    procedure DesabilitarJuntar;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFormPrincipal.AbrirPdf;
begin
  if ODPdf.Execute then
  begin
    ListBoxPdfs.Items.Add(ODPdf.FileName);
  end;
end;

procedure TFormPrincipal.BtAdicionarPdfClick(Sender: TObject);
begin
  AbrirPdf;
  HabilitarLimpar;
  HabilitarJuntar;
end;

procedure TFormPrincipal.BtJuntarClick(Sender: TObject);
begin
  JuntarPdf;
end;

procedure TFormPrincipal.BtLimparClick(Sender: TObject);
begin
  LimparListaPdfs;
  DesabilitarLimpar;
  DesabilitarJuntar;
end;

procedure TFormPrincipal.DesabilitarJuntar;
begin
  BtJuntar.Enabled := false;
end;

procedure TFormPrincipal.DesabilitarLimpar;
begin
  BtLimpar.Enabled := false;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  PythonEngine1.SetPythonHome('C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\');
  PythonEngine1.LoadDll;
end;

procedure TFormPrincipal.HabilitarJuntar;
begin
  BtJuntar.Enabled := true;
end;

procedure TFormPrincipal.HabilitarLimpar;
begin
  BtLimpar.Enabled := true;
end;

procedure TFormPrincipal.JuntarPdf;
var
  Script: string;
  i: Integer;
begin
  if ListBoxPdfs.Items.Count > 0 then
  begin
    PythonEngine1.ExecString('from pypdf import PdfWriter');
    PythonEngine1.ExecString('merger = PdfWriter()');

    for I := 0 to ListBoxPdfs.Items.Count-1 do
    begin
       PythonEngine1.ExecString('merger.append(r"' +
       ListBoxPdfs.Items[I] + '")');
    end;
    PythonEngine1.ExecString('merger.write(r"' + string(SalvarPdf) + '")');
    PythonEngine1.ExecString('merger.close()');
  end
  else
  begin
    MessageDlg('Lista de PDFs vazia, adicione PDFs para juntar!',
      TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;
end;

procedure TFormPrincipal.LimparListaPdfs;
begin
  ListBoxPdfs.Items.Clear;
end;

function TFormPrincipal.SalvarPdf: TFileName;
begin
  if SDPdf.Execute then
  begin
    Result := SDPdf.FileName;
  end;
end;

end.
