unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  csv: TStringList;
begin
  Memo1.clear;
  csv := TStringList.Create;
  try
    csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
    Memo1.Lines.AddStrings(csv);
  finally
    csv.Free;
  end;
end;


end.
