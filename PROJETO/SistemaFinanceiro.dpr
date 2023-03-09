program SistemaFinanceiro;

uses
  Forms,
  UMovimento in '..\FORMS\UMovimento.pas' {FrmMovimento},
  UDM in '..\FORMS\UDM.pas' {DM: TDataModule},
  UPesquisa in '..\FORMS\UPesquisa.pas' {FrmPesquisa},
  UMenu in '..\FORMS\UMenu.pas' {FrmMenu},
  UUsuario in '..\FORMS\UUsuario.pas' {FrmUsuario},
  UPesquisaUsuario in '..\FORMS\UPesquisaUsuario.pas' {FrmPesquisaUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmPesquisaUsuario, FrmPesquisaUsuario);
  Application.Run;
end.
