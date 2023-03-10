unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Menus;

type
  TFrmMenu = class(TForm)
    PnlTopo: TPanel;
    BtnSair: TSpeedButton;
    BtnUsuarios: TSpeedButton;
    BtnMovimento: TSpeedButton;
    StatusBar1: TStatusBar;
    LblCentro: TLabel;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    Usuarios: TMenuItem;
    Movimentos: TMenuItem;
    Sair: TMenuItem;
    Relatorios: TMenuItem;
    ListaMovimentos: TMenuItem;
    ListadeUsuarios: TMenuItem;
    Sobre: TMenuItem;
    Informacoes: TMenuItem;
    BtnTrocaDeUsuario: TSpeedButton;
    procedure BtnTrocaDeUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InformacoesClick(Sender: TObject);
    procedure ListadeUsuariosClick(Sender: TObject);
    procedure ListaMovimentosClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure MovimentosClick(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
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

uses UMovimento, UPesquisa, UUsuario, UPesquisaUsuario, UInformacoes, ULogin,
  UDM;

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
  //Bot�o sair
  if Application.MessageBox('Deseja realmente sair?','Sair', MB_ICONINFORMATION+MB_YESNO) = MRYES then
  begin
    Application.Terminate;
  end
  else
  Abort;
end;

procedure TFrmMenu.BtnTrocaDeUsuarioClick(Sender: TObject);
begin
  //Troca de usuario
  FrmMenu.Hide;
  FrmLogin.EdtNome.Clear;
  FrmLogin.EdtSenha.Clear;
  FrmLogin.EdtNome.SetFocus;
end;

procedure TFrmMenu.BtnUsuariosClick(Sender: TObject);
begin
  //Abre a tela de cadastro de usuarios
  FrmUsuario:=TFrmUsuario.Create(Self);
  FrmUsuario.ShowModal;
  try

  finally
    FrmUsuario.free;
    FrmUsuario:= nil;
  end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  //Valida o tipo de usuario
  if dm.Tipo = 'APOIO'  then
  begin
    BtnUsuarios.Enabled := false;
    ListadeUsuarios.Enabled := false;
  end
  else // Se for diferente, aborte
  begin
    Abort;
  end;
end;

procedure TFrmMenu.InformacoesClick(Sender: TObject);
begin
  FrmInformacoes := TFrmInformacoes.Create(Self);
  FrmInformacoes.ShowModal;
  try

  finally
    FrmInformacoes.Free;
    FrmInformacoes:= nil;
  end;
end;

procedure TFrmMenu.ListadeUsuariosClick(Sender: TObject);
begin
  //Abre a tela de pesquisa de usuario
  FrmPesquisaUsuario := TFrmPesquisaUsuario.Create(Self);
  FrmPesquisaUsuario.BtnTransferir.Enabled:= false;
  FrmPesquisaUsuario.ShowModal;
  try

  finally
  FrmPesquisaUsuario.Free;
  FrmPesquisaUsuario:= nil;
  end;
end;

procedure TFrmMenu.ListaMovimentosClick(Sender: TObject);
begin
  //Abre a tela de pesquisa de movimentos
  FrmPesquisa := TFrmPesquisa.Create(Self);
  FrmPesquisa.BtnTransferir.Enabled := false;
  FrmPesquisa.ShowModal;
  try

  finally
    FrmPesquisa.Free;
    FrmPesquisa := nil;
  end;
end;

procedure TFrmMenu.MovimentosClick(Sender: TObject);
begin
  //Quando clicar no Movimentos pelo Menu, clique o bot�o movimentos
  BtnMovimento.Click;
end;

procedure TFrmMenu.SairClick(Sender: TObject);
begin
  //Quando clicar no sair pelo Menu, clique no bot�o SAIR
  BtnSair.Click;
end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:= 'Data: '+DateToStr(Now);
    StatusBar1.Panels[1].Text:= 'Horas: '+TimeToStr(Now);
    StatusBar1.Panels[2].Text:= 'Seja bem vindo '+ dm.usuario;
    StatusBar1.Panels[3].Text:= 'Seja bem vindo '+ dm.tipo;
end;

procedure TFrmMenu.UsuariosClick(Sender: TObject);
begin
  //Quando clicar no usuarios pelo Menu, clique o bot�o Usuarios.
  BtnUsuarios.Click;
end;

end.
