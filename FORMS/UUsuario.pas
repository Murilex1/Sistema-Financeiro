unit UUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask;

type
  TFrmUsuario = class(TForm)
    PnlRodape: TPanel;
    DBNavigator1: TDBNavigator;
    PnlTopo: TPanel;
    BtnPesquisar: TBitBtn;
    BtnAtualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnEditar: TBitBtn;
    BtnNovo: TBitBtn;
    BtnSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit1: TDBEdit;
    DBTipo: TDBComboBox;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure tratabotao();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses UDM, UMovimento, UPesquisaUsuario;

{$R *.dfm}

procedure TFrmUsuario.BtnAtualizarClick(Sender: TObject);
begin
  Tratabotao();
  DM.cdsUsuario.Refresh;
  MessageDlg('Atualizado com sucesso!', MTINFORMATION, [MBOK],0);

end;

procedure TFrmUsuario.BtnCancelarClick(Sender: TObject);
begin
  Tratabotao();
  DM.cdsUsuario.Cancel;
  dm.cdsUsuario.CancelUpdates;
  MessageDlg('Ação cancelada com sucesso', MTINFORMATION, [MBOK], 0);
end;

procedure TFrmUsuario.BtnDeletarClick(Sender: TObject);
begin
 Tratabotao();
  if MessageDlg('Deseja deletar esse registro?', MtConfirmation, [mbOk,MbNo], 0) =mrOk then
    begin
      dm.cdsUsuario.delete;
      Tratabotao();
    end
    else
     Tratabotao();
     abort;
end;

procedure TFrmUsuario.BtnEditarClick(Sender: TObject);
begin
  Tratabotao();
  if MessageDlg('Deseja alterar esse registro?', MtConfirmation, [mbOk,MbNo], 0) =mrOk then
   begin
     dm.cdsUsuario.Edit;
   end
   else
    Tratabotao();
    abort;
end;

procedure TFrmUsuario.BtnGravarClick(Sender: TObject);
begin
   Tratabotao();
  dm.cdsUsuario.Post;
  MessageDlg('Registro salvo com sucesso!', MtInformation, [mbOk], 0);
  dm.cdsUsuario.ApplyUpdates(0);

end;

procedure TFrmUsuario.BtnNovoClick(Sender: TObject);
var proximo: Integer;
begin

  Tratabotao();
  dm.cdsUsuario.Open;   //Abre a tabela
  dm.cdsUsuario.Last;   // Vai para o ultimo registro da tabela
  proximo:= dm.cdsUsuarioIDUSUARIO.AsInteger + 1;   //Recebe o valor do ultimo registro e vai para o proximo '+1'
  dm.cdsUsuario.Append;  //Adiciona mais uma coluna em branco para adionar um novo registro
  dm.cdsUsuarioIDUSUARIO.AsInteger := proximo;   //O campo ID recebe o valor da variavel proximo
  DBEdit2.SetFocus;   //Leva o foco para o DBEdit2
  dm.cdsUsuarioCADASTRO.AsDateTime:=Date;  //O campo CADASTRO recebe a data atualizada
end;

procedure TFrmUsuario.BtnPesquisarClick(Sender: TObject);
begin
  FrmPesquisaUsuario:=TFrmPesquisaUsuario.Create(self);
  FrmPesquisaUsuario.ShowModal;
  try
  
  finally
    FrmPesquisaUsuario.Free;
    FrmPesquisaUsuario:= nil;
  end;
end;

procedure TFrmUsuario.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuario.tratabotao;
begin
// Ativa e desativa botões
  BtnNovo.Enabled:= Not BtnNovo.Enabled;
  BtnEditar.Enabled := Not BtnEditar.Enabled;
  BtnDeletar.Enabled:= Not BtnDeletar.Enabled;
  BtnGravar.Enabled := Not BtnGravar.Enabled;
  BtnAtualizar.Enabled := Not BtnAtualizar.Enabled;
end;


end.
