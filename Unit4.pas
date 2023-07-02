unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Panel1: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function ExcluirProdutoPorID(ID: Integer): Boolean;
  public
    { Public declarations }
    public
  function EditarProdutoPorID(ID: Integer; Nome, Descricao: string; Quantidade: Integer; Preco: Double): Boolean;

  end;

var
  Form4: TForm4;
  proximoID: Integer;

implementation

{$R *.dfm}

uses
  System.IOUtils;

function CarregarUltimoID: Integer;
var
  csv: TStringList;
begin
  Result := 0;
  csv := TStringList.Create;
  try
    if FileExists('Estoque Digital NAO APAGUE.csv') then
      csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
    if csv.Count > 0 then
      Result := StrToInt(Trim(Copy(csv[csv.Count - 1], 1, Pos('|', csv[csv.Count - 1]) - 1)));
  finally
    csv.Free;
  end;
end;

function TForm4.EditarProdutoPorID(ID: Integer; Nome, Descricao: string; Quantidade: Integer; Preco: Double): Boolean;
var
  csv: TStringList;
  i: Integer;
  linha: string;
  campos: TArray<string>;
begin
  Result := False;
  csv := TStringList.Create;
  try
    if FileExists('Estoque Digital NAO APAGUE.csv') then
      csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
    for i := 0 to csv.Count - 1 do
    begin
      linha := csv[i];
      campos := linha.Split(['|']);
      if StrToInt(Trim(campos[0])) = ID then
      begin
        if not Nome.Trim.IsEmpty then
          campos[1] := Nome;
        if not Descricao.Trim.IsEmpty then
          campos[2] := Descricao;
        if Quantidade > 0 then
          campos[3] := IntToStr(Quantidade);
        if Preco > 0 then
          campos[4] := FloatToStr(Preco);
        csv[i] := string.Join('|', campos);
        csv.SaveToFile('Estoque Digital NAO APAGUE.csv');
        Result := True;
        Break;
      end;
    end;
  finally
    csv.Free;
  end;
end;






procedure TForm4.Button1Click(Sender: TObject);
var
  ID, Quantidade: Integer;
  Preco: Double;
  Nome, Descricao: string;
begin
  ID := StrToIntDef(Edit2.Text, 0);
  Nome := Edit3.Text;
  Descricao := Edit4.Text;
  Quantidade := StrToIntDef(Edit5.Text, 0);
  Preco := StrToFloatDef(Edit6.Text, 0);
  if EditarProdutoPorID(ID, Nome, Descricao, Quantidade, Preco) then
    ShowMessage('Produto atualizado com sucesso!')
  else
    ShowMessage('Não foi possível atualizar o produto.'+#13+'Confira se os dados estão corretos.');
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
end;



procedure TForm4.Button2Click(Sender: TObject);
begin
begin
  if ExcluirProdutoPorID(StrToInt(Edit1.Text)) then
    ShowMessage('Produto excluído com sucesso!')
  else
    ShowMessage('Não foi possível excluir o produto.');
end;
begin
      Edit1.Text:= '';
end;
end;

function TForm4.ExcluirProdutoPorID(ID: Integer): Boolean;
var
  csv: TStringList;
  i: Integer;
begin
  Result := False;
  csv := TStringList.Create;
  try
    if FileExists('Estoque Digital NAO APAGUE.csv') then
      csv.LoadFromFile('Estoque Digital NAO APAGUE.csv');
    for i := 0 to csv.Count - 1 do
    begin
      if StrToInt(Trim(Copy(csv[i], 1, Pos('|', csv[i]) - 1))) = ID then
      begin
        csv.Delete(i);
        csv.SaveToFile('Estoque Digital NAO APAGUE.csv');
        Result := True;
        Break;
      end;
    end;
  finally
    csv.Free;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    proximoID := CarregarUltimoID + 1;
end;


end.

