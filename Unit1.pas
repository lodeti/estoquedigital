unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Menus, Unit2, Unit3, Unit4,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    Image2: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form3.Button1Click(Sender);
  Form3.Show;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
var
  NovoForm: TForm2;
begin
  NovoForm := TForm2.Create(Self);
  NovoForm.Show;
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
var
  NovoForm: TForm4;
begin
  NovoForm := TForm4.Create(Self);
  NovoForm.Show;
end;

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
ShowMessage('Desenvolvido por André Lodeti apenas para estudos.'+#13+'Esta aplicação não tem fins comerciais.'+#13+#13+'andrelodeti@gmail.com'+#13+#13+'2023 - Tapiratiba/SP');
end;

end.
