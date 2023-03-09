unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls;

type
  TFrmMenu = class(TForm)
    PnlTopo: TPanel;
    BtnSair: TSpeedButton;
    BtnUsuarios: TSpeedButton;
    BtnMovimento: TSpeedButton;
    StatusBar1: TStatusBar;
    LblCentro: TLabel;
    Timer1: TTimer;
    procedure BtnUsuariosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnMovimentoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses UMovimento, UPesquisa, UUsuario;

{$R *.dfm}

procedure TFrmMenu.BtnMovimentoClick(Sender: TObject);
begin
  //Abre o formulario de Movimento 
  FrmMovimento := TFrmMovimento.Create (self);
  FrmMovimento.ShowModal;
  try
  
  finally
  FrmMovimento.free;
  FrmMovimento:= nil; 
  end;
end;

procedure TFrmMenu.BtnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair?','Sair', MB_ICONINFORMATION+MB_YESNO) = MRYES then
  begin
    Application.Terminate;
  end
  else
  Abort;
end;

procedure TFrmMenu.BtnUsuariosClick(Sender: TObject);
begin
  FrmUsuario:=TFrmUsuario.Create(Self);
  FrmUsuario.ShowModal;
  try
  
  finally
    FrmUsuario.free;
    FrmUsuario:= nil;
  end;
end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:= DateToStr(Now);
    StatusBar1.Panels[1].Text:= TimeToStr(Now);
    StatusBar1.Panels[2].Text:= 'Seja bem vindo';   
end;

end.
