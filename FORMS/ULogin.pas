unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TFrmLogin = class(TForm)
    LblNome: TLabel;
    LblSenha: TLabel;
    EdtNome: TEdit;
    EdtSenha: TEdit;
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
   Aldo: Integer;
  public
    { Public declarations }
   Murilo: Integer;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Enter igual ao Tab
  if Key = #13 then
  begin
    Key:=#0;
    Perform(wm_NextDlgCtl,0,0);
  end;
end;

end.
