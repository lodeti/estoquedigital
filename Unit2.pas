unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  proximoID: Integer = 1;
  function PegaUltimoIDdoCSV: Integer;


implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  csv: TStringList;
begin
  csv := TStringList.Create;
  try
    if FileExists('Estoque Digital NAO APAGUE.csv') then
    csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
    csv.Add(Format('%d | %s | %s | %d | %.2f', [proximoID, Edit2.Text, Edit3.Text, StrToInt(Edit4.Text), StrToFloat(Edit5.Text)]));
    csv.SaveToFile('Estoque Digital NAO APAGUE.csv');
    ShowMessage('Estoque salvo com sucesso!');
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
    Inc(proximoID);
  finally
    csv.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Edit2.Text := '';
    Edit3.Text := '';
    Edit4.Text := '';
    Edit5.Text := '';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  proximoID := PegaUltimoIDdoCSV + 1;
end;

function PegaUltimoIDdoCSV: Integer;
var
  csv: TStringList;
  lastLine: string;
begin
  Result := 0;
  csv := TStringList.Create;
  try
    if FileExists('Estoque Digital NAO APAGUE.csv') then
    begin
      csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
      if csv.Count > 0 then
      begin
        lastLine := csv[csv.Count - 1];
        Result := StrToIntDef(Trim(Copy(lastLine, 1, Pos('|', lastLine) - 1)), 0);
      end;
    end;
  finally
    csv.Free;
  end;
end;

end.
